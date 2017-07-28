#!/usr/bin/env python
import sys
from utils.palette import palette

bits = [128, 64, 32, 16, 8, 4, 2, 1]

if len(sys.argv) != 2 :
  print "Usage ./tiles2png.py ddd.chra"
  sys.exit(1)

import png


fh = open(sys.argv[1], 'rb')
chars = bytearray(fh.read())
fh.close()

fh = open('c64/DDD1/ddd.code', 'rb')
code = bytearray(fh.read())
fh.close()

# 16x16 tiles with 16x16 pixels each
image = [[(0,0,0) for i in range(16*16)] for j in range(16*16)]

# iterate over the tiles
for tx in range(16) :
  for ty in range(16) :
    tile = tx + 16 * ty
    color = palette[code[0xC800 - 0xC540 + 2 + tile]]

    # iterate over the four characters that make up the tile
    for sx in range(2) :
      for sy in range(2) :
        char = code[0x100 * (sx + 2 * sy) + 0xC900 - 0xC540 + 2 + tile]

        # iterate over the pixels of the character
        for cx in range(8) :
          for cy in range(8) :
            v = chars[2 + char * 8 + cy] & bits[cx % 8]

            if v > 0 :
              image[ty*16+sy*8+cy][tx*16+sx*8+cx] = color

png.from_array(image, 'RGB').save('%s.tiles.png' % sys.argv[1])
