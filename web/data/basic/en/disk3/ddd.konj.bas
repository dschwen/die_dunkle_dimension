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
200 print"{clr}{down}{down}{down}{down}{down}{down}{down}{down}{lgrn}   please insert disk {wht}no."s"{lgrn}
210 print"{down}   front side up and
220 print"{down}   press any key...{gry3}{down}{down}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}/{down}{left}{left}{wht}{rvon}yz{down}{left}{left}äö
230 poke53265,27:poke198,0:wait198,1:print"{clr}{blk}lO"chr$(34)"ddd.konj"chr$(34)",8
240 goto120
