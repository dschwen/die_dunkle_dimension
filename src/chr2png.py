#!/usr/bin/env python
import sys
import png
from utils.gfx import drawChar

if len(sys.argv) != 2 :
  print "Usage ./chr2png.py ddd.chra"
  sys.exit(1)


fh = open(sys.argv[1], 'rb')
chars = bytearray(fh.read())
fh.close()

# allocate array for the final image (16*16 chars of 8*8 size each)
image = [[(0,0,0) for i in range(8*16)] for j in range(8*16)]

for x in range(16) :
    for y in range(16) :
        drawChar(image, chars, x + 16*y, (255,255,255), x*8, y*8)

png.from_array(image, 'RGB').save('%s.png' % sys.argv[1])
