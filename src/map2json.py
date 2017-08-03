#!/usr/bin/env python
import sys
import json

if len(sys.argv) < 3 :
    print "Usage ./map2json.py ddd.mapb [width]"
    sys.exit(1)


# load an uncompressed map
fh = open(sys.argv[1], 'rb')
vmap = bytearray(fh.read())
fh.close()

xsize = 35

if len(sys.argv) >=3 :
    xsize = int(sys.argv[2])

offset = 2
size = len(vmap)
ysize = int((size - offset) / xsize)

# allocate array for the json data
data = [[0 for i in range(xsize)] for j in range(ysize)]

for y in range(ysize) :
    for x in range(xsize) :
        tile = vmap[offset + x + y * xsize]
        data[y][x] = tile

with open('%s.json' % sys.argv[1], 'w') as outfile:
    json.dump(data, outfile)
