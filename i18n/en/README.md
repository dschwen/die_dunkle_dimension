# English translation – first pass

Sources of the English version of *Die Dunkle Dimension*. `node tools/i18n.mjs build en` (or `make i18n`)
turns them into `web/data/basic/en/`, which the web app loads with `?lang=en`.

| File | Purpose |
|------|---------|
| `strings/<file>.txt` | `<line>\|<text>\|<text>…` – English for the texts (string literals and DATA items) of one BASIC line, in order. `<line>=` keeps the German texts (graphics drawn with letters). An entry whose German texts are long enough is reused for identical lines in other files. |
| `common.txt` | `<german> => <english>` pairs for short texts that mean the same everywhere. |
| `rules.txt` | Literal code rewrites applied to every file: English keys, conversation input, sentence structures that differ in English. |
| `ddd.dtxt.txt` | Title scroller text (upper case; the German product names are kept with an English rendering). |
| `../../art/en/*.png`, `../../art/enhanced/en/*.png` | English title pictures ("The Dark Dimension", "PRESENTS:", tagline) for the regular and the enhanced edition, see WEBAPP.md. |
| `code/<file>.txt` | Whole-line replacements where the English needs different code (keyword completions, grammar tricks, inventory summary). Line numbers never change. |

Checks: `node tools/i18n.mjs build en` warns about texts wider than the 16 column message window and
yes/no prompts longer than 14 characters; `node tools/i18n-lint.mjs en` finds German leftovers and
conversation keywords that are too long or never mentioned in any dialogue; `make test` plays all
areas with random keys in both languages.

## Decisions

* **Keys** (rules.txt): yes/no `J/N` → `Y/N`; spell `Z` → `C`; Ultima convention `R` ready weapon /
  `W` wear armour (German: `W` Waffe / `R` Rüstung); talk `K` → `T`; ship's catapult `K` → `F`;
  shops kaufen/verkaufen `K/V` → buy/sell `B/S`; dungeon light `E` → `L`, use `B` → `U`;
  climb stays `K` ("klimb", as in Ultima). Character creation: attributes `S/D/I/C`
  (strength, dexterity, intelligence, charisma), difficulty `E/M/H`, attack/defend `A/D`.
* **Conversations**: keywords are English; the game compares the first 4 letters. Return now
  submits shorter words (so `job` and `bye` work Ultima-style); Return on an empty line is `bye`.
  When a keyword matches, the game prints the rest of the word – these completions were rewritten
  (`crys` + `tal`, `guar` + `d` …). Keyword list per NPC: see the keyword lines (400–449) in
  `strings/*.txt`. Input stops after 4 letters, so 3-letter keywords also accept the 4-letter
  start of the longer word (`map`/`maps`, `god`/`gods`, `inn`/`innk`, `see`/`seei`). The oak dagger
  is `dagg` (talk) and `dagg`/`oakd` (use – spaces are not accepted there).
* **Combat**: a missed blow reads "<monster> / evades you!" because the monster's name is printed
  first.
* **Names**: town and person names unchanged; descriptive names translated (Schädelfeste → Skull
  Keep, Drachenhort → Dragon's Hoard, Lindwurm → wyrm, Zauberschwinge → spellwing, Waldschrat →
  woodwose, Höhlenschrat → cavewose, Moorleichen → bog wights, Zweihaupt → ettin).
* **Ingredients**: sulphur, garlic, ginseng, blood moss, pinewort (Zirbelkraut), deathbloom
  (Totenblume), nightshade (Gift der Nacht), mandrake (Alraune).
* **Status panel** keeps the original label widths: health, astral, att./def., str./dex.,
  int./cha., exp., gold pcs., food supply.
* **Style**: informal "you", archaic touches kept; dialects rendered as English dialect – the
  drunkards slur ("treashure"), the Bavarian tourist keeps Bavarian words ("grüss gott",
  "saupreissen"), the Ackbah cook's broken German is broken English. The 1990 caricatures of Ackbah
  (god "Opec", names) and the Kohl/"Birne" chancellor joke are kept as in the original.
* **Bard's song** (Gaht) is re-rhymed in English; the title-text DM order address and author credits
  are kept historically.
* **Copy protection** text is translated although the web app skips it.

## Open questions

* **The name of evil**: the seven clay tablets show the letters T-R-O-F-N-I-H (2×2 glyphs in each
  town's character set). Calling the name forwards (`trofnih`) destroys the world, backwards
  (`hinfort`, German for "begone!") wins. The English version currently keeps both words – the
  puzzle still works, but the pun is lost. An English 7-letter word would also need new tablet
  glyphs in seven charsets.
* **Shared fragments**: short sentence pieces that are reused by different sentences were checked
  file by file, but a playthrough will surely find a few awkward joins.
