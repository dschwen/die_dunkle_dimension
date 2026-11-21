1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454:i=rnd(-ti)
5 dimw$(26):fori=0to26:readw$(i):next:gosub11000
6 poke51206,1:dima(3),p(3),q(3),h(3):fori=0to3:reada(i),p(i),q(i),h(i):next:goto20
7 fori=0to3:j=int(4*rnd(ti)):k=p(i)+a(j):z=peek(k):ifk=6144+x+35*ygoto9
8 ifz=3orz=8orz=11thenifk<7400thenpokep(i),q(i):p(i)=k:q(i)=z:pokep(i),h(i)
9 next:return
20 print"{home}{down}{down}"spc(24)"{lgrn}health:   (   )":printspc(24)"{up}{cyn}astral:   (   )
21 printspc(24)"{lred}att.:   {grn}def.:":printspc(24)"{up}{pur}str.:   {yel}dex.:
22 printspc(24)"{gry3}int.:   {lblu}cha.:":printspc(24)"{up}{lgrn}exp.:      (  )
23 printspc(24)"{yel}gold pcs.:":printspc(24)"{up}{orng}food supply:
25 x=16:y=36:q=11:gosub10000
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
261 ifj=16andy>24thenh=2:ify>33thenh=3
262 ifj=110thenh=4
263 ifj=111thenh=5
265 ifj=16thenify>12andy<16andx>15thenh=7
266 ifj=16thenifx>6andx<9andy>12andy<15thenh=8.2
267 ifj=46thenh=8
268 ifj=16andx>28andy<7thenh=6
269 ifj=18thenh=9
270 ifj=28thenh=10
271 ifj=16thenifx<7andy>12andy<15thenh=8.1
272 ifj=16thenifx>8andx<11thenh=8.3
273 ifj=39thenh=8.5
274 ifj=16thenifx<9andy<6thenh=8.8
275 ifj=34thenh=14
276 ifj=25thenh=13
277 ifj=32goto1110
278 ifj=30thenh=15
279 ifh=.thenprint"{lred}no answer!{home}":sys5681:goto100
280 sys5681:print"{cyn}you talk to{home}":sys5681:ifh=1thenprint"a guard.";
281 ifh=2thenprint"the{home}":sys5681:print"armourer.";
282 ifh=3thenprint"the{home}":sys5681:print"weaponsmith.";
283 ifh=4thenprint"a healer.{home}":sys5681
284 ifh=5thenprint"a cook.{home}":sys5681
285 ifh=6thenprint"a man.{home}":sys5681
286 ifh=7thenprint"a beggar.{home}":sys5681
287 ifh=8thenprint"a croupier.{home}":sys5681
288 ifh=13thenprint"a lady of{home}":sys5681:print"easy virtue.";
289 ifh=15thenprint"a waitress.{home}":sys5681
291 ifh=14thenprint"an old woman.{home}":sys5681
292 ifh=9thenprint"a wizard.{home}":sys5681
293 ifh=10thenprint"a druid.{home}":sys5681
294 ifh>8andh<8.5thenprint"a gambler.{home}":sys5681
295 ifh=8.5thenprint"a fire{home}":sys5681:print"devil.";
296 ifh=8.8thenprint"a warrior.{home}":sys5681
297 print"{home}":ifpeek(49352)goto1200
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
411 ifh=6andn$="peep"goto1100
412 ifh=7andn$="begg"andpeek(49350)=.goto1120
413 ifn$="name"thenprint"?{home}":goto820
414 ifn$="job"goto860
415 ifn$="fuck"orn$="piss"ormid$(n$,2)="ung"orn$="shit"orn$="porn"goto499
416 ifh=15andn$="wait"goto1140
417 ifh=15andn$="head"goto1150
419 ifh=8andn$="crou"goto4000
420 ifn$="bye"thenprint"!{home}":goto880
421 ifn$="heal"thenprint"th?{home}":goto840
422 ifh=7andn$="begg"thenprint"ar{home}":gosub800:goto1125
423 ifh=7andn$="flut"andpeek(49350)=.goto1130
424 ifh=9andn$="wiza"goto3000
425 ifh=9andn$="adep"goto3010
426 ifh=9andn$="tabl"goto3030
427 ifh=9andn$="pois"goto3020
428 ifh=10andn$="drui"goto3100
429 ifh=10andn$="help"goto3110
430 ifh=10andn$="tabl"goto3120
431 ifh=10thenifn$="evil"orn$="shar"orn$="crys"orn$="bala"orn$="circ"goto3130
432 ifh=13andn$="body"goto1050
433 ifh=13andn$="help"goto1060
434 ifh=8.1andn$="gamb"goto1160
435 ifh=8.1andn$="brok"andpeek(49354)=.goto1162
436 ifh=8.2andn$="gamb"goto1180
437 ifh=8.3andn$="gamb"goto1185
438 ifh=8.3andn$="mone"goto1187
439 ifh=14andn$="nigh"goto1070
440 ifh=8andn$="game"goto4010
441 ifh=14andn$="domi"goto1072
442 ifh=8.5andn$="dagg"andpeek(49349)=.goto1210
443 ifh=8.5andn$="serv"goto860
444 ifh=8.5andn$="fulg"goto1220
445 ifh=8.8andn$="warr"goto1300
446 ifh=8.8andn$="elit"goto1310
447 ifh=8.8andn$="gian"goto1320
448 ifh=8.8thenifn$="shei"orn$="prin"goto1340
449 ifh=3andn$="blow"goto2200
497 print" {home}":gosub800:print"i can't tell{home}":sys5681:print"you anything{home}":sys5681
498 print"about that.%{home}":goto400
499 print" {home}":gosub800:print"you are a{home}":sys5681:print"dirty old pig!%{home}":goto400
800 gosub999:print"{yel}the ";
801 ifh=1thenprint"guard{home}
802 ifh=2thenprint"armour-{home}":sys5681:print"smith{home}
803 ifh=3thenprint"weapon-{home}":sys5681:print"smith{home}
804 ifh=4thenprint"healer{home}
805 ifh=5thenprint"cook{home}
806 ifh=6thenprint"man{home}
807 ifh=7thenprint"beggar{home}
808 ifh=8.8thenprint"warrior{home}
810 ifh=9thenprint"wizard{home}
811 ifh=10thenprint"druid{home}
812 ifh=14thenprint"old woman{home}
813 ifh=13thenprint"girl{home}
814 ifh=8thenprint"croupier{home}
815 ifh=15thenprint"waitress{home}
816 ifh>8andh<8.5thenprint"gambler{home}
817 ifh=8.5thenprint"fire devil{home}
819 sys5681:print"says:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"i am ";:ifh=1thenprint"a{home}":sys5681:print"guard";
821 ifh=2thensys5681:print"harp";
822 ifh=3thensys5681:print"laython";
823 ifh=4thensys5681:print"krummfus";
824 ifh=5thensys5681:print"raskell";
825 ifh=6thensys5681:print"cydren";
826 ifh=7thensys5681:print"zamak";
827 ifh=9thensys5681:print"sherrar";
828 ifh=10thensys5681:print"tellus";
829 ifh=13thensys5681:print"jeanette";
830 ifh=8thensys5681:print"calhan";
831 ifh=15thensys5681:print"lizeth";
832 ifh=14thensys5681:print"merril";
833 ifh=8.1thenprint"greg";
834 ifh=8.2thensys5681:print"jerint";
835 ifh=8.3thensys5681:print"domick";
836 ifh=8.5thenprint"t'kul";
837 ifh=8.8thenprint"arnor";
839 print".%{home}":goto400
840 gosub800:ifh=1orh=8.2thenprint"excellent,{home}":sys5681:print"thank you";
841 ifh=2orh=3thenprint"quite well";
843 ifh=4thenprint"i feel fine,{home}":sys5681:print"of course";
844 ifh=5thenprint"i'm hot";
845 ifh=6orh=9orh=8.2thenprint"so-so";
846 ifh=7thenprint"i am{home}":sys5681:print"hungry";
849 ifh=8orh=8.3thenprint"i'm{home}":sys5681:print"fine";
850 ifh=13thenprint"business{home}":sys5681:print"is good";
851 ifh=15thenprint"i have a{home}":sys5681:print"headache";
852 ifh=14thenprint"my rheumatism{home}":sys5681:print"plagues me";
853 ifh=10thenprint"as well as can{home}":sys5681:print"be expected";
855 ifh=8.1thenprint"i'm{home}":sys5681:print"broke";
856 ifh=8.5thenprint"i'm cold";
857 ifh=8.8thenprint"lousy";
859 goto839
860 print"?{home}":ifh=1goto820
862 gosub800:ifh=2thenprint"i make";:sys5681:print"armour";
863 ifh=3thenprint"i make and{home}":sys5681:print"trade in";:sys5681:print"weapons";
864 ifh=5thenprint"i do the{home}":sys5681:print"cooking";
865 ifh=6thenprint"i run this{home}":sys5681:print"peep show";
866 ifh=7thenprint"i am a{home}":sys5681:print"beggar";
867 ifh=4thenprint"i am a{home}":sys5681:print"healer";
868 ifh=9thenprint"i am a{home}":sys5681:print"wizard";
869 ifh=10thenprint"i am a{home}":sys5681:print"druid";
870 ifh=15thenprint"i am the{home}":sys5681:print"waitress";
871 ifh=14thenprint"i am a{home}":sys5681:print"herb woman";
872 ifh=13thenprint"i sell{home}":sys5681:print"my body";
873 ifh=8.8thenprint"i am a{home}":sys5681:print"warrior";
874 ifh=8thenprint"i am the{home}":sys5681:print"croupier";
875 ifh>8andh<8.5thenprint"i am a{home}":sys5681:print"gambler";
876 ifh=8.5thenprint"i serve{home}":sys5681:print"fulgar";
879 goto839
880 gosub800:ifh=1thenprint"i must get back{home}":sys5681:print"to guard duty";
881 ifh=3orh=2thenprint"do come{home}":sys5681:print"again soon";
882 ifh=4thenprint"stay healthy,{home}":sys5681:print"always";
883 ifh=5thenprint"dig in";
884 ifh=6thenprint"take a look";
885 ifh=7thenprint"have pity";
886 ifh=15orh=8.5thenprint"bye";
887 ifh>8andh<8.5thenprint"good luck";
888 ifh=10thenprint"may the light{home}":sys5681:print"be with you";
889 ifh=8.8thenprint"farewell";
890 ifh=13thenprint"adieu, cherie";
892 ifh=14orh=9thenprint"may the magic{home}":sys5681:print"be with you";
896 ifh=8thenprint"unlucky at{home}":sys5681:print"cards, lucky{home}":sys5681:print"in love";
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
1001 print"{home}":gosub800:print"this is{home}":sys5681:print"mubrak, the{home}
1002 sys5681:print"independent{home}":sys5681:print"town.";:ifpeek(7385)<>21goto400
1003 print" want to{home}":sys5681:print"come in?";:gosub970
1004 ifu$="n"thenprint"then you'll{home}":sys5681:print"stay outside";:goto897
1005 print"but whoever{home}":sys5681:print"wants in must{home}
1006 sys5681:print"pay taxes,{home}":sys5681:print"which we need{home}
1007 sys5681:print"for the upkeep{home}":sys5681:print"of the town.{home}
1008 sys5681:print"do you agree{home}":sys5681:print"to that?";:gosub970:ifu$="n"goto1004
1009 z=50:gosub9000:sys5681:print"{lgrn}thanks, your{home}":sys5681:print"way is clear";
1010 poke7385,8:poke7386,8:poke7384,21:poke7387,21
1011 sys6041:pokes+5,16:pokes+1,12:pokes+4,129:goto897
1012 sys5681:sys5681:print"the minimum{home}":sys5681:print"stake is five{home}
1013 sys5681:print"gold pieces.{home}":goto4100
1016 print" {home}":gosub800:print"yes, i'd like{home}";:sys5681:print"some gold too!%{home}":goto400
1030 print"{home}";:gosub800:print"i can cure your{home}":sys5681:print"poison or{home}":sys5681
1031 print"restore you.{home}":sys5681:print"which would{home}":sys5681:print"you like?%{home}":goto400
1032 print"on{home}";:gosub800:z=4*peek(49245)-ch:ifz<2thenz=2
1033 gosub9000:poke49245,0:z=5
1034 pokes+5,201:pokes+12,201:pokes+11,129:pokes+4,17:k=5
1035 fori=5to255step5:pokes+1,i:pokes+8,i:k=z-k:poke53281,k:poke53280,k:next
1036 poke53281,0:poke53280,0:pokes+11,0:pokes+4,0:sys5681:ifh=12thengosub10000:goto400
1037 print"{lgrn}now you are{home}":sys5681:print"cured.%{home}":gosub10000:goto400
1038 print"ore{home}";:gosub800:z=80-4*(ch-su):ifz<10thenz=10
1039 gosub9000:poke49230,peek(49232):poke49231,peek(49233):z=18:goto1034
1040 print"{home}":gosub800:print"the chip shop{home}":sys5681:print"badly needs an{home}
1041 sys5681:print"oil change,{home}":sys5681:print"but would you{home}
1042 sys5681:print"like{home}":sys5681:print"10 rations{home}":sys5681:print"anyway?";
1043 gosub970:ifu$="n"thenprint"then don't.%{home}":goto400
1044 z=15-int(ch/1.5):gosub9000:sys5681:na=na+10:ifna>250thenna=250
1045 poke49244,na:gosub10000:sys5681:print"{lgrn}more?";:goto1043
1050 print"{home}":gosub800:print"i really don't{home}":sys5681:print"want to talk{home}
1051 sys5681:print"about that.{home}":gosub960:print"but on another{home}
1052 sys5681:print"matter: i hear{home}":sys5681:print"that you come{home}
1053 sys5681:print"from another{home}":sys5681:print"world and want{home}
1054 sys5681:print"to save us,{home}":sys5681:print"is that{home}
1055 sys5681:print"right?";:gosub970:ifu$="n"thenprint"then beat it";:goto897
1056 sys5681:print"then perhaps{home}":sys5681:print"i can{home}
1057 sys5681:print"help you.%{home}":goto400
1060 print"{home}":gosub800:print"a druid who{home}":sys5681:print"visited me{home}
1061 sys5681:print"told me{home}":sys5681:print"something.{home}":gosub960:print"only the druids{home}
1062 sys5681:print"know the right{home}":sys5681:print"order of the{home}
1063 sys5681:print"tablets with{home}":sys5681:print"the name of{home}
1064 sys5681:print"evil, which are{home}":sys5681:print"spread across{home}
1065 sys5681:print"the towns.{home}
1066 gosub960:print"ask the druids{home}":sys5681:print"in the towns{home}
1067 sys5681:print"about the{home}":sys5681:print"tablets.%{home}":goto400
1070 print"tshade{home}":gosub800:print"psst!{home}":fori=1to2e3:next:sys5681
1071 sys5681:print"keep your{home}":sys5681:print"voice down!{home}":fori=1to2e3:next:goto1090
1072 print"ck{home}":gosub800:print"for very special{home}":sys5681:print"customers i keep{home}
1073 sys5681:print"a small supply{home}":sys5681:print"of this{home}
1074 sys5681:print"powerful{home}":sys5681:print"reagent.{home}
1075 sys5681:print"would you like{home}":sys5681:print"some?";
1076 gosub970:ifu$="n"thenprint"as you wish.%{home}":goto400
1077 print"one mushroom is{home}":sys5681:print"enough for four{home}":sys5681
1078 print"spells.{home}":z=10:sys5681:gosub9000:j=peek(49342)+4:ifj>99thenj=99
1079 poke49342,j:sys5681:print"{lgrn}good, you now{home}":sys5681:print"have"j;
1080 sys5681:print"portions.{home}":sys5681:print"more?";:goto1076
1090 sys5681:sys5681:print"who told you{home}":sys5681:print"that?{home}":goto400
1100 print" show{home}":gosub800:print"hey, are you{home}":sys5681:print"even{home}
1101 sys5681:print"eighteen?";:gosub970:ifu$="n"thenprint"then get out";:goto897
1102 print"talk to one{home}":sys5681:print"of the hatches{home}
1103 sys5681:print"on the wall and{home}":sys5681:print"drop in a coin.{home}
1104 sys5681:print"then you'll{home}":sys5681:print"see.%{home}":goto400
1110 sys5681:print"{yel}do you want to{home}":sys5681:print"drop in a{home}
1111 sys5681:print"coin?";:gosub970:ifu$="n"orgp=.goto100
1112 z=1:gosub9004:sys5681:print"{yel}ten seconds!{home}":fori=0to2:poke6248+x+i,11:next
1113 poke2,x:poke182,y:sys6052:sys4482:sys4537:sys4361:fori=0to2:poke6248+x+i,9:next
1114 fori=0to6e3:next:goto100
1120 print"ar{home}":gosub800:print"i play{home}":sys5681:print"tunes on{home}
1122 sys5681:print"my flute and{home}":sys5681:print"hope that{home}
1123 sys5681:print"passers-by will{home}":sys5681:print"give me a few{home}
1124 sys5681:print"coins.{home}":gosub960
1125 print"have you got{home}":sys5681:print"a gold piece{home}":sys5681:print"for me?";:gosub970
1126 ifu$="n"thenprint"skinflint";:goto897
1127 z=1:gosub9003:sys5681:print"{lgrn}thank you.{home}":sys5681:print"ask the{home}
1128 sys5681:print"weaponsmith{home}":sys5681:print"about a{home}
1129 sys5681:print"blowpipe";:goto897
1130 print"e{home}":gosub800:print"funny thing,{home}":sys5681:print"made all of{home}
1131 sys5681:print"glass, innit?{home}":gosub960:print"but it has a{home}":sys5681:print"good sound.{home}
1132 sys5681:print"wanna buy{home}":sys5681:print"it,{home}":sys5681:print"maybe?";
1133 gosub970:ifu$="n"thenprint"hrmmpf!%{home}":goto400
1134 z=200:gosub9000:sys5681:print"{lgrn}there you go.%{home}":poke49350,1:goto400
1140 print"ress{home}":gosub800:print"silly question,{home}":sys5681:print"surely you know{home}
1141 sys5681:print"what a{home}":sys5681:print"waitress{home}":sys5681:print"is.{home}
1142 gosub960:print"oh, ";:goto844
1150 print"ache{home}":gosub800:print"yes, the beggar{home}":sys5681:print"out there{home}
1151 sys5681:print"tootles on his{home}":sys5681:print"flute all day{home}
1152 sys5681:print"long. it's{home}":sys5681:print"enough to drive{home}
1153 sys5681:print"you mad.{home}":gosub960:print"by the way, it's{home}
1154 sys5681:print"a very strange{home}":sys5681:print"flute. ask him{home}
1155 sys5681:print"about it. i bet{home}":sys5681:print"he stole{home}
1156 sys5681:print"it.%{home}":goto400
1160 print"ler{home}":gosub800:print"i've gambled{home}":sys5681:print"everything away{home}
1161 sys5681:print"now i'm totally{home}":sys5681:print"broke.%{home}":goto400
1162 print"e{home}":gosub800:print"i badly need{home}":sys5681:print"money.{home}
1163 sys5681:print"perhaps{home}":sys5681:print"you can give me{home}
1164 sys5681:print"some.{home}":gosub960:print"oh, not for{home}
1165 sys5681:print"nothing. i have{home}":sys5681:print"a strange{home}
1166 sys5681:print"piece of iron{home}":sys5681:print"that attracts{home}
1167 sys5681:print"other iron and,{home}":sys5681:print"when you hang it{home}
1168 sys5681:print"up, always{home}":sys5681:print"points{home}
1169 sys5681:print"north. do you{home}":sys5681:print"want it?";:gosub970
1170 ifu$="n"thenprint"pity.%{home}":goto400
1171 z=150:gosub9000:sys5681:print"{lgrn}there you go.%{home}":poke49354,1:goto400
1180 print"ler{home}":gosub800:print"why don't you{home}":sys5681:print"just join in?{home}
1181 gosub960:print"just talk to{home}":sys5681:print"the croupier{home}
1182 sys5681:print"across the{home}":sys5681:print"table. he'll{home}
1183 sys5681:print"surely let you{home}":sys5681:print"join the game{home}
1184 sys5681:print"right{home}":sys5681:print"away.%{home}":goto400
1185 print"ler{home}":gosub800:print"yes, i gamble,{home}":sys5681:print"because i made{home}
1186 sys5681:print"a lot of money{home}":sys5681:print"earlier.%{home}":goto400
1187 print"y{home}":gosub800:print"you won't tell{home}":sys5681:print"anyone{home}":sys5681:print"else?";
1188 gosub970:ifu$="y"thenprint"then i won't{home}":sys5681:print"tell you!%{home}":goto400
1189 print"deep in the{home}":sys5681:print"woods i found{home}":sys5681:print"a whole lot of{home}
1190 sys5681:print"the nightshade{home}":sys5681:print"mushroom{home}
1191 sys5681:print"and flogged it{home}":sys5681:print"to the herb{home}
1192 sys5681:print"woman here.{home}":gosub960:print"ask her about it{home}
1193 sys5681:print"if you need{home}":sys5681:print"some.{home}":goto400
1200 gosub800:print"you betrayed{home}":sys5681:print"our town to{home}
1201 sys5681:print"the king, and{home}":sys5681:print"you still dare{home}
1202 sys5681:print"to show your{home}":sys5681:print"face{home}
1203 sys5681:print"here?{home}":gosub960:print"get out of{home}
1204 sys5681:print"here, before{home}":sys5681:print"we beat you{home}
1205 sys5681:print"to death";:poke198,0:goto897
1210 print"er{home}":gosub800:print"oh, i completely{home}":sys5681:print"forgot to give{home}
1211 sys5681:print"it to{home}":sys5681:print"you. here it{home}":sys5681:print"is.%{home}
1212 poke49349,1:goto400
1220 print"ar{home}":gosub800:print"fulgar, my{home}":sys5681:print"master, has{home}
1221 sys5681:print"told me to{home}":sys5681:print"seek the one{home}
1222 sys5681:print"who comes from{home}":sys5681:print"another world.{home}
1223 sys5681:print"are you that{home}":sys5681:print"one, perhaps?";:gosub970:ifu$="n"goto1170
1224 sys5681:print"my master would{home}":sys5681:print"like to talk{home}
1225 sys5681:print"to you. i think{home}":sys5681:print"he has a{home}
1226 sys5681:print"rewarding{home}":sys5681:print"task for{home}
1227 sys5681:print"you. are you{home}":sys5681:print"interested?";:gosub970:ifu$="n"goto1170
1228 sys5681:print"go to fulgar's{home}":sys5681:print"castle. it lies{home}
1229 sys5681:print"in the fire{home}":sys5681:print"mountains far{home}
1230 sys5681:print"to the northeast{home}":gosub960:print"you can reach{home}
1231 sys5681:print"it only if you{home}":sys5681:print"land by ship{home}
1232 sys5681:print"south-east of{home}":sys5681:print"the great{home}
1233 sys5681:print"cliffs in the{home}":sys5681:print"bay of the{home}
1234 sys5681:print"thousand{home}":sys5681:print"reefs.{home}
1235 gosub960:print"then go through{home}":sys5681:print"the rock{home}
1236 sys5681:print"labyrinth until{home}":sys5681:print"you find his{home}
1237 sys5681:print"castle. he will{home}":sys5681:print"explain
1238 sys5681:print"everything.%{home}":goto400
1300 print"ior{home}":gosub800:print"i was a member{home}":sys5681:print"of an{home}
1301 sys5681:print"elite troop.%{home}":goto400
1310 print"e troop{home}":gosub800:print"the troop{home}":sys5681:print"no longer{home}
1311 sys5681:print"exists.{home}":gosub960:print"the king had{home}":sys5681:print"sent us to{home}
1312 sys5681:print"slay the giant{home}":sys5681:print"wyrm.%{home}":goto400
1320 print"t wyrm{home}":gosub800:print"it was{home}
1321 sys5681:print"terrible. our{home}":sys5681:print"men had no{home}
1322 sys5681:print"chance against{home}":sys5681:print"the beast.
1323 gosub960:print"only the famous{home}":sys5681:print"magic armour{home}
1324 sys5681:print"would be strong{home}":sys5681:print"enough to resist{home}
1325 sys5681:print"its fire, and{home}":sys5681:print"only the famous{home}
1326 sys5681:print"spellwing{home}":sys5681:print"could{home}
1327 sys5681:print"pierce its{home}":sys5681:print"scaly{home}
1328 sys5681:print"hide.{home}":gosub960:print"sadly these{home}
1329 sys5681:print"weapons are just{home}":sys5681:print"a legend. so the{home}
1330 sys5681:print"fair{home}":sys5681:print"princess{home}
1332 sys5681:print"sheila will soon{home}":sys5681:print"be killed by{home}
1333 sys5681:print"the dragon.%{home}":goto400
1340 print" ":gosub800:print"ask the king{home}":sys5681:print"himself.%{home}":goto400
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
2122 sys5681:print"{lgrn}here you are!{home}":sys5681:j=peek(49336+k)+zz:ifj>99thenj=99
2123 poke49336+k,j:gosub9004:sys5681:print"{lgrn}you now have":sys5681:printmid$(str$(j),2);
2124 print" unit.";:ifj>1thenprint"{left}s.{home}
2125 sys5681:print"another one?";:goto2120
2200 print"pipe":gosub800:ifpeek(49260)thenprint"you have one.%{home}":goto400
2210 print"but that is{home}":sys5681:print"forbidden.%{home}":sys5681
2220 print"{yel}he whispers:{home}":sys5681:print"{lgrn}%";:z=500:gosub9000:poke49260,1
2230 sys5681:print"{lgrn}here, but don't{home}":sys5681:print"tell anyone.%{home}":goto400
3000 print"rd{home}":gosub800:print"well, actually{home}":sys5681:print"i'm still{home}
3001 sys5681:print"an adept.%{home}":goto400
3010 print"t{home}":gosub800:print"i'm practising{home}":sys5681:print"the poison &{home}
3011 sys5681:print"gall spell.%{home}":goto400
3020 print"on & gall{home}":gosub800:print"a forbidden but{home}":sys5681:print"useful{home}
3021 sys5681:print"combat spell.{home}":sys5681:print"do you know{home}":sys5681:print"it?";:gosub970
3022 ifu$="y"thenprint"good for you.%{home}":goto400
3024 print"go to the{home}":sys5681:print"black{home}":sys5681:print"circle.%{home}":goto400
3030 print"et{home}":gosub800:print"go to the{home}":sys5681:print"peep show. if{home}
3031 sys5681:print"you use the{home}":sys5681:print"rightmost{home}
3032 sys5681:print"hatch, you'll{home}":sys5681:print"see the tablet.%{home}":goto400
3100 print"d{home}":gosub800:print"we druids{home}":sys5681:print"want to{home}
3101 sys5681:print"help you.%{home}":goto400
3110 print"{home}":gosub800:print"ask what you{home}":sys5681:print"want to know.%{home}":goto400
3120 print"et{home}":gosub800:print"you'll find the{home}":sys5681:print"first tablet{home}
3121 sys5681:print"in gaht.%{home}":goto400
3130 print"...":gosub800:print"cerfax can tell{home}":sys5681:print"you more about{home}
3131 sys5681:print"that than i.%{home}":goto400
3200 print"search";:fori=1to5:print".";:forj=.to400:nextj,i
3201 sys5681:print"{yel}you find{home}":sys5681:print"nothing.{home}":goto100
3300 print"{left}  {home}":sys5681:print"{yel}do you want to{home}":sys5681:print"leave mubrak{home}
3301 sys5681:print"now?";:gosub970:ifu$="n"theny=y-1:goto100
3302 goto6000
4000 print"pier{home}":gosub800:print"i run the{home}":sys5681:print"game here.%{home}":goto400
4010 print"{home}":gosub800:print"we play the{home}":sys5681:print"game 'devil'.{home}
4011 sys5681:print"do you know{home}":sys5681:print"the rules?";:gosub970:ifu$="y"goto4100
4012 print"the rules are{home}":sys5681:print"actually quite{home}":sys5681:print"simple:{home}":gosub960
4013 print"we play with{home}":sys5681:print"cards worth{home}
4014 sys5681:print"between one{home}":sys5681:print"and seven{home}
4015 sys5681:print"points{home}":sys5681:print"each.{home}
4016 gosub960:print"you get two{home}":sys5681:print"cards at the{home}
4017 sys5681:print"start and may{home}":sys5681:print"take up to four{home}
4018 sys5681:print"more if you{home}":sys5681:print"wish.{home}
4019 gosub960:print"the aim of the{home}":sys5681:print"game is to reach{home}
4020 sys5681:print"thirteen{home}":sys5681:print"points (a satan){home}":sys5681:print"or to get as{home}
4021 sys5681:print"close as{home}":sys5681:print"possible to{home}
4022 sys5681:print"thirteen.{home}":gosub960:print"if you reach{home}
4023 sys5681:print"thirteen with{home}":sys5681:print"your first two{home}
4024 sys5681:print"cards, you have{home}":sys5681:print"a 'devil' and{home}
4025 sys5681:print"win{home}":sys5681:print"immediately.{home}
4026 gosub960:print"but if you go{home}":sys5681:print"over thirteen{home}
4027 sys5681:print"points, it's{home}":sys5681:print"'bust, devil',{home}
4028 sys5681:print"and the game{home}":sys5681:print"is{home}
4029 sys5681:print"lost.{home}":gosub960:print"the player goes{home}
4030 sys5681:print"first, then me.{home}":sys5681:print"on a{home}
4031 sys5681:print"tie i win.{home}":sys5681:print"in return you{home}
4032 sys5681:print"have the{home}":sys5681:print"'devil'.{home}
4033 gosub960:print"did you get{home}":sys5681:print"all that?";:gosub970:ifu$="n"goto4013
4100 sys5681:print"fancy a{home}":sys5681:print"little{home}":sys5681:print"game?";
4110 gosub970:ifu$="n"goto888
4120 print"how much will{home}":sys5681:print"you bet? {blu}00{left}{left}{wht}";
4122 getu$:ifu$<"0"oru$>"9"goto4122
4124 e=val(u$)*10:printu$;
4126 getu$:ifu$<"0"oru$>"9"goto4126
4128 e=e+val(u$):printu$"{lgrn}{home}":ife<5goto1012
4129 z=e:ife>gpthensys5681:print"you don't own it{home}":sys5681:goto4100
4130 gosub9004:fori=0to9:sys5681:next:printd$spc(24)"{lgrn}shuffling...{home}
4140 fori=77to99:sys6041:pokes+5,5:pokes+1,i:pokes+4,129:forj=0to9:nextj,i
4150 printd$spc(25)"{yel}{up}{left}you:"d$spc(28)"{lgrn}dealing..{home}
4160 z=.:p=.:k=.:fori=1to2:gosub5000:next
4170 ifp>13goto4400
4180 ifp=13andk=2goto4500
4190 ifp=13ork=6goto4300
4200 printd$spc(24)"{lgrn}another? {wht}G{left}";
4210 getu$:ifu$<>"j"andu$<>"n"goto4210
4220 printu$;:ifu$="y"thengosub5000:goto4170
4300 printd$spc(24)"{yel}me:         {home}":n=p:z=1:k=.:p=.:fori=1to2:gosub5000:next
4310 ifp>13thensys5681:goto4500
4320 ifp<nandk<6thengosub5000:goto4310
4330 sys5681:ifp<ngoto4500
4400 printd$spc(24)"{lred}you have    {home}":sys5681:print"lost!{home}
4405 poke56295,1:poke2023,71:poke198,0:wait198,1:poke198,0:poke2023,32
4410 sys5681:sys5681:print"your"e"gold{home}":sys5681:print"pieces are gone!{home}
4420 sys5681:sys5681:print"{lgrn}play again?";:gosub970:ifu$="n"goto888
4430 goto4120
4500 e=e+e:printd$spc(24)"{lgrn}you have    {home}":sys5681:print"won!{home}
4505 poke56295,1:poke2023,71:poke198,0:wait198,1:poke198,0:poke2023,32
4510 sys5681:sys5681:print"you receive"e;:sys5681:print"gold pieces.{home}
4520 z=-e:gosub9004:goto4420
4999 end
5000 printleft$(d$,15+z+z)spc(25-z+k+k)"{gry3}{$b0}";:ifkthenprint"{left}X";
5010 print"{$c0}{$c0}{$c0}{$ae}{down}{left}{left}{left}{left}{left}";:forj=1to4:print"#{lblu};;;{gry3}#{down}{left}{left}{left}{left}{left}";:next:print"{$ad}";:ifkthenprint"{left}Y";
5020 print"{$c0}{$c0}{$c0}{$bd}{up}{up}{up}{up}{left}{left}{left}{left}";:sys6041:pokes+5,7:pokes+1,99:pokes+4,129:forj=0to250:next
5030 l=int(7*rnd(ti)+1):u$=mid$(str$(l),2)
5040 print"{wht}"u$" "u$"{down}{left}{left}{left}"mid$("{cyn}{pur}{grn}{yel}{orng}{lred}{lgrn}{lblu}",rnd(ti)*8+1,1);
5050 print"={rvon}5%{down}{left}{left}{left}{rvof}{$a2}{$ba}{rvon}&{rvof}{down}{left}{left}{left}{wht}"u$" "u$:p=p+l:k=k+1
5060 sys6041:pokes+5,5:pokes+1,66:pokes+4,129
5070 printleft$(d$,23+z)spc(28)"{yel}"p;:ifp=13thenprint"{left}, satan!";:ifk=2thenprint"{left}{left}{left}{left}{left}{left}devil! {home}
5080 ifp>13thenfori=.to800:next:print"{left}{left}{left}{left}{left}{left}{left}{left}  you're bust! {home}
5090 return
5999 end
6000 sys5681:print"{lred}you leave{home}":sys5681:print"the town.{home}
6010 fori=0to999:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
6020 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:poke2,0:new
6100 sys6041:pokes+5,16:pokes+1,12:pokes+4,129:goto100
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
11000 poke51208,12:poke51223,15:poke51211,2:poke51221,1:poke51209,15
11001 poke51228,8:poke51219,1:poke51217,8:poke52232,82:poke51976,82:poke51307,1
11002 poke52233,86:poke51977,86:poke52263,128:poke52007,127:poke51751,43
11003 poke51495,42:fori=0to3:poke51502+256*i,59:poke51488+256*i,59:poke650,255
11004 poke51544+256*i,184-(i>1):next:poke52340,217:poke51828,245:poke51225,1
11005 fori=.to3:poke51487+256*i,90+i:poke51499+256*i,226+i+144*(i>1):next
11006 poke51486,124:poke51742,126:d$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}":return
50000 dataknife,dagger,short sword,hand axe,sword,morning star,quarterstaff
50001 databastard sword,battle axe,greatsword,sling,short bow,,long bow
50002 datacrossbow,,,,clothes,gambeson,leather armour,chain mail,scale mail
50003 dataplate armour,magic armour,small shield,large shield
50100 data-35,6600,11,17,1,6720,3,17,35,6853,11,21,-1,6968,3,21
