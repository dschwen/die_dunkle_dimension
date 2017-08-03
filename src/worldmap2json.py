#!/usr/bin/env python
import sys
import json


# load packed overworld map
fh = open('c64/DDD1/ddd.mapa', 'rb')
mapa = bytearray(fh.read())
fh.close()

# load sub-tile data
fh = open('c64/DDD1/ddd.code', 'rb')
code = bytearray(fh.read())
fh.close()

xsize = 52
offset = 2

size = len(mapa)
ysize = int((size - offset) / xsize)

# allocate array for the final image
data = [[0 for i in range(xsize*3)] for j in range(ysize)]

for y in range(ysize) :
    for x in range(xsize) :
        # get super tile
        supertile = mapa[offset + x + y * xsize]
        for t in range(3) :
            # the three subtiles are at 0x100 * t + 0xCD00
            # to get the array index we subtract the memory offset of the file (0xC540)
            # and add 2, because the data is preceeded by a two bye offset address on disk
            tile = code[0x100 * t + 0xCD00 - 0xC540 + 2 + supertile]
            data[y][x*3 + t] = tile

with open('c64/DDD1/ddd.mapa.json', 'w') as outfile:
    json.dump(data, outfile)
