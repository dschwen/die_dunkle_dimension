# Web app

`web/` contains a browser version of *Die Dunkle Dimension*. It runs the **original game logic** – the tokenized BASIC programs and
the game's own 6502 machine code – on a small JavaScript reimplementation of the C64 platform. Nothing of the story, combat or
dungeon logic was rewritten by hand, so every dialogue, quest, shop, fight and dungeon behaves exactly like on the C64.

## Running

```
make web      # extracts the game files from c64/DDD{1,2,3} into web/data (needs `make data` first)
make serve    # http://localhost:8642/
make test     # headless smoke test: enters all 18 areas and presses random keys
```

`.github/workflows/pages.yml` does the same on every push to `master`: it downloads the disk images, extracts
them with `c1541`, builds `web/data`, runs the smoke test and deploys `web/` to GitHub Pages (repository
settings → Pages → Source: *GitHub Actions*). The game files themselves are never committed.

The page shows the 320×200 C64 picture scaled to the window with a 10% margin on every side; the margin takes the
current C64 border colour. `F1` help, `F8` turbo, `F9` sound on/off, `F10` (or double click) full screen.
Save games (`Q` in the overworld, slots 0–9) go to IndexedDB (database `die-dunkle-dimension`, store `saves`,
keys `ddd.sav0` … `ddd.sav9`, each value is the original 211 byte PRG with load address `$C000`).

## Architecture

| File | Role |
|------|------|
| `web/js/cpu6502.js` | 6502 core with cycle counts. Runs `ddd.asmb`, `ddd.assm`, `ddd.code`, the title code `ddd.dcod` and the music players. |
| `web/js/basic.js` | Commodore BASIC V2 interpreter working directly on tokenized lines, including C64 quirks (2 significant name characters, `LOAD` inside a program restarts it with variables kept, number formatting, `WAIT`, `DEF FN` …). Every statement costs approximate C64 cycles so the game runs at original speed. |
| `web/js/basictext.js` | Tokenizer (the ROM crunch algorithm, incl. `lO`/`rU` abbreviations) and detokenizer; defines the editable text format of the `.bas` files. |
| `web/js/machine.js` | Memory map, CIA timers, IRQ dispatch, kernal traps (`CHROUT $F1CA/$FFD2`, `GETIN`, IRQ entry `$FF48`, `$EA31/$EA81`, `IOINIT`), the screen editor (logical lines, quote mode, scrolling) and direct mode. |
| `web/js/vic.js` | VIC-II renderer, line by line: text, multicolour text, ECM, hires/multicolour bitmap, sprites (expansion, multicolour, priority), raster IRQ. |
| `web/js/sid-worklet.js`, `web/js/sid.js` | SID emulation in an AudioWorklet fed with cycle-stamped register writes. |
| `web/js/disk.js` | Virtual 1541 with all three disks plus the IndexedDB save disk; BASIC patches. |
| `web/js/charrom.js` | Stand-in for the (non-redistributable) character ROM, built from the game's own font. |
| `tools/build-data.mjs` | Builds `web/data` (binaries + `.bas` sources, verified to re-tokenize byte-identically). |
| `tools/headless.mjs` | Runs the game in Node, dumps the screen as text/PNG, scripted key input. |
| `tools/render-music.mjs` | Renders what the game plays through the SID emulation into a WAV file. |
| `tools/strings.mjs` | Translation helper (see below). |

No Commodore ROM code is used. The game relies on surprisingly little of it: the machine code only calls `CHROUT` and
leaves its IRQ handlers through `$EA31`; the BASIC programs chain each other with the classic keyboard-buffer trick
(print `lO"ddd.twnx",8` on screen, put `HOME RETURN RETURN` into the keyboard buffer, `END`). That trick works unmodified
because the screen editor and direct mode (`SEARCHING FOR`/`LOADING`/`READY.` output, line reading) are emulated faithfully.

### Changes compared to the original

* **Disk swaps** are automatic: the drive "inserts" the disk that belongs to the area number the loader keeps at `$02`
  (`ddd.code` and `ddd.konj` differ between the disks). Prompts such as "bitte lege jetzt wieder die Spieldiskette ein"
  still appear and are simply confirmed with a key.
