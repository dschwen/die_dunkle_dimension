# Game areas

Analysis of the `ddd.konj` loader code reveals an area index `n` and a loader stage
`i`.

`n`| Disk | Area
---|------|------
0  | 1| A - Overworld
1  | 1| B - Druid cottage
2  | 1| C - King's castle
3  | 2| D - "Trisdic"
4  | 2| E - "Worthal" the seafarer town
5  | 2| F - "Gaht" the elven town
6  | 2| G - "Ackbah" the desert city
7  | 2| H - "Damraskan" the island city
8  | 2| I - "Muspel" the dwarven town
9  | 2| J - "Mubrak" the independent city
10 | 1| K - White wizzard
11 | 1| L - Black wizzard
12 | 3| M - Dragon cave (3D dungeon)
13 | 3| N - Dragon lair
14 | 3| O - Fire castle
15 | 3| P - Vampire count (3D dungeon)
16 | 3| Q - Skull keep
17 | 1| R (B tiles) - Death!

# Disk 1

```
   10 poke53265,11:n=peek(2):ifn>2andn<10thens=2:goto200
   20 ifn>11andn<17thens=3:goto200
   30 i=i+1:ifi=1andn<17thenload"ddd.code",8,1
   40 a$=chr$(n+65):ifi=2andn=17thenload"ddd.chrb",8,1
   50 ifi=2thenload"ddd.chr"+a$,8,1
   60 ifi=3andn>0andn<17thenload"ddd.map"+a$,8,1
  100 ifi<5goto30
  110 print"{clr}lO"chr$(34)"ddd.twn"a$chr$(34)",8
  120 print"{down}{down}{down}{down}pO53265,27:rU"::poke631,19:poke632,13:poke633,13:poke198,3:end
  200 print"{clr}{down}{down}{down}{down}{down}{down}{down}{down}{lgrn}   lege bitte die diskette {wht}nr."s"{lgrn}mit
  210 print"{down}   der vorderseite nach oben ein und
  220 print"{down}   dr]cke eine taste...{gry3}{down}{down}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}/{down}{left}{left}{wht}{rvon}yz{down}{left}{left}[\
  230 poke53265,27:poke198,0:wait198,1:print"{clr}{blk}lO"chr$(34)"ddd.konj"chr$(34)",8
  240 goto120
```

# Disk 2

```
   10 poke53265,11:n=peek(2):ifn>11andn<17thens=3:goto200
   20 ifn<3orn>9then:s=1:goto200
   30 i=i+1:ifi=1thenload"ddd.code",8,1
   40 a$=chr$(n+65):ifi=2thenload"ddd.chr"+a$,8,1
   50 ifi=3thenload"ddd.map"+a$,8,1
  110 print"{clr}lO"chr$(34)"ddd.twn"a$chr$(34)",8
  120 print"{down}{down}{down}{down}pO53265,27:rU"::poke631,19:poke632,13:poke633,13:poke198,3:end
  200 print"{clr}{down}{down}{down}{down}{down}{down}{down}{down}{lgrn}   lege bitte die diskette {wht}nr."s"{lgrn}mit
  210 print"{down}   der vorderseite nach oben ein und
  220 print"{down}   dr]cke eine taste...{gry3}{down}{down}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}/{down}{left}{left}{wht}{rvon}yz{down}{left}{left}[\
  230 poke53265,27:poke198,0:wait198,1:print"{clr}{blk}lO"chr$(34)"ddd.konj"chr$(34)",8
  240 goto120
```

# Disk 3

```
   10 poke53265,11:n=peek(2):ifn>2andn<10thens=2:goto200
   20 ifn=17orn<12thens=1:goto200
   30 i=i+1:ifi=1and(n=14orn=16)thenload"ddd.code",8,1
   40 a$=chr$(n+65):ifi=2andn=15thena$="m
   50 ifi=2thenload"ddd.chr"+a$,8,1
   60 ifi=3thenload"ddd.map"+a$,8,1
   70 ifi=4and(n=12orn=15)thenload"ddd.assm",8,1
   80 ifi=4andn=16thenload"ddd.scrl",8,1
  100 ifi<5goto30
  110 print"{clr}lO"chr$(34)"ddd.twn"a$chr$(34)",8
  120 print"{down}{down}{down}{down}pO53265,27:rU"::poke631,19:poke632,13:poke633,13:poke198,3:end
  200 print"{clr}{down}{down}{down}{down}{down}{down}{down}{down}{lgrn}   lege bitte die diskette {wht}nr."s"{lgrn}mit
  210 print"{down}   der vorderseite nach oben ein und
  220 print"{down}   dr]cke eine taste...{gry3}{down}{down}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}/{down}{left}{left}{wht}{rvon}yz{down}{left}{left}[\
  230 poke53265,27:poke198,0:wait198,1:print"{clr}{blk}lO"chr$(34)"ddd.konj"chr$(34)",8
  240 goto120
```
