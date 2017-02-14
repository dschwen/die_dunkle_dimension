#!/usr/bin/env python
import sys

if len(sys.argv) < 3 :
  print "Usage ./bintool.py command ..."
  print "   grep: ./bintool.py grep file 2 45 21"
  print "   grep: ./bintool.py tail infile outfile address"
  print "   grep: ./bintool.py info file"
  print "   grep: ./bintool.py hist file offset stride"
  sys.exit(1)


fh = open(sys.argv[2], 'rb')
ba = bytearray(fh.read())
fh.close()

start = ba[0] + ba[1] * 256
cmd = sys.argv[1]

#
# Print load address of the file
#
if cmd == 'info' :
  print start, hex(start)

#
# Histogram of the bytes in the specified file starting at offset using stride
#
elif cmd == 'hist' :
  offset = 0
  stride = 1
  if len(sys.argv) > 3 :
    offset = int(sys.argv[3])
  if len(sys.argv) > 4 :
    stride = int(sys.argv[4])
  hist = []
  for i in range(offset, len(ba), stride) :
    if len(hist) <= ba[i] :
      hist.extend([0] * (ba[i] - len(hist) + 1))
    hist[ba[i]] += 1

  for i in range(len(hist)) :
    print "%d %d" % (i, hist[i])

#
# Write bytes starting at a given physical address to a new file
#
elif cmd == 'tail' :
  fh = open(sys.argv[3], 'wb')
  fh.write(ba[2+int(sys.argv[4])-start:])
  fh.close()

#
# Look for a specified sequence of bytes in the file
#
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
