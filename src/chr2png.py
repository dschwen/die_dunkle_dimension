#!/usr/bin/env python
import sys

if len(sys.argv) != 2 :
  print "Usage ./chr2png.py ddd.chra"
  sys.exit(1)

import png


fh = open(sys.argv[1], 'rb')
ba = bytearray(fh.read())
fh.close()

print len(ba), "bytes read"

bits = [128, 64, 32, 16, 8, 4, 2, 1]
image = []

for y in range(128) :
	row = []
	for x in range(128) :
		c = int(y/8) * 16 + int(x/8)
		v = ba[2 + c*8 + y % 8] & bits[x % 8]

		if v == 0 :
			row.append((255,255,255))
		else:
			row.append((0,0,0))

	image.append(row)

png.from_array(image, 'RGB').save('%s.png' % sys.argv[1])
