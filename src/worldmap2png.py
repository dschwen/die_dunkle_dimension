#!/usr/bin/env python
import sys
import png

fh = open('c64/DDD1/ddd.mapa', 'rb')
mp = bytearray(fh.read())
fh.close()

fh = open('c64/DDD1/ddd.code', 'rb')
cd = bytearray(fh.read())
fh.close()

xsize = 52

offset = 2
if len(sys.argv) >=4 :
  xsize = int(sys.argv[3])

size = len(mp)
lines = int((size - offset) / xsize)

image = []

for y in range(lines) :
  row = []
  for x in range(xsize) :
    # get super tile
    st = mp[offset + x + y * xsize]
    for t in range(3) :
      b = cd[0x100 * t + 0xCD00 - 0xC540 + 2 + st]
      row.append(((79 * b) % 256, (9 * b) % 256, (21 * b) % 256))

  image.append(row)

png.from_array(image, 'RGB').save('c64/DDD1/ddd.mapa.png')
