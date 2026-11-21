1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454
2 poke51209,15:poke51211,2:poke51206,10:poke51221,1:poke51230,7
3 poke51219,1:poke51224,1:poke51225,1:poke51223,7:poke51208,12:poke650,255
4 dimr$(21):fori=2to21:readr$(i):next:poke51468,59:poke51724,98:poke51980,36
5 poke52236,61:poke51469,60:poke51725,119:poke51981,127:poke52237,123
6 dima(3),p(3):fori=0to3:reada(i),p(i):next:goto20
7 fori=0to3:j=int(4*rnd(ti)):k=p(i)+a(j):ifpeek(k)=11thenpokep(i),11:p(i)=k:pokep(i),21
9 next:return
20 print"{home}{down}{down}"spc(24)"{lgrn}vital.:   (   )":printspc(24)"{up}{cyn}astral:   (   )
21 printspc(24)"{lred}ang.:   {grn}ver.:":printspc(24)"{up}{pur}str.:   {yel}ges.:
22 printspc(24)"{gry3}klg.:   {lblu}cha.:":printspc(24)"{up}{lgrn}erf.:      (  )
23 printspc(24)"{yel}goldstck.:":printspc(24)"{up}{orng}nahr.vorrat:
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
128 ifu$="k"goto240
129 ifu$="w"thenprint"waffe{home}":goto191
130 ifu$="r"thenprint"rüstung{home}":goto191
131 ifu$="i"thenprint"inventur{home}":goto191
190 print"wie bitte..?{home}":goto100
191 sys5681:print"{yel}mach das{home}":sys5681:print"draussen!{home}":goto100
200 print"warten...{home}":goto100
210 print"norden{home}":j=peek(881):ifj<3orj=5orj=9orj>11goto214
212 pokep,q:q=j:p=p-35:y=y-1:goto6100
214 sys5681:print"{lred}blockiert!{home}":sys5681:goto100
220 print"süden{home}":j=peek(903):ifj<3orj=5orj=9orj>11goto214
222 pokep,q:q=j:p=p+35:y=y+1:goto6100
230 print"westen{home}":j=peek(891):ifj<3orj=5orj=9orj>11goto214
232 pokep,q:q=j:p=p-1:x=x-1:goto6100
234 print"osten{home}":j=peek(893):ifj<3orj=5orj=9orj>11goto214
236 pokep,q:q=j:p=p+1:x=x+1:goto6100
240 print"kommuniziere";:sys5681:print"{yel} - richt.? {wht}G{left}";:z=0
250 z=z+1:ifz>499goto258
252 getu$:ifu$=""goto252
254 ifu$="{up}"thenprint"nord{home}":j=-11:goto260
255 ifu$="{down}"thenprint"süd{home}":j=11:goto260
256 ifu$="{left}"thenprint"west{home}":j=-1:goto260
257 ifu$="{rght}"thenprint"ost{home}":j=1:goto260
258 print"nein{home}":sys5681:z=0:goto100
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
279 ifh=.thenprint"{lred}keine antwort!{home}":sys5681:goto100
280 sys5681:print"{cyn}du sprichst{home}":sys5681:ifh=1thenprint"eine wache ";
281 ifh=2thenprint"den schatz-{home}":sys5681:print"wächter ";
282 ifh=3thenprint"einen priester{home}":sys5681
283 ifh=4thenprint"einen heiler{home}":sys5681
284 ifh=5thenprint"einen koch ";
285 ifh=6thenprint"einen zeichner{home}":sys5681
286 ifh=7thenprint"einen kämpfer{home}":sys5681
287 ifh=8thenprint"den henker{home}":sys5681
288 ifh=9thenprint"einen älteren{home}";:sys5681:print"mann ";
289 ifh=12thenprint"den könig ";
290 ifh=11thenprint"einen offizier":sys5681
291 ifh=14thenprint"die königin{home}":sys5681
292 ifh=13thenprint"einen mann in{home}":sys5681:print"einem blauen na-{home}
293 ifh=13thensys5681:print"delstreifenanzug{home}":sys5681
294 ifh=10thenprint"einen barden{home}":sys5681
295 ifh=15thenprint"eine junge{home}":sys5681:print"magd ";
296 ifh=16thenprint"einen gaukler{home}":sys5681
297 print"an.{home}":ifh=12goto1200
298 ifh=13orrnd(ti)<.5goto400
299 goto820
400 gosub900:ifrnd(ti)<.05thenprint" {home}":goto880
401 ifh=1andn$="waec"goto1000
402 ifh=2andn$="scha"goto1010
403 ifn$="gold"goto1016
404 ifh=3andn$="prie"goto1020
405 ifh=3andn$="gott"goto1022
406 ifh=4andn$="heil"goto1030
407 ifh=4andn$="entg"goto1032
408 ifh=4andn$="rege"goto1038
409 ifh=5andn$="esse"goto1040
410 ifh=6andn$="geog"goto1050
411 ifh=6andn$="kart"goto1051
412 ifh=7andn$="schw"goto1070
413 ifn$="name"thenprint"?{home}":goto820
414 ifn$="beru"goto860
415 ifn$="fick"orn$="piss"ormid$(n$,2)="otz"orn$="arsc"orn$="porn"goto449
416 ifh=7andn$="trai"goto1072
417 ifh=7andn$="angr"goto1084
418 ifh=7andn$="vert"goto1086
419 ifh=8andn$="henk"goto1090
420 ifn$="wied"thenprint"ersehen.{home}":goto880
421 ifn$="gesu"thenprint"ndheit?{home}":goto840
422 ifh=9andn$="haus"goto1100
423 ifh=12andn$="koen"goto1110
424 ifh=12andn$="land"goto1111
425 ifh=12andn$="toch"andpeek(49358)=.goto1113
426 ifh=12andn$="abko"andpeek(49358)=.goto1115
427 ifh=11andn$="sher"goto1131
428 ifh=11andn$="verb"goto1132
429 ifh=11andn$="mubr"goto1135
430 ifh=14andn$="verz"andpeek(49358)=.goto1142
431 ifh=14andn$="toch"andpeek(49358)=.goto1144
432 ifh=14andn$="lott"andpeek(49358)=.goto1146
433 ifh=14andn$="lind"andpeek(49358)=.goto1152
434 ifh=14andn$="abko"andpeek(49358)=.goto1154
435 ifh=13andn$="kanz"goto1160
436 ifh=13andn$="kohl"goto1163
437 ifh=10andn$="psst"goto1230
438 ifh=15andn$="magd"goto1240
439 ifh=10and(n$="helf"orn$="hilf")goto1250
440 ifh=12andn$="mubr"goto2000
441 ifh=6andn$="uyrp"goto3000
442 ifh=16andn$="hofn"goto2100
443 ifh=16andn$="witz"goto2110
445 print" {home}":gosub800:print"dazu kann{home}":sys5681:print"ich dir nichts{home}":sys5681
446 print"sagen.%{home}
448 goto400
449 print" {home}":gosub800:print"du bist ein{home}":sys5681:print"altes ferkel!%{home}":goto400
800 gosub999:print"{yel}der ";:ifh>13andh<16thenprint"{left}{left}{left}ie ";
801 ifh=1thenprint"wächter{home}
802 ifh=2thenprint"schatz-{home}":sys5681:print"wächter{home}
803 ifh=3thenprint"priester{home}
804 ifh=4thenprint"heiler{home}
805 ifh=5thenprint"koch{home}
806 ifh=6thenprint"zeichner{home}
807 ifh=7thenprint"krieger{home}
808 ifh=8thenprint"henker{home}
809 ifh=9thenprint"alte mann{home}
810 ifh=12thenprint"könig{home}
811 ifh=11thenprint"offizier{home}
812 ifh=14thenprint"{left}{left}{left}die königin{home}
813 ifh=13thenprint"mann{home}
814 ifh=10thenprint"barde{home}
815 ifh=15thenprint"magd{home}
816 ifh=16thenprint"gaukler{home}
819 sys5681:print"sagt:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"ich bin ";:ifh=1thenprint"ein{home}":sys5681:print"wächter";
821 ifh=2thenprint"der{home}":sys5681:print"schatzwächter";
822 ifh=3thenprint"pater{home}":sys5681:print"antonius";
823 ifh=4thensys5681:print"hypochondrius";
824 ifh=5thensys5681:print"corollus";
825 ifh=6thensys5681:print"theodorus";
826 ifh=7thensys5681:print"ator";
827 ifh=8thenprint"vultan,{home}":sys5681:print"aber man nennt{home}
828 ifh=8thensys5681:print"mich meist nur{home}":sys5681:print"'die axt'";
829 ifh=9thensys5681:print"haflar";
830 ifh=12thensys5681:print"casiodorus rex";
831 ifh=11thensys5681:print"torquill";
832 ifh=14thensys5681:print"thea";
833 ifh=13thenprint"helmut,{home}":sys5681:print"aber alle nennen{home}
834 ifh=13thensys5681:print"mich 'birne'";
835 ifh=10thensys5681:print"dakteon";
836 ifh=15thensys5681:print"gunli";
837 ifh=16thensys5681:print"harlekin";
839 print".%{home}":goto400
840 gosub800:ifh=1thenprint"sehr gut,{home}":sys5681:print"danke";
841 ifh=2thenprint"ich fühle mich{home}":sys5681:print"grossartig";
842 ifh=3thenprint"ich bin total";:sys5681:print"besoffen vom";:sys5681:print"messwein";
843 ifh=4thenprint"ich fühle mich{home}":sys5681:print"natürlich wohl";
844 ifh=5thenprint"bisschen heiss{home}":sys5681:print"ist's hier";
845 ifh=6thenprint"ich bin etwas{home}":sys5681:print"im stress";
846 ifh=7orh=16thenprint"ausgezeichnet";
847 ifh=8thenprint"ich bin immer{home}":sys5681:print"blutgierig";
848 ifh=9thenprint"ich bin er-{home}":sys5681:print"kältet";
849 ifh=12thenprint"mir geht es{home}":sys5681:print"zwar gut, aber{home}
850 ifh=12thensys5681:print"mein land ist{home}":sys5681:print"krank";
851 ifh=11thenprint"geht so, danke{home}":sys5681:print"der nachfrage";
852 ifh=14andpeek(49358)=.thenprint"ich bin ver-{home}":sys5681:print"zweifelt";:goto839
853 ifh=13thenprint"gut - bis zur{home}":sys5681:print"nächsten wahl";
854 ifh=10thenprint"psst";
855 ifh=15orh=14thenprint"gut, danke";
859 goto839
860 print"f?{home}":ifh<3goto820
861 gosub800
862 ifh=3thenprint"ich bin der";:sys5681:print"priester dieses";:sys5681:print"schlosses";
863 ifh=4thenprint"heilen ist mein{home}":sys5681:print"beruf";
864 ifh=5thenprint"ich mache hier{home}":sys5681:print"das essen";
865 ifh=6thenprint"ich bin ein{home}":sys5681:print"geograph";
866 ifh=7thenprint"ich bin der{home}":sys5681:print"schwertmeister";
867 ifh=8thenprint"rate mal. man{home}":sys5681:print"sieht doch, dass{home}":sys5681:gosub899
868 ifh=9thenprint"ich bin der{home}":sys5681:print"haushofmeister{home}":sys5681:print"des königs";
869 ifh=12thenprint"ich bin der{home}":sys5681:print"könig dieses{home}":sys5681:print"landes";
870 ifh=11thenprint"ich bin des{home}":sys5681:print"königs sheriff";
871 ifh=14thenprint"ich bin die{home}":sys5681:print"frau des{home}":sys5681:print"königs";
872 ifh=13thenprint"ich bin der{home}":sys5681:print"kanzler in{home}
873 ifh=13thensys5681:print"dieser unserer{home}":sys5681:print"dimension";
874 ifh=10thenprint"psst";
875 ifh=15thenprint"ich bin nur{home}":sys5681:print"eine magd";
876 ifh=16thenprint"ich hier der{home}":sys5681:print"hofnarr";
879 goto839
880 gosub800:ifh=1thenprint"ich muss weiter{home}":sys5681:print"wache schieben";
881 ifh=3thenprint"ich werde für{home}":sys5681:print"dich beten";
882 ifh=4thenprint"halte dich{home}":sys5681:print"immer gesund";
883 ifh=5thenprint"guten appetit";
884 ifh=6thenprint"gute reise";
885 ifh=7thenprint"sei tapfer";
886 ifh=8thenprint"tschüss. viel-{home}":sys5681:print"leicht treffen
887 ifh=2thenprint"ich beobachte{home}":sys5681:print"dich genau";
888 ifh=8thensys5681:print"wir uns mal{home}":sys5681:print"beruflich";
889 ifh=9thenprint"gehst du jetzt":sys5681:print"endlich";
890 ifh=12thenprint"rette unsere{home}":sys5681:print"welt";
891 ifh=11thenprint"zahle pünktlich{home}":sys5681:print"deine steuern";
892 ifh=14andpeek(49358)=.thenprint"rette unsere{home}":sys5681:print"tochter";:goto897
893 ifh=13thenprint"'swar mir eine{home}":sys5681:print"freude, dich{home}":sys5681:print"kennenzulernen";
894 ifh=10thenprint"ich singe{home}":sys5681:print"jetzt weiter";
895 ifh=15orh=14thenprint"lebe wohl";
896 ifh=16thenprint"viel spass{home}":sys5681:print"noch, haha";
897 print".%{home}":sys5681:sys5681:print"{yel}er";:ifh>13andh<16thenprint"{left}{left}sie";
898 print" wendet sich{home}":sys5681:print"ab.{home}":sys5681:goto100
899 print"ich henker bin";:return
900 gosub999:print"{yel}dein begehr?";:sys5681:print"{wht}@G{left}";:z=0:n$="":poke198,0
910 getu$:ifu$=chr$(13)andz=0thenn$="wied":printn$;:return
912 ifu$=chr$(20)andz>0thenz=z-1:n$=left$(n$,z):print" {left}{left}G{left}";
920 ifu$<"a"oru$>"z"goto910
930 printu$"G{left}";:n$=n$+u$:z=z+1:ifz=4thenreturn
940 goto910
960 sys5681:printspc(15)"{wht}G{left}{lgrn}";:poke198,0:wait198,1:print" {home}":sys5681:return
970 print" {wht}G{left}";:poke198,0
971 getu$:ifu$="j"oru$="n"thenprintu$"{lgrn}{home}":gosub999:return
972 goto971
999 sys5681:sys5681:return
1000 print"hter{home}":gosub800:print"ich bewache das{home}":sys5681:print"schloss und den{home}
1001 sys5681:print"könig. willst du{home}":sys5681:print"eine audienz?";:gosub970
1002 ifu$="n"thenprint"es ist auch{home}":sys5681:print"nicht gut, den{home}
1003 ifu$="n"thensys5681:print"könig zu{home}":sys5681:print"stören.%{home}":goto400
1004 print"der könig wird{home}":sys5681:print"dich im thron-{home}
1005 sys5681:print"saal empfangen.%{home}":goto400
1010 print"tz{home}":gosub800:print"ich bewache das{home}":sys5681:print"gold des königs.{home}
1011 sys5681:print"willst du hier{home}":sys5681:print"etwa stehlen?";:gosub970:ifu$="j"goto1013
1012 print"das will ich dir{home}":sys5681:print"auch nicht{home}":sys5681:print"raten!%{home}":goto400
1013 print"sieh dich vor!{home}":sys5681:print"für leute wie{home}
1014 sys5681:print"dich ist hier{home}":sys5681:print"der herr hinter{home}
1015 sys5681:print"dir zuständig.%{home}":goto400
1016 print" {home}":gosub800:print"ja, gold hätte{home}";:sys5681:print"ich auch gern!%{home}":goto400
1020 print"ster{home}":gosub800:print"ich bin ein{home}":sys5681:print"mann gottes.{home}":goto400
1022 print" {home}":gosub800:print"glaubst du an{home}":sys5681:print"gott?";:gosub970:ifu$="n"goto1024
1023 print"dann knie nieder{home}":sys5681:print"und bete!{home}":goto400
1024 print"ich auch nicht,{home}":sys5681:print"aber von irgend-{home}
1025 sys5681:print"etwas muss man{home}":sys5681:print"ja leben.%{home}":goto400
1030 print"en{home}";:gosub800:print"ich kann dich{home}":sys5681:print"entgiften oder{home}":sys5681
1031 print"regenerieren.{home}":sys5681:print"was möchtest{home}":sys5681:print"du?%{home}":goto400
1032 print"iften{home}";:gosub800:z=4*peek(49245)-ch:ifz<2thenz=2
1033 gosub9000:poke49245,0:z=5
1034 pokes+5,201:pokes+12,201:pokes+11,129:pokes+4,17:k=5
1035 fori=5to255step5:pokes+1,i:pokes+8,i:k=z-k:poke53281,k:poke53280,k:next
1036 poke53281,0:poke53280,0:pokes+11,0:pokes+4,0:sys5681:ifh=12thengosub10000:goto400
1037 print"nun bist du{home}":sys5681:print"geheilt.%{home}":gosub10000:goto400
1038 print"nerieren{home}";:gosub800:z=80-4*(ch-su):ifz<10thenz=10
1039 gosub9000:poke49230,peek(49232):poke49231,peek(49233):z=18:goto1034
1040 print"n{home}":gosub800:print"ich koche sehr{home}";:sys5681:print"gut. willst du{home}
1041 sys5681:print"ein lunchpaket{home}":sys5681:print"mit 25 luxuspor-{home}
1042 sys5681:print"tionen kaufen?";
1043 gosub970:ifu$="n"thenprint"wie du willst.%{home}":goto400
1044 z=45-ch:gosub9000:na=na+25:ifna>250thenna=250
1045 poke49244,na:gosub10000:sys5681:print"{lgrn}noch eins?";:goto1043
1050 print"raph{home}":gosub800:print"ich zeichne{home}":sys5681:print"karten.%{home}":goto400
1051 print"en{home}":gosub800:print"möchtest du{home}":sys5681:print"genaue karten{home}":sys5681
1052 print"dieses landes{home}";:sys5681:print"und pläne der{home}":sys5681:print"gebäude, städte,{home}
1053 sys5681:print"labyrinthe etc.{home}":sys5681:print"kaufen?";:gosub970:ifu$="j"goto1056
1054 print"na gut, wenn du{home}":sys5681:print"dich auch so{home}
1055 sys5681:print"zurechtfindest.%{home}":goto400
1056 print"leider habe ich{home}":sys5681:print"im augenblick{home}
1057 sys5681:print"keine fertig.{home}":sys5681:print"möchtest du{home}
1058 sys5681:print"trotzdem welche{home}":sys5681:print"kaufen?";:gosub970:ifu$="n"goto1054
1060 print"dann schick doch{home}":sys5681:print"20,- dm (schein{home}":sys5681:print"oder scheck){home}
1061 sys5681:print"an den autor:{home}":gosub960:sys5681:print"{wht}german design{home}
1062 sys5681:print"    group{home}":sys5681:sys5681:print"r. rinscheidt{home}
1063 sys5681:print"stichwort:{home}":sys5681:print"d.d.d. - karten{home}":sys5681:print"buchholzstr. 17{home}
1064 sys5681:print"4755 holzwickede{home}":sys5681:print"west-germany{home}
1065 gosub960:print"du bekommst dann{home}":sys5681:print"sehr schönes{home}
1066 sys5681:print"kartenmaterial{home}":sys5681:print"und lösungstips.{home}":goto400
1070 print"ertmeister?{home}":gosub800:print"ich kann dich{home}":sys5681:print"im kampf
1071 sys5681:print"trainieren.%{home}":goto400
1072 print"nieren{home}":gosub800:ifpeek(49344)goto1075
1073 print"dazu musst du{home}":sys5681:print"erst noch etwas{home}
1074 sys5681:print"erfahrener{home}":sys5681:print"werden.%{home}":goto400
1075 print"gut. willst du{home}":sys5681:print"deinen angriff{home}":sys5681
1076 print"oder die vertei-{home}":sys5681:print"digung verbes-%{home}":sys5681:print"sern?{home}":goto400
1077 j=peek(49228):ifj<18thenpoke49228,j+1:goto1079
1078 print"da kann ich dir{home}":sys5681:print"nichts mehr{home}":sys5681:print"beibringen.%{home}":goto400
1079 poke49344,peek(49344)-1:print"okay, lass uns{home}":sys5681:print"kämpfen!%{home}
1080 fori=0to9:poke53280,10:sys6041:pokes+5,8:pokes+1,50+30*rnd(ti)
1081 pokes+4,17:poke53280,0:k=60+200*rnd(ti):forj=0tok:nextj,i:gosub10000:goto400
1082 j=peek(49229):ifj=18goto1078
1083 poke49229,j+1:goto1079
1084 print"iff{home}":gosub800:ifat=18orpeek(49344)>.goto1077
1085 goto1073
1086 print"eidigung{home}":gosub800:ifpa=17orpeek(49344)>.goto1082
1087 goto1073
1090 print"er{home}":gosub800:print"ich bin henker{home}":sys5681:print"und folterknecht{home}
1091 sys5681:print"des königs.{home}":gosub960:print"warst du schon{home}
1092 sys5681:print"einmal bei einer{home}":sys5681:print"hinrichtung{home}":sys5681:print"dabei?";
1093 gosub970:ifu$="j"thenprint"lustig, nicht?{home}":sys5681:print"köpfen gefällt{home}
1094 ifu$="j"thensys5681:print"mir am besten.%{home}":goto400
1095 print"dann bleib mal{home}":sys5681:print"noch 'ne weile{home}":sys5681:print"hier. der typ{home}
1096 sys5681:print"hier in der{home}":sys5681:print"zelle wird bald{home}":sys5681:print"geköpft.%{home}
1097 goto400
1100 print"hofmeister{home}":gosub800:print"ich verwalte{home}":sys5681:print"das schloss.{home}
1101 gosub960:print"dies hier sind{home}":sys5681:print"die königlichen{home}
1102 sys5681:print"gemächer. hier{home}":sys5681:print"darf niemand{home}
1103 sys5681:print"herein. du gehst{home}":sys5681:print"jetzt besser,{home}
1104 sys5681:print"bevor die wachen{home}":sys5681:print"dich sehen.%{home}":goto400
1110 print"ig{home}":gosub800:print"ich regiere{home}":sys5681:print"dieses land.%{home}":goto400
1111 print" {home}":gosub800:print"mein land wird":sys5681:print"von einer fins-{home}
1112 sys5681:print"teren macht be-":sys5681:print"droht.%{home}":goto400
1113 print"ter{home}":gosub800:print"oh, dieses{home}":sys5681:print"verfluchte{home}
1114 sys5681:print"abkommen!%{home}":goto400
1115 print"mmen{home}":gosub800:print"zweimal im{home}":sys5681:print"jahr, immer zur{home}
1116 sys5681:print"sonnenwende, be-{home}":sys5681:print"kommt der drache{home}
1117 sys5681:print"hunger auf men-{home}":sys5681:print"schenfleisch.{home}
1118 gosub960:print"wir haben daher{home}":sys5681:print"mit ihm ein ab-{home}
1119 sys5681:print"kommen getrof-{home}":sys5681:print"fen: als gegen-{home}
1120 sys5681:print"leistung dafür,{home}":sys5681:print"dass er unsere{home}
1121 sys5681:print"städte ver-{home}":sys5681:print"schont, müssen{home}
1122 sys5681:print"wir ihm dann{home}":sys5681:print"eine jungfrau{home}":sys5681:print"darbringen.{home}
1123 gosub960:print"welche es ist,{home}":sys5681:print"wird durch los{home}
1124 sys5681:print"bestimmt. dies-{home}":sys5681:print"mal hat es meine{home}
1125 sys5681:print"einzige tochter{home}":sys5681:print"getroffen.{home}
1126 gosub960:print"ich bitte dich,{home}":sys5681:print"töte den lind-{home}
1127 sys5681:print"wurm, wenn du{home}":sys5681:print"kannst. aber{home}
1128 sys5681:print"versage nicht,{home}":sys5681:print"denn sonst wird{home}
1129 sys5681:print"das untier{home}":sys5681:print"fürchterliche{home}
1130 sys5681:print"rache nehmen.%{home}":goto400
1131 print"iff{home}":gosub800:print"ich jage{home}":sys5681:print"verbrecher.%{home}":goto400
1132 print"recher{home}":gosub800:print"zum beispiel{home}":sys5681:print"sucht der könig{home}
1133 sys5681:print"schon lange die{home}":sys5681:print"diebesbande von{home}
1134 sys5681:print"mubrak.%{home}":goto400
1135 print"ak{home}":gosub800:print"warst du schon{home}":sys5681:print"einmal in{home}":sys5681:print"mubrak?";
1136 gosub970:ifu$="j"goto1139
1137 print"schade, der{home}";:sys5681:print"könig möchte{home}":sys5681:print"wissen, wo es{home}
1138 sys5681:print"liegt.%{home}":goto400
1139 print"sprich den könig{home}";:sys5681:print"auf mubrak an{home}":sys5681:print"und gib ihm die{home}
1140 sys5681:print"koordinaten. er{home}":sys5681:print"wird dich reich{home}
1141 sys5681:print"belohnen.%{home}":goto400
1142 print"weifelt{home}":gosub800:print"unsere tochter{home}":sys5681:print"wird bald{home}
1143 sys5681:print"sterben.%{home}":goto400
1144 print"ter{home}":gosub800:print"prinzessin{home}":sys5681:print"sheila. ihr los{home}
1145 sys5681:print"wurde bei der{home}":sys5681:print"lotterie gezo-{home}":sys5681:print"gen.%{home}":goto400
1146 print"erie{home}":gosub800:print"du bist wohl{home}":sys5681:print"fremd hier?";:gosub970
1147 ifu$="n"thenprint"dann müsstest du{home}":sys5681:print"wissen, was das{home}
1148 ifu$="n"thensys5681:print"bedeutet!%{home}":goto400
1150 print"in den bergen{home}":sys5681:print"der wüste 'öd'{home}":sys5681:print"im osten haust{home}
1151 sys5681:print"ein furchtbarer{home}":sys5681:print"lindwurm.%{home}":goto400
1152 print"wurm{home}":gosub800:print"wir mussten ein{home}":sys5681:print"schreckliches{home}
1153 sys5681:print"abkommen mit ihm{home}":sys5681:print"treffen.%{home}":goto400
1154 print"mmen{home}":gosub800:print"ich...% {yel}(weint){home}":sys5681:print"{lgrn}%...kann nicht.{home}
1155 sys5681:print"frag meinen mann{home}":sys5681:print"nach unserer{home}
1156 sys5681:print"tochter.%{home}":goto400
1160 print"ler{home}":gosub800:print"ich mache...{home}":gosub960:print"...ja, was mache{home}
1161 sys5681:print"ich eigentlich?{home}":gosub960:print"ich weiss{home}":sys5681:print"eigentlich nie{home}
1162 sys5681:print"so recht was{home}":sys5681:print"ich tue...%{home}":goto400
1163 print" ":gosub800:print"ja, so heisse{home}":sys5681:print"ich.%{home}":goto400
1200 gosub800:print"sei willkommen,{home}":sys5681:print"mein";
1201 ifpeek(49166)thenprint"e kriegerin.{home}":goto1203
1202 print" ritter.{home}
1203 sys5681:print"ich habe kunde{home}":sys5681:print"von deinen taten{home}
1204 sys5681:print"vernommen.{home}":gosub960:gosub7000:ifsu=21goto1220
1205 j=0:fori=1tosu:j=j+100*i:next:ifef<jgoto1222
1206 su=su+1:hm=54+45*su:poke49241,su:poke49344,peek(49344)+1
1207 poke49287,peek(49287)+2:j=j+100*su:ifsu<21andj<=efgoto1206
1208 print"ich hebe dich{home}":sys5681:print"auf stufe"su"an{home}
1209 sys5681:print"und verleihe dir{home}":sys5681:print"den rang eines{home}
1210 sys5681:printr$(su);:sys5681:print"meiner armee.%{home}
1211 poke49233,hm/256:poke49232,hm-256*peek(49233):z=19:goto1034
1220 print"geh nun und ver-{home}":sys5681:print"nichte das böse,{home}
1221 sys5681:print"das uns be-{home}":sys5681:print"droht.%{home}":goto400
1222 print"versuche, noch{home}":sys5681:print"erfahrener und{home}
1223 sys5681:print"besser zu{home}":sys5681:print"werden.%{home}":goto400
1230 print"?{home}":gosub800:print"ja, psst!{home}":sys5681:print"siehst du{home}
1231 sys5681:print"nicht, dass{home}":sys5681:print"ich spiele?%{home}":goto400
1240 print" {home}":gosub800:print"ich diene{home}":sys5681:print"meinem könig.{home}
1242 gosub960:print"bist du gekom-{home}":sys5681:print"men, um unsere{home}":sys5681:print"welt zu{home}
1243 sys5681:print"retten?";:gosub970:ifu$="n"thenprint"hilf uns!%{home}":goto400
1244 print"dakteon kann{home}":sys5681:print"dir vielleicht{home}":sys5681:print"einen tip geben.{home}
1245 sys5681:print"bitte ihn um{home}":sys5681:print"hilfe.%{home}":goto400
1250 print"e{home}":gosub800:print"der name des{home}":sys5681:print"bösen, den nie-{home}
1251 sys5681:print"mand aussprechen{home}":sys5681:print"darf, ohne zu{home}
1252 sys5681:print"verbrennen, ist{home}":sys5681:print"wichtig, wenn{home}
1253 sys5681:print"du das böse{home}":sys5681:print"vernichten{home}":sys5681:print"willst.{home}
1255 gosub960:print"die zauberer{home}":sys5681:print"der beiden
1256 sys5681:print"zirkel wissen{home}":sys5681:print"etwas darüber.{home}
1257 sys5681:print"frage sie nach{home}":sys5681:print"dem bösen.%{home}":goto400
2000 print"ak{home}":gosub800:ifpeek(49352)thenprint"mubrak wird{home}":sys5681:print"zerstört!%{home}":goto400
2001 print"mubrak? weisst{home}":sys5681:print"du etwa, wo{home}
2002 sys5681:print"dieses ratten-{home}":sys5681:print"nest liegt? ";:gosub970
2004 ifu$="n"thenprint"zu schade. ich{home}":sys5681:print"hätte es zu gern{home}
2006 ifu$="n"thensys5681:print"ausgelöscht.%{home}":goto400
2008 print"verrate mir die{home}":sys5681:print"koordinaten,{home}":sys5681:print"dann werde ich{home}
2010 sys5681:print"dich reich{home}":sys5681:print"belohnen:{home}
2012 sys5681:sys5681:print"{yel}( & '/ & '){left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{wht}";:n$=""
2014 gosub2900:gosub2900:print"{rght}";:gosub2900:gosub2900:sys5681:sys5681:print"{lgrn}";
2016 ifn$<>"biej"thenprint"unmöglich, meine{home}":sys5681:print"männer haben da{home}
2018 ifn$<>"biej"thensys5681:print"schon gesucht.%{home}":goto400
2020 print"sehr gut, ich{home}":sys5681:print"werde sofort{home}":sys5681:print"eine truppe ent-{home}
2022 sys5681:print"senden, die{home}":sys5681:print"diesen schand-{home}
2024 sys5681:print"fleck vernich-{home}":sys5681:print"tet.{home}":gosub960:print"zum dank ge-{home}
2026 sys5681:print"währe ich dir{home}":sys5681:print"2000 goldstücke{home}
2028 sys5681:print"belohnung.%{home}":poke49352,1:gp=gp+2e3:ifgp>5e4thengp=5e4
2030 z=.:gosub9004:goto400
2100 print"arr{home}":gosub800:print"ich mache hier{home}":sys5681:print"die witze.%{home}":goto400
2110 print"e{home}":gosub800:print"kennst du den{home}":sys5681:print"unterschied{home}
2112 sys5681:print"zwischen der{home}":sys5681:print"königin und ei-{home}
2114 sys5681:print"nem nilpferd?";:gosub970:ifu$="j"thenprint"oh...%{home}":goto400
2116 print"das nilpferd{home}":sys5681:print"badet öfter,{home}":sys5681:print"hahahaha!%{home}":goto400
2900 print"G{left}";
2910 getu$:ifu$<"a"oru$>"p"goto2910
2920 printu$"{rght}";:n$=n$+u$:return
3000 print" ":gosub800:print"die insel uyrp{home}":sys5681:print"liegt am südkap{home}":sys5681
3002 print"und hat die{home}":sys5681:print"koordinaten:{home}":sys5681:print"(d&m'/j&g').%{home}":goto400
3300 print"{left}  {home}":sys5681:print"{yel}möchtest du{home}":sys5681:print"das schloss{home}
3301 sys5681:print"verlassen?";:gosub970:ifu$="n"theny=y-1:goto100
6000 sys5681:print"{lred}du verlässt{home}":sys5681:print"das schloss.{home}
6010 fori=0to600:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
6020 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:poke2,0:new
6100 pokes+4,0:pokes+5,16:pokes+1,12:pokes+4,129:goto100
7000 ifpeek(49360)>.orpeek(49358)=.thenreturn
7010 print"du hast den{home}":sys5681:print"riesenlindwurm{home}
7012 sys5681:print"getötet und{home}":sys5681:print"meine tochter{home}
7014 sys5681:print"sheila gerettet.{home}":gosub960:print"zum dank dafür{home}
7015 sys5681:print"schenke ich dir{home}":sys5681:print"1ooo goldstücke.{home}
7020 z=-1e3:gosub9004:sys5681:print"{lgrn}";:poke49360,1:return
9000 print"das kostet dich{home}":sys5681:print"aber"z"gold-{home}":sys5681:print"stücke. willst{home}
9001 sys5681:print"du bezahlen?";:gosub970:ifu$="j"goto9003
9002 print"na, dann nicht.%{home}":goto400
9003 ifgp<zthenprint"du hast nicht{home}":sys5681:print"genug gold!%{home}":goto400
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
50000 datagefreiten,obergefreiten,hauptgefreiten,unteroffiziers,fahnenjunkers
50001 datastabsunteroffiz.,feldwebels,fähnrichs,oberfeldwebels,hauptfeldwebels
50002 dataoberfähnrichs,stabsfeldwebels,leutnants,oberleutnants,hauptmanns
50003 datamajors,oberstleutnants,oberst,generals,feldmarschalls
51000 data-35,6368,1,6601,35,6736,-1,6999
60000 fori=0to120:poke832+i,i:next:sys4361
