1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454:poke6794,3
2 poke650,255:poke51223,15:poke51221,1:poke51208,12:poke51209,15:poke51211,2
3 poke51217,8:poke51219,1:poke51206,8:poke51224,1:poke51228,8:poke51222,8
4 poke7243,90:poke7244,98:poke7245,99:poke7246,101:poke7247,100:poke7249,94
5 dimw$(26):fori=0to26:readw$(i):next
6 dima(3),p(3),q(3),h(3):fori=0to3:reada(i),p(i),q(i),h(i):next:goto20
7 fori=0to3:j=int(4*rnd(ti)):k=p(i)+a(j):z=peek(k):ifk=6144+x+35*ygoto9
8 ifz=3orz=8orz=11thenifk<7400thenpokep(i),q(i):p(i)=k:q(i)=z:pokep(i),h(i)
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
132 ifu$="s"goto3200
190 print"wie bitte..?{home}":goto100
191 sys5681:print"{yel}mach das{home}":sys5681:print"draussen!{home}":goto100
200 print"warten...{home}":goto100
210 print"norden{home}":j=peek(881):ifj<3orj=5orj=9or(j>11andj<>119andj<>120)goto214
212 pokep,q:q=j:p=p-35:y=y-1:goto6100
214 sys5681:print"{lred}blockiert!{home}":sys5681:goto100
220 print"süden{home}":j=peek(903):ifj<3orj=5orj=9or(j>11andj<>119andj<>120)goto214
222 pokep,q:q=j:p=p+35:y=y+1:goto6100
230 print"westen{home}":j=peek(891):ifj<3orj=5orj=9or(j>11andj<>119andj<>120)goto214
232 pokep,q:q=j:p=p-1:x=x-1:goto6100
234 print"osten{home}":j=peek(893):ifj<3orj=5orj=9or(j>11andj<>119andj<>120)goto214
236 pokep,q:q=j:p=p+1:x=x+1:goto6100
240 print"kommuniziere";:sys5681:print"{yel} - richt.? {wht}G{left}";:z=0
250 z=z+1:ifz>499goto258
252 getu$:ifu$=""goto252
254 ifu$="{up}"thenprint"nord{home}":j=-11:goto260
255 ifu$="{down}"thenprint"süd{home}":j=11:goto260
256 ifu$="{left}"thenprint"west{home}":j=-1:goto260
257 ifu$="{rght}"thenprint"ost{home}":j=1:goto260
258 print"nein{home}":sys5681:z=0:goto100
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
279 ifh=.thenprint"{lred}keine antwort!{home}":sys5681:goto100
280 sys5681:print"{cyn}du sprichst{home}":sys5681:ifh=1thenprint"eine wache ";
281 ifh=2thenprint"den rüstungs-{home}":sys5681:print"macher ";
282 ifh=3thenprint"den waffen-{home}":sys5681:print"schmied ";
283 ifh=4thenprint"einen heiler{home}":sys5681
284 ifh=5thenprint"einen koch{home}":sys5681
285 ifh=6thenprint"einen alten{home}":sys5681:print"seebären ";
286 ifh=7thenprint"einen gastwirt{home}":sys5681
287 ifh=8thenprint"einen muskel-{home}":sys5681:print"protz ";
288 ifh=9thenprint"einen zimmer-{home}";:sys5681:print"mann ";
289 ifh=10thenprint"einen druiden{home}":sys5681
290 ifh=16thenprint"eine zauberin{home}":sys5681
297 print"an.{home}":ifh=12goto1200
298 ifh=13orrnd(ti)<.5goto400
299 goto820
400 gosub900:ifrnd(ti)<.05thenprint" {home}":goto880
401 ifh=1andn$="waec"goto1000
402 ifh=1andn$="stad"goto1001
403 ifn$="gold"goto1016
404 ifh=2andn$="rues"goto2000
405 ifh=3andn$="waff"goto2040
406 ifh=4andn$="heil"goto1030
407 ifh=4andn$="entg"goto1032
408 ifh=4andn$="rege"goto1038
409 ifh=5andn$="esse"goto1040
410 ifn$="beru"goto860
411 ifh=6andn$="seem"goto1100
412 ifh=7andn$="wirt"goto1140
413 ifn$="name"thenprint"?{home}":goto820
415 ifn$="fick"orn$="piss"ormid$(n$,2)="otz"orn$="arsc"orn$="porn"goto449
416 ifh=8andn$="schw"goto1144
417 ifh=8andn$="body"goto1150
418 ifh=8andn$="trai"goto1154
419 ifh=9andn$="werf"goto1170
420 ifn$="wied"thenprint"ersehen.{home}":goto880
421 ifn$="gesu"thenprint"ndheit?{home}":goto840
422 ifh=9andn$="schi"goto1172
423 ifh=16andn$="zaub"goto3000
424 ifh=16andn$="adep"goto3010
425 ifh=16andn$="tafe"goto3030
426 ifh=10andn$="drui"goto3100
427 ifh=10thenifn$="kris"orn$="spli"orn$="glei"orn$="boes"goto3130
428 ifh=10andn$="tafe"goto3120
429 ifh=16andn$="donn"goto3020
439 ifh=10andn$="helf"goto3110
440 print" {home}":gosub800:print"dazu kann{home}":sys5681:print"ich dir nichts{home}":sys5681
441 print"sagen.%{home}
442 goto400
449 print" {home}":gosub800:print"du bist ein{home}":sys5681:print"altes ferkel!%{home}":goto400
800 gosub999:print"{yel}der ";:ifh=16thenprint"{left}{left}{left}ie ";
801 ifh=1thenprint"wächter{home}
802 ifh=2thenprint"rüstungs-{home}":sys5681:print"macher{home}
803 ifh=3thenprint"waffen-{home}":sys5681:print"schmied{home}
804 ifh=4thenprint"heiler{home}
805 ifh=5thenprint"koch{home}
806 ifh=6thenprint"seemann{home}
807 ifh=7thenprint"gastwirt{home}
808 ifh=8thenprint"muskelmann{home}
809 ifh=9thenprint"zimmermann{home}
810 ifh=10thenprint"druide{home}
811 ifh=16thenprint"zauberin{home}
819 sys5681:print"sagt:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"ich bin ";:ifh=1thenprint"ein{home}":sys5681:print"wächter";
821 ifh=2thenprint"olof";
822 ifh=3thenprint"erik";
823 ifh=4thensys5681:print"appendicus";
824 ifh=5thensys5681:print"kulinarus";
825 ifh=6thensys5681:print"käpt'n hook";
826 ifh=7thensys5681:print"dolph";
827 ifh=8thensys5681:print"arnold";
829 ifh=9thensys5681:print"ragnar";
830 ifh=10thensys5681:print"riclan";
831 ifh=16thensys5681:print"tecca";
839 print".%{home}":goto400
840 gosub800:ifh=1thenprint"ausgezeichnet,{home}":sys5681:print"danke";
841 ifh=2orh=3orh=10thenprint"ganz gut";
843 ifh=4thenprint"ich fühle mich{home}":sys5681:print"natürlich wohl";
844 ifh=5orh=16thenprint"geht so, danke{home}":sys5681:print"der nachfrage";
845 ifh=6thenprint"ich bin etwas{home}":sys5681:print"angetrunken";
846 ifh=7thenprint"ausgezeichnet";
847 ifh=8thenprint"ich fühle mich{home}":sys5681:print"sehr stark";
848 ifh=9thenprint"ich habe hart{home}":sys5681:print"gearbeitet";
859 goto839
860 print"f?{home}":ifh=1goto820
862 gosub800:ifh=2thenprint"ich fertige";:sys5681:print"rüstungen";
863 ifh=3thenprint"ich mache und{home}":sys5681:print"handle mit";:sys5681:print"waffen";
864 ifh=5thenprint"rate mal - man{home}":sys5681:print"sieht doch, dass";
865 ifh=4thenprint"ich bin der{home}":sys5681:print"heiler dieser";:sys5681:print"stadt";
866 ifh=6thenprint"ich bin ein{home}":sys5681:print"seemann";
867 ifh=7thenprint"ich bin hier{home}":sys5681:print"der wirt";
868 ifh=8thenprint"ich bin ein{home}":sys5681:print"bodybuilder";
870 ifh=5thensys5681:print"ich hier das{home}":sys5681:print"essen mache";
872 ifh=9thenprint"ich bin der{home}":sys5681:print"werftmeister";
873 ifh=10thenprint"ich bin ein{home}":sys5681:print"druide";
874 ifh=16thenprint"ich bin eine{home}":sys5681:print"zauberin";
879 goto839
880 gosub800:ifh=1thenprint"ich muss weiter{home}":sys5681:print"wache schieben";
881 ifh=3orh=2thenprint"beehre mich{home}":sys5681:print"bald wieder";
882 ifh=4thenprint"halte dich{home}":sys5681:print"immer gesund";
883 ifh=5thenprint"iss tüchtig";
884 ifh=6orh=10thenprint"gute reise";
885 ifh=7thenprint"trink 'n bier";
886 ifh=8thenprint"kauf dir mal 'n{home}":sys5681:print"paar hanteln";
887 ifh=16thenprint"möge die magie{home}":sys5681:print"mit dir sein";
889 ifh=9thenprint"guten wind";
897 print".%{home}":sys5681:sys5681:print"{yel}er";:ifh>13thenprint"{left}{left}sie";
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
971 getu$:ifu$="j"oru$="n"thenprintu$"{lgrn}{home}":goto999
972 goto971
980 gosub800:print"willst du{home}":sys5681:print"kaufen oder{home}":sys5681:print"verkaufen? {wht}G{left}";
981 getu$:ifu$<>"k"andu$<>"v"goto981
982 printu$"{lgrn}";:goto999
999 sys5681:sys5681:return
1000 print"hter{home}":gosub800:print"ich bewache die{home}":sys5681:print"stadt.%{home}":goto400
1001 print"t":gosub800:print"dies hier ist{home}":sys5681:print"worthal, die{home}":sys5681
1002 print"stadt der{home}":sys5681:print"seefahrer.{home}":sys5681:print"willst du ein{home}":sys5681
1003 print"schiff{home}":sys5681:print"kaufen? ";:gosub970:ifu$="n"thenprint"was willst du{home}
1004 ifu$="n"thensys5681:print"dann hier?{home}":goto400
1005 print"dann bist du{home}":sys5681:print"hier genau{home}":sys5681:print"richtig.{home}":goto400
1016 print" {home}":gosub800:print"ja, gold hätte{home}";:sys5681:print"ich auch gern!%{home}":goto400
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
1040 print"n{home}":gosub800:print"hier gibt's {home}";:sys5681:print"leckere fisch-{home}
1041 sys5681:print"gerichte. willst{home}":sys5681:print"du ein paket mit{home}
1042 sys5681:print"15 rationen?";
1043 gosub970:ifu$="n"thenprint"dann lass es.%{home}":goto400
1044 z=16-int(ch/1.5):gosub9000:sys5681:na=na+15:ifna>250thenna=250
1045 poke49244,na:gosub10000:sys5681:print"noch eins?";:goto1043
1100 print"ann{home}":gosub800:print"früher war ich{home}":sys5681:print"ein berühmter{home}
1110 sys5681:print"seefahrer, doch{home}":sys5681:print"ich habe mich{home}
1111 sys5681:print"zur ruhe{home}":sys5681:print"gesetzt.{home}
1112 gosub960:print"willst du{home}":sys5681:print"auch zur see{home}
1113 sys5681:print"fahren?";:gosub970
1114 ifu$="n"thenprint"ein schiff ist{home}":sys5681:print"das beste{home}":sys5681
1115 ifu$="n"thenprint"zu hause.{home}":goto400
1117 print"findest du dich{home}":sys5681:print"denn auf see{home}
1118 sys5681:print"zurecht? ";:gosub970:ifu$="j"thenprint"dann ist es{home}":sys5681:print"ja gut.%{home}
1119 ifu$="j"goto400
1120 print"naja, als{home}":sys5681:print"anfänger...{home}
1121 sys5681:print"gibst du mir{home}":sys5681:print"'n bier aus?";:gosub970
1122 ifu$="n"thenprint"geizhals!%{home}":goto400
1123 z=2:gosub9000:sys5681:print"{lgrn}danke, das tut{home}":sys5681:print"gut.";
1124 ifpeek(49347)thenprint"%{home}":goto400
1125 print" ich hätte{home}":sys5681:print"da vielleicht{home}
1126 sys5681:print"etwas für dich.{home}":sys5681:print"ich habe noch{home}
1127 sys5681:print"meinen alten{home}":sys5681:print"sextanten zur{home}
1128 sys5681:print"positionsbestim-{home}":sys5681:print"mung. ich würde{home}
1129 sys5681:print"ihn dir gern{home}":sys5681:print"verkaufen. hast{home}
1130 sys5681:print"du interesse? ";:gosub970:ifu$="n"thenprint"dann nicht.%{home}":goto400
1131 z=420-chr*10:gosub9000:sys5681:print"danke sehr. {home}":sys5681:print"hier hast du{home}
1132 sys5681:print"ihn.%";:poke49347,1:goto400
1140 print" {home}":gosub800:print"ja, setz dich{home}":sys5681:print"an einen tisch,{home}
1142 sys5681:print"ich komme{home}":sys5681:print"gleich.%{home}":goto400
1144 print"arzenegger{home}":gosub800:print"nein, die{home}":sys5681:print"namensgleichheit{home}
1145 sys5681:print"ist zufällig.%";:goto400
1150 print"builder{home}":gosub800:print"ich bin spezia-{home}":sys5681:print"list für kraft.{home}
1151 sys5681:print"ich könnte auch{home}":sys5681:print"dich trainieren.";:goto400
1154 print"nieren{home}":gosub800:print"willst du stär-{home}":sys5681:print"ker werden? ";
1155 gosub970:ifu$="n"thenprint"kraft ist aber{home}":sys5681:print"wichtig für den{home}
1156 ifu$="n"thensys5681:print"kampf und das{home}":sys5681:print"tragen von{home}":sys5681
1157 ifu$="n"thenprint"rüstungen.%{home}":goto400
1158 ifsr=18thenprint"du bist schon so{home}":sys5681:print"stark wie ich.%{home}":goto400
1159 ifpeek(49287)=0thenprint"dazu musst du{home}":sys5681:print"erst noch erfah-{home}
1160 ifpeek(49287)=0thensys5681:print"rener werden.%{home}":goto400
1161 print"gut, lass uns{home}":sys5681:print"trainieren.%{home}
1162 fori=0to7:poke53280,4:sys6041:pokes+5,73:pokes+1,22:pokes+4,129
1164 k=400*rnd(ti)+200:poke53280,0:forj=0tok:nextj,i:poke49287,peek(49287)-1
1166 poke49224,sr+1:gosub10000:goto400
1170 print"tmeister{home}":gosub800:print"ich baue hier{home}":sys5681:print"die schiffe.%{home}":goto400
1172 print"ff{home}":gosub800:print"ja, hättest du{home}":sys5681:print"vielleicht{home}
1173 sys5681:print"interesse an{home}":sys5681:print"einer einmann-{home}
1174 sys5681:print"segeljolle? ";:gosub970:ifu$="n"goto1114
1175 z=1e3:gosub9000:sys5681
1176 print"{lgrn}willkommen{home}":sys5681:print"an bord, dein{home}":sys5681:print"schiff liegt{home}
1178 sys5681:print"vor der stadt{home}":sys5681:print"vor anker.%{home}
1180 poke49160,48:poke49164,35:goto400
2000 print"tung{home}":gosub980:ifu$="k"goto2020
2001 print"und was? (b-i) {wht}G{left}";
2002 getu$:ifu$=""goto2002
2003 ifu$>"a"andu$<"j"andu$<>"g"goto2006
2004 print" {lgrn}{home}":gosub999:print"tut mir leid,{home}":sys5681:print"aber das nehme{home}
2005 sys5681:print"ich nicht.%{home}":goto400
2006 printu$"{lgrn}{home}":gosub999:k=asc(u$)-47:printw$(k);
2007 ifpeek(49248+k)=.thensys5681:print"hast du nicht.{home}":goto400
2008 print",{home}":sys5681:print"hm - gebraucht{home}";:sys5681:print"gebe ich dir{home}
2009 sys5681:print"dafür - sagen{home}";:sys5681:print"wir -";
2010 z=int(peek(50569+k)*4*(1+(ch-15)/15)):printz"gold-{home}":sys5681
2011 print"stücke, ok?";:gosub970:ifu$="n"goto9002
2012 print"abgemacht!{home}":poke49248+k,0:ifgp+z>5e4thenz=5e4-gp
2013 z=-z:gosub9004:gosub10000:goto400
2020 print"ich biete an:{home}":sys5681:fori=1to8:ifi=6theni=7
2021 sys5681:printchr$(65+i)" "w$(i+18);:next:gosub999:print"was möchtest du{home}
2022 sys5681:print"kaufen? (b-i) {wht}G{left}";
2023 getu$:ifu$=""goto2023
2024 ifu$>"a"andu$<"j"andu$<>"g"goto2026
2025 print" {lgrn}{home}":gosub999:print"tut mir leid,{home}":sys5681:print"aber das habe{home}";:goto2005
2026 printu$;:gosub999:k=asc(u$)-47:print"{lgrn}"w$(k);
2027 ifpeek(49248+k)thensys5681:print"hast du doch.{home}":goto400
2028 print",{home}":sys5681:print"ein schönes";:sys5681:print"stück. und für{home}
2029 sys5681:z=int(peek(50569+k)*8*(1-(ch-12)/15)):print"nur"z"gold-{home}":sys5681
2030 print"stücke gehört{home}":sys5681:print"es dir, ok?";:gosub970
2031 ifu$="n"goto9002
2032 ifz>gpgoto9003
2033 print"abgemacht!{home}":poke49248+k,1:gosub9004:gosub10000:goto400
2040 print"en{home}":gosub980:ifu$="k"goto2050
2041 print"und was? (b-p) {wht}G{left}";
2042 getu$:ifu$=""goto2042
2043 ifu$>"a"andu$<"q"andu$<>"n"goto2045
2044 goto2004
2045 printu$"{lgrn}{home}":gosub999:k=asc(u$)-66:printw$(k);:goto2007
2050 print"ich biete an:{home}":sys5681:fori=1to15:ifi=13theni=14
2051 sys5681:printchr$(65+i)" "w$(i-1);:ifi=6ori=10thengosub960
2052 next:gosub999:print"was möchtest du{home}
2053 sys5681:print"kaufen? (b-p) {wht}G{left}";:poke198,0
2054 getu$:ifu$=""goto2054
2055 ifu$>"a"andu$<"q"andu$<>"n"goto2057
2056 goto2025
2057 printu$;:gosub999:k=asc(u$)-66:print"{lgrn}"w$(k);:goto2027
3000 print"erer{home}":gosub800:print"naja, eigent-{home}":sys5681:print"lich bin ich{home}
3001 sys5681:print"eine adeptin.%{home}":goto400
3010 print"tin{home}":gosub800:print"ich übe den{home}":sys5681:print"donnerkeil-{home}
3011 sys5681:print"zauberspruch.%{home}":goto400
3020 print"erkeil{home}":gosub800:print"ein nützlicher{home}":sys5681:print"kampfzauber.{home}
3021 sys5681:print"kannst du{home}":sys5681:print"ihn?";:gosub970
3022 ifu$="j"thenprint"gut für dich.%{home}":goto400
3024 print"geh mal zum{home}":sys5681:print"schwarzen{home}":sys5681:print"zirkel.%{home}":goto400
3030 print"l{home}":gosub800:print"beim heiler ist{home}":sys5681:print"doch noch ein{home}
3034 sys5681:print"platz frei. sieh{home}":sys5681:print"dich dort mal{home}
3035 sys5681:print"um.%{home}":goto400
3100 print"de{home}":gosub800:print"wir druiden{home}":sys5681:print"wollen dir{home}
3101 sys5681:print"helfen.%{home}":goto400
3110 print"en{home}":gosub800:print"frage, was du{home}":sys5681:print"wissen willst.%{home}":goto400
3120 print"l{home}":gosub800:print"ich war in{home}":sys5681:print"ackbah. dort{home}
3121 sys5681:print"findest du die{home}":sys5681:print"fünfte tafel.%{home}":goto400
3130 print"...":gosub800:print"dazu kann dir{home}":sys5681:print"cerfax mehr{home}
3131 sys5681:print"sagen als ich.%{home}":goto400
3200 print"suchen";:fori=1to5:print".";:forj=.to400:nextj,i
3201 sys5681:print"{yel}du findest{home}":sys5681
3202 ifx<>26ory<>35thenprint"nichts.{home}":goto100
3204 print"eine tontafel:{home}":sys5681:sys5681:print"{orng}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}:CD;{home}
3206 sys5681:print"{rght}{rght}{rght}{rght}{rght}{rght}{rvon}<EF={home}":sys5681:sys5681:goto100
3300 print"{left}  {home}":sys5681:print"{yel}möchtest du{home}":sys5681:print"worthal{home}
3301 sys5681:print"verlassen?";:gosub970:ifu$="n"theny=y-1:goto100
6000 sys5681:print"{lred}du verlässt{home}":sys5681:print"die stadt.{home}
6010 fori=0to999:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
6020 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:poke2,0:new
6100 pokes+4,0:pokes+5,16:pokes+1,12:pokes+4,129:goto100
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
50000 datamesser,dolch,kurzschwert,handbeil,schwert,morgenstern,kampfstab
50001 databastardschwert,streitaxt,zweihänder,schleuder,kurzbogen,,langbogen
50002 dataarmbrust,,,,kleidung,waffenrock,lederrüstung,kettenhemd,schuppenpanzer
50003 dataritterrüstung,,kleiner schild,grosser schild
50100 data-35,6500,11,17,1,6787,8,17,35,6820,11,21,-1,6780,11,21
