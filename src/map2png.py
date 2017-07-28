#!/usr/bin/env python
import sys

palette = [
  (0,0,0),
  (255,255,255),
  (104,55,43),
  (112,164,178),
  (111,61,134),
  (88,141,67),
  (53,40,121),
  (184,199,111),
  (111,79,37),
  (67,57,0),
  (154,103,89),
  (68,68,68),
  (108,108,108),
  (154,210,132),
  (108,94,181),
  (149,149,149)
]

if len(sys.argv) < 2 :
  print "Usage ./map2png.py ddd.mapb height offset"
  sys.exit(1)

import png

fh = open(sys.argv[1], 'rb')
ba = bytearray(fh.read())
fh.close()

fh = open('c64/DDD1/ddd.code', 'rb')
code = bytearray(fh.read())
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
    tile = ba[offset + x + y * xsize]
    color = palette[code[0xC800 - 0xC540 + 2 + tile]]
    row.append(color)

  image.append(row)

png.from_array(image, 'RGB').save('%s.png' % sys.argv[1])