* **Copy protection**: `ddd.prep` asks for a word from the printed manual and otherwise leaves `sys5681` broken
  (`poke5681,2` → a JAM opcode). Line 2000 is patched to `poke5681,169:return` (`PATCHES` in `web/js/disk.js`).
* **Character ROM**: only visible for a moment while booting; replaced by the game's own font.
* **Title pictures**: the English version has translated title pictures and scroller text (see below).

### Editions

The start screen offers two editions (also `?edition=regular|enhanced`; the choice is remembered like the language):

* **Regular** – the original game with the original graphics. In German it is exactly the original; in other
  languages only texts are translated (including the texts in the title pictures).
* **Enhanced** – changes on top of that:
  * remastered shading of the dragon title picture,
  * fewer but more rewarding fights: random encounters are half as likely, experience and gold won in combat are
    10× higher; the experience lost when fleeing is unchanged (`ENCOUNTER_FACTOR` and `REWARD_FACTOR` in
    `web/js/enhanced.js`).

The gameplay changes live in `web/js/enhanced.js`:

* BASIC patches replace code (never text) inside a line, so they apply to every translation; a patch that no longer
  matches is an error. Encounters: terrain ambushes on the overworld (`ddd.twna` 10–12), the step encounters of
  the dragon cave and the vampire count's dungeon (`ddd.twnm`/`ddd.twnp` 240) and the Skull Keep ambushes
  (`ddd.twnq` 102). Rewards: experience per kill (`ddd.twna` 334/535/619, `ddd.twnm`/`ddd.twnp`/`ddd.twnq` 13110,
  the dragon in `ddd.twnn` 13140) and the monsters' gold (`ddd.twna` 70, `ddd.twnm`/`ddd.twnp` 1710). Flee
  penalties are computed on other lines from the monsters' base values. Treasure found by searching, chests and
  quest rewards are unchanged.
* Overworld monsters are spawned by machine code: on every move `ddd.asmb` tests `lda $DC04 : and #mask` at
  `$16A1`, where `ddd.twna` lines 1–2 POKE the mask into `$16A5` depending on the game's progress (`$80` = every
  second move passes). The enhanced edition redirects the load to a 25 byte helper in the free bytes after
  `ddd.asmb` (`$17E7–$17FF`) that applies the same mask and lets only every `ENCOUNTER_FACTOR`-th success through.
* `node tools/test-enhanced.mjs` plays the overworld in both editions and prints the measured spawn check rate and
  the experience/gold of fights against goblins (regular: check passes 49% of moves, 3–4 XP and 5–22 gold;
  enhanced: 26%, 30–40 XP and 70–160 gold; flee penalty −3/−4 in both).

Save games are the same in both editions and can be loaded in either.

### Title pictures

Both title pictures are Koala multicolor bitmaps (`$6000`: 8000 bytes bitmap, 1000 screen, 1000 colour, background).
The edited versions are PNG sources in `art/` that `make web` converts to PRGs (`tools/koala.mjs`) per edition and
language (`web/data/bin/<edition>/<lang>/`). The most specific file wins: `art/enhanced/<lang>/`, `art/enhanced/`
(enhanced edition only), then `art/<lang>/` (translated texts, both editions). They can be edited by hand as long as
they keep the C64 palette and the multicolor rule (background + 3 colours per 4×8 cell, check with
`tools/koala.py check file.png`).
`make art` (Python 3 with numpy, scipy, Pillow) regenerates them from the original files with `tools/title_art.py`:

* **Shading** (enhanced edition, `tools/titl_shade.py`): the dragon's neck is lit like a cylinder from the left (light green streak,
  dark grey shadow side), the wing membranes sag between the bones (lit under each bone, in shadow where they fold
  into the next), the hill crests catch the glow of the volcano and the sunrise, and the sky gets a dawn gradient.
  Everything is ordered dithering in fat-pixel space within each cell's free colour slots; details such as the eye,
  mouth and scale dots are protected.
