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
49152  | 0xc000 |    | (starts at 34)
49153  | 0xc001 |    | (starts at 177)
49154  | 0xc002 |    | Player X in overword (starts at 64)
49155  | 0xc003 |    | Player Y in overword (starts at 89)
49156  | 0xc004 |    | (starts at 2)
49157  | 0xc005 |    | Transportation mode
"|"| 1  | Player on foot
"|"| 2  | Player on horse
"|"| 3  | Player on unicorn (einhorn)
"|"| 4  | Player on ship
"|"| 5  | Player on fire lizzard (feuerechse)
49158  | 0xc006 |    | (starts at 255)
...    |
49165  | 0xc00d |    | (starts at 255)
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

## Countdown registers
Starting at `0xc07f` (49279) seven countdown registers are located that are decremented at each turn (and perform an action when they reach one)

Address| (hex)  | Value | Comment
-------|--------|----|-------
49279  | 0xc07f | >0 | Player is dazed
...|
49285  | 0xc085 |

## State

Address| (hex)  |  Comment
-------|--------|-------
49287  | 0xc087 | Points to spend on skill training


## Spells
Starting at `0xc097` (49303) 16 flags determine if the spells "a" through "p" are known by the player.

Address| (hex)  | Value | Comment
-------|--------|----|-------
49303  | 0xc097 | >0 | Player knows "mag. licht" (light)
49304  | 0xc098 | >0 | Player knows "gift neutral." (cure poison)
49305  | 0xc099 | >0 | Player knows "schutzschild" (shield)
49306  | 0xc09a | >0 | Player knows "wunderheilung" (heal)
49307  | 0xc09b | >0 | Player knows "bannbrecher" (break curse)
49308  | 0xc09c | >0 | Player knows "lichtschild" (shield of light)
49309  | 0xc09d | >0 | Player knows "gewandtheit" (agility)
49310  | 0xc09e | >0 | Player knows "totenbann" (ban undead)
49311  | 0xc09f | >0 | Player knows "donnerkeil" (thunder strike)
49312  | 0xc0a0 | >0 | Player knows "gift u. galle" (poison)
49313  | 0xc0a1 | >0 | Player knows "feuerball" (fire ball)
49314  | 0xc0a2 | >0 | Player knows "flammenspur" (flame trace)
49315  | 0xc0a3 | >0 | Player knows "furchtfluch" (curse of fear)
49316  | 0xc0a4 | >0 | Player knows "zeit gefrier." (freeze time)
49317  | 0xc0a5 | >0 | Player knows "todesblitz" (death lightning)
49318  | 0xc0a6 | >0 | Player knows "mag. bombe" (magig bomb)

## Magic ingredients Inventory
Counters for carried ingredients.
Magic ingredients for each spell are defined using a bit set (8bit).

Address| (hex)  | index | Comment
-------|--------|-------|--------
49336  | 0xc0b8 | 0     | Magic ingredient 0
49337  | 0xc0b9 | 1     | Magic ingredient 1
49338  | 0xc0ba | 2     | Magic ingredient 2
49339  | 0xc0bb | 3     | Magic ingredient 3
49340  | 0xc0bc | 4     | Magic ingredient 4
49341  | 0xc0bd | 5     | Magic ingredient 5
49342  | 0xc0be | 6     | Magic ingredient 6
49343  | 0xc0bf | 7     | Alraune root


## Story flags

Address| (hex)  | Value | Comment
-------|--------|----|-------
49353  | 0xc0c9 | >0 | Player found 1000 gold pieces at `x=48`, `y=138` in the overworld
