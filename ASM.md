# `ddd.asmb`

List of `sys` call addresses

Address (hex) | Address (dec) | Purpose
--------------|---------------|------------
0x1085 | 4229 |
0x1109 | 4361 | Called when turn begins  
0x1182 | 4482 |
0x11b9 | 4537 |
0x11d3 | 4563 |
0x120d | 4621 |
0x124d | 4685 |
0x128f | 4751 |
0x12cc | 4812 |
0x130d | 4877 |
0x1315 | 4885 |
0x131d | 4893 |
0x1325 | 4901 |
0x13f3 | 5107 |
0x1540 | 5440 |
0x154e | 5454 | Called upon entering a new area
0x15b6 | 5558 |
0x1631 | 5681 | Dialog text output related
0x1696 | 5782 |
0x16e0 | 5856 |
0x16ec | 5868 |
0x174e | 5966 |
0x176e | 5998 |
0x1799 | 6041 | Zero out SID registers
0x17a4 | 6052 | Draw map in towns with x in 2 and y in 182

## C64 Symbols

Address | Kernal routine / chip register
--------|-----------
`$F1CA` | CHROUT - output accumulator as character

## Listing comments

* `0x154e`
Output `#$9a` (light blue), `#$93` (home), load `#$B0` (), jsr `0x1608`

* `0x1608`

* `0x17a4`
Fetch x coordinate from `0x02` (2) and add `0x4B` store in `0x22`, store `0x15` in `0x23` (temporary area)
Fetch y ccordinate from `0xB6` (182)

## The Map

### Current viewport

The current viewport is stored in the datasette buffer starting at `0x340`. It is 11 x 11 tiles in size. The center of the viewport (i.e. the tile underneath the player) is located at `0x37c` (892). The twn basic files contain `l=peek(892)` to fetch the current tile beneath the player.

`sys4229` unpacks the current viewport from the packed map into the cassette buffer

The druid cottage (ddd.mapb) is a non-scolling single viewport map that is loaded straight into the datasette buffer.

`sys4361` renders the current viewport to the screen.

The overworld map is unpacked into the datasette buffer by a routine starting at `0x1085` (`sys4229` - tentative).
The 3 sub-tiles making up an overworld super tile _i_ are tabulated at 0xCD00+i, 0xCE00+i, and 0xCF00+i.
`worldmap2png.py` decodes the overworld map.

The town maps

## Vice monitor tips

Using the monitor in `x64` (vice) the `sys` calls can be traced using

1. `bk E144` (sets a breakpoint in the kernal right before the jump to the sys destination address)
2. `m 14` (look at the LSB (`0x14`) and MSB (`0x15`) of the destination address )
3. `ret` and `x` (to jump back into basic)
