1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454:i=rnd(-ti)
2 poke51208,12:poke51223,15:poke51211,2:poke51221,1:poke51209,15:poke51251,1
3 poke51228,8:poke51219,1:poke650,255
5 dimw$(26):fori=0to26:readw$(i):next:poke51217,8:poke51205,8:poke7097,6
6 poke51206,1:dima(3),p(3),q(3),h(3):fori=0to3:reada(i),p(i),q(i),h(i):next:goto20
7 fori=0to3:j=int(4*rnd(ti)):k=p(i)+a(j):z=peek(k):ifk=6144+x+35*ygoto9
8 ifz=3orz=8orz=11thenifk<7400thenpokep(i),q(i):p(i)=k:q(i)=z:pokep(i),h(i)
9 next:return
20 print"{home}{down}{down}"spc(24)"{lgrn}health:   (   )":printspc(24)"{up}{cyn}astral:   (   )
21 printspc(24)"{lred}att.:   {grn}def.:":printspc(24)"{up}{pur}str.:   {yel}dex.:
22 printspc(24)"{gry3}int.:   {lblu}cha.:":printspc(24)"{up}{lgrn}exp.:      (  )
23 printspc(24)"{yel}gold pcs.:":printspc(24)"{up}{orng}food supply:
25 x=17:y=36:q=11:gosub10000
100 poke2,x:poke182,y:sys6052:sys4482:sys4537:gosub7:sys4361:sys5440:sys5681
105 print"{wht}@G{left}";:z=0:ify=37goto3300
110 z=z+1:ifz>299goto200
120 getu$:ifu$=""goto110
122 ifu$=" "goto200
124 ifu$="{up}"goto210
125 ifu$="{down}"goto220
126 ifu$="{left}"goto230
127 ifu$="{rght}"goto234
128 ifu$="t"goto240
129 ifu$="r"thenprint"weapon{home}":goto191
130 ifu$="w"thenprint"armour{home}":goto191
131 ifu$="i"thenprint"inventory{home}":goto191
132 ifu$="s"goto3200
190 print"what..?{home}":goto100
191 sys5681:print"{yel}do that{home}":sys5681:print"outside!{home}":goto100
200 print"waiting...{home}":goto100
210 print"north{home}":j=peek(881):ifj<3orj=5orj=9orj>11goto214
212 pokep,q:q=j:y=y-1:goto6100
214 sys5681:print"{lred}blocked!{home}":sys5681:goto100
220 print"south{home}":j=peek(903):ifj<3orj=5orj=9orj>11goto214
222 pokep,q:q=j:y=y+1:goto6100
230 print"west{home}":j=peek(891):ifj<3orj=5orj=9orj>11goto214
232 pokep,q:q=j:x=x-1:goto6100
234 print"east{home}":j=peek(893):ifj<3orj=5orj=9orj=6orj>11goto214
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
261 ifj=16andy<8thenh=3:ifx<20thenh=2
262 ifj=110thenh=4
263 ifj=111thenh=5
265 ifj=51thenh=7
267 ifj=16andy>30thenh=8
268 ifj=16andx<10andy<11thenh=6
269 ifj=18thenh=9
270 ifj=28thenh=10
275 ifj=34thenh=14
276 ifj=6thenh=13
279 ifh=.thenprint"{lred}no answer!{home}":sys5681:goto100
280 sys5681:print"{cyn}you talk to{home}":sys5681:ifh=1thenprint"a guard.";
281 ifh=2thenprint"the{home}":sys5681:print"armourer.";
282 ifh=3thenprint"the{home}":sys5681:print"weaponsmith.";
283 ifh=4thenprint"a healer.{home}":sys5681
284 ifh=5thenprint"a cook.{home}":sys5681
285 ifh=6thenprint"an{home}":sys5681:print"employee.";
286 ifh=7thenprint"a smith.{home}":sys5681
287 ifh=8thenprint"an old{home}":sys5681:print"man.";
288 ifh=13thenprint"a dwarf{home}":sys5681:print"girl.";
291 ifh=14thenprint"an old woman.{home}":sys5681
292 ifh=9thenprint"a wizard.{home}":sys5681
293 ifh=10thenprint"a druid.{home}":sys5681
297 print"{home}":ifh=12goto1200
298 ifh=13orrnd(ti)<.5goto400
299 goto820
400 gosub900:ifrnd(ti)<.05thenprint" {home}":goto880
401 ifh=1andn$="guar"goto1000
402 ifh=1andn$="town"goto1001
403 ifn$="gold"goto1016
404 ifh=2andn$="armo"goto2000
405 ifh=3andn$="weap"goto2040
406 ifh=4andn$="heal"goto1030
407 ifh=4andn$="pois"goto1032
408 ifh=4andn$="rest"goto1038
409 ifh=5andn$="food"goto1040
410 ifh=14andn$="herb"goto2100
411 ifh=6andn$="mini"goto1100
412 ifh=6andn$="ores"goto1110
413 ifn$="name"thenprint"?{home}":goto820
414 ifn$="job"goto860
415 ifn$="fuck"orn$="piss"ormid$(n$,2)="ung"orn$="shit"orn$="porn"goto449
416 ifh=6andn$="tool"goto1120
417 ifh=6andn$="torc"goto1130
418 ifh=6andn$="lamp"goto1140
419 ifh=8andn$="thin"goto1300
420 ifn$="bye"thenprint"!{home}":goto880
421 ifn$="heal"thenprint"th?{home}":goto840
422 ifh=7andn$="smit"goto1050
423 ifh=7thenifn$="ship"orn$="wind"orn$="wrec"orn$="sea"goto1070
424 ifh=9andn$="wiza"goto3000
425 ifh=9andn$="adep"goto3010
426 ifh=9andn$="tabl"goto3030
427 ifh=9andn$="ingr"goto3011
428 ifh=10andn$="drui"goto3100
429 ifh=10andn$="help"goto3110
430 ifh=10andn$="tabl"goto3120
431 ifh=10thenifn$="evil"orn$="shar"orn$="crys"orn$="bala"orn$="circ"goto3130
432 ifh=13andn$="drin"goto1180
433 ifh=13andn$="ship"goto1185
434 ifh=13andn$="wind"goto1186
435 ifh=9thenifn$="sulp"orn$="garl"orn$="gins"orn$="bloo"goto3040
436 ifh=9andn$="pine"goto3042
437 ifh=9andn$="deat"goto3043
438 ifh=9andn$="nigh"goto3044
439 ifh=9andn$="mand"goto3050
440 ifh=8andn$="clev"goto1310
441 print" {home}":gosub800:print"i can't tell{home}":sys5681:print"you anything{home}":sys5681
442 print"about that.%{home}
443 goto400
449 print" {home}":gosub800:print"you are a{home}":sys5681:print"dirty old pig!%{home}":goto400
800 gosub999:print"{yel}the ";
801 ifh=1thenprint"guard{home}
802 ifh=2thenprint"armour-{home}":sys5681:print"smith{home}
803 ifh=3thenprint"weapon-{home}":sys5681:print"smith{home}
804 ifh=4thenprint"healer{home}
805 ifh=5thenprint"cook{home}
806 ifh=6thenprint"employee{home}
807 ifh=7thenprint"smith{home}
810 ifh=9thenprint"wizard{home}
811 ifh=10thenprint"druid{home}
812 ifh=14orh=8thenprint"old woman{home}
813 ifh=13thenprint"girl{home}
819 sys5681:print"says:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"i am ";:ifh=1thenprint"a{home}":sys5681:print"guard";
821 ifh=2thensys5681:print"gwendall";
822 ifh=3thensys5681:print"thormin";
823 ifh=4thensys5681:print"virus";
824 ifh=5thensys5681:print"osmond";
825 ifh=6thensys5681:print"gumbert";
826 ifh=7thensys5681:print"a smith";
827 ifh=9thensys5681:print"alfin";
828 ifh=10thensys5681:print"rewan";
829 ifh=13thensys5681:print"trenca";
830 ifh=8thensys5681:print"jiovan";
832 ifh=14thensys5681:print"heben";
839 print".%{home}":goto400
840 gosub800:ifh=1thenprint"excellent,{home}":sys5681:print"thank you";
841 ifh=2orh=3orh=7thenprint"quite well";
843 ifh=4thenprint"i feel fine,{home}":sys5681:print"of course";
844 ifh=5thenprint"mustn't grumble";
845 ifh=6thenprint"so-so";
849 ifh=8thenprint"i'm{home}":sys5681:print"fine";
850 ifh=13thenprint"i am{home}":sys5681:print"a bit tired";
852 ifh=14thenprint"i sense{home}":sys5681:print"great doom";
853 ifh=10thenprint"as well as can{home}":sys5681:print"be expected";
854 ifh=9thenprint"so-so";
859 goto839
860 print"?{home}":ifh=1goto820
862 gosub800:ifh=2thenprint"i make";:sys5681:print"armour";
863 ifh=3thenprint"i make and{home}":sys5681:print"trade in";:sys5681:print"weapons";
864 ifh=5thenprint"i do the{home}":sys5681:print"cooking";
865 ifh=6thenprint"i work{home}":sys5681:print"in the mines";
866 ifh=7thenprint"i am a{home}":sys5681:print"smith";
867 ifh=4thenprint"i am a{home}":sys5681:print"healer";
868 ifh=9thenprint"i am a{home}":sys5681:print"wizard";
869 ifh=10thenprint"i am a{home}":sys5681:print"druid";
871 ifh=14thenprint"i am a{home}":sys5681:print"herb woman";
872 ifh=13thenprint"i drink";
874 ifh=8thenprint"i am a{home}":sys5681:print"thinker";
879 goto839
880 gosub800:ifh=1thenprint"i must get back{home}":sys5681:print"to guard duty";
881 ifh=3orh=2thenprint"do come{home}":sys5681:print"again soon";
882 ifh=4thenprint"stay healthy,{home}":sys5681:print"always";
883 ifh=5thenprint"bon appetit";
884 ifh=6thenprint"safe digging";
885 ifh=7thenprint"i must get{home}":sys5681:print"back to work";
886 ifh=10thenprint"may the light{home}":sys5681:print"be with you";
890 ifh=13thenprint"get lost";
892 ifh=14orh=9thenprint"may the magic{home}":sys5681:print"be with you";
896 ifh=8thenprint"cogito ergo{home}":sys5681:print"sum";
897 print".%{home}":sys5681:sys5681:print"{yel}he";:ifh>12thenprint"{left}{left}she";
898 print" turns{home}":sys5681:print"away.{home}":sys5681:goto100
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
1000 print"d{home}":gosub800:print"i guard the{home}":sys5681:print"town.%{home}":goto400
1001 print"{home}":gosub800:print"this is{home}":sys5681:print"muspel, the{home}
1002 sys5681:print"town of the{home}":sys5681:print"dwarves. do you{home}
1003 sys5681:print"want to see{home}":sys5681:print"our famous{home}":sys5681:print"smithy?";
1004 gosub970:ifu$="n"thenprint"i see, so you{home}":sys5681:print"are just a{home}
1005 ifu$="n"thensys5681:print"tourist.%{home}":goto400
1006 print"we dwarves are{home}":sys5681:print"good smiths.%{home}":goto400
1016 print" {home}":gosub800:print"yes, i'd like{home}";:sys5681:print"some gold too!%{home}":goto400
1030 print"{home}";:gosub800:print"i can cure your{home}":sys5681:print"poison or{home}":sys5681
1031 print"restore you.{home}":sys5681:print"which would{home}":sys5681:print"you like?%{home}":goto400
1032 print"on{home}";:gosub800:z=4*peek(49245)-ch:ifz<2thenz=2
1033 gosub9000:poke49245,0:z=5
1034 pokes+5,201:pokes+12,201:pokes+11,129:pokes+4,17:k=5
1035 fori=5to255step5:pokes+1,i:pokes+8,i:k=z-k:poke53281,k:poke53280,k:next
1036 poke53281,0:poke53280,0:pokes+11,0:pokes+4,0:sys5681:ifh=12thengosub10000:goto400
1037 print"now you are{home}":sys5681:print"cured.%{home}":gosub10000:goto400
1038 print"ore{home}";:gosub800:z=80-4*(ch-su):ifz<10thenz=10
1039 gosub9000:poke49230,peek(49232):poke49231,peek(49233):z=18:goto1034
1040 print"{home}":gosub800:print"our speciality{home}";:sys5681:print"is ragout.{home}
1041 sys5681:print"would you like{home}":sys5681:print"16 rations?";
1043 gosub970:ifu$="n"thenprint"then don't.%{home}":goto400
1044 z=16-int(ch/1.7):gosub9000:sys5681:na=na+16:ifna>250thenna=250
1045 poke49244,na:gosub10000:sys5681:print"{lgrn}more?";:goto1043
1050 print"h{home}":gosub800:print"we make{home}":sys5681:print"armour and{home}
1051 sys5681:print"weapons of all{home}":sys5681:print"kinds. we forge{home}
1052 sys5681:print"them in lava,{home}":sys5681:print"which gives{home}
1053 sys5681:print"things a certain{home}":sys5681:print"power.{home}
1054 gosub960:print"have you ever{home}":sys5681:print"heard of our{home}
1055 sys5681:print"famous{home}":sys5681:print"magic axe{home}
1056 sys5681:print"before?";:gosub970:ifu$="y"thenprint"great, isn't it?{home}":goto400
1057 print"it was a{home}":sys5681:print"weapon, a{home}
1058 sys5681:print"throwing axe{home}":sys5681:print"that returns{home}
1059 sys5681:print"to its bearer's{home}":sys5681:print"hand after{home}
1060 sys5681:print"the throw and{home}":sys5681:print"can be used{home}
1061 sys5681:print"again at once.{home}":gosub960:print"sadly it was{home}
1062 sys5681:print"on a sailing{home}":sys5681:print"ship, the{home}
1063 sys5681:print"'windchaser',{home}":sys5681:print"when it sank.{home}
1064 sys5681:print"now the axe{home}":sys5681:print"rests on the{home}
1065 sys5681:print"sea floor.%{home}":goto400
1070 print"...{home}":gosub800:print"trenca was on{home}":sys5681:print"the ship. she{home}
1071 sys5681:print"survived the{home}":sys5681:print"wreck. ask{home}
1072 sys5681:print"her about the{home}":sys5681:print"ship.%{home}":goto400
1100 print"ng{home}":gosub800:print"yes, we dwarves{home}":sys5681:print"mine our ores{home}
1101 sys5681:print"ourselves.%{home}":goto400
1110 print" {home}":gosub800:print"yes, and i sell{home}":sys5681:print"the tools{home}
1111 sys5681:print"you need{home}":sys5681:print"for it.%{home}":goto400
1120 print"s{home}":gosub800:print"for example{home}":sys5681:print"torches or{home}
1121 sys5681:print"lamps, so that{home}":sys5681:print"you can see{home}
1122 sys5681:print"in the dark.%{home}":goto400
1130 print"hes{home}":gosub800:print"they cost only{home}";:sys5681:print"two coins{home}
1131 sys5681:print"apiece. would{home}":sys5681:print"you like to{home}":sys5681:print"buy some?";
1132 gosub970:ifu$="n"thenprint"what for.%{home}":goto400
1133 print"how many? {blu}00{left}{left}{wht}";
1134 getu$:ifu$<"0"oru$>"9"goto1134
1135 printu$;:j=val(u$)*10
1136 getu$:ifu$<"0"oru$>"9"goto1136
1137 printu$;:j=j+val(u$):print"{lgrn}{home}":sys5681:ifj=.thenprint"oh.%{home}":goto400
1138 sys5681:z=j*2:gosub9000:i=peek(49356)+j:ifi>99theni=99
1139 poke49356,i:sys5681:print"{lgrn}here you are!%{home}":goto400
1140 print"{home}";:gosub800:print"a lamp costs{home}":sys5681:print"200 gold{home}
1141 sys5681:print"pieces. i know{home}":sys5681:print"that's{home}
1142 sys5681:print"expensive, but{home}":sys5681:print"our magic lamps{home}
1143 sys5681:print"never run{home}":sys5681:print"dry. do you{home}
1144 sys5681:print"want one?";:gosub970:ifu$="n"thenprint"oh well.%{home}":goto400
1145 ifpeek(49355)thenprint"you have one!%{home}":goto400
1146 z=200:gosub9000:sys5681:poke49355,1:print"{lgrn}here, take it.%{home}":goto400
1180 print"king{home}";:gosub800:print"can't a person{home}":sys5681:print"have a drink{home}
1181 sys5681:print"here without{home}":sys5681:print"being pestered{home}
1182 sys5681:print"by some{home}":sys5681:print"idiot?%{home}":goto400
1185 print"{home}":gosub800:print"which{home}":sys5681:print"ship?%{home}":goto400
1186 print"chaser{home}":gosub800:print"yes, i was on{home}":sys5681:print"the ship when{home}
1187 sys5681:print"it sank.{home}":gosub960:print"do you want to{home}
1188 sys5681:print"know where?";:gosub970:ifu$="n"thenprint"then get lost.%{home}":goto400
1189 print"you want to{home}":sys5681:print"salvage the{home}
1190 sys5681:print"magic axe, eh?";:gosub970
1191 ifu$="n"thenprint"then why do you{home}":sys5681:print"want to know{home}
1192 ifu$="n"thensys5681:print"where the ship{home}":sys5681:print"lies?{home}":goto400
1193 z=500:gosub9000:sys5681:print"{lgrn}all right, the{home}":sys5681:print"ship lies{home}
1194 sys5681:print"exactly at the{home}":sys5681:print"deepest spot{home}
1195 sys5681:print"between mubrak{home}":sys5681:print"and the{home}
1196 sys5681:print"mainland.%{home}":goto400
1300 print"ker{home}":gosub800:print"a thinker must{home}":sys5681:print"be very clever.%{home}":goto400
1310 print" {home}":gosub800:print"are you clever{home}":sys5681:print"enough?";:gosub970
1311 ifu$="y"thenprint"nobody is{home}":sys5681:print"that.%{home}":goto400
1312 print"shall i teach{home}":sys5681:print"you{home}":sys5681:print"wisdom?";:gosub970
1313 print"very well.{home}":ifu$="n"goto400
1314 ifkg=18thensys5681:print"you are already{home}":sys5681:print"as clever as{home}":sys5681
1315 ifkg=18thenprint"i am.%{home}":goto400
1316 ifpeek(49287)=.thensys5681:print"for that you{home}":sys5681:print"must first gain{home}
1317 ifpeek(49287)=.thensys5681:print"more{home}":sys5681:print"experience.%{home}":goto400
1320 sys5681:sys5681:print"{yel}you think...{home}":fori=1to2e3:next:sys5681:sys5681
1321 print"enlightenment!{home}":fori=0to1e3:next:poke49226,kg+1:gosub10000:poke49287,peek(49287)-1
1322 sys5681:gosub800:print"now you are{home}":sys5681:print"cleverer.%{home}":goto400
2000 print"ur{home}":gosub980:ifu$="b"goto2020
2001 print"what? (b-i) {wht}G{left}";
2002 getu$:ifu$=""goto2002
2003 ifu$>"a"andu$<"j"andu$<>"g"goto2006
2004 print" {lgrn}{home}":gosub999:print"sorry, but{home}":sys5681:print"i don't buy{home}
2005 sys5681:print"that.%{home}":goto400
2006 printu$"{lgrn}{home}":gosub999:k=asc(u$)-47:printw$(k);
2007 ifpeek(49248+k)=.thensys5681:print"you don't own it{home}":goto400
2008 print",{home}":sys5681:print"hm - used, i'll{home}";:sys5681:print"give you{home}
2009 sys5681:print"- let's{home}";:sys5681:print"say -";
2010 z=int(peek(50569+k)*4*(1+(ch-12)/25)):printz"gold{home}":sys5681
2011 print"pieces, ok?";:gosub970:ifu$="n"goto9002
2012 print"it's a deal!{home}":poke49248+k,0:gp=gp+z:ifgp>5e4thengp=5e4
2013 z=-z:gosub9004:gosub10000:goto400
2020 print"i offer:{home}":sys5681:fori=1to8:ifi=6theni=7
2021 sys5681:printchr$(65+i)" "w$(i+18);:next:gosub999:print"what would you{home}
2022 sys5681:print"buy? (b-i) {wht}G{left}";
2023 getu$:ifu$=""goto2023
2024 ifu$>"a"andu$<"j"andu$<>"g"goto2026
2025 print" {lgrn}{home}":gosub999:print"sorry, but i{home}":sys5681:print"don't have{home}";:goto2005
2026 printu$;:gosub999:k=asc(u$)-47:print"{lgrn}"w$(k);
2027 ifpeek(49248+k)thensys5681:print"you have one.{home}":goto400
2028 print",{home}":sys5681:print"a fine";:sys5681:print"piece. and for{home}
2029 sys5681:z=int(peek(50569+k)*8*(1-(ch-12)/25)):print"only"z"gold{home}":sys5681
2030 print"pieces it's{home}":sys5681:print"yours, ok?";:gosub970
2031 ifu$="n"goto9002
2032 ifz>gpgoto9003
2033 print"it's a deal!{home}":poke49248+k,1:gosub9004:gosub10000:goto400
2040 print"ons{home}":gosub980:ifu$="b"goto2050
2041 print"what? (b-p) {wht}G{left}";
2042 getu$:ifu$=""goto2042
2043 ifu$>"a"andu$<"q"andu$<>"n"goto2045
2044 goto2004
2045 printu$"{lgrn}{home}":gosub999:k=asc(u$)-66:printw$(k);:goto2007
2050 print"i offer:{home}":sys5681:fori=1to15:ifi=13theni=14
2051 sys5681:printchr$(65+i)" "w$(i-1);:ifi=6ori=10thengosub960
2052 next:gosub999:print"what would you{home}
2053 sys5681:print"buy? (b-p) {wht}G{left}";:poke198,0
2054 getu$:ifu$=""goto2054
2055 ifu$>"a"andu$<"q"andu$<>"n"goto2057
2056 goto2025
2057 printu$;:gosub999:k=asc(u$)-66:print"{lgrn}"w$(k);:goto2027
2100 print"s{home}":gosub800:print"ah, are you{home}":sys5681:print"a magic user?";:gosub970
2101 ifu$="n"thenprint"then why do{home}":sys5681:print"you need{home}":sys5681:print"ingredients?%{home}
2102 ifu$="n"goto400
2103 print"i have:{home}":gosub999:print"a sulphur{home}":sys5681:print"b garlic{home}
2104 sys5681:print"c ginseng{home}":sys5681:print"d blood moss{home}":gosub999
2105 print"what'll it be? {wht}G{left}";
2106 getu$:ifu$=""goto2106
2107 ifu$<"a"oru$>"d"goto2025
2108 printu$"{lgrn}";:gosub999:k=asc(u$)-65:zz=10:ifk>.thenzz=6:ifk>1thenzz=3:ifk>2thenzz=1
2109 ifk<3thenprint"in packs of"zz"{left}{home}":sys5681:print"for{home}":sys5681
2110 print"1 gold piece";:sys5681:print"each, ok?";
2120 z=1:gosub970:ifu$="n"goto9002
2121 ifgp<zgoto9003
2122 print"here you are!{home}":sys5681:j=peek(49336+k)+zz:ifj>99thenj=99
2123 poke49336+k,j:gosub9004:sys5681:print"you now have{home}":sys5681:printmid$(str$(j),2);
2124 print" unit.";:ifj>1thenprint"{left}s.{home}
2125 gosub10000:sys5681:print"another one?";:goto2120
3000 print"rd{home}":gosub800:print"well, actually{home}":sys5681:print"i'm still{home}
3001 sys5681:print"an adept.%{home}":goto400
3010 print"t{home}":gosub800:print"i procure{home}":sys5681:print"ingredients.%{home}":goto400
3011 print"edients{home}":gosub800:print"are you looking{home}":sys5681:print"for some too?";
3012 gosub970:ifu$="n"thenprint"but i am.%{home}":goto400
3013 print"which ones are{home}":sys5681:print"you looking for?{home}":goto400
3020 print"ball{home}":gosub800:print"a useful{home}":sys5681:print"combat spell.{home}
3021 sys5681:print"do you know{home}":sys5681:print"it?";:gosub970
3022 ifu$="y"thenprint"good for you.%{home}":goto400
3024 print"go to the{home}":sys5681:print"black{home}":sys5681:print"circle.%{home}":goto400
3030 print"et{home}":gosub800:print"go round behind{home}":sys5681:print"{home}
3031 sys5681:print"heben's shop.{home}":sys5681:print"you must search{home}
3032 sys5681:print"at the south-{home}":sys5681:print"ernmost spot.%{home}":goto400
3040 print"...{home}":gosub800:print"you can buy{home}":sys5681:print"that almost{home}
3041 sys5681:print"anywhere.%{home}":goto400
3042 print"wort{home}":gosub800:print"you can buy it{home}":sys5681:print"only in{home}":sys5681:print"madraksan.%{home}":goto400
3043 print"hbloom{home}":gosub800:print"you can buy it{home}":sys5681:print"from the{home}":sys5681:print"elves.%{home}":goto400
3044 print"tshade{home}":gosub800:print"now now, that{home}":sys5681:print"stuff is{home}
3045 sys5681:print"forbidden. but i{home}":sys5681:print"have heard that{home}
3046 sys5681:print"in mubrak it{home}":sys5681:print"might be{home}
3047 sys5681:print"available.{home}":goto400
3050 print"rake{home}":gosub800:print"psst!{home}":fori=1to2e3:next:sys5681:sys5681
3051 print"come a little{home}":sys5681:print"closer...{home}":fori=1to2e3:next:sys5681:sys5681
3052 print"i know where{home}":sys5681:print"it still grows,{home}
3053 sys5681:print"but i'm not{home}":sys5681:print"allowed to{home}
3054 sys5681:print"tell you.{home}":gosub960:print"but perhaps i{home}
3056 sys5681:print"would be more{home}":sys5681:print"talkative with{home}
3057 sys5681:print"some gold.{home}":sys5681:print"how many hundred{home}
3058 sys5681:print"coins will you{home}":sys5681:print"offer me? {wht}G{left}";
3059 getu$:ifu$<"0"oru$>"9"goto3059
3060 printu$"{lgrn}{home}":sys5681:sys5681:j=val(u$):ifj<5thenprint"you're crazy.%{home}":goto400
3062 z=100*j:print"accepted.{home}":sys5681:gosub9000:sys5681
3063 print"{lgrn}thank you! it{home}":sys5681:print"still grows on{home}":sys5681:print"the smallest of{home}
3064 sys5681:print"the isles of the{home}":sys5681:print"dead, west of{home}
3065 sys5681:print"the swamps{home}":sys5681:print"of death.{home}
3066 gosub960:print"the exact{home}":sys5681:print"position is:{home}
3067 sys5681:print"(f&i'/i&f').%{home}":goto400
3100 print"d{home}":gosub800:print"we druids{home}":sys5681:print"want to{home}
3101 sys5681:print"help you.%{home}":goto400
3110 print"{home}":gosub800:print"ask what you{home}":sys5681:print"want to know.%{home}":goto400
3120 print"et{home}":gosub800:print"i was in{home}":sys5681:print"mubrak. that{home}
3121 sys5681:print"is where the{home}":sys5681:print"2nd tablet is.%{home}":goto400
3130 print"...":gosub800:print"cerfax can tell{home}":sys5681:print"you more about{home}
3131 sys5681:print"that than i.%{home}":goto400
3200 print"search";:fori=1to5:print".";:forj=.to400:nextj,i
3201 sys5681:print"{yel}you find{home}":sys5681
3202 ifx<>31ory<>30thenprint"nothing.{home}":goto100
3204 print"a clay tablet:{home}":sys5681:sys5681:print"{orng}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}:Z6;{home}
3206 sys5681:print"{rght}{rght}{rght}{rght}{rght}{rght}{rvon}<{$dc}7={home}":sys5681:sys5681:goto100
3300 print"{left}  {home}":sys5681:print"{yel}do you want to{home}":sys5681:print"leave muspel{home}
3301 sys5681:print"now?";:gosub970:ifu$="n"theny=y-1:goto100
6000 sys5681:print"{lred}you leave{home}":sys5681:print"the town.{home}
6010 fori=0to999:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
6020 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:poke2,0:new
6100 pokes+4,0:pokes+5,16:pokes+1,12:pokes+4,129:goto100
9000 print"but that costs{home}":sys5681:print"you"z"gold{home}":sys5681:print"pieces. do you{home}
9001 sys5681:print"want to pay?";:gosub970:ifu$="y"goto9003
9002 print"well, then not.%{home}":goto400
9003 ifgp<zthenprint"you don't have{home}":sys5681:print"enough gold!%{home}":goto400
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
50000 dataknife,dagger,short sword,hand axe,sword,morning star,quarterstaff
50001 databastard sword,battle axe,greatsword,sling,short bow,,long bow
50002 datacrossbow,,,,clothes,gambeson,leather armour,chain mail,scale mail
50003 dataplate armour,magic armour,small shield,large shield
50100 data-35,6348,11,17,1,6604,11,17,35,6853,3,21,-1,6975,11,21
