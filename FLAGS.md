# Game state

The game state is stored in the 209 bytes starting at `0xc000` (49152)

## Save code

In the overworld (`ddd.twna`):
```
614 sys5681:sys5681:print"   speichere{home}":sys5681:print"  spiel nr. "u$"{home}
615 u$="ddd.sav"+u$:open1,8,15,"s:"+u$:close1:open1,8,1,u$+",p,w"
616 print#1,chr$(0)chr$(192);:fori=0to208:print#1,chr$(peek(49152+i));:next
617 close1:sys5681:sys5681:print"{yel}bitte lege jetzt{home}":sys5681:print"wieder die{home}
```

Address| (hex)  | Value | Comment
-------|--------|----|-------
49152  | 0xc000 |    | LSB Address of top left tile in viewport (34 at game start)
49153  | 0xc001 |    | MSB " (177 at game start)
49154  | 0xc002 |    | Player X in overword (starts at 64 at game start)
49155  | 0xc003 |    | Player Y in overword (starts at 89 at game start)
49156  | 0xc004 |    | Subtile index (0,1,2) (2 at game start)
49157  | 0xc005 |    | Transportation mode
"|"| 1  | Player on foot
"|"| 2  | Player on horse
"|"| 3  | Player on unicorn (einhorn)
"|"| 4  | Player on ship
"|"| 5  | Player on fire lizzard (feuerechse)
49158  | 0xc006 |    | X position horse (255 at game start - off map)
49159  | 0xc007 |    | X position unicorn (255 at game start)
49160  | 0xc008 |    | X position ship (255 at game start)
49161  | 0xc009 |    | X position fire lizzard (255 at game start)
49162  | 0xc006 |    | Y position horse (255 at game start - off map)
49163  | 0xc007 |    | Y position unicorn (255 at game start)
49164  | 0xc008 |    | Y position ship (255 at game start)
49165  | 0xc009 |    | Y position fire lizzard (255 at game start)
49166  | 0xc00e |    | Player gender
"|"| 0  | male
"|"| 1  | female
49167  | 0xc00f || Current shield (see `w$` array)
49168  | 0xc010 || Monster 0 - type (active on the overworld)
...    |
49177  | 0xc019 || Monster 9 - type
(gap)  |
49188  | 0xc024 || Monster 0 - x coordinate
...    |
49197  | 0xc02d || Monster 9 - x coordinate
49198  | 0xc02e || Monster 0 - y coordinate
...    |
49207  | 0xc037 || Monster 9 - y coordinate
49208  | 0xc038 | LSB game moves
49209  | 0xc039 | MSB (`*256`) game moves
49210  | 0xc03a | MMSB (`*65536`) game moves
49211  | 0xc03b | Player name letter 1
...    |
49223  | 0xc047 | Player name letter 13

When buying a ship in Worthal the ship coordinates are set to `x=48`, `y=35`

## Character stats

Address| (hex)  |  Comment
-------|--------|-------
49224  | 0xc048 | Strength skill
49225  | 0xc049 | Dexterity skill
49226  | 0xc04a | Intelligence skill
49227  | 0xc04b | Charisma skill
49228  | 0xc04c | Attack skill
49229  | 0xc04d | Defense skill
49230  | 0xc04e | LSB **Current hit points** (starts at 99)
49231  | 0xc04f | MSB **Current hit points**
49232  | 0xc050 | LSB Max hit points (starts at 99)
49233  | 0xc051 | MSB Max hit points
49234  | 0xc052 | LSB Current astral points
49235  | 0xc053 | MSB Current astral points
49236  | 0xc054 | LSB Max astral points
49237  | 0xc055 | MSB Max astral points
49238  | 0xc056 | LSB Experience points
49239  | 0xc057 | MSB (`*256`) Experience points
49240  | 0xc058 | MMSB (`*65536`) Experience points
49241  | 0xc059 | Level
49242  | 0xc05a | LSB Gold
49243  | 0xc05b | MSB Gold
49244  | 0xc05c | Food
49245  | 0xc05d | Poison factor
49246  | 0xc05e | Current weapon (see `w$` array)
49247  | 0xc05f | Current armor (see `w$` array)
<s>49248>/s>  | <s>0xc060</s> | _this is erroneously assigned to `sh` in some places_

### `w$` array inventory items
Set to `>0` if owned

Address| (hex)  | index| string | comment
-------|--------|------|--------|-----
<s>49247</s>  | <s>0xc05f</s> | 0 | haende | always owned
49248  | 0xc060 | 1 | messer
49249  | 0xc061 | 2 | dolch
49250  | 0xc062 | 3 | kurzschwert
49251  | 0xc063 | 4 | handbeil
49252  | 0xc064 | 5 | schwert
49253  | 0xc065 | 6 | morgenstern
49254  | 0xc066 | 7 | kampfstab
49255  | 0xc067 | 8 | bastardschw.
49256  | 0xc068 | 9 | streitaxt
49257  | 0xc069 | 10 | zweihaender
49258  | 0xc06a | 11 | schleuder
49259  | 0xc06b | 12 | kurzbogen
49260  | 0xc06c | 13 | blasrohr |(blow gun) obtained in Mubrak
49261  | 0xc06d | 14 | langbogen
49262  | 0xc06e | 15 | armbrust
49263  | 0xc06f | 16 | magische axt  | 'famous' magic axe at `x=17`, `y=63` in the overworld
49264  | 0xc070 | 17 | elbenbogen    | obtained in Ghat (Thyra sent me)
49265  | 0xc071 | 18 | zauberschwin. | 'magic' wings (_sicaria draconem_) at `x=48`, `y=106` in the overworld

