#!/usr/bin/env python
import sys

if len(sys.argv) < 3 :
  print "Usage ./bintool.py command ..."
  print "   grep: ./bintool.py grep file 2 45 21"
  print "   grep: ./bintool.py tail infile outfile address"
  print "   grep: ./bintool.py info file"
  sys.exit(1)


fh = open(sys.argv[2], 'rb')
ba = bytearray(fh.read())
fh.close()

start = ba[0] + ba[1] * 256
cmd = sys.argv[1]

if cmd == 'info' :
  print start

elif cmd == 'tail' :
  fh = open(sys.argv[3], 'wb')
  fh.write(ba[2+int(sys.argv[4])-start:])
  fh.close()

elif cmd == 'grep' :
  bytes = sys.argv[3:]
  print bytes

  for y in range(len(ba) - len(bytes) - 1) :
    found = True
    for x in range(len(bytes)) :
      if ba[y + x] != bytes[x] :
        found = False
        break

    if found :
      print "found at %d" % y
      break
