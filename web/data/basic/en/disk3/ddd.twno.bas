1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454:i=rnd(-ti)
2 ifpeek(49161)<255thenpoke7153,11
6 gosub11000:dima(3),p(3):fori=0to3:reada(i),p(i):next:poke650,255:goto20
7 fori=0to3:j=int(4*rnd(ti)):k=p(i)+a(j):ifk=6144+x+35*ygoto9
8 ifpeek(k)=11andk<7400thenpokep(i),11:p(i)=k:pokep(i),21
9 next:return
20 print"{home}{down}{down}"spc(24)"{lgrn}health:   (   )":printspc(24)"{up}{cyn}astral:   (   )
21 printspc(24)"{lred}att.:   {grn}def.:":printspc(24)"{up}{pur}str.:   {yel}dex.:
22 printspc(24)"{gry3}int.:   {lblu}cha.:":printspc(24)"{up}{lgrn}exp.:      (  )
23 printspc(24)"{yel}gold pcs.:":printspc(24)"{up}{orng}food supply:
25 x=17:y=36:q=11:gosub10000
100 poke2,x:poke182,y:sys6052:sys4482:sys4537:gosub7:sys4361:sys5440:sys5681
102 ifq=10andpeek(49348)=.goto6200
105 print"{wht}@G{left}";:z=0:ify=37goto3300
110 z=z+1:ifz>299goto200
120 getu$:ifu$=""goto110
122 ifu$=" "goto200
124 ifu$="{up}"goto210
125 ifu$="{down}"goto220
126 ifu$="{left}"andx>.goto230
127 ifu$="{rght}"andx<34goto234
128 ifu$="t"goto240
129 ifu$="r"thenprint"weapon{home}":goto191
130 ifu$="w"thenprint"armour{home}":goto191
131 ifu$="i"thenprint"inventory{home}":goto191
190 print"what..?{home}":goto100
191 sys5681:print"{yel}do that{home}":sys5681:print"outside!{home}":goto100
200 print"waiting...{home}":goto100
210 print"north{home}":j=peek(881):ifj=18goto2500
211 ifj<6orj=9or(j>11andj<119)goto214
212 pokep,q:q=j:y=y-1:goto6100
214 sys5681:print"{lred}blocked!{home}":sys5681:goto100
220 print"south{home}":j=peek(903):ifj<6orj=9or(j>11andj<119)goto214
222 pokep,q:q=j:y=y+1:goto6100
230 print"west{home}":j=peek(891):ifj<6orj=9or(j>11andj<119)goto214
232 pokep,q:q=j:x=x-1:goto6100
234 print"east{home}":j=peek(893):ifj<6orj=9or(j>11andj<119)goto214
236 pokep,q:q=j:x=x+1:goto6100
240 print"talk";:sys5681:print"{yel} -direction? {wht}G{left}";:z=0
250 z=z+1:ifz>499goto258
252 getu$:ifu$=""goto252
254 ifu$="{up}"thenprint"north{home}":j=-11:goto260
255 ifu$="{down}"thenprint"south{home}":j=11:goto260
256 ifu$="{left}"thenprint"west{home}":j=-1:goto260
257 ifu$="{rght}"thenprint"east{home}":j=1:goto260
258 print"no{home}":sys5681:z=0:goto100
260 j=peek(892+j):sys5681:h=0:ifj=21thenh=1
261 ifj=17thenh=5
262 ifj=16thenh=2:ifx>19thenh=3
279 ifh=.thenprint"{lred}no answer!{home}":sys5681:goto100
280 sys5681:print"{cyn}you talk to{home}":sys5681:ifh=1thenprint"a guard.";
281 ifh=2orh=3thenprint"a fire{home}":sys5681:print"devil.";
287 ifh=5thenprint"the fire demon{home}":sys5681:print"fulgar.";
297 print"{home}":ifh=5goto2000
298 ifrnd(ti)<.5goto400
299 goto820
400 gosub900:ifrnd(ti)<.05thenprint" {home}":goto880
401 ifh=1andn$="guar"goto1000
402 ifh=1andn$="fort"goto1001
403 ifn$="gold"goto1016
404 ifh=2andn$="fort"goto1020
405 ifh=3andn$="liza"goto1110
406 ifh=3andn$="stab"goto1100
407 ifn$="demo"orn$="fulg"thenifpeek(49359)=.goto1030
408 ifh=3andn$="moun"andpeek(7153)=18goto1120
413 ifn$="name"thenprint"?{home}":goto820
414 ifn$="job"goto860
415 ifn$="fuck"orn$="piss"ormid$(n$,2)="ung"orn$="shit"orn$="porn"goto449
420 ifn$="bye"thenprint"!{home}":goto880
421 ifn$="heal"thenprint"th?{home}":goto840
441 print" {home}":gosub800:print"i can't tell{home}":sys5681:print"you anything{home}":sys5681
442 print"about that.%{home}
443 goto400
449 print" {home}":gosub800:print"you are a{home}":sys5681:print"dirty old pig!%{home}":goto400
800 gosub999:print"{yel}the ";
801 ifh=1thenprint"guard{home}
802 ifh=2orh=3thenprint"fire devil{home}
810 ifh=5thenprint"fire demon{home}
819 sys5681:print"says:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"i am ";:ifh=1thenprint"a{home}":sys5681:print"guard";
821 ifh=2thensys5681:print"f'gor";
822 ifh=3thensys5681:print"n'lar";
839 print".%{home}":goto400
840 gosub800:ifh=1thenprint"excellent,{home}":sys5681:print"thank you";
841 ifh=2orh=3thenprint"quite well";
859 goto839
860 print"?{home}":ifh=1goto820
862 gosub800:ifh=2thenprint"i am the";:sys5681:print"steward";
863 ifh=3thenprint"i am the{home}":sys5681:print"stable hand";
879 goto839
880 gosub800:ifh=1thenprint"i must get back{home}":sys5681:print"to guard duty";
881 ifh=3orh=2thenprint"may fire light{home}":sys5681:print"your way";
897 print".%{home}":sys5681:sys5681
898 print"{yel}he turns{home}":sys5681:print"away.{home}":sys5681:goto100
900 gosub999:print"{yel}your business?";:sys5681:print"{wht}@G{left}";:z=0:n$="":poke198,0
910 getu$:ifu$=chr$(13)thenn$=n$+mid$("bye",1,-3*(z=0)):printmid$("bye",1,-3*(z=0));:return
912 ifu$=chr$(20)andz>0thenz=z-1:n$=left$(n$,z):print" {left}{left}G{left}";
920 ifu$<"a"oru$>"z"goto910
930 printu$"G{left}";:n$=n$+u$:z=z+1:ifz=4thenreturn
940 goto910
960 sys5681:printspc(15)"{wht}G{left}{lgrn}";:poke198,0:wait198,1:print" {home}":sys5681:return
970 print" {wht}G{left}";:poke198,0
971 getu$:ifu$="y"oru$="n"thenprintu$"{lgrn}{home}":goto999
972 goto971
980 gosub800:print"do you want to{home}":sys5681:print"buy or{home}":sys5681:print"sell? {wht}G{left}";
981 getu$:ifu$<>"b"andu$<>"s"goto981
982 printu$"{lgrn}";:goto999
999 sys5681:sys5681:return
1000 print"d{home}":gosub800:print"i guard the{home}":sys5681:print"fortress.%{home}":goto400
1001 print" ":gosub800:print"this is the{home}":sys5681:print"fortress of the{home}
1002 sys5681:print"mighty{home}":sys5681:print"fire demon{home}
1003 sys5681:print"fulgar.{home}":gosub960:print"are you in{home}":sys5681:print"his service?";
1004 gosub970:ifu$="n"thenprint"report to{home}":sys5681:print"the steward.%{home}":goto400
1005 print"then hurry to{home}":sys5681:print"him and make{home}
1006 sys5681:print"your report.%{home}":goto400
1016 print" {home}":gosub800:print"yes, i'd like{home}";:sys5681:print"some gold too!%{home}":goto400
1020 print" {home}":gosub800:print"this is the{home}":sys5681:print"fortress of the{home}
1022 sys5681:print"fire demon{home}":sys5681:print"fulgar.%{home}":goto400
1030 print" {home}":gosub800:print"fulgar may{home}":sys5681:print"well have a bad{home}
1032 sys5681:print"reputation{home}":sys5681:print"among humans,{home}
1034 sys5681:print"mostly because{home}":sys5681:print"of the fire{home}
1036 sys5681:print"lizards that{home}":sys5681:print"have lately{home}
1038 sys5681:print"been marauding.{home}":gosub960:print"but let me{home}
1040 sys5681:print"explain the{home}":sys5681:print"following.{home}
1042 gosub960:print"fulgar is called{home}":sys5681:print"a fire demon,{home}
1043 sys5681:print"but that is{home}":sys5681:print"not quite{home}
1044 sys5681:print"correct. he is{home}":sys5681:print"an elemental{home}
1045 sys5681:print"being, namely{home}":sys5681:print"that of{home}
1046 sys5681:print"fire. we, his{home}":gosub960:print"servants, the{home}
1047 sys5681:print"fire devils, are{home}":sys5681:print"in truth also{home}
1048 sys5681:print"elemental{home}":sys5681:print"spirits, but of{home}
1049 sys5681:print"a lower{home}":sys5681:print"order.{home}
1050 gosub960:print"towards humans{home}":sys5681:print"fulgar has a{home}
1051 sys5681:print"rather neutral{home}":sys5681:print"attitude, that{home}
1052 sys5681:print"is, he doesn't{home}":sys5681:print"bother with them{home}
1053 sys5681:print"but pursues his{home}":sys5681:print"own interests,{home}
1054 sys5681:print"which do not{home}":sys5681:print"harm{home}
1055 sys5681:print"humans.{home}":gosub960:print"the fire lizards{home}
1056 sys5681:print"are being set{home}":sys5681:print"against humans{home}
1057 sys5681:print"by the arch-{home}":sys5681:print"demon who{home}
1058 sys5681:print"destroyed the{home}":sys5681:print"crystal.{home}
1059 sys5681:print"this annoys{home}":sys5681:print"fulgar, as we{home}
1060 sys5681:print"lose many{home}":sys5681:print"lizards.{home}
1061 gosub960:print"but otherwise{home}":sys5681:print"evil does not{home}
1062 sys5681:print"bother fulgar{home}":sys5681:print"much, and he{home}
1063 sys5681:print"takes no action{home}":sys5681:print"against it. he{home}
1064 sys5681:print"has other{home}":sys5681:print"problems. that{home}
1065 sys5681:print"is why he{home}":sys5681:print"sent for you.{home}
1066 gosub960:print"you are the{home}":sys5681:print"first human{home}
1067 sys5681:print"he has allowed{home}":sys5681:print"to enter his{home}
1068 sys5681:print"fortress.{home}":gosub960:print"he has a{home}":sys5681:print"task for{home}
1069 sys5681:print"you, and for{home}":sys5681:print"doing it he{home}
1070 sys5681:print"will surely{home}":sys5681:print"reward you with{home}
1071 sys5681:print"something that{home}":sys5681:print"will help you{home}
1072 sys5681:print"fight evil.{home}":sys5681:print"fulgar is very{home}
1074 sys5681:print"generous.{home}":gosub960:print"now go to{home}
1075 sys5681:print"him. he is{home}":sys5681:print"expecting you.%{home}":goto400
1100 print"le hand{home}":gosub800:print"i look{home}":sys5681:print"after the{home}
1102 sys5681:print"fire lizards.%{home}":goto400
1110 print"rds{home}":gosub800:print"we breed them{home}":sys5681:print"as mounts.%{home}":goto400
1120 print"ts{home}":gosub800:print"yes, normally{home}":sys5681:print"they are{home}
1122 sys5681:print"very tame and{home}":sys5681:print"obedient. fulgar{home}
1124 sys5681:print"always rides the{home}":sys5681:print"albino in the{home}
1126 sys5681:print"middle stall.{home}":gosub960:print"excuse me,{home}
1128 sys5681:print"i have a lot":sys5681:print"to do";:goto897
2000 gosub800:print"welcome,{home}":sys5681:print"              {home}
2002 fori=0to12:j=peek(49211+i):poke1968+i,j:ifj<>32thennext
2004 poke1968+i,33:sys5681:ifpeek(49359)goto2200
2010 print"i have heard{home}":sys5681:print"much about you{home}":sys5681:print"and have{home}
2012 sys5681:print"been expecting{home}":sys5681:print"you.{home}
2014 gosub960:print"and not only{home}":sys5681:print"expected you,{home}
2016 sys5681:print"i even sent{home}":sys5681:print"for you. have{home}
2018 sys5681:print"you met my{home}":sys5681:print"servant t'kul{home}
2020 sys5681:print"in mubrak?";:gosub970:ifu$="y"goto2040
2022 print"hm, no matter,{home}":sys5681:print"but you must{home}":sys5681:print"still look him{home}
2024 sys5681:print"up, if you{home}":sys5681:print"accept my{home}
2026 sys5681:print"task. he{home}":sys5681:print"has an{home}
2028 sys5681:print"oak dagger":sys5681:print"you will need.{home}
2030 sys5681:print"have him give":sys5681:print"it to you.%{home}":goto2100
2040 print"good, then you{home}":sys5681:print"know that i{home}
2042 sys5681:print"have a task{home}":sys5681:print"for you.{home}":gosub960
2043 sys5681:print"but for that{home}
2044 sys5681:print"you need the{home}":sys5681:print"oak dagger.{home}
2045 sys5681:print"did t'kul give{home}":sys5681:print"it to you?";:gosub970
2046 ifu$="y"thenprint"good.{home}":goto2100
2050 print"that stupid{home}":sys5681:print"idiot. i told{home}":sys5681
2052 print"him{home}":sys5681:print"specifically to{home}":sys5681:print"give it to you,{home}
2054 sys5681:print"but the fool{home}":sys5681:print"apparently{home}
2056 sys5681:print"only had the{home}
2058 sys5681:print"casino on his{home}":gosub960:print"mind. go to him{home}
2060 sys5681:print"once more and{home}":sys5681:print"demand the{home}
2062 sys5681:print"oak dagger.{home}
2100 gosub960:print"my task for{home}":sys5681:print"you is this:{home}
2102 sys5681:print"go to the castle{home}";:sys5681:print"of the vampire{home}
2104 sys5681:print"count kroloc,{home}";:sys5681:print"which lies in{home}
2106 sys5681:print"the swamps of";:sys5681:print"death, and slay{home}
2108 sys5681:print"count kroloc.";:gosub960:print"i am at deadly{home}
2110 sys5681:print"enmity with this";:sys5681:print"vampire prince.{home}
2112 sys5681:print"{home}":sys5681:print"if you kill him,{home}
2114 sys5681:print"it would be{home}":sys5681:print"a boon for{home}
2116 sys5681:print"humankind{home}":sys5681:print"too.{home}
2120 gosub960:print"i could kill him{home}":sys5681:print"myself with{home}":sys5681:print"some effort,{home}
2122 sys5681:print"but as a{home}":sys5681:print"being of fire{home}
2124 sys5681:print"i find those{home}":sys5681:print"disgusting{home}
2126 sys5681:print"swamps{home}":sys5681:print"simply{home}
2128 sys5681:print"too wet.{home}":gosub960:print"the count's{home}
2130 sys5681:print"castle is a{home}":sys5681:print"three-storey,{home}
2132 sys5681:print"half-ruined{home}":sys5681:print"tangle of{home}
2134 sys5681:print"passages,{home}":sys5681:print"teeming with{home}
2136 sys5681:print"traps and the{home}":sys5681:print"count's minions.{home}
2140 gosub960:print"the count dwells{home}":sys5681:print"in a kind of{home}
2142 sys5681:print"crypt above the{home}":sys5681:print"third floor.{home}
2144 sys5681:print"he masters{home}":sys5681:print"the black{home}
2146 sys5681:print"arts and can{home}":sys5681:print"only be{home}
2148 sys5681:print"destroyed{home}":sys5681:print"with the{home}
2150 sys5681:print"oak dagger.{home}":gosub960:print"the dagger is{home}
2151 sys5681:print"made from the{home}":sys5681:print"wood of his{home}
2152 sys5681:print"coffin and works{home}
2153 sys5681:print"only on kroloc.{home}":sys5681:print"do you accept{home}
2154 sys5681:print"the task?";:gosub970
2156 ifu$="n"thenprint"you miserable{home}":sys5681:print"coward";:goto897
2158 print"my blessing{home}":sys5681:print"goes with you";:goto897
2200 ifpeek(49348)goto2290
2202 print"hearty{home}";:sys5681:print"congratulations,{home}":sys5681:print"you have{home}
2204 sys5681:print"destroyed him!{home}":gosub960:print"as thanks i{home}
2206 sys5681:print"want to give you{home}":sys5681:print"something very{home}":sys5681
2208 print"special.%{home}":gosub960:print"{yel}he pulls a{home}":sys5681:print"ring from{home}
2210 sys5681:print"his finger{home}":sys5681:print"and hands it{home}":sys5681
2212 print"to you.{home}":gosub960:gosub800:print"this is a{home}":sys5681:print"fire ring. it{home}
2214 sys5681:print"lets its{home}":sys5681:print"wearer safely{home}
2216 sys5681:print"cross liquid{home}":sys5681:print"lava.{home}
2218 gosub960:print"you are the{home}":sys5681:print"first human{home}
2220 sys5681:print"to receive such{home}":sys5681:print"a ring. sadly{home}
2222 poke49348,1:sys5681:print"it only protects{home}":sys5681:print"against lava,{home}
2224 sys5681:print"not against{home}":sys5681:print"other fire.{home}
2226 gosub960:print"is that reward{home}":sys5681:print"enough?";:gosub970
2228 ifu$="y"thenprint"use it well";:goto897
2230 print"you are bold,{home}";:sys5681:print"but i am{home}":sys5681:print"generous.{home}
2232 sys5681:print"you shall also{home}";:sys5681:print"be rewarded{home}
2234 sys5681:print"in coin.{home}";:sys5681:print"will 500 gold{home}
2236 sys5681:print"pieces do?";:gosub970
2238 ifu$="y"thenz=-500:gosub9004:sys5681:print"{lgrn}there you are";:goto897
2240 print"that's enough!{home}":sys5681:print"you are far too{home}":sys5681:print"impudent!{home}
2242 sys5681:print"now you get{home}":sys5681:print"no gold at all";:goto897
2290 ifpeek(49161)<255goto2400
2300 print"make yourself{home}":sys5681:print"at home in{home}":sys5681:print"my fortress";:goto897
2400 print"i'm a bit{home}":sys5681:print"cross with you,{home}
2410 sys5681:print"because you took{home}";:sys5681:print"my fire lizard{home}
2412 sys5681:print"without{home}";:sys5681:print"asking.{home}
2414 gosub960:print"but fine, i'll{home}";:sys5681:print"lend her to you{home}
2416 sys5681:print"for as long as{home}";:sys5681:print"you fight evil,{home}
2418 sys5681:print"since i bear{home}";:sys5681:print"a grudge{home}
2420 sys5681:print"against evil{home}";:sys5681:print"for its hold{home}
2422 sys5681:print"over my{home}";:sys5681:print"lizards.{home}
2426 gosub960:print"i'll get my{home}";:sys5681:print"mount back{home}
2428 sys5681:print"in any case.{home}
2430 sys5681:print"{home}":gosub960:print"once evil{home}
2432 sys5681:print"has crushed{home}":sys5681:print"you,{home}
2434 sys5681:print"she'll find her{home}":sys5681:print"way back";:goto897
2500 poke892,11:sys4361:y=y-1:poke49157,5:poke7153,11
2502 sys5681:print"{yel}you swing{home}":sys5681:print"yourself onto{home}
2504 sys5681:print"{yel}the back of the{home}":sys5681:print"fire lizard!{home}":sys5681:fori=0to8
2506 forj=0to180:next:ifi/4=int(i/4)thensys6041:pokes+5,160:pokes+1,5:pokes+4,129
2510 y=y+1:poke2,x:poke182,y:sys6052:sys4482:poke892,18:sys4361
2520 next:goto6000
3300 print"{left}  {home}":sys5681:print"{yel}do you want to{home}":sys5681:print"leave the fort{home}
3301 sys5681:print"now?";:gosub970:ifu$="n"theny=y-1:goto100
6000 sys5681:print"{lred}you leave{home}":sys5681:print"the fortress.{home}
6010 fori=0to999:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
6020 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:poke2,0:new
6100 pokes+4,0:pokes+5,16:pokes+1,12:pokes+4,129:goto100
6200 poke892,22:sys5681:print"{lred}hot lava{home}":sys5681:print"burns you!{home}
6210 sys5681:sys4361:sys6041:pokes+5,10:pokes+4,129:hp=hp-30:ifhp<1thenhp=.
6215 poke49231,hp/256:poke49230,hp-256*peek(49231)
6220 fori=0to60:pokes+1,130*rnd(ti):next:poke892,27:ifhp=.goto6300
6230 ifu$="@"theny=y+1
6232 ifu$="/"theny=y-1
6234 ifu$=":"thenx=x+1
6236 ifu$=";"thenx=x-1
6240 gosub10000:sys4361:q=peek(6144+x+35*y):goto6100
6300 poke892,10:sys4361:print"{home}"spc(72)"{lgrn}{down}00":sys5681:print"{wht}{$b0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$ae}{home}
6302 sys5681:print"# {yel}you are dead!{wht}#{home}":sys5681:print"{wht}{$ad}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$bd}{home}
6304 fori=0to3e3:next:fori=0to150:poke832+121*rnd(ti),20:sys4361:next
6306 poke2,20:sys5782:sys4361:fori=0to3e3:next:sys5681:sys5681
6310 print"{yel}or are you?{home}":fori=1to3e3:next:sys5681:sys5681
6312 print"you feel a{home}";:sys5681:print"strong magic...{home}
6314 sys6041:pokes+5,12:k=5:pokes+4,33:fori=0to80step5:k=11-k
6316 poke53281,k:poke53280,k:forj=itoi+10step2:pokes+1,j:nextj,i
6320 poke53281,0:poke53280,0:poke49230,30:sys5681:sys5681
6322 print"{lred}the magic of the{home}":sys5681:print"fire demon{home}":sys5681:print"saves you.{home}"
6324 goto6230
9004 gp=gp-z:poke49243,gp/256:poke49242,gp-256*peek(49243)
10000 hp=peek(49230)+256*peek(49231):u$="00"+mid$(str$(hp),2)
10001 print"{home}{down}{down}"spc(31)"{lgrn}"right$(u$,3);
10002 hm=peek(49232)+256*peek(49233):u$="00"+mid$(str$(hm),2):print"{rght}"right$(u$,3)
10004 as=peek(49234)+256*peek(49235):u$="00"+mid$(str$(as),2)
10005 printspc(31)"{up}{cyn}"right$(u$,3);
10006 am=peek(49236)+256*peek(49237):u$="00"+mid$(str$(am),2):print"{rght}"right$(u$,3)
10008 at=peek(49228):u$="0"+mid$(str$(at),2):print"{lred}"spc(29)right$(u$,2);
10009 pa=peek(49229):u$="0"+mid$(str$(pa),2):print"{grn}"spc(6)right$(u$,2)
10010 sr=peek(49224):u$="0"+mid$(str$(sr),2):print"{pur}{up}"spc(29)right$(u$,2);
10011 ge=peek(49225):u$="0"+mid$(str$(ge),2):print"{yel}"spc(6)right$(u$,2)
10012 kg=peek(49226):u$="0"+mid$(str$(kg),2):print"{gry3}"spc(29)right$(u$,2);
10013 ch=peek(49227):u$="0"+mid$(str$(ch),2):print"{lblu}"spc(6)right$(u$,2)
10014 ef=peek(49238)+256*peek(49239)+65536*peek(49240):u$="00000"+mid$(str$(ef),2)
10015 print"{up}{lgrn}"spc(29)right$(u$,6);
10016 su=peek(49241):u$="0"+mid$(str$(su),2):print"{rght}"right$(u$,2)
10017 gp=peek(49242)+256*peek(49243):u$="0000"+mid$(str$(gp),2):print"{yel}"spc(34)right$(u$,5)
10018 na=peek(49244):u$="00"+mid$(str$(na),2):print"{up}{orng}"spc(36)right$(u$,3)
10019 printspc(24)"{wht}g{lgrn} ":po=peek(49245):poke1449,32-16*(po>0)+po:ifpothenpoke55720,13
10020 wf=peek(49246):rs=peek(49247):sh=peek(49248):return
11000 poke51208,12:poke51223,15:poke51211,2:poke51221,10:poke51209,15:poke51206,8
11001 poke51561,184:poke51817,184:poke52073,185:poke52329,185:poke51205,15
11002 poke51313,10:poke51226,10:poke51212,7:poke51216,10:poke51215,8
11003 poke51217,10:poke51228,2:poke51230,2:poke51222,10:return
50000 data-35,6465,1,6570,35,6853,-1,7075