## Armour
Address| (hex)  | index| string | comment
-------|--------|------|--------|-----
49266  | 0xc072 | 19 | kleidung | always owned
49267  | 0xc073 | 20 | waffenrock
49268  | 0xc074 | 21 | lederruestung
49269  | 0xc075 | 22 | kettenhemd
49270  | 0xc076 | 23 | schuppenpanz.
49271  | 0xc077 | 24 | ritterruestung
49272  | 0xc078 | 25 | mag. ruestung

## Shield
Address| (hex)  | index| string | comment
-------|--------|------|--------|-----
49273  | 0xc079 | 26 | kleiner schild
49274  | 0xc07a | 27 | grosser schild | cannot be used with two-handed weapons(?)
(gap)|

## Countdown registers
Starting at `0xc07f` (49279) seven countdown registers are located that are decremented at each turn (and perform an action when they reach one)

Address| (hex)  | Value | Comment
-------|--------|----|-------
49279  | 0xc07f | >0 |  (betaeubt) Player is dazed (no parry, no shield use)
(gap)|
49282  | 0xc082 | >0 | Agility spell (lasts 23 turns) - Enemies move every second turn
49283  | 0xc083 | >0 | Freeze time spell (lasts 13 turns) - Enemies do not move
49284  | 0xc084 | >0 | Shield spell (lasts 13 turns)
49285  | 0xc085 | >0 | Shield of light (lasts 13 turns)
(gap)|

## State

Address| (hex)  |  Comment
-------|--------|-------
49287  | 0xc087 | Points to spend on skill training
(gap)|


## Spells
Starting at `0xc097` (49303) 16 flags determine if the spells "a" through "p" are known by the player.

WM 302,307,321,312,302,337,342,326
BM 346,353,357,366,361,370,374,378

Address| (hex)  | min Astral| Ingredients | Comment
-------|--------|-----------|-------------|---------
**White Magic** |
49303  | 0xc097 |  2 || Light (mag. licht), duration is tracked using the local variable `f`
49304  | 0xc098 |  5 || Cure poison (gift neutral.), costs 3 AS per poison point
49305  | 0xc099 | 10 || Shield (schutzschild), does not work if shield of light is active
49306  | 0xc09a | 10 || Heal (wunderheilung), costs 1 AS per HP and one extra AS
49307  | 0xc09b |  ? || Break curse (bannbrecher)
49308  | 0xc09c | 15 || Shield of light (lichtschild), does not work if shield spell is active
49309  | 0xc09d | 20 || Agility (gewandtheit)
49310  | 0xc09e |  ? || Ban undead (totenbann)
**Black Magic** |
49311  | 0xc09f |  5 || Thunder strike (donnerkeil)
49312  | 0xc0a0 |  7 || Poison (gift u. galle)
49313  | 0xc0a1 | 10 || Fire ball (feuerball)
49314  | 0xc0a2 |  ? || Flame trace (flammenspur)
49315  | 0xc0a3 |  ? || Curse of fear (furchtfluch)
49316  | 0xc0a4 | 25 || Freeze time (zeit gefrier.)
49317  | 0xc0a5 | 20 || Death lightning (todesblitz)
49318  | 0xc0a6 |  ? || Magic bomb (mag. bombe)

The use of 49319 - 49335 is not yet known

## Magic ingredients Inventory (`g$` array)
Counters for carried ingredients.
Magic ingredients for each spell are defined using a bit set (8bit).

Address| (hex)  | index | Comment
-------|--------|-------|--------
49336  | 0xc0b8 | 0     | Sulfur (schwefel)
49337  | 0xc0b9 | 1     | Garlic (knoblauch)
49338  | 0xc0ba | 2     | Ginseng
49339  | 0xc0bb | 3     | Blood moss (blutflechte)
49340  | 0xc0bc | 4     | (zirbelkraut)
49341  | 0xc0bd | 5     | Flower of death (totenblume)
49342  | 0xc0be | 6     | Poison of the night mushroom (g. d. nacht)
49343  | 0xc0bf | 7     | Alraune root (alraune)

schwefel,knoblauch,ginseng,blutflechte,zirbelkraut,totenblume
60301 datag. d. nacht,alraune

Address| (hex)  | Value | Comment
-------|--------|-------|--------
49344  | 0xc0c0 |       | Trainer countdown Kings Castle
49345  | 0xc0c1 |       | ?
49346  | 0xc0c2 |       | When pressing `h` riding a horse or unicorn in the overworld
"|"| 0  | say 'hooh!
"|"| 1  | say 'haa!'

Address| (hex)  | Item    | Comment
-------|--------|---------|--------
49347  | 0xc0c3 | Sextant | player can get the overword position with `p`
49348  | 0xc0c4 | Lava protection ring (feuerring) | Found at fire castle as reward for killing kroloc
49349  | 0xc0c5 | Oak dagger (eichendolch) | Found in Mubrak by t'kul
49350  | 0xc0c6 | Glass flute (glasfloete) |
49351  | 0xc0c7 | Shard (splitter) | Found in dragon cave, play flute to get it
49352  | 0xc0c8 | >0 | Player gave the location of Mubrak to the king (for 2000gp)
49353  | 0xc0c9 | >0 | Player found 1000 gold pieces at `x=48`, `y=138` in the overworld
49354  | 0xc0ca | Compass (kompass) | Shows the direction in dungeon levels
49355  | 0xc0cb | Lamp (lampe) |
49356  | 0xc0cc | Torches (fackeln) | This contains the *number* of torches held
49357  | 0xc0cd | >0 | Player found 500 gold pieces in the dragon cave
49358  | 0xc0ce | Dragon Claw (drachenkralle) | obtained from princess in dragon cave, opens the dragon cave loot room door
49359  | 0xc0cf | >0 | Count kroloc is dead (last byte in game status)
