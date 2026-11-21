#!/usr/bin/env python3
"""Koala multicolor bitmap <-> PNG.

  koala.py topng  in.prg out.png [--scale N]   decode (160x200 fat pixels -> 320x200 PNG)
  koala.py toprg  in.png out.prg [--addr 6000] encode a 320x200 (or 160x200) PNG that uses
                                               only C64 palette colours and at most 3 colours
                                               + background per 4x8 cell (checked, errors listed)
  koala.py check  in.png                       report cells that break the multicolor rules
Layout: bitmap 8000 bytes, screen 1000, colour 1000, background 1 (after a 2 byte load address).
"""
import sys
from PIL import Image

PAL = [(0,0,0),(255,255,255),(104,55,43),(112,164,178),(111,61,134),(88,141,67),(53,40,121),(184,199,111),
       (111,79,37),(67,57,0),(154,103,89),(68,68,68),(108,108,108),(154,210,132),(108,94,181),(149,149,149)]
IDX = {c: i for i, c in enumerate(PAL)}

def decode(data):
    body = data[2:]
    bm, scr, col, bg = body[:8000], body[8000:9000], body[9000:10000], body[10000] & 15
    px = [[0] * 160 for _ in range(200)]
    for cy in range(25):
        for cx in range(40):
            c = cy * 40 + cx
            cols = [bg, scr[c] >> 4, scr[c] & 15, col[c] & 15]
            for line in range(8):
                b = bm[c * 8 + line]
                for i in range(4):
                    px[cy * 8 + line][cx * 4 + i] = cols[(b >> (6 - 2 * i)) & 3]
    return px, bg

def to_image(px, scale=1):
    im = Image.new('RGB', (320, 200))
    for y in range(200):
        for x in range(160):
            c = PAL[px[y][x]]
            im.putpixel((2 * x, y), c); im.putpixel((2 * x + 1, y), c)
    if scale > 1:
        im = im.resize((320 * scale, 200 * scale), Image.NEAREST)
    return im

def nearest(rgb):
    if rgb in IDX:
        return IDX[rgb]
    return min(range(16), key=lambda i: sum((a - b) ** 2 for a, b in zip(PAL[i], rgb)))

def from_image(im):
    im = im.convert('RGB')
    w, h = im.size
    assert h == 200 and w in (160, 320), 'image must be 320x200 or 160x200'
    step = 2 if w == 320 else 1
    return [[nearest(im.getpixel((x * step, y))) for x in range(160)] for y in range(200)]

def encode(px, bg=None, addr=0x6000):
    from collections import Counter
    if bg is None:
        bg = Counter(c for row in px for c in row).most_common(1)[0][0]
    bm, scr, col, errors = bytearray(8000), bytearray(1000), bytearray(1000), []
    for cy in range(25):
        for cx in range(40):
            c = cy * 40 + cx
            cnt = Counter(px[cy * 8 + l][cx * 4 + i] for l in range(8) for i in range(4))
            others = [k for k, _ in cnt.most_common() if k != bg]
            if len(others) > 3:
                errors.append((cx, cy, sorted(cnt)))
                others = others[:3]
            others += [0] * (3 - len(others))
            a, b, d = others
            scr[c] = (a << 4) | b; col[c] = d
            m = {bg: 0, a: 1, b: 2, d: 3}
            for l in range(8):
                v = 0
                for i in range(4):
                    p = px[cy * 8 + l][cx * 4 + i]
                    if p not in m:  # map illegal colour to closest allowed one
                        p = min(m, key=lambda k: sum((x - y) ** 2 for x, y in zip(PAL[k], PAL[p])))
                    v |= m[p] << (6 - 2 * i)
                bm[c * 8 + l] = v
    return bytes([addr & 255, addr >> 8]) + bytes(bm) + bytes(scr) + bytes(col) + bytes([bg]), errors

if __name__ == '__main__':
    cmd = sys.argv[1]
    scale = int(sys.argv[sys.argv.index('--scale') + 1]) if '--scale' in sys.argv else 1
    if cmd == 'topng':
        px, bg = decode(open(sys.argv[2], 'rb').read())
        to_image(px, scale).save(sys.argv[3])
        print('background colour', bg)
    elif cmd in ('toprg', 'check'):
        px = from_image(Image.open(sys.argv[2]))
        bg = int(sys.argv[sys.argv.index('--bg') + 1]) if '--bg' in sys.argv else None
        data, errors = encode(px, bg)
        for e in errors[:40]:
            print('cell %d,%d has colours %s (max 3 + background)' % e)
        print(len(errors), 'cell errors')
        if cmd == 'toprg':
            open(sys.argv[3], 'wb').write(data)
        sys.exit(1 if errors else 0)
