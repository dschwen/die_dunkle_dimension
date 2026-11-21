1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454:poke6794,3
2 poke650,255:poke51223,15:poke51221,1:poke51208,12:poke51209,15:poke51211,2
3 poke51217,8:poke51219,1:poke51206,8:poke51224,1:poke51228,8:poke51222,8
4 poke7243,90:poke7244,98:poke7245,99:poke7246,101:poke7247,100:poke7249,94
5 dimw$(26):fori=0to26:readw$(i):next
6 dima(3),p(3),q(3),h(3):fori=0to3:reada(i),p(i),q(i),h(i):next:goto20
7 fori=0to3:j=int(4*rnd(ti)):k=p(i)+a(j):z=peek(k):ifk=6144+x+35*ygoto9
8 ifz=3orz=8orz=11thenifk<7400thenpokep(i),q(i):p(i)=k:q(i)=z:pokep(i),h(i)
9 next:return
20 print"{home}{down}{down}"spc(24)"{lgrn}health:   (   )":printspc(24)"{up}{cyn}astral:   (   )
21 printspc(24)"{lred}att.:   {grn}def.:":printspc(24)"{up}{pur}str.:   {yel}dex.:
22 printspc(24)"{gry3}int.:   {lblu}cha.:":printspc(24)"{up}{lgrn}exp.:      (  )
23 printspc(24)"{yel}gold pcs.:":printspc(24)"{up}{orng}food supply:
25 x=17:y=36:p=40721:q=11:gosub10000
30 goto100:p(0)=40137:p(1)=40207:fori=2to4
32 p(i)=39235+int(1120*rnd(ti)):ifpeek(p(i))<>11goto32
34 pokep(i),21:next
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
210 print"north{home}":j=peek(881):ifj<3orj=5orj=9or(j>11andj<>119andj<>120)goto214
212 pokep,q:q=j:p=p-35:y=y-1:goto6100
214 sys5681:print"{lred}blocked!{home}":sys5681:goto100
220 print"south{home}":j=peek(903):ifj<3orj=5orj=9or(j>11andj<>119andj<>120)goto214
222 pokep,q:q=j:p=p+35:y=y+1:goto6100
230 print"west{home}":j=peek(891):ifj<3orj=5orj=9or(j>11andj<>119andj<>120)goto214
232 pokep,q:q=j:p=p-1:x=x-1:goto6100
234 print"east{home}":j=peek(893):ifj<3orj=5orj=9or(j>11andj<>119andj<>120)goto214
236 pokep,q:q=j:p=p+1:x=x+1:goto6100
240 print"talk";:sys5681:print"{yel} -direction? {wht}G{left}";:z=0
250 z=z+1:ifz>499goto258
252 getu$:ifu$=""goto252
254 ifu$="{up}"thenprint"north{home}":j=-11:goto260
255 ifu$="{down}"thenprint"south{home}":j=11:goto260
256 ifu$="{left}"thenprint"west{home}":j=-1:goto260
257 ifu$="{rght}"thenprint"east{home}":j=1:goto260
258 print"no{home}":sys5681:z=0:goto100
260 j=peek(892+j):sys5681:h=0:ifj=21thenh=1
262 ifj=110thenh=4
263 ifj=111thenh=5
264 ifj=16andy=20andx<9thenh=6
265 ifj=18thenh=11
266 ifj=16and(y=17ory=16)thenh=7
267 ifj=16andy<14thenh=9
268 ifj=28thenh=10
269 ifj=18thenh=16
274 ifj=16andy>24thenh=3
275 ifj=16andy<24andy>18andx>20thenh=2
276 ifj=114thenh=8
279 ifh=.thenprint"{lred}no answer!{home}":sys5681:goto100
280 sys5681:print"{cyn}you talk to{home}":sys5681:ifh=1thenprint"a guard.";
281 ifh=2thenprint"the{home}":sys5681:print"armourer.";
282 ifh=3thenprint"the{home}":sys5681:print"weaponsmith.";
283 ifh=4thenprint"a healer.{home}":sys5681
284 ifh=5thenprint"a cook.{home}":sys5681
285 ifh=6thenprint"an old{home}":sys5681:print"sea dog.";
286 ifh=7thenprint"an innkeeper.{home}":sys5681
287 ifh=8thenprint"a muscle-{home}":sys5681:print"man.";
288 ifh=9thenprint"a carpen-{home}";:sys5681:print"ter.";
289 ifh=10thenprint"a druid.{home}":sys5681
290 ifh=16thenprint"a sorceress.{home}":sys5681
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
410 ifn$="job"goto860
411 ifh=6andn$="sail"goto1100
412 ifh=7and(n$="inn"orn$="innk")goto1140
413 ifn$="name"thenprint"?{home}":goto820
415 ifn$="fuck"orn$="piss"ormid$(n$,2)="ung"orn$="shit"orn$="porn"goto449
416 ifh=8andn$="schw"goto1144
417 ifh=8andn$="body"goto1150
418 ifh=8andn$="trai"goto1154
419 ifh=9andn$="yard"goto1170
420 ifn$="bye"thenprint"!{home}":goto880
421 ifn$="heal"thenprint"th?{home}":goto840
422 ifh=9andn$="ship"goto1172
423 ifh=16andn$="wiza"goto3000
424 ifh=16andn$="adep"goto3010
425 ifh=16andn$="tabl"goto3030
426 ifh=10andn$="drui"goto3100
427 ifh=10thenifn$="crys"orn$="shar"orn$="bala"orn$="evil"goto3130
428 ifh=10andn$="tabl"goto3120
429 ifh=16andn$="thun"goto3020
439 ifh=10andn$="help"goto3110
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
806 ifh=6thenprint"sailor{home}
807 ifh=7thenprint"innkeeper{home}
808 ifh=8thenprint"muscleman{home}
809 ifh=9thenprint"carpenter{home}
810 ifh=10thenprint"druid{home}
811 ifh=16thenprint"sorceress{home}
819 sys5681:print"says:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"i am ";:ifh=1thenprint"a{home}":sys5681:print"guard";
821 ifh=2thenprint"olof";
822 ifh=3thenprint"erik";
823 ifh=4thensys5681:print"appendicus";
824 ifh=5thensys5681:print"kulinarus";
825 ifh=6thensys5681:print"cap'n hook";
826 ifh=7thensys5681:print"dolph";
827 ifh=8thensys5681:print"arnold";
829 ifh=9thensys5681:print"ragnar";
830 ifh=10thensys5681:print"riclan";
831 ifh=16thensys5681:print"tecca";
839 print".%{home}":goto400
840 gosub800:ifh=1thenprint"excellent,{home}":sys5681:print"thank you";
841 ifh=2orh=3orh=10thenprint"quite well";
843 ifh=4thenprint"i feel fine,{home}":sys5681:print"of course";
844 ifh=5orh=16thenprint"so-so, thanks{home}":sys5681:print"for asking";
845 ifh=6thenprint"i'm a bit{home}":sys5681:print"tipsy";
846 ifh=7thenprint"excellent";
847 ifh=8thenprint"i feel{home}":sys5681:print"very strong";
848 ifh=9thenprint"i've been{home}":sys5681:print"working hard";
859 goto839
860 print"?{home}":ifh=1goto820
862 gosub800:ifh=2thenprint"i make";:sys5681:print"armour";
863 ifh=3thenprint"i make and{home}":sys5681:print"trade in";:sys5681:print"weapons";
864 ifh=5thenprint"guess - surely{home}":sys5681:print"you can see";
865 ifh=4thenprint"i am the{home}":sys5681:print"healer of this";:sys5681:print"town";
866 ifh=6thenprint"i am a{home}":sys5681:print"sailor";
867 ifh=7thenprint"i am the{home}":sys5681:print"innkeeper here";
868 ifh=8thenprint"i am a{home}":sys5681:print"bodybuilder";
870 ifh=5thensys5681:print"that i do the{home}":sys5681:print"cooking here";
872 ifh=9thenprint"i am the master{home}":sys5681:print"of the shipyard";
873 ifh=10thenprint"i am a{home}":sys5681:print"druid";
874 ifh=16thenprint"i am a{home}":sys5681:print"sorceress";
879 goto839
880 gosub800:ifh=1thenprint"i must get back{home}":sys5681:print"to guard duty";
881 ifh=3orh=2thenprint"do come{home}":sys5681:print"again soon";
882 ifh=4thenprint"stay healthy,{home}":sys5681:print"always";
883 ifh=5thenprint"eat hearty";
884 ifh=6orh=10thenprint"safe journey";
885 ifh=7thenprint"have a beer";
886 ifh=8thenprint"go buy yourself{home}":sys5681:print"some dumbbells";
887 ifh=16thenprint"may the magic{home}":sys5681:print"be with you";
889 ifh=9thenprint"fair winds";
897 print".%{home}":sys5681:sys5681:print"{yel}he";:ifh>13thenprint"{left}{left}she";
898 print" turns{home}":sys5681:print"away.{home}":sys5681:goto100
899 print"i'm the hangman";:return
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
1001 print"{home}":gosub800:print"this is{home}":sys5681:print"worthal, the{home}":sys5681
1002 print"town of the{home}":sys5681:print"seafarers.{home}":sys5681:print"do you want to{home}":sys5681
1003 print"buy a{home}":sys5681:print"ship? ";:gosub970:ifu$="n"thenprint"then what do you{home}
1004 ifu$="n"thensys5681:print"want here?{home}":goto400
1005 print"then you've{home}":sys5681:print"come to the{home}":sys5681:print"right place.{home}":goto400
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
1040 print"{home}":gosub800:print"we serve tasty{home}";:sys5681:print"fish dishes.{home}
1041 sys5681:print"would you like{home}":sys5681:print"a pack of{home}
1042 sys5681:print"15 rations?";
1043 gosub970:ifu$="n"thenprint"then don't.%{home}":goto400
1044 z=16-int(ch/1.5):gosub9000:sys5681:na=na+15:ifna>250thenna=250
1045 poke49244,na:gosub10000:sys5681:print"another one?";:goto1043
1100 print"or{home}":gosub800:print"i used to be{home}":sys5681:print"a famous{home}
1110 sys5681:print"seafarer, but{home}":sys5681:print"i have{home}
1111 sys5681:print"retired{home}":sys5681:print"now.{home}
1112 gosub960:print"do you want{home}":sys5681:print"to go to sea{home}
1113 sys5681:print"too?";:gosub970
1114 ifu$="n"thenprint"a ship is the{home}":sys5681:print"best{home}":sys5681
1115 ifu$="n"thenprint"home.{home}":goto400
1117 print"can you find{home}":sys5681:print"your way at{home}
1118 sys5681:print"sea? ";:gosub970:ifu$="y"thenprint"then that's{home}":sys5681:print"fine.%{home}
1119 ifu$="y"goto400
1120 print"well, as a{home}":sys5681:print"beginner...{home}
1121 sys5681:print"will you buy{home}":sys5681:print"me a beer?";:gosub970
1122 ifu$="n"thenprint"skinflint!%{home}":goto400
1123 z=2:gosub9000:sys5681:print"{lgrn}thanks, that{home}":sys5681:print"hits the spot.";
1124 ifpeek(49347)thenprint"%{home}":goto400
1125 print" i{home}":sys5681:print"might have{home}
1126 sys5681:print"something for{home}":sys5681:print"you. i still{home}
1127 sys5681:print"have my old{home}":sys5681:print"sextant for{home}
1128 sys5681:print"navigation. i'd{home}":sys5681:print"gladly sell{home}
1129 sys5681:print"it to you. are{home}":sys5681:print"you{home}
1130 sys5681:print"interested? ";:gosub970:ifu$="n"thenprint"then not.%{home}":goto400
1131 z=420-chr*10:gosub9000:sys5681:print"thank you.{home}":sys5681:print"here it{home}
1132 sys5681:print"is.%";:poke49347,1:goto400
1140 print" {home}":gosub800:print"yes, sit down{home}":sys5681:print"at a table,{home}
1142 sys5681:print"i'll be right{home}":sys5681:print"with you.%{home}":goto400
1144 print"arzenegger{home}":gosub800:print"no, the{home}":sys5681:print"shared name is{home}
1145 sys5681:print"a coincidence.%";:goto400
1150 print"builder{home}":gosub800:print"i specialize{home}":sys5681:print"in strength.{home}
1151 sys5681:print"i could train{home}":sys5681:print"you, too.";:goto400
1154 print"ning{home}":gosub800:print"do you want to{home}":sys5681:print"get stronger? ";
1155 gosub970:ifu$="n"thenprint"but strength is{home}":sys5681:print"important for{home}
1156 ifu$="n"thensys5681:print"combat and for{home}":sys5681:print"wearing{home}":sys5681
1157 ifu$="n"thenprint"armour.%{home}":goto400
1158 ifsr=18thenprint"you are already{home}":sys5681:print"as strong as i.%{home}":goto400
1159 ifpeek(49287)=0thenprint"for that you{home}":sys5681:print"must first gain{home}
1160 ifpeek(49287)=0thensys5681:print"experience.%{home}":goto400
1161 print"good, let's{home}":sys5681:print"train.%{home}
1162 fori=0to7:poke53280,4:sys6041:pokes+5,73:pokes+1,22:pokes+4,129
1164 k=400*rnd(ti)+200:poke53280,0:forj=0tok:nextj,i:poke49287,peek(49287)-1
1166 poke49224,sr+1:gosub10000:goto400
1170 print"{home}":gosub800:print"i build the{home}":sys5681:print"ships here.%{home}":goto400
1172 print"{home}":gosub800:print"yes, would you{home}":sys5681:print"perhaps be{home}
1173 sys5681:print"interested in{home}":sys5681:print"a one-man{home}
1174 sys5681:print"sailboat? ";:gosub970:ifu$="n"goto1114
1175 z=1e3:gosub9000:sys5681
1176 print"{lgrn}welcome{home}":sys5681:print"aboard, your{home}":sys5681:print"ship lies at{home}
1178 sys5681:print"anchor outside{home}":sys5681:print"the town.%{home}
1180 poke49160,48:poke49164,35:goto400
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
2029 sys5681:z=int(peek(50569+k)*8*(1-(ch-12)/15)):print"only"z"gold{home}":sys5681
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
3000 print"rd{home}":gosub800:print"well, actually{home}":sys5681:print"i'm still{home}
3001 sys5681:print"an adept.%{home}":goto400
3010 print"t{home}":gosub800:print"i'm practising{home}":sys5681:print"the thunderbolt{home}
3011 sys5681:print"spell.%{home}":goto400
3020 print"derbolt{home}":gosub800:print"a useful{home}":sys5681:print"combat spell.{home}
3021 sys5681:print"do you know{home}":sys5681:print"it?";:gosub970
3022 ifu$="y"thenprint"good for you.%{home}":goto400
3024 print"go to the{home}":sys5681:print"black{home}":sys5681:print"circle.%{home}":goto400
3030 print"et{home}":gosub800:print"the healer has{home}":sys5681:print"a free spot{home}
3034 sys5681:print"at his place.{home}":sys5681:print"have a look{home}
3035 sys5681:print"there.%{home}":goto400
3100 print"d{home}":gosub800:print"we druids{home}":sys5681:print"want to{home}
3101 sys5681:print"help you.%{home}":goto400
3110 print"{home}":gosub800:print"ask what you{home}":sys5681:print"want to know.%{home}":goto400
3120 print"et{home}":gosub800:print"i was in{home}":sys5681:print"ackbah. there{home}
3121 sys5681:print"you'll find the{home}":sys5681:print"fifth tablet.%{home}":goto400
3130 print"...":gosub800:print"cerfax can tell{home}":sys5681:print"you more about{home}
3131 sys5681:print"that than i.%{home}":goto400
3200 print"search";:fori=1to5:print".";:forj=.to400:nextj,i
3201 sys5681:print"{yel}you find{home}":sys5681
3202 ifx<>26ory<>35thenprint"nothing.{home}":goto100
3204 print"a clay tablet:{home}":sys5681:sys5681:print"{orng}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}:CD;{home}
3206 sys5681:print"{rght}{rght}{rght}{rght}{rght}{rght}{rvon}<EF={home}":sys5681:sys5681:goto100
3300 print"{left}  {home}":sys5681:print"{yel}do you want to{home}":sys5681:print"leave worthal{home}
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
50003 dataplate armour,,small shield,large shield
50100 data-35,6500,11,17,1,6787,8,17,35,6820,11,21,-1,6780,11,21
