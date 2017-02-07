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

* `0x17a4`
Fetch x coordinate from `0x02` (2) and add `0x4B` store in `0x22`, store `0x15` in `0x23` (temporary area)
Fetch y ccordinate from `0xB6` (182)
