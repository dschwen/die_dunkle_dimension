1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454:i=rnd(-ti)
2 poke51208,12:poke51223,15:poke51211,2:poke51221,1:poke51209,15
3 poke51228,8:poke51219,1:poke650,255:poke6729,30:poke7242,86:poke7244,115
5 dimw$(26):fori=0to26:readw$(i):next:poke51217,15
6 dima(3),p(3),q(3),h(3):fori=0to3:reada(i),p(i),q(i),h(i):next:goto20
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
234 print"east{home}":j=peek(893):ifj<3orj=5orj=9orj>11goto214
236 pokep,q:q=j:x=x+1:goto6100
240 print"talk";:sys5681:print"{yel} -where? {wht}G{left}";:z=0
250 z=z+1:ifz>499goto258
252 getu$:ifu$=""goto252
254 ifu$="{up}"thenprint"north{home}":j=-11:goto260
255 ifu$="{down}"thenprint"south{home}":j=11:goto260
256 ifu$="{left}"thenprint"west{home}":j=-1:goto260
257 ifu$="{rght}"thenprint"east{home}":j=1:goto260
258 print"no{home}":sys5681:z=0:goto100
260 j=peek(892+j):sys5681:h=0:ifj=21thenh=1
261 ifj=16andy<9thenh=3:ifx<20thenh=2
262 ifj=110thenh=4
263 ifj=111thenh=5
265 ifj=16andy>17andy<21thenh=7
266 ifj=114thenh=6
267 ifj=16andx=24andy=19thenh=8
268 ifj=16andx=19andy=21thenh=6
269 ifj=18thenh=9
270 ifj=28thenh=10
275 ifj=34thenh=14
276 ifj=30thenh=13
279 ifh=.thenprint"{lred}no answer!{home}":sys5681:goto100
280 sys5681:print"{cyn}you talk to{home}":sys5681:ifh=1thenprint"a guard.";
281 ifh=2thenprint"the{home}":sys5681:print"armourer.";
282 ifh=3thenprint"the{home}":sys5681:print"weaponsmith.";
283 ifh=4thenprint"a healer.{home}":sys5681
284 ifh=5thenprint"a cook.{home}":sys5681
285 ifh=6thenprint"a man in{home}":sys5681:print"lederhosen.";
286 ifh=7thenprint"the innkeeper.{home}":sys5681
287 ifh=8thenprint"a drunk{home}":sys5681:print".";
288 ifh=13thenprint"a waitress.{home}":sys5681
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
411 ifh=13andn$="drun"goto1100
412 ifh=13andn$="nons"goto1110
413 ifn$="name"thenprint"?{home}":goto820
414 ifn$="job"goto860
415 ifn$="fuck"orn$="piss"ormid$(n$,2)="ung"orn$="shit"orn$="porn"goto449
416 ifh=8andn$="armo"goto1120
417 ifh=2andn$="magi"andpeek(49272)=.goto1130
418 ifh=2andn$="hero"andpeek(49272)=.goto1135
420 ifn$="bye"thenprint"!{home}":goto880
421 ifn$="heal"thenprint"th?{home}":goto840
422 ifh=7and(n$="inn"orn$="innk")goto1200
423 ifh=6andn$="bava"goto1300
424 ifh=9andn$="wiza"goto3000
425 ifh=9andn$="adep"goto3010
426 ifh=9andn$="tabl"goto3030
427 ifh=9andn$="fire"goto3020
428 ifh=10andn$="drui"goto3100
429 ifh=10andn$="help"goto3110
430 ifh=10andn$="tabl"goto3120
431 ifh=10thenifn$="evil"orn$="shar"orn$="crys"orn$="bala"orn$="circ"goto3130
440 print" {home}":gosub800:print"i can't tell{home}":sys5681:print"you anything{home}":sys5681
441 print"about that.%{home}
442 goto400
449 print" {home}":gosub800:print"you are a{home}":sys5681:print"dirty old pig!%{home}":goto400
800 gosub999:print"{yel}the ";
801 ifh=1thenprint"guard{home}
802 ifh=2thenprint"armour-{home}":sys5681:print"smith{home}
803 ifh=3thenprint"weapon-{home}":sys5681:print"smith{home}
804 ifh=4thenprint"healer{home}
805 ifh=5thenprint"cook{home}
806 ifh=6thenprint"man{home}
807 ifh=7thenprint"innkeeper{home}
808 ifh=13thenprint"waitress{home}
809 ifh=8thenprint"drunkard{home}
810 ifh=9thenprint"wizard{home}
811 ifh=10thenprint"druid{home}
812 ifh=14thenprint"old woman{home}
819 sys5681:print"says:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"i am ";:ifh=1thenprint"a{home}":sys5681:print"guard";
821 ifh=2thensys5681:print"temuchin";
822 ifh=3thensys5681:print"grif";
823 ifh=4thensys5681:print"exitus";
824 ifh=5thensys5681:print"talenc";
825 ifh=6thensys5681:print"der wastl";
826 ifh=7thensys5681:print"selver";
827 ifh=9thensys5681:print"shanin";
828 ifh=10thensys5681:print"mikah";
830 ifh=8thensys5681:print"edipon";
831 ifh=13thensys5681:print"joyla";
832 ifh=14thensys5681:print"orpha";
839 print".%{home}":goto400
840 gosub800:ifh=1orh=7thenprint"excellent,{home}":sys5681:print"thank you";
841 ifh=2orh=3thenprint"quite well";
843 ifh=4thenprint"i feel fine,{home}":sys5681:print"of course";
844 ifh=5thenprint"all fine";
845 ifh=6thenprint"fei guat";
849 ifh=8thenprint"i'm totally{home}":sys5681:print"plashtered";
850 ifh=13thenprint"i am{home}":sys5681:print"overworked";
852 ifh=14thenprint"i sense{home}":sys5681:print"great doom";
853 ifh=10thenprint"as well as can{home}":sys5681:print"be expected";
854 ifh=9thenprint"so-so";
859 goto839
860 print"?{home}":ifh=1goto820
862 gosub800:ifh=2thenprint"i make";:sys5681:print"armour";
863 ifh=3thenprint"i make and{home}":sys5681:print"trade in";:sys5681:print"weapons";
864 ifh=5thenprint"i do the{home}":sys5681:print"cooking";
865 ifh=6thenprint"i'm a{home}":sys5681:print"bavarian";
866 ifh=7thenprint"i am the{home}":sys5681:print"innkeeper here";
867 ifh=4thenprint"i am a{home}":sys5681:print"healer";
868 ifh=9thenprint"i am a{home}":sys5681:print"wizard";
869 ifh=10thenprint"i am a{home}":sys5681:print"druid";
871 ifh=14thenprint"i am a{home}":sys5681:print"herb woman";
872 ifh=13thenprint"i serve and{home}":sys5681:print"throw out";
873 ifh=13thensys5681:print"the{home}":sys5681:print"drunks";
874 ifh=8thenprint"i'm{home}":sys5681:print"unemployed{home}
875 ifh=8thensys5681:print"and drinking{home}":sys5681:print"myshelf shilly";
879 goto839
880 gosub800:ifh=1thenprint"i must get back{home}":sys5681:print"to guard duty";
881 ifh=3orh=2thenprint"do come{home}":sys5681:print"again soon";
882 ifh=4thenprint"stay healthy,{home}":sys5681:print"always";
883 ifh=5thenprint"bon appetit";
884 ifh=6thenprint"grüss gott";
885 ifh=7thenprint"go and have{home}":sys5681:print"a drink";
886 ifh=10thenprint"may the light{home}":sys5681:print"be with you";
890 ifh=13thenprint"take care";
892 ifh=14orh=9thenprint"may the magic{home}":sys5681:print"be with you";
896 ifh=8thenprint"drunk today,{home}":sys5681:print"and tomorrow";:sys5681:print"drunk..";
897 print".%{home}":sys5681:sys5681:print"{yel}he";:ifh>13thenprint"{left}{left}she";
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
1001 print"{home}":gosub800:print"you are in{home}":sys5681:print"damraskan, the{home}
1002 sys5681:print"town on the{home}":sys5681:print"island of the{home}":sys5681:print"same name.{home}
1003 sys5681:print"are you here to{home}":sys5681:print"steal, maybe?";
1004 gosub970:ifu$="n"thenprint"that wouldn't{home}":sys5681:print"do you any{home}
1005 ifu$="n"thensys5681:print"good either.%{home}":goto400
1006 print"try that{home}":sys5681:print"elsewhere.%{home}":goto400
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
1040 print"{home}":gosub800:print"i make really{home}";:sys5681:print"tasty roasts.{home}
1041 sys5681:print"would you like{home}":sys5681:print"12 rations?";
1043 gosub970:ifu$="n"thenprint"as you wish.%{home}":goto400
1044 z=12-int(ch/1.7):gosub9000:sys5681:na=na+12:ifna>250thenna=250
1045 poke49244,na:gosub10000:sys5681:print"{lgrn}more?";:goto1043
1100 print"ks{home}":gosub800:print"yes, the guy{home}":sys5681:print"over there in{home}":sys5681
1101 print"the corner just{home}":sys5681:print"babbles{home}":sys5681:print"nonsense.%{home}":goto400
1110 print"ense{home}":gosub800:print"oh, something":sys5681:print"about some{home}":sys5681
1111 print"armour.%{home}":goto400
1120 print"ur{home}":gosub800:print"yesh, right,{home}":sys5681:print"i shaw the{home}
1121 sys5681:print"famoush magic{home}":sys5681:print"armour by{home}
1122 sys5681:print"chance, under{home}":sys5681:print"the counter in{home}
1123 sys5681:print"temuchin'sh{home}":sys5681:print"shop.{home}
1124 gosub960:print"ashk him{home}":sys5681:print"about it, hic.%{home}":goto400
1130 print"c armour{home}":gosub800:print"indeed i keep{home}":sys5681:print"the magic armour{home}
1131 sys5681:print"made from{home}":sys5681:print"the scales of a{home}
1132 sys5681:print"giant wyrm,{home}":sys5681:print"the ma-{home}
1133 sys5681:printmid$(w$(24),3)",{home}":sys5681:print"to give it to{home}
1134 sys5681:print"a hero.%{home}":goto400
1135 print" ":gosub800:print"do you mean to{home}":sys5681:print"say that you are{home}
1136 sys5681:print"the hero who{home}":sys5681:print"will free{home}
1137 sys5681:print"our world?";:gosub970:ifu$="n"thenprint"then go!%{home}":goto400
1138 print"anyone can say{home}":sys5681:print"that. let me{home}
1139 sys5681:print"test if you are{home}":sys5681:print"an experienced{home}
1140 sys5681:print"fighter.{home}":gosub960:fori=0to2:sys5681:sys5681
1142 print"{lgrn}how many{home}":sys5681:print"experience pts{home}
1144 sys5681:print"do you get for{home}":sys5681:print"killing a{home}":sys5681
1146 printmid$("troll{rvof}{rvof}balrog{rvof}dragon",i*7+1,7)"? {wht}";:j=.:k=.
1150 print"G{left}";
1152 getu$:ifu$<"0"oru$>"9"goto1152
1153 printu$;:j=j+val(u$):k=k+1:ifk=1thenj=j*10:goto1150
1160 ifj=12+6*ithennext:goto1170
1162 gosub800:print"wrong! you are{home}":sys5681:print"not worthy{home}
1164 sys5681:print"of the armour";:goto897
1170 gosub800:print"that was all{home}":sys5681:print"correct. i{home}
1172 sys5681:print"give you the{home}":sys5681:printw$(24);
1174 sys5681:print"it can withstand{home}":sys5681
1176 print"the fire of a{home}":sys5681:print"giant wyrm{home}
1178 sys5681:print"reasonably{home}":sys5681:print"well.%{home}"
1180 poke49272,1:goto400
1200 print" ":gosub800:print"you know what{home}":sys5681:print"they say: if you{home}
1201 sys5681:print"can't do any-{home}":gosub960:print"thing, run a pub{home}":sys5681:print"but joking{home}
1202 sys5681:print"aside, i own{home}":sys5681:print"this joint.{home}
1203 sys5681:print"we have a{home}":sys5681:print"bar, a grill{home}
1204 sys5681:print"room, a{home}":sys5681:print"swimming pool, a{home}
1206 sys5681:print"sauna and even{home}":sys5681:print"a solarium.{home}
1208 gosub960:print"the solarium is{home}":sys5681:print"outside the{home}
1209 sys5681:print"door - but only{home}":sys5681:print"when the sun{home}
1210 sys5681:print"shines, haha.%{home}":goto400
1300 print"rian":gosub800:print"ja mei, i'm just{home}":sys5681:print"here on{home}
1301 sys5681:print"holiday. but{home}":sys5681:print"with these daft{home}
1302 sys5681:print"damraskan{home}":sys5681:print"saupreissen{home}
1304 sys5681:print"you can't even{home}":sys5681:print"get a decent{home}":sys5681:print"schweinshaxn.{home}
1305 gosub960:print"now i sit{home}":sys5681:print"here and{home}":sys5681:print"sweat, they say{home}
1306 sys5681:print"it's healthy.{home}":gosub960:print"in the pub that{home}
1307 sys5681:print"drunkard's{home}":sys5681:print"drivel{home}
1308 sys5681:print"gets on my{home}":sys5681:print"nerves. ask{home}
1309 sys5681:print"the waitress{home}":sys5681:print"what nonsense{home}
1310 sys5681:print"he's spouting.{home}":sys5681:print"%{home}":goto400
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
2010 z=int(peek(50569+k)*4*(1+(ch-15)/15)):printz"gold{home}":sys5681
2011 print"pieces, ok?";:gosub970:ifu$="n"goto9002
2012 print"it's a deal!{home}":poke49248+k,0:ifgp+z>5e4thenz=5e4-gp
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
2104 sys5681:print"c ginseng{home}":sys5681:print"d pinewort{home}":gosub999
2105 print"what'll it be? {wht}G{left}";
2106 getu$:ifu$=""goto2106
2107 ifu$<"a"oru$>"d"goto2025
2108 printu$"{lgrn}";:gosub999:k=asc(u$)-65:zz=10:ifk>.thenzz=6:ifk>1thenzz=3:ifk>2thenzz=1:k=4
2109 ifk<3thenprint"in packs of"zz"{left}{home}":sys5681:print"for{home}":sys5681
2110 print"1 gold piece";:sys5681:print"each, ok?";
2120 z=1:gosub970:ifu$="n"goto9002
2121 ifgp<zgoto9003
2122 print"here you are!{home}":sys5681:j=peek(49336+k)+zz:ifj>99thenj=99
2123 poke49336+k,j:gosub9004:sys5681:print"you now have":sys5681:printmid$(str$(j),2);
2124 print" unit.";:ifj>1thenprint"{left}s.{home}
2125 gosub10000:sys5681:print"another one?";:goto2120
3000 print"rd{home}":gosub800:print"well, actually{home}":sys5681:print"i'm still{home}
3001 sys5681:print"an adept.%{home}":goto400
3010 print"t{home}":gosub800:print"i'm practising{home}":sys5681:print"the fireball{home}
3011 sys5681:print"spell.%{home}":goto400
3020 print"ball{home}":gosub800:print"a useful{home}":sys5681:print"combat spell.{home}
3021 sys5681:print"do you know{home}":sys5681:print"it?";:gosub970
3022 ifu$="y"thenprint"good for you.%{home}":goto400
3024 print"go to the{home}":sys5681:print"black{home}":sys5681:print"circle.%{home}":goto400
3030 print"et{home}":gosub800:print"seeking a{home}":sys5681:print"letter? seek it{home}
3031 sys5681:print"out from a{home}":sys5681:print"different{home}
3032 sys5681:print"letter.{home}":gosub960:print"find the only{home}
3033 sys5681:print"big 'k' in{home}":sys5681:print"the town and{home}
3034 sys5681:print"stand right{home}":sys5681:print"in front of it.{home}
3035 gosub960:print"then go five{home}":sys5681:print"steps east,{home}
3036 sys5681:print"six north{home}":sys5681:print"and{home}
3037 sys5681:print"four east.{home}":sys5681:print"search there.%{home}":goto400
3100 print"d{home}":gosub800:print"we druids{home}":sys5681:print"want to{home}
3101 sys5681:print"help you.%{home}":goto400
3110 print"{home}":gosub800:print"ask what you{home}":sys5681:print"want to know.%{home}":goto400
3120 print"et{home}":gosub800:print"i was in{home}":sys5681:print"trisdic. there{home}
3121 sys5681:print"you'll find the{home}":sys5681:print"fourth tablet.%{home}":goto400
3130 print"...":gosub800:print"cerfax can tell{home}":sys5681:print"you more about{home}
3131 sys5681:print"that than i.%{home}":goto400
3200 print"search";:fori=1to5:print".";:forj=.to400:nextj,i
3201 sys5681:print"{yel}you find{home}":sys5681
3202 ifx<>28ory<>26thenprint"nothing.{home}":goto100
3204 print"a clay tablet:{home}":sys5681:sys5681:print"{orng}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}:{$ac}{$ad};{home}
3206 sys5681:print"{rght}{rght}{rght}{rght}{rght}{rght}{rvon}<{$ae}{$af}={home}":sys5681:sys5681:goto100
3300 print"{left}  {home}":sys5681:print"{yel}do you want to{home}":sys5681:print"leave damraskan{home}
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
50100 data-35,6240,11,17,1,6560,8,17,35,6853,11,21,-1,6975,8,21
