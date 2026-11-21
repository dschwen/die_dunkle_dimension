1 l=l+1:ifl=1thenload"ddd.dchr",8,1
2 ifl=2thenload"ddd.dtxt",8,1
3 ifl=3thenload"ddd.dttl",8,1
4 ifl=4thenload"ddd.dcod",8,1
5 ifl=5thenload"ddd.dspr",8,1
6 ifl=6thenload"ddd.dsnd",8,1
7 ifl=8thenload"ddd.dtun",8,1
8 ifl=9thenfori=3584to3902:pokei,.:next:goto30
10 sys52224:sys4615:poke4143,235:poke4443,4:poke4138,7:poke198,0:sys4892
20 poke53269,0:sys52232:load"ddd.titl",8,1
30 sys4799:poke4099,32:sys52992:sys4615:poke4143,241:poke4138,1:poke198,0:sys4892
40 poke53269,0:sys53129:sys4799:poke53281,0:gosub100:poke53276,0:poke56325,64
90 print"{home}{blk}pO43,1:pO44,30:pO7680,0:lO"chr$(34)"ddd.boot"chr$(34)",8
92 fori=1to12:print"rU:":next:poke631,19:poke632,13:poke633,13:poke198,3:new
100 poke56325,64:print"{clr}{down}{down}{down}{down}{down}{down}{down}{down}"spc(8)"{red}{$b8}{$a3}{$a3}    {$a3}{$a3}{$a3}{$a3}{$a3}{$b8}       {$b8}{$a3}{$a3}
102 poke53271,0:printspc(6)"{$b8}{$b8}{$a3}{$a3}{$a3}{$a3}{$a3}  {$a3}{$a3}{$a3}{$a3}{$a3}{$a3}{$b8}{$b8}   {$b8}{$b8}{$a3}{$a3}{$a3}{$a3}{$a3}
103 poke53277,0:printspc(5)"{$b8}{$b8}{$a3}{$a3}{$a3}{$a3}{$a3}{$a3}{$a3} {$a3}{$a3}{$a3}{$a3}{$a3}{$a3}{$a3}{$b8}{$b8} {$b8}{$b8}{$a3}{$a3}{$a3}{$a3}{$a3}{$a3}{$a3}
104 printspc(5)"{$b8}{$b8}{$a3}{$a3}{$a3}{$b8}{$b8}{$b8}{$b8} {$a3}{$a3}{$a3}{$a3}{$a3}{$a3}{$a3}{$b8}{$b8} {$b8}{$b8}{$a3}{$a3}{$a3}{$b8}{$b8}{$b8}{$b8}
105 printspc(5)"{$b8}{$b8}{$a3}{$a3}{$a3}{$a3}{$a3}{$b8}{$b8} {$a3}{$a3}{$a3}{$a3}{$a3}{$a3}{$b8}{$b8}{$b8} {$b8}{$b8}{$a3}{$a3}{$a3}{$a3}{$a3}{$b8}{$b8}
106 printspc(5)"{$b8}{$b8}{$b8}{$a3}{$a3}{$a3}{$a3}{$b8}{$b8} {$a3}{$a3}{$a3}{$a3}{$a3}{$b8}{$b8}{$b8}{$b8} {$b8}{$b8}{$b8}{$a3}{$a3}{$a3}{$a3}{$b8}{$b8}
107 printspc(6)"{$b8}{$b8}{$b8}{$a3}{$a3}{$b8}{$b8}  {$a3}{$a3}{$a3}{$b8}{$b8}{$b8}{$b8}{$b8}   {$b8}{$b8}{$b8}{$a3}{$a3}{$b8}{$b8}
108 printspc(8)"{$b8}{$b8}{$b8}    {$b8}{$b8}{$b8}{$b8}{$b8}{$b8}       {$b8}{$b8}{$b8}
109 printspc(10)"{down}{wht}german design group":return
