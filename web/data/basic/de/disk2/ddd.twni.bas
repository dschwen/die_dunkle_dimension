1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454:i=rnd(-ti)
2 poke51208,12:poke51223,15:poke51211,2:poke51221,1:poke51209,15:poke51251,1
3 poke51228,8:poke51219,1:poke650,255
5 dimw$(26):fori=0to26:readw$(i):next:poke51217,8:poke51205,8:poke7097,6
6 poke51206,1:dima(3),p(3),q(3),h(3):fori=0to3:reada(i),p(i),q(i),h(i):next:goto20
7 fori=0to3:j=int(4*rnd(ti)):k=p(i)+a(j):z=peek(k):ifk=6144+x+35*ygoto9
8 ifz=3orz=8orz=11thenifk<7400thenpokep(i),q(i):p(i)=k:q(i)=z:pokep(i),h(i)
9 next:return
20 print"{home}{down}{down}"spc(24)"{lgrn}vital.:   (   )":printspc(24)"{up}{cyn}astral:   (   )
21 printspc(24)"{lred}att.:   {grn}par.:":printspc(24)"{up}{pur}str.:   {yel}ges.:
22 printspc(24)"{gry3}klg.:   {lblu}cha.:":printspc(24)"{up}{lgrn}erf.:      (  )
23 printspc(24)"{yel}goldstck.:":printspc(24)"{up}{orng}nahr.vorrat:
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
128 ifu$="k"goto240
129 ifu$="w"thenprint"waffe{home}":goto191
130 ifu$="r"thenprint"rüstung{home}":goto191
131 ifu$="i"thenprint"inventur{home}":goto191
132 ifu$="s"goto3200
190 print"wie bitte..?{home}":goto100
191 sys5681:print"{yel}mach das{home}":sys5681:print"draussen!{home}":goto100
200 print"warten...{home}":goto100
210 print"norden{home}":j=peek(881):ifj<3orj=5orj=9orj>11goto214
212 pokep,q:q=j:y=y-1:goto6100
214 sys5681:print"{lred}blockiert!{home}":sys5681:goto100
220 print"süden{home}":j=peek(903):ifj<3orj=5orj=9orj>11goto214
222 pokep,q:q=j:y=y+1:goto6100
230 print"westen{home}":j=peek(891):ifj<3orj=5orj=9orj>11goto214
232 pokep,q:q=j:x=x-1:goto6100
234 print"osten{home}":j=peek(893):ifj<3orj=5orj=9orj=6orj>11goto214
236 pokep,q:q=j:x=x+1:goto6100
240 print"kommuniziere";:sys5681:print"{yel} - richt.? {wht}G{left}";:z=0
250 z=z+1:ifz>499goto258
252 getu$:ifu$=""goto252
254 ifu$="{up}"thenprint"nord{home}":j=-11:goto260
255 ifu$="{down}"thenprint"süd{home}":j=11:goto260
256 ifu$="{left}"thenprint"west{home}":j=-1:goto260
257 ifu$="{rght}"thenprint"ost{home}":j=1:goto260
258 print"nein{home}":sys5681:z=0:goto100
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
279 ifh=.thenprint"{lred}keine antwort!{home}":sys5681:goto100
280 sys5681:print"{cyn}du sprichst{home}":sys5681:ifh=1thenprint"eine wache ";
281 ifh=2thenprint"den rüstungs-{home}":sys5681:print"macher ";
282 ifh=3thenprint"den waffen-{home}":sys5681:print"schmied ";
283 ifh=4thenprint"einen heiler{home}":sys5681
284 ifh=5thenprint"einen koch{home}":sys5681
285 ifh=6thenprint"einen ange-{home}":sys5681:print"stellten ";
286 ifh=7thenprint"einen schmied{home}":sys5681
287 ifh=8thenprint"einen alten{home}":sys5681:print"mann ";
288 ifh=13thenprint"eine zwergen-{home}":sys5681:print"mädchen ";
291 ifh=14thenprint"eine alte frau{home}":sys5681
292 ifh=9thenprint"einen zuberer{home}":sys5681
293 ifh=10thenprint"einen druiden{home}":sys5681
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
410 ifh=14andn$="krae"goto2100
411 ifh=6andn$="berg"goto1100
412 ifh=6andn$="erze"goto1110
413 ifn$="name"thenprint"?{home}":goto820
414 ifn$="beru"goto860
415 ifn$="fick"orn$="piss"ormid$(n$,2)="otz"orn$="arsc"orn$="porn"goto449
416 ifh=6andn$="uten"goto1120
417 ifh=6andn$="fack"goto1130
418 ifh=6andn$="lamp"goto1140
419 ifh=8andn$="denk"goto1300
420 ifn$="wied"thenprint"ersehen.{home}":goto880
421 ifn$="gesu"thenprint"ndheit?{home}":goto840
422 ifh=7andn$="schm"goto1050
423 ifh=7thenifn$="schi"orn$="wind"orn$="unte"orn$="meer"goto1070
424 ifh=9andn$="zaub"goto3000
425 ifh=9andn$="adep"goto3010
426 ifh=9andn$="tafe"goto3030
427 ifh=9andn$="ingr"goto3011
428 ifh=10andn$="drui"goto3100
429 ifh=10andn$="helf"goto3110
430 ifh=10andn$="tafe"goto3120
431 ifh=10thenifn$="boes"orn$="spli"orn$="kris"orn$="glei"orn$="umst"goto3130
432 ifh=13andn$="trin"goto1180
433 ifh=13andn$="schi"goto1185
434 ifh=13andn$="wind"goto1186
435 ifh=9thenifn$="schw"orn$="knob"orn$="gins"orn$="blut"goto3040
436 ifh=9andn$="zirb"goto3042
437 ifh=9andn$="tote"goto3043
438 ifh=9andn$="gift"goto3044
439 ifh=9andn$="alra"goto3050
440 ifh=8andn$="klug"goto1310
441 print" {home}":gosub800:print"dazu kann{home}":sys5681:print"ich dir nichts{home}":sys5681
442 print"sagen.%{home}
443 goto400
449 print" {home}":gosub800:print"du bist ein{home}":sys5681:print"altes ferkel!%{home}":goto400
800 gosub999:print"{yel}der ";:ifh>12thenprint"{left}{left}{left}ie ";:ifh=13thenprint"{left}{left}{left}as ";
801 ifh=1thenprint"wächter{home}
802 ifh=2thenprint"rüstungs-{home}":sys5681:print"macher{home}
803 ifh=3thenprint"waffen-{home}":sys5681:print"schmied{home}
804 ifh=4thenprint"heiler{home}
805 ifh=5thenprint"koch{home}
806 ifh=6thenprint"angestellte{home}
807 ifh=7thenprint"schmied{home}
810 ifh=9thenprint"zauberer{home}
811 ifh=10thenprint"druide{home}
812 ifh=14orh=8thenprint"alte{home}
813 ifh=13thenprint"mädchen{home}
819 sys5681:print"sagt:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"ich bin ";:ifh=1thenprint"ein{home}":sys5681:print"wächter";
821 ifh=2thensys5681:print"gwendall";
822 ifh=3thensys5681:print"thormin";
823 ifh=4thensys5681:print"virus";
824 ifh=5thensys5681:print"osmond";
825 ifh=6thensys5681:print"gumbert";
826 ifh=7thensys5681:print"ein schmied";
827 ifh=9thensys5681:print"alfin";
828 ifh=10thensys5681:print"rewan";
829 ifh=13thensys5681:print"trenca";
830 ifh=8thensys5681:print"jiovan";
832 ifh=14thensys5681:print"heben";
839 print".%{home}":goto400
840 gosub800:ifh=1thenprint"ausgezeichnet,{home}":sys5681:print"danke";
841 ifh=2orh=3orh=7thenprint"ganz gut";
843 ifh=4thenprint"ich fühle mich{home}":sys5681:print"natürlich wohl";
844 ifh=5thenprint"es muss ja";
845 ifh=6thenprint"geht so";
849 ifh=8thenprint"es geht{home}":sys5681:print"mir gut";
850 ifh=13thenprint"ich bin{home}":sys5681:print"etwas müde";
852 ifh=14thenprint"ich fühle{home}":sys5681:print"grosses unheil";
853 ifh=10thenprint"den umständen{home}":sys5681:print"entsprechend";
854 ifh=9thenprint"geht so";
859 goto839
860 print"f?{home}":ifh=1goto820
862 gosub800:ifh=2thenprint"ich fertige";:sys5681:print"rüstungen";
863 ifh=3thenprint"ich mache und{home}":sys5681:print"handle mit";:sys5681:print"waffen";
864 ifh=5thenprint"ich bereite das{home}":sys5681:print"essen";
865 ifh=6thenprint"ich bin im{home}":sys5681:print"bergbau tätig";
866 ifh=7thenprint"ich bin ein{home}":sys5681:print"schmied";
867 ifh=4thenprint"ich bin ein{home}":sys5681:print"heiler";
868 ifh=9thenprint"ich bin ein{home}":sys5681:print"zauberer";
869 ifh=10thenprint"ich bin ein{home}":sys5681:print"druide";
871 ifh=14thenprint"ich bin ein{home}":sys5681:print"kräuterweib";
872 ifh=13thenprint"ich trinke";
874 ifh=8thenprint"ich bin ein{home}":sys5681:print"denker";
879 goto839
880 gosub800:ifh=1thenprint"ich muss weiter{home}":sys5681:print"wache schieben";
881 ifh=3orh=2thenprint"beehre mich{home}":sys5681:print"bald wieder";
882 ifh=4thenprint"halte dich{home}":sys5681:print"immer gesund";
883 ifh=5thenprint"guten hunger";
884 ifh=6thenprint"glück auf";
885 ifh=7thenprint"ich muss jetzt{home}":sys5681:print"weiterarbeiten";
886 ifh=10thenprint"das licht sei{home}":sys5681:print"mit dir";
890 ifh=13thenprint"verzieh dich";
892 ifh=14orh=9thenprint"möge die magie{home}":sys5681:print"mit dir sein";
896 ifh=8thenprint"cogito ergo{home}":sys5681:print"sum";
897 print".%{home}":sys5681:sys5681:print"{yel}er";:ifh>12thenprint"{left}{left}sie";
898 print" wendet sich{home}":sys5681:print"ab.{home}":sys5681:goto100
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
1001 print"t":gosub800:print"das hier ist{home}":sys5681:print"muspel, die{home}
1002 sys5681:print"stadt der{home}":sys5681:print"zwerge. willst{home}
1003 sys5681:print"du unsere{home}":sys5681:print"schmiede{home}":sys5681:print"besuchen?";
1004 gosub970:ifu$="n"thenprint"aha, du bist{home}":sys5681:print"also bloss ein{home}
1005 ifu$="n"thensys5681:print"tourist.%{home}":goto400
1006 print"wir zwerge sind{home}":sys5681:print"gute schmiede.%{home}":goto400
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
1040 print"n{home}":gosub800:print"unsere speziali-{home}";:sys5681:print"tät ist ragout.{home}
1041 sys5681:print"möchtest du{home}":sys5681:print"16 rationen?";
1043 gosub970:ifu$="n"thenprint"dann lass es.%{home}":goto400
1044 z=16-int(ch/1.7):gosub9000:sys5681:na=na+16:ifna>250thenna=250
1045 poke49244,na:gosub10000:sys5681:print"{lgrn}noch mehr?";:goto1043
1050 print"ied{home}":gosub800:print"wir fertigen{home}":sys5681:print"rüstungen und{home}
1051 sys5681:print"waffen aller art{home}":sys5681:print"an. wir schmie-{home}
1052 sys5681:print"den sie in lava,{home}":sys5681:print"das verleiht den{home}
1053 sys5681:print"dingen eine ge-{home}":sys5681:print"wisse kraft.{home}
1054 gosub960:print"hast du schon{home}":sys5681:print"einmal von unse-{home}
1055 sys5681:print"rer berühmten{home}":sys5681:print"magischen axt{home}
1056 sys5681:print"gehört?";:gosub970:ifu$="j"thenprint"toll, nicht?{home}":goto400
1057 print"es war eine{home}":sys5681:print"waffe, eine{home}
1058 sys5681:print"wurfaxt, die{home}":sys5681:print"nach dem wurf{home}
1059 sys5681:print"in die hand des{home}":sys5681:print"trägers zurück-{home}
1060 sys5681:print"kehrt und sofort{home}":sys5681:print"wieder benutzt{home}
1061 sys5681:print"werden kann.{home}":gosub960:print"leider war sie{home}
1062 sys5681:print"auf einem segel-{home}":sys5681:print"schiff, der{home}
1063 sys5681:print"'windjagd', als{home}":sys5681:print"es unterging.{home}
1064 sys5681:print"nun ruht die axt{home}":sys5681:print"auf dem meeres-{home}
1065 sys5681:print"grund.%{home}":goto400
1070 print"...{home}":gosub800:print"trenca war auf{home}":sys5681:print"dem schiff. sie{home}
1071 sys5681:print"hat das unglück{home}":sys5681:print"überlebt. frag{home}
1072 sys5681:print"sie nach dem{home}":sys5681:print"schiff.%{home}":goto400
1100 print"bau{home}":gosub800:print"ja, wir zwerge{home}":sys5681:print"fördern unsere{home}
1101 sys5681:print"erze selbst.%{home}":goto400
1110 print" {home}":gosub800:print"ja, und ich{home}":sys5681:print"verkaufe die{home}
1111 sys5681:print"dafür nötigen{home}":sys5681:print"utensilien.%{home}":goto400
1120 print"silien{home}":gosub800:print"zum beispiel{home}":sys5681:print"fackeln oder{home}
1121 sys5681:print"lampen, damit{home}":sys5681:print"man im dunkeln%{home}
1122 sys5681:print"sehen kann.%{home}":goto400
1130 print"eln{home}":gosub800:print"sie kosten nur{home}";:sys5681:print"zwei münzen pro{home}
1131 sys5681:print"stück. möchtest{home}":sys5681:print"du welche{home}":sys5681:print"kaufen?";
1132 gosub970:ifu$="n"thenprint"wozu auch.%{home}":goto400
1133 print"wieviele? {blu}00{left}{left}{wht}";
1134 getu$:ifu$<"0"oru$>"9"goto1134
1135 printu$;:j=val(u$)*10
1136 getu$:ifu$<"0"oru$>"9"goto1136
1137 printu$;:j=j+val(u$):print"{lgrn}{home}":sys5681:ifj=.thenprint"oh.%{home}":goto400
1138 sys5681:z=j*2:gosub9000:i=peek(49356)+j:ifi>99theni=99
1139 poke49356,i:sys5681:print"{lgrn}bitte sehr!%{home}":goto400
1140 print"e{home}";:gosub800:print"eine lampe kos-{home}":sys5681:print"tet 200 gold-{home}
1141 sys5681:print"stücke. ich{home}":sys5681:print"weiss, dass das{home}
1142 sys5681:print"teuer ist, aber{home}":sys5681:print"unsere magischen{home}
1143 sys5681:print"lampen werden{home}":sys5681:print"nie leer. willst{home}
1144 sys5681:print"du eine?";:gosub970:ifu$="n"thenprint"na, gut.%{home}":goto400
1145 ifpeek(49355)thenprint"hast du doch!%{home}":goto400
1146 z=200:gosub9000:sys5681:poke49355,1:print"{lgrn}hier, nimm.%{home}":goto400
1180 print"ken{home}";:gosub800:print"darf man hier{home}":sys5681:print"nicht mal was{home}
1181 sys5681:print"trinken, ohne{home}":sys5681:print"gleich blöde{home}
1182 sys5681:print"angequatscht{home}":sys5681:print"zu werden?%{home}":goto400
1185 print"ff{home}":gosub800:print"welches{home}":sys5681:print"schiff?%{home}":goto400
1186 print"jagd{home}":gosub800:print"ja, ich war auf{home}":sys5681:print"dem schiff als{home}
1187 sys5681:print"es unterging.{home}":gosub960:print"willst du etwa{home}
1188 sys5681:print"wissen wo?";:gosub970:ifu$="n"thenprint"dann hau ab.%{home}":goto400
1189 print"du willst doch{home}":sys5681:print"die magische axt{home}
1190 sys5681:print"bergen, oder?";:gosub970
1191 ifu$="n"thenprint"wozu willst du{home}":sys5681:print"dann wissen, wo{home}
1192 ifu$="n"thensys5681:print"das schiff{home}":sys5681:print"liegt?{home}":goto400
1193 z=500:gosub9000:sys5681:print"{lgrn}also gut, das{home}":sys5681:print"schiff liegt{home}
1194 sys5681:print"genau in der{home}":sys5681:print"tiefsten stelle{home}
1195 sys5681:print"zwischen mubrak{home}":sys5681:print"und dem fest-{home}
1196 sys5681:print"land.%{home}":goto400
1300 print"er{home}":gosub800:print"ein denker muss{home}":sys5681:print"sehr klug sein.%{home}":goto400
1310 print" {home}":gosub800:print"bist du klug{home}":sys5681:print"genug?";:gosub970
1311 ifu$="j"thenprint"niemand ist{home}":sys5681:print"das.%{home}":goto400
1312 print"soll ich dich{home}":sys5681:print"klugheit{home}":sys5681:print"lehren?";:gosub970
1313 print"na schön.{home}":ifu$="n"goto400
1314 ifkg=18thensys5681:print"du bist schon{home}":sys5681:print"so klug wie{home}":sys5681
1315 ifkg=18thenprint"ich.%{home}":goto400
1316 ifpeek(49287)=.thensys5681:print"dazu musst du{home}":sys5681:print"erst noch etwas{home}
1317 ifpeek(49287)=.thensys5681:print"erfahrener{home}":sys5681:print"werden.%{home}":goto400
1320 sys5681:sys5681:print"{yel}ihr denkt...{home}":fori=1to2e3:next:sys5681:sys5681
1321 print"erleuchtung!{home}":fori=0to1e3:next:poke49226,kg+1:gosub10000:poke49287,peek(49287)-1
1322 sys5681:gosub800:print"nun bist du{home}":sys5681:print"klüger.%{home}":goto400
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
2010 z=int(peek(50569+k)*4*(1+(ch-12)/25)):printz"gold-{home}":sys5681
2011 print"stücke, ok?";:gosub970:ifu$="n"goto9002
2012 print"abgemacht!{home}":poke49248+k,0:gp=gp+z:ifgp>5e4thengp=5e4
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
2029 sys5681:z=int(peek(50569+k)*8*(1-(ch-12)/25)):print"nur"z"gold-{home}":sys5681
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
2100 print"uter{home}":gosub800:print"ah, bist du{home}":sys5681:print"magiekundig?";:gosub970
2101 ifu$="n"thenprint"wozu brauchst{home}":sys5681:print"du denn dann{home}":sys5681:print"ingredienzen?%{home}
2102 ifu$="n"goto400
2103 print"ich habe:{home}":gosub999:print"a schwefel{home}":sys5681:print"b knoblauch{home}
2104 sys5681:print"c ginseng{home}":sys5681:print"d blutflechte{home}":gosub999
2105 print"was willst du? {wht}G{left}";
2106 getu$:ifu$=""goto2106
2107 ifu$<"a"oru$>"d"goto2025
2108 printu$"{lgrn}";:gosub999:k=asc(u$)-65:zz=10:ifk>.thenzz=6:ifk>1thenzz=3:ifk>2thenzz=1
2109 ifk<3thenprint"gibt's im"zz"{left}'er{home}":sys5681:print"pack und{home}":sys5681
2110 print"kostet 1 gold-";:sys5681:print"stück, ok?";
2120 z=1:gosub970:ifu$="n"goto9002
2121 ifgp<zgoto9003
2122 print"bitte sehr!{home}":sys5681:j=peek(49336+k)+zz:ifj>99thenj=99
2123 poke49336+k,j:gosub9004:sys5681:print"du hast nun{home}":sys5681:printmid$(str$(j),2);
2124 print" einheit.";:ifj>1thenprint"{left}en.{home}
2125 gosub10000:sys5681:print"noch eine?";:goto2120
3000 print"erer{home}":gosub800:print"naja, eigent-{home}":sys5681:print"lich bin ich{home}
3001 sys5681:print"noch ein adept.%{home}":goto400
3010 print"t{home}":gosub800:print"ich besorge{home}":sys5681:print"ingredenzien.%{home}":goto400
3011 print"edenzien{home}":gosub800:print"suchst du auch{home}":sys5681:print"welche?";
3012 gosub970:ifu$="n"thenprint"aber ich.%{home}":goto400
3013 print"welche suchst{home}":sys5681:print"du denn?%{home}":goto400
3020 print"rball{home}":gosub800:print"ein nützlicher{home}":sys5681:print"kampfzauber.{home}
3021 sys5681:print"kannst du{home}":sys5681:print"ihn?";:gosub970
3022 ifu$="j"thenprint"gut für dich.%{home}":goto400
3024 print"geh mal zum{home}":sys5681:print"schwarzen{home}":sys5681:print"zirkel.%{home}":goto400
3030 print"l{home}":gosub800:print"latsch' mal{home}":sys5681:print"hinter die bude{home}
3031 sys5681:print"von heben. an{home}":sys5681:print"der südlichs-{home}
3032 sys5681:print"ten stelle musst{home}":sys5681:print"du suchen.%{home}":goto400
3040 print"...{home}":gosub800:print"das kannst du{home}":sys5681:print"fast überall{home}
3041 sys5681:print"kaufen.%{home}":goto400
3042 print"elkraut{home}":gosub800:print"das kannst du{home}":sys5681:print"nur in madraksan{home}":goto3041
3043 print"nblume{home}":gosub800:print"das kannst du{home}":sys5681:print"bei den elfen{home}":goto3041
3044 print" der nacht{home}":gosub800:print"nana, das zeug{home}":sys5681:print"ist doch verbo-{home}
3045 sys5681:print"ten. aber ich{home}":sys5681:print"habe gehört,{home}
3046 sys5681:print"in mubrak sei{home}":sys5681:print"es eventuell{home}
3047 sys5681:print"zu haben.{home}":goto400
3050 print"une{home}":gosub800:print"psst!{home}":fori=1to2e3:next:sys5681:sys5681
3051 print"komm 'mal etwas{home}":sys5681:print"näher...{home}":fori=1to2e3:next:sys5681:sys5681
3052 print"ich weiss, wo{home}":sys5681:print"sie noch wächst,{home}
3053 sys5681:print"aber das darf{home}":sys5681:print"ich dir nicht{home}
3054 sys5681:print"sagen.{home}":gosub960:print"aber ich bin{home}
3056 sys5681:print"vielleicht{home}":sys5681:print"mit etwas gold{home}
3057 sys5681:print"gesprächiger.{home}":sys5681:print"wieviele hundert{home}
3058 sys5681:print"münzen bietest{home}":sys5681:print"du mir an? {wht}G{left}";
3059 getu$:ifu$<"0"oru$>"9"goto3059
3060 printu$"{lgrn}{home}":sys5681:sys5681:j=val(u$):ifj<5thenprint"du spinnst ja.%{home}":goto400
3062 z=100*j:print"akzeptiert.{home}":sys5681:gosub9000:sys5681
3063 print"{lgrn}danke sehr! es{home}":sys5681:print"gibt noch vor-{home}":sys5681:print"kommen auf der{home}
3064 sys5681:print"kleinsten der{home}":sys5681:print"toteninseln,{home}
3065 sys5681:print"westlich der{home}":sys5681:print"todessümpfe.{home}
3066 gosub960:print"die genaue{home}":sys5681:print"position ist:{home}
3067 sys5681:print"(f&i'/i&f').%{home}":goto400
3100 print"de{home}":gosub800:print"wir druiden{home}":sys5681:print"wollen dir{home}
3101 sys5681:print"helfen.%{home}":goto400
3110 print"en{home}":gosub800:print"frage, was du{home}":sys5681:print"wissen willst.%{home}":goto400
3120 print"l{home}":gosub800:print"ich war in{home}":sys5681:print"mubrak. dort{home}
3121 sys5681:print"ist die zweite{home}":sys5681:print"tafel.%{home}":goto400
3130 print"...":gosub800:print"dazu kann dir{home}":sys5681:print"cerfax mehr{home}
3131 sys5681:print"sagen als ich.%{home}":goto400
3200 print"suchen";:fori=1to5:print".";:forj=.to400:nextj,i
3201 sys5681:print"{yel}du findest{home}":sys5681
3202 ifx<>31ory<>30thenprint"nichts.{home}":goto100
3204 print"eine tontafel:{home}":sys5681:sys5681:print"{orng}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}:Z6;{home}
3206 sys5681:print"{rght}{rght}{rght}{rght}{rght}{rght}{rvon}<{$dc}7={home}":sys5681:sys5681:goto100
3300 print"{left}  {home}":sys5681:print"{yel}möchtest du{home}":sys5681:print"die stadt muspel{home}
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
50003 dataritterrüstung,magische rüstung,kleiner schild,grosser schild
50100 data-35,6348,11,17,1,6604,11,17,35,6853,3,21,-1,6975,11,21
