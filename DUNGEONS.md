# Dungeons

This note collects what we currently know about the 3D dungeon data and the rendering code that drives the first-person view on disk 3.

## Runtime layout

- The first-person dungeon driver exists in two grid sizes. Dragon cave (`ddd.twnm`/`ddd.mapm`) starts at `p = 6361` (`$18D9`) and uses 12x12 floors; Vampire Count (`ddd.twnp`/`ddd.mapp`) starts at `p = 6551` (`$1997`) and uses 20x20 floors (`c64/DDD3/ddd.twnm.txt:1`, `c64/DDD3/ddd.twnp.txt:1`).
- The BASIC direction offsets `a()` make N/E/S/W movement a pointer add: `-width`, `+1`, `+width`, `-1`. Dragon cave uses `int((p-6178)/144)` for floor numbering and +/-144 for ladders; Vampire Count uses `int((p-5922)/400)` and +/-400 (`c64/DDD3/ddd.twnm.txt:35`, `c64/DDD3/ddd.twnm.txt:930`, `c64/DDD3/ddd.twnp.txt:34`, `c64/DDD3/ddd.twnp.txt:930`).
- Each visible frame is reduced to three five-byte binary occlusion strips before the renderer runs: `$0341-$0345` straight ahead, `$0346-$034A` left side, and `$034B-$034F` right side. BASIC writes `1` for blocking tiles `1`, `2`, or `5`; everything else is treated as open by `sys49650` (`c64/DDD3/ddd.twnm.txt:308-333`, `c64/DDD3/ddd.twnp.txt:308-333`).

### Tile codes seen in play

| Value | Observed usage | Evidence | Render cues |
|-------|----------------|----------|-------------|
| `0`   | Empty corridor / room | Traversal falls through to the movement block with no special handling (`c64/DDD3/ddd.twnm.txt:210-225`). | When the occlusion buffer entry is zero, `sys49650` swaps the front strip to spaces plus the checkerboard floor glyphs `#$4E/#$4F` with colour `#$0C` (`c64/DDD3/ddd.assm.asm:219-286`). |
| `1`   | Solid wall          | Forward motion is blocked with a "rumms" message (`c64/DDD3/ddd.twnm.txt:212`). | The default render path leaves the gradient wall glyphs `#$4A-#$4D` seeded by `uC1F2` in place, producing the stone face on left/right walls (`c64/DDD3/ddd.assm.asm:214-359`). |
| `2`   | Closed door / secret passage | Forward motion is blocked when the door flag `t` is clear; the "suchen" command can reveal or open it (`c64/DDD3/ddd.twnm.txt:212`, `c64/DDD3/ddd.twnm.txt:6000-6022`). | The door keeps the heavy columns `#$51-#$54` in the central strip until BASIC toggles `t`; the same glyphs are emitted by `lC418`/`lC465` (`c64/DDD3/ddd.assm.asm:463-522`, `c64/DDD3/ddd.twnm.txt:5405-5420`). |
| `3`   | Ladder up / exit branch | The `klettern` command rewrites "hinab" to "hinauf" when the current tile is `3` and moves one floor in the opposite direction from tile `4` (`c64/DDD3/ddd.twnm.txt:900-950`, `c64/DDD3/ddd.twnp.txt:900-950`). | The renderer sees this as open floor; BASIC overlays the ladder art at the right distance after `sys49650` returns (`c64/DDD3/ddd.twnm.txt:340-390`). |
| `4`   | Ladder down / default climb branch | Shares the ladder handling with tile `3`, but takes the default "hinab" path (`c64/DDD3/ddd.twnm.txt:900-950`, `c64/DDD3/ddd.twnp.txt:900-950`). | Also rendered as open floor first, with ladder glyphs overlaid by BASIC (`c64/DDD3/ddd.twnm.txt:340-390`). |
| `5`   | Locked gate / scripted room | Movement onto the tile routes into the treasure-room logic and the crystal key set pieces (`c64/DDD3/ddd.twnm.txt:214-225`, `c64/DDD3/ddd.twnm.txt:5405-5626`). | Appears as a shimmering barrier: the default pillar glyphs `#$55-#$58` stay in place and BASIC draws the animated “magische Tür” overlay until the event clears (`c64/DDD3/ddd.assm.asm:214-359`, `c64/DDD3/ddd.twnm.txt:5405-5626`). |

