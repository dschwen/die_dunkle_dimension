# Disk 1

File    |Address| Content
--------|-------|----
dunkle dimension|0x032d | Main loader
ddd.asmb| 0x1000| Machine code routines
ddd.boot| 0x1e01| Basic loader (loads ddd.chrb, ddd.asmb, ddd.mapa, ddd.prep)
ddd.chra| 0x0800| Charset A - Overworld
ddd.chrb| 0x0800| Charset B - Druid cottage
ddd.chrc| 0x0800| Charset C -
ddd.chrk| 0x0800| Charset K -
ddd.chrl| 0x0800| Charset L -
ddd.code| 0xc540 (upper RAM)|
ddd.dbas| 0x0801| Basic Title loader (loads ddd.dtxt, ddd.dttl, ddd.dcod, ddd.dspr, ddd.dsnd, ddd.dtun, ddd.titl, ddd.boot)
ddd.dchr| 0x8800| main title file
ddd.dcod| 0x1000| main title file
ddd.dsnd| 0xc000| main title file
ddd.dspr| 0x0e00| Multicolor sprite, 5 frames
ddd.dttl| 0x6000| main title file
ddd.dtun| 0xc000| main title file
ddd.dtxt| 0x4000| main title file
ddd.konj| 0x1e01| [Basic loader code](AREAS.md)
ddd.mapa| 0xa000| Map A - Overworld - meta tiles
ddd.mapb| 0x0340 (datasette buffer) | Map B - Druid cottage
ddd.mapc| 0x1800| Map C -
ddd.mapk| 0x1800| Map K -
ddd.mapl| 0x1800| Map L -
ddd.prep| 0x1e01| Basic code character generation
ddd.titl| 0x6000| main title file
ddd.twna| 0x0801 (loaded to new start of basic area with `,8`)| Basic code A -
ddd.twnb| 0x0801| Basic code B -
ddd.twnc| 0x0801| Basic code C -
ddd.twnk| 0x0801| Basic code K -
ddd.twnl| 0x0801| Basic code L -
ddd.twnr| 0x0801| Basic code R - Death

# Disk 2

File    |       | Content
--------|-------|----
ddd.chrd|       | Charset D -
ddd.chre|       | Charset E -
ddd.chrf|       | Charset F -
ddd.chrg|       | Charset G -
ddd.chrh|       | Charset H -
ddd.chri|       | Charset I -
ddd.chrj|       | Charset J -
ddd.code|
ddd.konj|       | [Basic loader code](AREAS.md)
ddd.mapd|       | Map D -
ddd.mape|       | Map E -
ddd.mapf|       | Map F -
ddd.mapg|       | Map G -
ddd.maph|       | Map H -
ddd.mapi|       | Map I -
ddd.mapj|       | Map J -
ddd.twnd|       | Basic code D -
ddd.twne|       | Basic code E -
ddd.twnf|       | Basic code F -
ddd.twng|       | Basic code G -
ddd.twnh|       | Basic code H -
ddd.twni|       | Basic code I -
ddd.twnj|       | Basic code J -

# Disk 3

File    |       | Content
--------|-------|----
ddd.assm|
ddd.chrm|       | Charset M -
ddd.chrn|       | Charset N -
ddd.chro|       | Charset O -
ddd.chrq|       | Charset Q -
ddd.code|
ddd.konj|       | [Basic loader code](AREAS.md)
ddd.mapm|       | Map M -
ddd.mapn|       | Map N -
ddd.mapo|       | Map O -
ddd.mapp|       | Map P - ?
ddd.mapq|       | Map Q -
ddd.scrl|
ddd.twnm|       | Basic code M -
ddd.twnn|       | Basic code N -
ddd.twno|       | Basic code O -
ddd.twnp|       | Basic code P -
ddd.twnq|       | Basic code Q -

# Save disk

File    |       | Content
--------|-------|----
ddd.sav?| 0xC000| Save game data (? = 0..9)
