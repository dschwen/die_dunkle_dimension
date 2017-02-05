#!/usr/bin/env python
import sys

if len(sys.argv) < 3 :
  print "Usage ./bingrep.py file bytelist"
  sys.exit(1)

bytes = sys.argv[2:]
print bytes

fh = open(sys.argv[1], 'rb')
ba = bytearray(fh.read())
fh.close()

for y in range(len(ba) - len(bytes) - 1) :
  found = True
  for x in range(len(bytes)) :
    if ba[y + x] != bytes[x] :
      found = False
      break

  if found :
    print "found at %d" % y
    break
