#!/usr/bin/env python
import sys
import png

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

fh = open('c64/DDD1/ddd.mapa', 'rb')
mapa = bytearray(fh.read())
fh.close()

fh = open('c64/DDD1/ddd.code', 'rb')
code = bytearray(fh.read())
fh.close()

xsize = 52

offset = 2
if len(sys.argv) >=4 :
  xsize = int(sys.argv[3])

size = len(mapa)
lines = int((size - offset) / xsize)

image = []

for y in range(lines) :
  row = []
  for x in range(xsize) :
    # get super tile
    supertile = mapa[offset + x + y * xsize]
    for t in range(3) :
      # the three subtiles are at 0x100 * t + 0xCD00
      # to get the array index we subtract the memory offset of the file (0xC540)
      # and add 2, because the data is preceeded by a two bye offset address on disk
      tile = code[0x100 * t + 0xCD00 - 0xC540 + 2 + supertile]
      color = palette[code[0xC800 - 0xC540 + 2 + tile]]
      row.append(color)

  image.append(row)

png.from_array(image, 'RGB').save('c64/DDD1/ddd.mapa.png')
