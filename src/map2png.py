#!/usr/bin/env python
import sys
import png
from utils.palette import palette
from utils.gfx import drawTile

if len(sys.argv) < 3 :
    print "Usage ./map2png.py ddd.mapb ddd.chrb [width]"
    sys.exit(1)


# load an uncompressed map
fh = open(sys.argv[1], 'rb')
vmap = bytearray(fh.read())
fh.close()

# load corresponding charset
fh = open(sys.argv[2], 'rb')
chars = bytearray(fh.read())
fh.close()

xsize = 35

if len(sys.argv) >=4 :
    xsize = int(sys.argv[3])

offset = 2
size = len(vmap)
ysize = int((size - offset) / xsize)

# allocate array for the final image
image = [[(0,0,0) for i in range(xsize*16)] for j in range(ysize*16)]

for y in range(ysize) :
    for x in range(xsize) :
        tile = vmap[offset + x + y * xsize]
        drawTile(image, chars, tile, x*16, y*16)

png.from_array(image, 'RGB').save('%s.png' % sys.argv[1])
