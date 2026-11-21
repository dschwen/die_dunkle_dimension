#!/usr/bin/env python3
"""Generates the edited title pictures in art/ from the original disk files.

  title_art.py [outdir]     (default: art/)

  regular edition (original graphics, only texts translated):
    art/en/ddd.titl.png            dragon picture with the English logo "The Dark Dimension"
    art/en/ddd.dttl.png            "German Design Group presents" picture with English texts
  enhanced edition (new graphics):
    art/enhanced/ddd.titl.png      dragon picture with remastered shading
    art/enhanced/en/ddd.titl.png   ... plus the English logo

The PNGs are 320x200, C64 palette, valid multicolor bitmaps (4x8 cells, background + 3 colours);
tools/build-data.mjs converts them to Koala PRGs for the web app. They can also be edited by hand
(keep the palette and the cell rule: `tools/koala.py check file.png`).
"""
import os
import sys
import numpy as np
from scipy import ndimage
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from koala import decode, encode, to_image
from titl_shade import shade

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
BLACK, WHITE, RED, CYAN, PURPLE, GREEN, BLUE, YELLOW, ORANGE, BROWN, LRED, DGREY, GREY, LGREEN, LBLUE, LGREY = range(16)


def load(name):
    px, bg = decode(open(os.path.join(ROOT, 'c64/DDD1', name), 'rb').read())
    return np.array(px, dtype=np.int8), bg


def pts(spec):
    """'row:col,col-col;row-row:col' -> list of (row, col)"""
    out = []
    for part in spec.split(';'):
        part = part.strip()
        if not part:
            continue
        r, cols = part.split(':')
        r0, r1 = (int(v) for v in (r.split('-') * 2)[:2])
        for c in cols.split(','):
            c0, c1 = (int(v) for v in (c.split('-') * 2)[:2])
            out += [(row, col) for row in range(r0, r1 + 1) for col in range(c0, c1 + 1)]
    return out


def shift(m, dy, dx):
    o = np.zeros_like(m)
    H, W = m.shape
    o[dy:, dx:] = m[:H - dy, :W - dx]
    return o


# ------------------------------------------------------------------ logo "The Dark Dimension"
def english_logo_skeleton(titl):
    """Yellow skeleton of the logo in ddd.titl coordinates, first line replaced by "The Dark".
    The logo is a one pixel stroke; D, e and k are copied from the original "Die Dunkle"."""
    old = titl == YELLOW
    old[51:, :] = False
    old[:, 80:] = False
    skel = old.copy()
    skel[11:28, 10:76] = False  # first line, without the frame stem on the left

    def copy(rows, cols, dx):
        for r in range(rows[0], rows[1] + 1):
            for c in range(cols[0], cols[1] + 1):
                if old[r, c]:
                    skel[r, c + dx] = True

    new = []
    # T: crossbar out of the frame curl, hook at the right end, stem with a foot curling left
    new += pts('11:11-21; 12:22; 13:23; 12-24:15; 25:12-14')
    # h: ascender like the original "l", arch like the original "n"
    new += pts('14:18; 15-24:19; 25:18; 18:20; 17:21-22; 18-24:23; 25:24')
    copy((17, 25), (23, 27), 3)   # e of "Die"
    copy((13, 27), (30, 40), 6)   # D of "Dunkle"
    # a: round bowl with a stem on the right ending in a small tail
    new += pts('19:50-52; 20:49; 21-25:48; 26:49; 27:50-51; 20-26:53; 27:54')
    # r: stem like the first stroke of "n", short shoulder
    new += pts('20-26:57; 27:56; 19:58-59; 20:60')
    copy((14, 27), (54, 59), 8)   # k of "Dunkle" (without the l)
    for r, c in new:
        skel[r, c] = True
    return old, skel


def render_logo(px, old, new, dy, dx, shadows, clear_to):
    """Redraw the logo strokes in px around the pixels where the skeleton changed.
    shadows: colours placed 1, 2, ... pixels right of / below each stroke pixel."""
    o = np.zeros(px.shape, bool)
    n = np.zeros(px.shape, bool)
    h, w = old.shape
    o[dy:dy + h, dx:dx + w] = old[:px.shape[0] - dy, :px.shape[1] - dx]
    n[dy:dy + h, dx:dx + w] = new[:px.shape[0] - dy, :px.shape[1] - dx]
    reach = len(shadows) + 1
    region = ndimage.binary_dilation(o ^ n, structure=np.ones((2 * reach + 1, 2 * reach + 1)))
    logo_colours = [YELLOW] + list(shadows)
    px[region & np.isin(px, logo_colours)] = clear_to
    taken = n.copy()
    for k, colour in enumerate(shadows, 1):
        s = (shift(n, 0, k) | shift(n, k, 0)) & ~taken
        px[region & s] = colour
        taken |= s
    px[region & n] = YELLOW


