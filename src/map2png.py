#!/usr/bin/env python
import sys

if len(sys.argv) < 2 :
  print "Usage ./map2png.py ddd.mapa height offset"
  sys.exit(1)

import png

fh = open(sys.argv[1], 'rb')
ba = bytearray(fh.read())
fh.close()

xsize = 52

if len(sys.argv) >=3 :
  xsize = int(sys.argv[2])

offset = 2
if len(sys.argv) >=4 :
  xsize = int(sys.argv[3])

size = len(ba)
lines = int((size - offset) / xsize)

image = []

for y in range(lines) :
  row = []
  for x in range(xsize) :
    b = ba[offset + x + y * xsize]
    row.append((b,(9 * b) % 256, (21 * b) % 256))

  image.append(row)

png.from_array(image, 'RGB').save('%s.png' % sys.argv[1])
