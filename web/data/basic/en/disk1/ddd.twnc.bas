1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454
2 poke51209,15:poke51211,2:poke51206,10:poke51221,1:poke51230,7
3 poke51219,1:poke51224,1:poke51225,1:poke51223,7:poke51208,12:poke650,255
4 dimr$(21):fori=2to21:readr$(i):next:poke51468,59:poke51724,98:poke51980,36
5 poke52236,61:poke51469,60:poke51725,119:poke51981,127:poke52237,123
6 dima(3),p(3):fori=0to3:reada(i),p(i):next:goto20
7 fori=0to3:j=int(4*rnd(ti)):k=p(i)+a(j):ifpeek(k)=11thenpokep(i),11:p(i)=k:pokep(i),21
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
190 print"what..?{home}":goto100
191 sys5681:print"{yel}do that{home}":sys5681:print"outside!{home}":goto100
200 print"waiting...{home}":goto100
210 print"north{home}":j=peek(881):ifj<3orj=5orj=9orj>11goto214
212 pokep,q:q=j:p=p-35:y=y-1:goto6100
214 sys5681:print"{lred}blocked!{home}":sys5681:goto100
220 print"south{home}":j=peek(903):ifj<3orj=5orj=9orj>11goto214
222 pokep,q:q=j:p=p+35:y=y+1:goto6100
230 print"west{home}":j=peek(891):ifj<3orj=5orj=9orj>11goto214
232 pokep,q:q=j:p=p-1:x=x-1:goto6100
234 print"east{home}":j=peek(893):ifj<3orj=5orj=9orj>11goto214
236 pokep,q:q=j:p=p+1:x=x+1:goto6100
240 print"talk";:sys5681:print"{yel} -direction? {wht}G{left}";:z=0
250 z=z+1:ifz>499goto258
252 getu$:ifu$=""goto252
254 ifu$="{up}"thenprint"north{home}":j=-11:goto260
255 ifu$="{down}"thenprint"south{home}":j=11:goto260
256 ifu$="{left}"thenprint"west{home}":j=-1:goto260
257 ifu$="{rght}"thenprint"east{home}":j=1:goto260
258 print"no{home}":sys5681:z=0:goto100
260 j=peek(892+j):sys5681:h=0:ifj=21thenh=1:ifx=11andy=6thenh=2
261 ifj=109thenh=3
262 ifj=110thenh=4
263 ifj=111thenh=5
264 ifj=16andy<5thenh=6
265 ifj=18thenh=7
266 ifj=17thenh=8
267 ifj=16and(y=15ory=16)thenh=9
268 ifj=51thenh=12
269 ifj=16andx<5andy>32thenh=11
270 ifj=34thenh=14
271 ifj=16andx>29thenh=13
272 ifj=19thenh=10
273 ifj=112thenh=15
274 ifj=13thenh=16
279 ifh=.thenprint"{lred}no answer!{home}":sys5681:goto100
280 sys5681:print"{cyn}you talk to{home}":sys5681:ifh=1thenprint"a guard.";
281 ifh=2thenprint"the treasure{home}":sys5681:print"guard.";
282 ifh=3thenprint"a priest.{home}":sys5681
283 ifh=4thenprint"a healer.{home}":sys5681
284 ifh=5thenprint"a cook.";
285 ifh=6thenprint"a cartographer.{home}":sys5681
286 ifh=7thenprint"a fighter.{home}":sys5681
287 ifh=8thenprint"the executioner.{home}":sys5681
288 ifh=9thenprint"an elderly{home}";:sys5681:print"man.";
289 ifh=12thenprint"the king.";
290 ifh=11thenprint"an officer.":sys5681
291 ifh=14thenprint"the queen.{home}":sys5681
292 ifh=13thenprint"a man in a{home}":sys5681:print"blue pinstripe{home}
293 ifh=13thensys5681:print"suit.{home}":sys5681
294 ifh=10thenprint"a bard.{home}":sys5681
295 ifh=15thenprint"a young{home}":sys5681:print"maid.";
296 ifh=16thenprint"a jester.{home}":sys5681
297 print"{home}":ifh=12goto1200
298 ifh=13orrnd(ti)<.5goto400
299 goto820
400 gosub900:ifrnd(ti)<.05thenprint" {home}":goto880
401 ifh=1andn$="guar"goto1000
402 ifh=2andn$="trea"goto1010
403 ifn$="gold"goto1016
404 ifh=3andn$="prie"goto1020
405 ifh=3and(n$="god"orn$="gods")goto1022
406 ifh=4andn$="heal"goto1030
407 ifh=4andn$="pois"goto1032
408 ifh=4andn$="rest"goto1038
409 ifh=5andn$="food"goto1040
410 ifh=6andn$="geog"goto1050
411 ifh=6and(n$="map"orn$="maps")goto1051
412 ifh=7andn$="swor"goto1070
413 ifn$="name"thenprint"?{home}":goto820
414 ifn$="job"goto860
415 ifn$="fuck"orn$="piss"ormid$(n$,2)="ung"orn$="shit"orn$="porn"goto449
416 ifh=7andn$="trai"goto1072
417 ifh=7andn$="atta"goto1084
418 ifh=7andn$="defe"goto1086
419 ifh=8andn$="exec"goto1090
420 ifn$="bye"thenprint"!{home}":goto880
421 ifn$="heal"thenprint"th?{home}":goto840
422 ifh=9andn$="stew"goto1100
423 ifh=12andn$="king"goto1110
424 ifh=12andn$="land"goto1111
425 ifh=12andn$="daug"andpeek(49358)=.goto1113
426 ifh=12andn$="pact"andpeek(49358)=.goto1115
427 ifh=11andn$="sher"goto1131
428 ifh=11andn$="crim"goto1132
429 ifh=11andn$="mubr"goto1135
430 ifh=14andn$="desp"andpeek(49358)=.goto1142
431 ifh=14andn$="daug"andpeek(49358)=.goto1144
432 ifh=14andn$="lott"andpeek(49358)=.goto1146
433 ifh=14andn$="wyrm"andpeek(49358)=.goto1152
434 ifh=14andn$="pact"andpeek(49358)=.goto1154
435 ifh=13andn$="chan"goto1160
436 ifh=13andn$="kohl"goto1163
437 ifh=10andn$="psst"goto1230
438 ifh=15andn$="maid"goto1240
439 ifh=10and(n$="help"orn$="aid")goto1250
440 ifh=12andn$="mubr"goto2000
441 ifh=6andn$="uyrp"goto3000
442 ifh=16andn$="jest"goto2100
443 ifh=16andn$="joke"goto2110
445 print" {home}":gosub800:print"i can't tell{home}":sys5681:print"you anything{home}":sys5681
446 print"about that.%{home}
448 goto400
449 print" {home}":gosub800:print"you are a{home}":sys5681:print"dirty old pig!%{home}":goto400
800 gosub999:print"{yel}the ";
801 ifh=1thenprint"guard{home}
802 ifh=2thenprint"treasure{home}":sys5681:print"guard{home}
803 ifh=3thenprint"priest{home}
804 ifh=4thenprint"healer{home}
805 ifh=5thenprint"cook{home}
806 ifh=6thenprint"cartographer{home}
807 ifh=7thenprint"swordmaster{home}
808 ifh=8thenprint"executioner{home}
809 ifh=9thenprint"old man{home}
810 ifh=12thenprint"king{home}
811 ifh=11thenprint"officer{home}
812 ifh=14thenprint"queen{home}
813 ifh=13thenprint"man{home}
814 ifh=10thenprint"bard{home}
815 ifh=15thenprint"maid{home}
816 ifh=16thenprint"jester{home}
819 sys5681:print"says:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"i am ";:ifh=1thenprint"a{home}":sys5681:print"guard";
821 ifh=2thenprint"the{home}":sys5681:print"treasure guard";
822 ifh=3thenprint"father{home}":sys5681:print"antonius";
823 ifh=4thensys5681:print"hypochondrius";
824 ifh=5thensys5681:print"corollus";
825 ifh=6thensys5681:print"theodorus";
826 ifh=7thensys5681:print"ator";
827 ifh=8thenprint"vultan,{home}":sys5681:print"but people{home}
828 ifh=8thensys5681:print"mostly call me{home}":sys5681:print"'the axe'";
829 ifh=9thensys5681:print"haflar";
830 ifh=12thensys5681:print"casiodorus rex";
831 ifh=11thensys5681:print"torquill";
832 ifh=14thensys5681:print"thea";
833 ifh=13thenprint"helmut,{home}":sys5681:print"but everyone{home}
834 ifh=13thensys5681:print"calls me 'pear'";
835 ifh=10thensys5681:print"dakteon";
836 ifh=15thensys5681:print"gunli";
837 ifh=16thensys5681:print"harlekin";
839 print".%{home}":goto400
840 gosub800:ifh=1thenprint"very well,{home}":sys5681:print"thank you";
841 ifh=2thenprint"i feel{home}":sys5681:print"great";
842 ifh=3thenprint"i am totally";:sys5681:print"drunk on the";:sys5681:print"altar wine";
843 ifh=4thenprint"i feel fine,{home}":sys5681:print"of course";
844 ifh=5thenprint"it's a bit{home}":sys5681:print"hot in here";
845 ifh=6thenprint"i am a bit{home}":sys5681:print"stressed";
846 ifh=7orh=16thenprint"excellent";
847 ifh=8thenprint"i am always{home}":sys5681:print"bloodthirsty";
848 ifh=9thenprint"i have{home}":sys5681:print"caught a cold";
849 ifh=12thenprint"i am well,{home}":sys5681:print"but{home}
850 ifh=12thensys5681:print"my land is{home}":sys5681:print"sick";
851 ifh=11thenprint"so-so, thanks{home}":sys5681:print"for asking";
852 ifh=14andpeek(49358)=.thenprint"i am in{home}":sys5681:print"despair";:goto839
853 ifh=13thenprint"fine - until{home}":sys5681:print"the next vote";
854 ifh=10thenprint"psst";
855 ifh=15orh=14thenprint"fine, thanks";
859 goto839
860 print"?{home}":ifh<3goto820
861 gosub800
862 ifh=3thenprint"i am the";:sys5681:print"priest of this";:sys5681:print"castle";
863 ifh=4thenprint"healing is my{home}":sys5681:print"job";
864 ifh=5thenprint"i do the{home}":sys5681:print"cooking here";
865 ifh=6thenprint"i am a{home}":sys5681:print"geographer";
866 ifh=7thenprint"i am the{home}":sys5681:print"swordmaster";
867 ifh=8thenprint"guess. surely{home}":sys5681:print"you can see{home}":sys5681:gosub899
868 ifh=9thenprint"i am the{home}":sys5681:print"king's{home}":sys5681:print"steward";
869 ifh=12thenprint"i am the{home}":sys5681:print"king of this{home}":sys5681:print"land";
870 ifh=11thenprint"i am the{home}":sys5681:print"king's sheriff";
871 ifh=14thenprint"i am the{home}":sys5681:print"king's{home}":sys5681:print"wife";
872 ifh=13thenprint"i am the{home}":sys5681:print"chancellor of{home}
873 ifh=13thensys5681:print"this our{home}":sys5681:print"dimension";
874 ifh=10thenprint"psst";
875 ifh=15thenprint"i am only{home}":sys5681:print"a maid";
876 ifh=16thenprint"me be the{home}":sys5681:print"court jester";
879 goto839
880 gosub800:ifh=1thenprint"i must get back{home}":sys5681:print"to guard duty";
881 ifh=3thenprint"i will pray{home}":sys5681:print"for you";
882 ifh=4thenprint"stay healthy,{home}":sys5681:print"always";
883 ifh=5thenprint"enjoy your meal";
884 ifh=6thenprint"safe journey";
885 ifh=7thenprint"be brave";
886 ifh=8thenprint"bye. perhaps{home}":sys5681:print"we'll meet
887 ifh=2thenprint"i'm keeping an{home}":sys5681:print"eye on you";
888 ifh=8thensys5681:print"again some day,{home}":sys5681:print"on business";
889 ifh=9thenprint"are you finally":sys5681:print"leaving";
890 ifh=12thenprint"save our{home}":sys5681:print"world";
891 ifh=11thenprint"pay your taxes{home}":sys5681:print"on time";
892 ifh=14andpeek(49358)=.thenprint"save our{home}":sys5681:print"daughter";:goto897
893 ifh=13thenprint"'twas a{home}":sys5681:print"pleasure to{home}":sys5681:print"meet you";
894 ifh=10thenprint"i'll go on{home}":sys5681:print"singing now";
895 ifh=15orh=14thenprint"farewell";
896 ifh=16thenprint"have fun{home}":sys5681:print"then, haha";
897 print".%{home}":sys5681:sys5681:print"{yel}he";:ifh>13andh<16thenprint"{left}{left}she";
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
971 getu$:ifu$="y"oru$="n"thenprintu$"{lgrn}{home}":gosub999:return
972 goto971
999 sys5681:sys5681:return
1000 print"d{home}":gosub800:print"i guard the{home}":sys5681:print"castle and{home}
1001 sys5681:print"the king. want{home}":sys5681:print"an audience?";:gosub970
1002 ifu$="n"thenprint"it's better not{home}":sys5681:print"to disturb{home}
1003 ifu$="n"thensys5681:print"the king{home}":sys5681:print"anyway.%{home}":goto400
1004 print"the king will{home}":sys5681:print"see you in the{home}
1005 sys5681:print"throne room.%{home}":goto400
1010 print"sure{home}":gosub800:print"i guard the{home}":sys5681:print"king's gold.{home}
1011 sys5681:print"are you here to{home}":sys5681:print"steal, maybe?";:gosub970:ifu$="y"goto1013
1012 print"i wouldn't{home}":sys5681:print"advise it{home}":sys5681:print"either!%{home}":goto400
1013 print"watch out!{home}":sys5681:print"for folks like{home}
1014 sys5681:print"you, the man{home}":sys5681:print"behind you is{home}
1015 sys5681:print"in charge.%{home}":goto400
1016 print" {home}":gosub800:print"yes, i'd like{home}";:sys5681:print"some gold too!%{home}":goto400
1020 print"st{home}":gosub800:print"i am a{home}":sys5681:print"man of god.{home}":goto400
1022 print" {home}":gosub800:print"do you believe{home}":sys5681:print"in god?";:gosub970:ifu$="n"goto1024
1023 print"then kneel down{home}":sys5681:print"and pray!{home}":goto400
1024 print"neither do i,{home}":sys5681:print"but a man has{home}
1025 sys5681:print"to make a{home}":sys5681:print"living.%{home}":goto400
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
1040 print"{home}":gosub800:print"i cook very{home}";:sys5681:print"well. would you{home}
1041 sys5681:print"like to buy a{home}":sys5681:print"lunch box with{home}
1042 sys5681:print"25 portions?";
1043 gosub970:ifu$="n"thenprint"as you wish.%{home}":goto400
1044 z=45-ch:gosub9000:na=na+25:ifna>250thenna=250
1045 poke49244,na:gosub10000:sys5681:print"{lgrn}another one?";:goto1043
1050 print"raphy{home}":gosub800:print"i draw{home}":sys5681:print"maps.%{home}":goto400
1051 print"{home}":gosub800:print"would you like{home}":sys5681:print"to buy exact{home}":sys5681
1052 print"maps of this{home}";:sys5681:print"land and plans{home}":sys5681:print"of buildings,{home}
1053 sys5681:print"towns, mazes{home}":sys5681:print"etc.?";:gosub970:ifu$="y"goto1056
1054 print"oh well, if you{home}":sys5681:print"can find your{home}
1055 sys5681:print"way anyway.%{home}":goto400
1056 print"sadly i have{home}":sys5681:print"none ready{home}
1057 sys5681:print"at the moment.{home}":sys5681:print"would you still{home}
1058 sys5681:print"like to buy{home}":sys5681:print"some?";:gosub970:ifu$="n"goto1054
1060 print"then just send{home}":sys5681:print"20 dm (cash{home}":sys5681:print"or cheque){home}
1061 sys5681:print"to the author:{home}":gosub960:sys5681:print"{wht}german design{home}
1062 sys5681:print"    group{home}":sys5681:sys5681:print"r. rinscheidt{home}
1063 sys5681:print"reference:{home}":sys5681:print"d.d.d. - maps{home}":sys5681:print"buchholzstr. 17{home}
1064 sys5681:print"4755 holzwickede{home}":sys5681:print"west-germany{home}
1065 gosub960:print"you will get{home}":sys5681:print"very nice{home}
1066 sys5681:print"maps and{home}":sys5681:print"solution hints.{home}":goto400
1070 print"dmaster?{home}":gosub800:print"i can train{home}":sys5681:print"you in combat
1071 sys5681:print".%{home}":goto400
1072 print"ning{home}":gosub800:ifpeek(49344)goto1075
1073 print"for that you{home}":sys5681:print"must first gain{home}
1074 sys5681:print"more{home}":sys5681:print"experience.%{home}":goto400
1075 print"good. do you{home}":sys5681:print"want to improve{home}":sys5681
1076 print"your attack{home}":sys5681:print"or your{home}":sys5681:print"defense?%{home}":goto400
1077 j=peek(49228):ifj<18thenpoke49228,j+1:goto1079
1078 print"there is{home}":sys5681:print"nothing more{home}":sys5681:print"i can teach.%{home}":goto400
1079 poke49344,peek(49344)-1:print"okay, let's{home}":sys5681:print"fight!%{home}
1080 fori=0to9:poke53280,10:sys6041:pokes+5,8:pokes+1,50+30*rnd(ti)
1081 pokes+4,17:poke53280,0:k=60+200*rnd(ti):forj=0tok:nextj,i:gosub10000:goto400
1082 j=peek(49229):ifj=18goto1078
1083 poke49229,j+1:goto1079
1084 print"ck{home}":gosub800:ifat=18orpeek(49344)>.goto1077
1085 goto1073
1086 print"nse{home}":gosub800:ifpa=17orpeek(49344)>.goto1082
1087 goto1073
1090 print"utioner{home}":gosub800:print"i am the king's{home}":sys5681:print"executioner and{home}
1091 sys5681:print"torturer.{home}":gosub960:print"have you ever{home}
1092 sys5681:print"been at an{home}":sys5681:print"execution{home}":sys5681:print"before?";
1093 gosub970:ifu$="y"thenprint"fun, isn't it?{home}":sys5681:print"beheading is{home}
1094 ifu$="y"thensys5681:print"my favourite.%{home}":goto400
1095 print"then stay here{home}":sys5681:print"a little while.{home}":sys5681:print"the guy here in{home}
1096 sys5681:print"the cell will{home}":sys5681:print"soon lose his{home}":sys5681:print"head.%{home}
1097 goto400
1100 print"ard{home}":gosub800:print"i manage{home}":sys5681:print"the castle.{home}
1101 gosub960:print"these are{home}":sys5681:print"the royal{home}
1102 sys5681:print"chambers. no one{home}":sys5681:print"may enter here.{home}
1103 sys5681:print"you had better{home}":sys5681:print"leave now,{home}
1104 sys5681:print"before the{home}":sys5681:print"guards see you.%{home}":goto400
1110 print"{home}":gosub800:print"i rule{home}":sys5681:print"this land.%{home}":goto400
1111 print" {home}":gosub800:print"my land is":sys5681:print"threatened{home}
1112 sys5681:print"by a dark":sys5681:print"power.%{home}":goto400
1113 print"hter{home}":gosub800:print"oh, that{home}":sys5681:print"accursed{home}
1114 sys5681:print"pact!%{home}":goto400
1115 print"{home}":gosub800:print"twice a year,{home}":sys5681:print"always at the{home}
1116 sys5681:print"solstice, the{home}":sys5681:print"dragon grows{home}
1117 sys5681:print"hungry for{home}":sys5681:print"human flesh.{home}
1118 gosub960:print"therefore we{home}":sys5681:print"made a pact{home}
1119 sys5681:print"with it: in{home}":sys5681:print"return for{home}
1120 sys5681:print"sparing our{home}":sys5681:print"towns, we must{home}
1121 sys5681:print"then offer it{home}":sys5681:print"a young{home}
1122 sys5681:print"maiden as a{home}":sys5681:print"sacrifice{home}":sys5681:print"each time.{home}
1123 gosub960:print"which maiden is{home}":sys5681:print"chosen by lot.{home}
1124 sys5681:print"this time the{home}":sys5681:print"lot fell on my{home}
1125 sys5681:print"only{home}":sys5681:print"daughter.{home}
1126 gosub960:print"i beg you,{home}":sys5681:print"slay the wyrm{home}
1127 sys5681:print"if you can. but{home}":sys5681:print"do not fail,{home}
1128 sys5681:print"or else the{home}":sys5681:print"beast will take{home}
1129 sys5681:print"a terrible{home}":sys5681:print"revenge{home}
1130 sys5681:print"on us all.%{home}":goto400
1131 print"iff{home}":gosub800:print"i hunt{home}":sys5681:print"criminals.%{home}":goto400
1132 print"inals{home}":gosub800:print"for example,{home}":sys5681:print"the king has{home}
1133 sys5681:print"long sought the{home}":sys5681:print"thieves' gang of{home}
1134 sys5681:print"mubrak.%{home}":goto400
1135 print"ak{home}":gosub800:print"have you ever{home}":sys5681:print"been to{home}":sys5681:print"mubrak?";
1136 gosub970:ifu$="y"goto1139
1137 print"pity, the king{home}";:sys5681:print"would like to{home}":sys5681:print"know where it{home}
1138 sys5681:print"lies.%{home}":goto400
1139 print"ask the king{home}";:sys5681:print"about mubrak{home}":sys5681:print"and give him{home}
1140 sys5681:print"the coordinates.{home}":sys5681:print"he will reward{home}
1141 sys5681:print"you richly.%{home}":goto400
1142 print"air{home}":gosub800:print"our daughter{home}":sys5681:print"will soon{home}
1143 sys5681:print"die.%{home}":goto400
1144 print"hter{home}":gosub800:print"princess{home}":sys5681:print"sheila. her lot{home}
1145 sys5681:print"was drawn{home}":sys5681:print"in the{home}":sys5681:print"lottery.%{home}":goto400
1146 print"ery{home}":gosub800:print"you're not{home}":sys5681:print"from here?";:gosub970
1147 ifu$="n"thenprint"then you should{home}":sys5681:print"know what that{home}
1148 ifu$="n"thensys5681:print"means!%{home}":goto400
1150 print"in the mountains{home}":sys5681:print"of the desert{home}":sys5681:print"'öd' in the{home}
1151 sys5681:print"east dwells a{home}":sys5681:print"terrible wyrm.%{home}":goto400
1152 print"{home}":gosub800:print"we had to make{home}":sys5681:print"a terrible{home}
1153 sys5681:print"pact with{home}":sys5681:print"it.%{home}":goto400
1154 print"{home}":gosub800:print"i...% {yel}(cries){home}":sys5681:print"{lgrn}%...cannot.{home}
1155 sys5681:print"ask my husband{home}":sys5681:print"about our{home}
1156 sys5681:print"daughter.%{home}":goto400
1160 print"cellor{home}":gosub800:print"i do...{home}":gosub960:print"...well, what{home}
1161 sys5681:print"do i do, really?{home}":gosub960:print"i never quite{home}":sys5681:print"know{home}
1162 sys5681:print"what it is{home}":sys5681:print"i do...%{home}":goto400
1163 print" ":gosub800:print"yes, that's{home}":sys5681:print"my name.%{home}":goto400
1200 gosub800:print"welcome,{home}":sys5681:print"my";
1201 ifpeek(49166)thenprint" lady knight.{home}":goto1203
1202 print" knight.{home}
1203 sys5681:print"i have heard{home}":sys5681:print"word of your{home}
1204 sys5681:print"deeds.{home}":gosub960:gosub7000:ifsu=21goto1220
1205 j=0:fori=1tosu:j=j+100*i:next:ifef<jgoto1222
1206 su=su+1:hm=54+45*su:poke49241,su:poke49344,peek(49344)+1
1207 poke49287,peek(49287)+2:j=j+100*su:ifsu<21andj<=efgoto1206
1208 print"i raise you{home}":sys5681:print"to level"su"{home}
1209 sys5681:print"and grant you{home}":sys5681:print"the rank of{home}
1210 sys5681:printr$(su);:sys5681:print"in my army.%{home}
1211 poke49233,hm/256:poke49232,hm-256*peek(49233):z=19:goto1034
1220 print"go now and{home}":sys5681:print"destroy the evil{home}
1221 sys5681:print"that threatens{home}":sys5681:print"us.%{home}":goto400
1222 print"try to become{home}":sys5681:print"more experi-{home}
1223 sys5681:print"enced and{home}":sys5681:print"better.%{home}":goto400
1230 print"?{home}":gosub800:print"yes, psst!{home}":sys5681:print"can't you see{home}
1231 sys5681:print"that i am{home}":sys5681:print"playing?%{home}":goto400
1240 print" {home}":gosub800:print"i serve{home}":sys5681:print"my king.{home}
1242 gosub960:print"have you come{home}":sys5681:print"to save{home}":sys5681:print"our{home}
1243 sys5681:print"world?";:gosub970:ifu$="n"thenprint"help us!%{home}":goto400
1244 print"dakteon may{home}":sys5681:print"be able to give{home}":sys5681:print"you a hint.{home}
1245 sys5681:print"ask him for{home}":sys5681:print"help.%{home}":goto400
1250 print"{home}":gosub800:print"the name of{home}":sys5681:print"evil, which no{home}
1251 sys5681:print"one may speak{home}":sys5681:print"without burning,{home}
1252 sys5681:print"is important if{home}":sys5681:print"you want to{home}
1253 sys5681:print"destroy{home}":sys5681:print"the evil{home}":sys5681:print"one.{home}
1255 gosub960:print"the wizards{home}":sys5681:print"of the two
1256 sys5681:print"circles know{home}":sys5681:print"something of it.{home}
1257 sys5681:print"ask them about{home}":sys5681:print"evil.%{home}":goto400
2000 print"ak{home}":gosub800:ifpeek(49352)thenprint"mubrak will be{home}":sys5681:print"destroyed!%{home}":goto400
2001 print"mubrak? do you{home}":sys5681:print"know where{home}
2002 sys5681:print"that rats' nest{home}":sys5681:print"lies? ";:gosub970
2004 ifu$="n"thenprint"too bad. i'd{home}":sys5681:print"love to have{home}
2006 ifu$="n"thensys5681:print"wiped it out.%{home}":goto400
2008 print"tell me the{home}":sys5681:print"coordinates,{home}":sys5681:print"then i will{home}
2010 sys5681:print"reward you{home}":sys5681:print"richly:{home}
2012 sys5681:sys5681:print"{yel}( & '/ & '){left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{wht}";:n$=""
2014 gosub2900:gosub2900:print"{rght}";:gosub2900:gosub2900:sys5681:sys5681:print"{lgrn}";
2016 ifn$<>"biej"thenprint"impossible, my{home}":sys5681:print"men have already{home}
2018 ifn$<>"biej"thensys5681:print"searched there.%{home}":goto400
2020 print"very good, i{home}":sys5681:print"will send a{home}":sys5681:print"troop at once{home}
2022 sys5681:print"to destroy{home}":sys5681:print"this den of{home}
2024 sys5681:print"iniquity{home}":sys5681:print"for good.{home}":gosub960:print"in gratitude i{home}
2026 sys5681:print"grant you{home}":sys5681:print"2000 gold pieces{home}
2028 sys5681:print"as a reward.%{home}":poke49352,1:gp=gp+2e3:ifgp>5e4thengp=5e4
2030 z=.:gosub9004:goto400
2100 print"er{home}":gosub800:print"i am the one who{home}":sys5681:print"tells jokes.%{home}":goto400
2110 print"{home}":gosub800:print"do you know the{home}":sys5681:print"difference{home}
2112 sys5681:print"between the{home}":sys5681:print"queen and a{home}
2114 sys5681:print"hippo?";:gosub970:ifu$="y"thenprint"oh...%{home}":goto400
2116 print"the hippo{home}":sys5681:print"bathes more{home}":sys5681:print"often, hahaha!%{home}":goto400
2900 print"G{left}";
2910 getu$:ifu$<"a"oru$>"p"goto2910
2920 printu$"{rght}";:n$=n$+u$:return
3000 print" ":gosub800:print"the isle of uyrp{home}":sys5681:print"lies at the{home}":sys5681
3002 print"south cape, at{home}":sys5681:print"coordinates{home}":sys5681:print"(d&m'/j&g').%{home}":goto400
3300 print"{left}  {home}":sys5681:print"{yel}do you want to{home}":sys5681:print"leave the castle{home}
3301 sys5681:print"now?";:gosub970:ifu$="n"theny=y-1:goto100
6000 sys5681:print"{lred}you leave{home}":sys5681:print"the castle.{home}
6010 fori=0to600:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
6020 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:poke2,0:new
6100 pokes+4,0:pokes+5,16:pokes+1,12:pokes+4,129:goto100
7000 ifpeek(49360)>.orpeek(49358)=.thenreturn
7010 print"you have slain{home}":sys5681:print"the giant wyrm{home}
7012 sys5681:print"and rescued{home}":sys5681:print"my daughter{home}
7014 sys5681:print"sheila.{home}":gosub960:print"in gratitude{home}
7015 sys5681:print"i give you{home}":sys5681:print"1ooo gold pieces{home}
7020 z=-1e3:gosub9004:sys5681:print"{lgrn}";:poke49360,1:return
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
50000 dataprivate,lance corporal,corporal,sergeant,officer cadet
50001 datastaff sergeant,master sergeant,ensign,first sergeant,sergeant major
50002 datasenior ensign,warrant officer,lieutenant,first lieutenant,captain
50003 datamajor,lt. colonel,colonel,general,field marshal
51000 data-35,6368,1,6601,35,6736,-1,6999
60000 fori=0to120:poke832+i,i:next:sys4361
