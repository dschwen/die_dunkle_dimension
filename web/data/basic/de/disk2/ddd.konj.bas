10 poke53265,11:n=peek(2):ifn>11andn<17thens=3:goto200
20 ifn<3orn>9then:s=1:goto200
30 i=i+1:ifi=1thenload"ddd.code",8,1
40 a$=chr$(n+65):ifi=2thenload"ddd.chr"+a$,8,1
50 ifi=3thenload"ddd.map"+a$,8,1
110 print"{clr}lO"chr$(34)"ddd.twn"a$chr$(34)",8
120 print"{down}{down}{down}{down}pO53265,27:rU"::poke631,19:poke632,13:poke633,13:poke198,3:end
200 print"{clr}{down}{down}{down}{down}{down}{down}{down}{down}{lgrn}   lege bitte die diskette {wht}nr."s"{lgrn}mit
210 print"{down}   der vorderseite nach oben ein und
220 print"{down}   drücke eine taste...{gry3}{down}{down}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}/{down}{left}{left}{wht}{rvon}yz{down}{left}{left}äö
230 poke53265,27:poke198,0:wait198,1:print"{clr}{blk}lO"chr$(34)"ddd.konj"chr$(34)",8
240 goto120
