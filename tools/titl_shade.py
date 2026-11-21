#!/usr/bin/env python3
"""Remaster the shading of the dragon title picture (ddd.titl) within C64 multicolor limits.

  titl_shade.py in.prg out.png [out.prg]     (normally used through tools/title_art.py)

Dragon neck: cylinder lit from the left (light green streak, dark grey shadow side); wing membranes
sag between the bones (lit under each bone, shadowed where they fold into the next); hill crests
catch the glow of the volcano and the rising sun; dawn gradient in the sky above the horizon.

All work happens on the 160x200 fat-pixel grid using palette indices. Every change is checked
against the multicolor rule (background + at most 3 colours per 4x8 cell); a pixel whose new
colour would break its cell keeps its old colour.
"""
import sys
import numpy as np
from scipy import ndimage
sys.path.insert(0, __file__.rsplit('/', 1)[0])
from koala import decode, encode, to_image

BLACK, WHITE, RED, CYAN, PURPLE, GREEN, BLUE, YELLOW, ORANGE, BROWN, LRED, DGREY, GREY, LGREEN, LBLUE, LGREY = range(16)

# 4x4 Bayer matrix in fat-pixel space (values 0..15)
BAYER = np.array([[0, 8, 2, 10], [12, 4, 14, 6], [3, 11, 1, 9], [15, 7, 13, 5]])


def bayer(h, w):
    return (np.tile(BAYER, (h // 4 + 1, w // 4 + 1))[:h, :w] + 0.5) / 16.0


class Canvas:
    def __init__(self, px, bg):
        self.p = np.array(px, dtype=np.int8)
        self.bg = bg

    def cell_colours(self, y, x):
        cy, cx = y // 8 * 8, x // 4 * 4
        return set(np.unique(self.p[cy:cy + 8, cx:cx + 4])) - {self.bg}

    def set(self, y, x, c):
        old = self.p[y, x]
        if old == c:
            return True
        self.p[y, x] = c
        cols = self.cell_colours(y, x)
        if len(cols) > 3:
            self.p[y, x] = old
            return False
        return True


def shade(px, bg):
    """Return the remastered picture (160x200 palette indices) for decoded ddd.titl pixels."""
    cv = Canvas(px, bg)
    p0 = cv.p.copy()
    H, W = p0.shape

    dith = bayer(H, W)

    def place(y, x, colour, density):
        if density > 0 and dith[y, x] < density:
            cv.set(y, x, colour)

    # pixels next to small details (eye, mouth, scale dots, sword ...) stay untouched
    detail = ~np.isin(p0, [GREEN, BROWN, GREY, LGREY, DGREY])
    protect = ndimage.binary_dilation(detail, structure=np.ones((3, 3)))

    # ---------------- dragon: split the big green area into neck/head and wings
    green = (p0 == GREEN)
    green[:60, :] = False
    yy, xx = np.mgrid[0:H, 0:W]
    neck = green & (((xx >= 72) & (yy < 165)) | ((xx >= 79) & (xx <= 112) & (yy >= 165)))
    wings = green & ~neck

    # neck: cylinder lit from the left, rows above the jaw are the head
    for y in range(60, H):
        xs = np.nonzero(neck[y])[0]
        if len(xs) < 4:
            continue
        # split the row into runs
        runs = np.split(xs, np.nonzero(np.diff(xs) > 1)[0] + 1)
        for run in runs:
            if len(run) < 4:
                continue
            l, r = run[0], run[-1]
            for x in run:
                if protect[y, x]:
                    continue
                t = (x - l) / max(1, r - l)
                if y < 100:  # head: only a soft sheen on the upper surfaces
                    place(y, x, LGREEN, 0.35 if 0.15 < t < 0.45 and y < 80 else 0.0)
                    place(y, x, DGREY, 0.25 if t > 0.85 else 0.0)
                    continue
                hi = min(0.8, max(0.0, 1.0 - abs(t - 0.27) / 0.15) * 0.95)
                lo = max(0.0, (t - 0.70) / 0.30) * 0.55
                place(y, x, LGREEN, hi)
                place(y, x, DGREY, lo)

    # wings: each membrane sags below its bone: lit just under the bone, in shadow where it
    # folds into the next bone (column-wise position inside the panel)
    logo = np.zeros_like(green); logo[180:, 120:] = True  # GDG logo bottom right
    for x in range(W):
        ys = np.nonzero(wings[:, x])[0]
        if not len(ys):
            continue
        runs = np.split(ys, np.nonzero(np.diff(ys) > 1)[0] + 1)
        for run in runs:
            if len(run) < 5:
                continue
            top, bot = run[0], run[-1]
            for y in run:
                if protect[y, x] or logo[y, x]:
                    continue
                t = (y - top) / max(1, bot - top)
                hi = max(0.0, 1.0 - abs(t - 0.18) / 0.16) * 0.5
                lo = max(0.0, (t - 0.68) / 0.32) * 0.5
                place(y, x, LGREEN, hi)
                place(y, x, DGREY, lo)

    # ---------------- hills: warm glow of the volcano / sunrise on the crests
    ground = (p0 == BROWN)
    sky = np.isin(p0, [GREY, LGREY])
    dist = np.full((H, W), 999.0)
    for x in range(W):
        last = -999
        for y in range(H):
            if sky[y, x]:
                last = y
            dist[y, x] = y - last
    for y in range(H):
        for x in range(W):
            if not ground[y, x] or y > 150 or protect[y, x]:
                continue
            dd = dist[y, x]
            if dd < 1 or dd > 8:
                continue
            band = (dd - 1) // 2  # 2-row bands
            strength = [0.5, 0.3125, 0.1875, 0.0625][int(min(band, 3))]
            vx = 1.0 - min(abs(x - 120) / 100.0, 1.0)
            sx = 1.0 - min(abs(x - 50) / 50.0, 1.0)
            if max(vx, sx) < 0.2:
                strength /= 2
            place(y, x, ORANGE, strength)

    # ---------------- sky: dawn gradient towards the horizon (below the logo), 4-row bands
    for y in range(58, 82):
        band = (y - 58) // 4  # 0..5
        density = [2, 4, 6, 8, 10, 12][band] / 16.0
        for x in range(W):
            if p0[y, x] == GREY:
                place(y, x, LGREY, density)

    return cv.p


def main():
    px, bg = decode(open(sys.argv[1], 'rb').read())
    out = shade(px, bg).tolist()
    to_image(out).save(sys.argv[2])
    if len(sys.argv) > 3:
        prg, errors = encode(out, bg)
        assert not errors, errors
        open(sys.argv[3], 'wb').write(prg)


if __name__ == '__main__':
    main()