The assembly renderer only receives binary occlusion for `1`, `2`, and `5`; it does not distinguish wall vs. secret door vs. scripted gate. Tile-specific ladder and door interactions are handled by BASIC before or after the render call.

### Glyph reference

- The dungeon character set comes from `c64/DDD3/ddd.chrm`. Glyphs `#$4A-#$4D` are the diagonal gradients that form the side walls, while `#$4E/#$4F/#$50` are the checkerboard ceiling/floor tiles used when a corridor is open.
- Door frames and sealed gates rely on `#$51-#$58`. The dungeon stub at `$1837` seeds these values in the central strips, and the renderer keeps or clears them depending on the occlusion bytes (`c64/DDD3/ddd.mapm:$1837`, `c64/DDD3/ddd.assm.asm:463-522`).
- Colours are written alongside the character codes (for example the open corridor path stores `#$0C` into `$D9C2/$D9EA` in `c64/DDD3/ddd.assm.asm:219-229`), which keeps the stone vs. passage contrast even when BASIC adds extra overlays.

## Disk data

All first-person dungeon PRGs on disk 3 load at `$1800`. The two known 3D dungeon maps (`ddd.mapm` - Dragon cave, `ddd.mapp` - Vampire count) share the same code-stub-then-raw-grid layout but not the same width:

| File | Area | Grid | Stub length | Tile bytes | Floors | Notes |
|------|------|------|-------------|------------|--------|-------|
| `c64/DDD3/ddd.mapm` | M | 12x12 | `0x00B3` | `1188` | `8 + 3 rows` | Dragon cave: 8 full floors plus a 3-row special/exit section. Tiles only use values 0-5. |
| `c64/DDD3/ddd.mapp` | P | 20x20 | `0x00B3` | `1260` | `3 + 3 rows` | Vampire Count dungeon: 3 full floors plus a 3-row special/crypt section. Tiles only use values 0-5. |

- The first 0xB3 bytes are a code stub. Once `sys49650` finishes its generic setup, `ddd.assm` tail-calls into this stub (`jmp $1800` at `c64/DDD3/ddd.assm.asm:579`). The stub copies dungeon-specific character art into screen and colour RAM using helper loops (`lC114`, `lC122`, ...) before returning to BASIC.
- Raw map data starts immediately after the stub at `$18B3`. Row width and floor stride come from the matching BASIC driver: 12/144 for `mapm`, 20/400 for `mapp`.
- The one-byte mismatch between the raw data start (`$18B3`) and the floor-numbering base (`$18B2`) appears intentional or harmless: accessible ladders still land on the expected level numbers, and the first payload byte is the first map tile.
- Other disk-3 maps are not this first-person format. `ddd.mapo` and `ddd.mapq` are ordinary 35x43 top-down maps (`1505 = 35*43` data bytes), and their BASIC drivers use the normal `sys4361` viewport renderer (`c64/DDD3/ddd.twno.txt:100`, `c64/DDD3/ddd.twnq.txt:100`).

### Disk 1/2 audit

- There are no first-person dungeon maps on DDD1 or DDD2. The disk 1/2 loaders never load `ddd.assm`, and none of their BASIC programs call `sys49650`.
- Their area maps are standard 2D data: `ddd.mapc`/`mapk`/`mapl` and `ddd.mapd` through `mapj` are all 1505-byte payloads, which is exactly 35x43 tiles. `ddd.mapb` is the 11x11 druid cottage, and `ddd.mapa` is the packed overworld.
- Several disk 1/2 programs call `sys5440`, but in those areas it is only part of the shared UI/setup path; rendering remains the normal `sys4361` top-down viewport.

