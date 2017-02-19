#!/usr/bin/env python
import sys

if len(sys.argv) != 2 :
  print "Usage ./tiles2png.py ddd.chra"
  sys.exit(1)

import png


fh = open(sys.argv[1], 'rb')
ba = bytearray(fh.read())
fh.close()

print len(ba), "bytes read"

# Frame pieces
# 107 UDR, 109 UR, 110 DL, 112 DR, 114 LRD, 125 UL
#

bits = [128, 64, 32, 16, 8, 4, 2, 1]
tiles = [(65,66,67,68), (69,70,69,70), (71,72,71,72), (73,73,73,73), (74,75,76,77), (78,79,80,81),
         (82,83,84,85), (86,87,88,89), (90,91,92,93), (94,95,96,97), (98,98,98,98),
         (99,100,101,102),  # Dungeon
         (103,104,105,106), # Town
         (108,111,113,115), # Town 2
         (116,117,118,119), # Druiden haus
         (120,121,122,123), # Zirkel Tower
         (124,126,127,128), # Town 3
         (129,130,131,132), # Town/Castle
         (133,134,135,136), # Skullkeep
         (137,138,139,140), # Dot (projectile?)
         (141,142,143,144), # Rocks
         (145,146,147,148), # More Rocks
         (149,150,151,152), # Target
         (153,154,155,156), # Player
         (157,158,159,160), # Corpse
         (161,162,163,164), # Horse
         (165,166,167,168), # Ship
         (169,170,171,172), # Ship 2
         (173,162,163,164), # Horse two heads
         (174,162,163,164), # Unicorn
         (175,176,177,178), # Ogre?
         (179,180,177,178), # Balrog?
         (181,180,182,178), # Balrog with axe?
         (183,184,177,178), # Two headed..
         (185,176,182,178), # Ogre with mace?
         (186,187,188,189), # Cyclops?
         (190,191,192,193), # Merman
         (194,195,196,196), # Kraken
         (32,197,198,199),  # Seasnake
         (200,201,202,203), # Seahorse
         (204,205,206,207), # Spider
         (208,209,210,211), # Skeleton
         (212,213,210,211), # Skeleton
         (214,215,210,211), # Bandit?
         (216,215,210,211), # Bandit with sword?
         (217,218,219,220), # Snake
         (221,215,222,211), # Wizzard
         (223,224,225,226), # Winged demon
         (227,228,229,230), # Hydra?
         (231,232,233,234), # Dragon?
         (235,236,237,238), # Winged demon 2
         (239,240,241,242), # Dragon 2
         (243,244,210,211), # Arms up guy
         (245,246,247,248), # Flying lizard
         (249,250,251,252)  # Tree
        ]

# for i in range(82,)

image = []
for t in tiles :
  for y in range(16) :
    row = []
    for x in range(16) :
      c = t[int(y/8) * 2 + int(x/8)]
      v = ba[2 + c*8 + y % 8] & bits[x % 8]

      if v == 0 :
        row.append((255,255,255))
      else:
        row.append((0,0,0))

    image.append(row)

png.from_array(image, 'RGB').save('%s.tiles.png' % sys.argv[1])