* **English logo**: "The Dark Dimension". Both pictures use the same calligraphic skeleton (the first picture renders
  it with a wider shadow), so the English first line is composed once from the original strokes (D, e and k are
  copied, T, h, a and r drawn in the same style) and only the changed strokes are re-rendered.
* **First picture**: "PRESENTS:" is assembled from the letters of "PRÄSENTIERT:", the tagline is set in a small font
  matching the original one.
* **Scroller**: `i18n/<lang>/ddd.dtxt.txt` (upper case text, line breaks become spaces) replaces the screen code
  text of `ddd.dtxt`.

## Music and sound effects

There is no separate sound data to convert: everything audible is produced by original code writing to the SID, which the
web app reproduces by emulating the chip.

* **Title tune 1** – `ddd.dsnd` (loaded to `$C000`). `sys52224` (`$CC00`) sets volume `$1F` (volume 15, low pass) and calls the
  init at `$C02A`, which clears the player state, speeds the CIA timer up (`$DC05 = $24`, ≈106 Hz) and hooks the IRQ vector
  to the player at `$C05A`. `sys52232` (`$CC08`) fades the master volume from 15 to 0 with a delay loop and restores the
  IRQ vector to `$EA31`.
* **Title tune 2** – `ddd.dtun` (also at `$C000`, loaded while the second picture is shown). `sys52992` (`$CF00`) stops CIA
  timer A, enables a raster interrupt at line `$33` and installs the handler at `$CF35`, calls the player init `jsr $C000`
  with `$01=$35`, and sets volume `$1F`. `sys53129` (`$CF89`) disables the raster IRQ, restores `$EA31`, restarts the CIA timer
  and clears all SID registers.
* **In-game sound effects** are written by BASIC directly (`s=54272: pokes+5,…: pokes+4,33: for…pokes+1,i…`), e.g. the
  attack sweep in `ddd.twna` line 58 or lighting the lamp in `ddd.twnm` line 810–812; `sys6041` (`$1799`) silences the SID.
  The dragon lair uses small routines inside `ddd.mapn` (`sys6336`, `sys6348`, `sys6360`).

`node tools/render-music.mjs title.wav 1300 '@500 '` renders both title tunes (≈26 s) to a WAV file for checking.

## Translating

The BASIC programs live as plain text in `web/data/basic/<lang>/disk<N>/<file>.bas`, one BASIC line per text line:

```
86 print"wie bitte..?{home}":goto4
```

* keywords are lower case, `{…}` are PETSCII control codes (`{wht}` `{home}` `{rvon}` …) or raw bytes (`{$xx}`),
* lower case letters are normal text, upper case letters are *shifted* characters, which the game fonts use for
  graphics (frames, icons) – keep them as they are,
* the game font shows `[ \ ]` as `ä ö ü`, written as `ä ö ü` in the files.

The German files are extracted from the disks. Translations are **not** edited in `web/data/basic/<lang>`
directly but built from translation tables in `i18n/<lang>/` by `tools/i18n.mjs` – that way shared code
(combat, shops, inventory …) is translated once, and the German source can be regenerated at any time.
The English first pass is in `i18n/en/` (see `i18n/en/README.md` for the format, the key mapping and the
translation decisions). The page loads `?lang=en` (the start screen has a language switch; the choice is
remembered). Files missing for a language fall back to German. Save games work in both languages.

```
node tools/i18n.mjs work en ddd.twnc      # German lines of a file that still need a translation
node tools/i18n.mjs build en              # write web/data/basic/en/, report coverage and overlong texts
node tools/i18n-lint.mjs en               # German leftovers, keyword checks
node tools/strings.mjs list de            # all ~7200 German texts with their visible length
make test                                 # all areas, random keys, both languages
```

Texts ending in `{home}` are printed into the 16 column message window (`sys5681` scrolls it); the build warns
when they get longer than 16 characters. Not covered by the `.bas` files: the title pictures and the scroller
text (see "Title pictures" above) and the 2×2 letters on the clay tablets (part of the town character sets).