# ------------------------------------------------------------------ helpers for ddd.dttl
def fix_cells(px, bg, keep_rows):
    """Remove star pixels from cells that got more than 3 colours: in every cell the colours of the
    edited element of that row band (keep_rows: [(first_row, last_row, colours)]) win."""
    removed = 0
    for cy in range(0, 200, 8):
        keep = set()
        for r0, r1, cols in keep_rows:
            if r0 <= cy + 7 and cy <= r1:
                keep |= set(cols)
        for cx in range(0, 160, 4):
            cell = px[cy:cy + 8, cx:cx + 4]
            cols = set(np.unique(cell)) - {bg}
            while len(cols) > 3:
                drop = min((c for c in cols if c not in keep), key=lambda c: (cell == c).sum())
                removed += int((cell == drop).sum())
                cell[cell == drop] = bg
                cols.discard(drop)
    return removed


def presents(px, orig):
    """PRÄSENTIERT: -> PRESENTS: (letters are 9x11 blocks in the German Design Group font)."""
    letters = {'P': 32, 'R': 41, 'S': 59, 'E': 68, 'N': 77, 'T': 86}
    px[89:92, 50:59] = BLACK          # umlaut dots
    px[92:103, 32:128] = BLACK
    word = 'PRESENTS'
    x = 80 - (len(word) * 9 + 3) // 2
    for ch in word:
        px[92:103, x:x + 9] = orig[92:103, letters[ch]:letters[ch] + 9]
        x += 9
    px[92:103, x:x + 3] = orig[92:103, 125:128]  # colon


# thin font of the tagline: rows 169-178, x-height rows 172-176
FONT = {
    'T': ['#####', '..#..', '..#..', '..#..', '..#..', '..#..', '..#..'],
    'h': ['#..', '#..', '##.', '#.#', '#.#', '#.#', '#.#'],
    'e': ['...', '...', '.#.', '#.#', '###', '#..', '.##'],
    'u': ['...', '...', '#.#', '#.#', '#.#', '#.#', '.##'],
    'l': ['#.', '#.', '#.', '#.', '#.', '#.', '.#'],
    't': ['.#.', '###', '.#.', '.#.', '.#.', '.#.', '..#'],
    'i': ['#', '.', '#', '#', '#', '#', '#'],
    'm': ['.....', '.....', '####.', '#.#.#', '#.#.#', '#.#.#', '#.#.#'],
    'a': ['...', '...', '.##', '#.#', '#.#', '#.#', '.##'],
    'f': ['.##', '#..', '###', '#..', '#..', '#..', '#..'],
    'n': ['...', '...', '##.', '#.#', '#.#', '#.#', '#.#'],
    's': ['...', '...', '.##', '#..', '.#.', '..#', '##.'],
    'y': ['...', '...', '#.#', '#.#', '#.#', '.##', '..#', '##.'],
    'r': ['...', '...', '#.#', '##.', '#..', '#..', '#..'],
    'o': ['...', '...', '.#.', '#.#', '#.#', '#.#', '.#.'],
    'p': ['...', '...', '##.', '#.#', '#.#', '#.#', '##.', '#..'],
    'g': ['...', '...', '.##', '#.#', '#.#', '#.#', '.##', '..#', '##.'],
    '-': ['..', '..', '..', '..', '##', '..', '..'],
    ' ': ['..'],
}


def tagline(px, text):
    px[169:179, :] = np.where(px[169:179, :] == LGREY, BLACK, px[169:179, :])
    width = sum(len(FONT[c][0]) + 1 for c in text) - 1
    x = 80 - width // 2
    for c in text:
        g = FONT[c]
        for r, row in enumerate(g):
            for i, v in enumerate(row):
                if v == '#':
                    px[170 + r, x + i] = LGREY
        x += len(g[0]) + 1
    return width


def save(px, bg, path):
    os.makedirs(os.path.dirname(path), exist_ok=True)
    out = px.tolist()
    _, errors = encode(out, bg)
    assert not errors, (path, errors[:5])
    to_image(out).save(path)
    print('wrote', os.path.relpath(path, ROOT))


def main():
    outdir = sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT, 'art')
    titl, tbg = load('ddd.titl')
    dttl, dbg = load('ddd.dttl')
    old, new = english_logo_skeleton(titl)

    # dragon picture: English logo on the original (regular) and on the remastered picture (enhanced)
    en = titl.copy()
    render_logo(en, old, new, 0, 0, [LRED], GREY)
    save(en, tbg, os.path.join(outdir, 'en', 'ddd.titl.png'))
    shaded = shade(titl.tolist(), tbg)
    save(shaded, tbg, os.path.join(outdir, 'enhanced', 'ddd.titl.png'))
    en = shaded.copy()
    render_logo(en, old, new, 0, 0, [LRED], GREY)
    save(en, tbg, os.path.join(outdir, 'enhanced', 'en', 'ddd.titl.png'))

    # first picture: PRESENTS:, heavy logo (same skeleton, offset +105/+37), tagline
    d = dttl.copy()
    presents(d, dttl)
    render_logo(d, old, new, 105, 37, [LRED, RED], BLACK)
    w = tagline(d, 'The ultimate fantasy role-playing game')
    removed = fix_cells(d, dbg, [(89, 102, {CYAN, LBLUE, BLUE}), (110, 160, {YELLOW, LRED, RED}),
                                 (169, 178, {LGREY})])
    print('tagline width', w, 'star pixels removed', removed)
    save(d, dbg, os.path.join(outdir, 'en', 'ddd.dttl.png'))


if __name__ == '__main__':
    main()
