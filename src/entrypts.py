#!/usr/bin/env python

# Looks at a list of basic files and an assembler file and generates a list of
# all entry points (sys calls) from the basic codes into the asm module

import sys
import re

if len(sys.argv) < 4 or (sys.argv[1] != '-dis' and sys.argv[1] != '-md'):
  print "Usage ./entrypts.py -dis|-md ddd.asmb ddd.twna.txt ddd.twnb.txt ..."
  sys.exit(1)

# read assembly
f = open(sys.argv[2], 'rb')
ba = bytearray(f.read())
f.close()

# find the valid address range for jumps into this asm module
asm_start = ba[0] + ba[1] * 256
asm_end = asm_start + len(ba) - 2

# store entry points here
entry = []

# loop over all basic files
for i in range(3, len(sys.argv)) :
  # read basic source
  f = open(sys.argv[i], 'r')
  basic_lines = f.readlines()
  f.close()

  # search the basic source for sys calls
  for line in basic_lines :
    for m in re.finditer('sys(\d+)', line) :
      addr = int(m.group(1))
      if addr >= asm_start and addr < asm_end :
        entry.append(addr)

# output
if sys.argv[1] == '-dis' :
  print ' '.join("-c %04x" % x for x in sorted(set(entry)))
elif sys.argv[1] == '-md' :
  for addr in sorted(set(entry)) :
    print "0x%04x | %d |" % (addr, addr)
