#!/usr/bin/env python
import sys
import png
from utils.palette import palette
from utils.gfx import drawTile

if len(sys.argv) < 3 :
    print "Usage ./map2png.py ddd.mapm [width]"
    sys.exit(1)


# load an uncompressed map
fh = open(sys.argv[1], 'rb')
vmap = bytearray(fh.read())
fh.close()

xsize = 12

if len(sys.argv) >=4 :
    xsize = int(sys.argv[3])

offset = 2
size = len(vmap)
ysize = int((size - offset) / xsize)

# allocate array for the final image
image = [[(0,0,0) for i in range(xsize)] for j in range(ysize)]

for y in range(ysize) :
    for x in range(xsize) :
        tile = vmap[offset + x + y * xsize]
        image[y][x] = (tile,tile,tile)

png.from_array(image, 'RGB').save('%s.png' % sys.argv[1])