### Other PRGs on disk 3

- `ddd.mapn` (Dragon lair, area N) is a tiny 230-byte support file for a special encounter, not a first-person dungeon grid. The loader does not load `ddd.assm` for area N, and `ddd.twnn` drives a custom dragon fight rather than the `sys49650` dungeon renderer.
- `ddd.mapo` (Fire castle, area O) and `ddd.mapq` (Skull Keep, area Q) are standard 2D area maps. Treating them as `[tile, count, values...]` records produces plausible-looking histograms by accident, but the file size and BASIC code show they should be decoded with the normal 35-column map tools.

## Rendering pipeline

1. Entering the dungeon triggers `sys5440` from BASIC (`c64/DDD3/ddd.twnm.txt:100`), which initialises character graphics and colour tables before control drops into the main loop.
2. Each frame, the BASIC code populates the visibility masks in `$0341-$034F`, sets up sound/colour effects, and then calls `sys49650` (`c64/DDD3/ddd.twnm.txt:302-330`).
   - The `sys49650` target (`uC1F2`) clears the viewport, pulls the visibility bits, and stamps the wall/door/floor slices (`c64/DDD3/ddd.assm.asm:208-531`). The helper routines (`lC114`, `lC122`, ...) advance the pointer pair in `$22/$23` through screen RAM while writing repeating character triplets (`c64/DDD3/ddd.assm.asm:214-357`).
   - The same helper code dumps colour attributes by mirroring the writes into the buffer pointed to by `$24/$25` (`c64/DDD3/ddd.assm.asm:242-304`, `c64/DDD3/ddd.assm.asm:463-522`).
3. Once the shared renderer finishes, it dispatches to the dungeon stub (`jmp $1800`). The stub pushes any extra scenery/ornaments the specific dungeon needs (`da65` shows the fill loops that drop door jambs and staircase tiles at `$1800+$00...$B2` in each PRG).
4. Combat uses an adjacent entry point, `sys50976`, which copies 8x8x8 glyph blocks into the encounter panel using the pointer stored at `$033E/$033F` (`c64/DDD3/ddd.twnm.txt:1000`, `c64/DDD3/ddd.assm.asm:1137-1178`). This routine reuses the same helper machinery but reads from the buffer prefilled by the BASIC monster tables.

## Working with the map data

- `src/dungeon_split.py` handles the stub skip, infers 12x12 for `ddd.mapm` and 20x20 for `ddd.mapp`, and writes one JSON plus one PNG per floor into `res/dungeons`.
- Example: `./src/dungeon_split.py c64/DDD3/ddd.mapm c64/DDD3/ddd.mapp`
- If decoding manually, skip the two-byte PRG load address and the 0xB3-byte stub, then reshape the payload with the matching BASIC width (`12` for M, `20` for P). Do not use 12 columns for `ddd.mapp`; that creates nine false floors.
- The same raw rows can be dumped to JSON with `src/map2json.py` after the same offset and width tweaks (`src/map2json.py:9-33`). That lets you label floors, annotate encounters, or diff revisions.
- Histogramming tile bytes is a robust sanity check: both known dungeons only use the six tile codes listed above, so any other value hints at yet-to-be-understood data.

### Suggested next steps

1. Render one or two complete first-person views from decoded maps and the `$0341-$034F` masks to verify the perspective model outside VICE.
2. Annotate special coordinates in the decoded grids: entrances, ladder pairs, secret doors, tile-5 scripted rooms, and guaranteed treasure/event cells.
3. Decide whether to keep or remove the experimental column decoder outputs for `mapo`/`mapq`; they are not evidence for the first-person dungeon format.

Open questions and TODOs belong at the bottom of this file as we reverse engineer more of the dungeon pipeline.
