#!/usr/bin/env python
import sys

if len(sys.argv) != 1 :
  print "Usage ./spr2png.py"
  sys.exit(1)

import png


fh = open('c64/DDD1/ddd.dspr', 'rb')
ba = bytearray(fh.read())
fh.close()

bits = [128, 64, 32, 16, 8, 4, 2, 1]
image = []

# five sprites in the file
for s in range(5) :
  # each sprite has 21 lines...
  for y in range(21) :
    row = []
    # ...and 24 columns
    for x in range(24) :
      # sprites are aligned to addresses divisible by 64
      b = s * 64 + y * 3 + x/8
      v = ba[2 + b] & bits[x % 8]

      if v == 0 :
        row.append((255,255,255))
      else:
        row.append((0,0,0))

    image.append(row)

png.from_array(image, 'RGB').save('c64/DDD1/ddd.dspr.png')
