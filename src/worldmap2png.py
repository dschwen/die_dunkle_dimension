#!/usr/bin/env python
import sys
import png
from utils.palette import palette

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
