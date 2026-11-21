1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454:i=rnd(-ti)
2 ifpeek(49161)<255thenpoke7153,11
6 gosub11000:dima(3),p(3):fori=0to3:reada(i),p(i):next:poke650,255:goto20
7 fori=0to3:j=int(4*rnd(ti)):k=p(i)+a(j):ifk=6144+x+35*ygoto9
8 ifpeek(k)=11andk<7400thenpokep(i),11:p(i)=k:pokep(i),21
9 next:return
20 print"{home}{down}{down}"spc(24)"{lgrn}vital.:   (   )":printspc(24)"{up}{cyn}astral:   (   )
21 printspc(24)"{lred}ang.:   {grn}ver.:":printspc(24)"{up}{pur}str.:   {yel}ges.:
22 printspc(24)"{gry3}klg.:   {lblu}cha.:":printspc(24)"{up}{lgrn}erf.:      (  )
23 printspc(24)"{yel}goldstck.:":printspc(24)"{up}{orng}nahr.vorrat:
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
128 ifu$="k"goto240
129 ifu$="w"thenprint"waffe{home}":goto191
130 ifu$="r"thenprint"rüstung{home}":goto191
131 ifu$="i"thenprint"inventur{home}":goto191
190 print"wie bitte..?{home}":goto100
191 sys5681:print"{yel}mach das{home}":sys5681:print"draussen!{home}":goto100
200 print"warten...{home}":goto100
210 print"norden{home}":j=peek(881):ifj=18goto2500
211 ifj<6orj=9or(j>11andj<119)goto214
212 pokep,q:q=j:y=y-1:goto6100
214 sys5681:print"{lred}blockiert!{home}":sys5681:goto100
220 print"süden{home}":j=peek(903):ifj<6orj=9or(j>11andj<119)goto214
222 pokep,q:q=j:y=y+1:goto6100
230 print"westen{home}":j=peek(891):ifj<6orj=9or(j>11andj<119)goto214
232 pokep,q:q=j:x=x-1:goto6100
234 print"osten{home}":j=peek(893):ifj<6orj=9or(j>11andj<119)goto214
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
261 ifj=17thenh=5
262 ifj=16thenh=2:ifx>19thenh=3
279 ifh=.thenprint"{lred}keine antwort!{home}":sys5681:goto100
280 sys5681:print"{cyn}du sprichst{home}":sys5681:ifh=1thenprint"eine wache ";
281 ifh=2orh=3thenprint"einen feuer-{home}":sys5681:print"teufel ";
287 ifh=5thenprint"den feuerdämon{home}":sys5681:print"fulgar ";
297 print"an.{home}":ifh=5goto2000
298 ifrnd(ti)<.5goto400
299 goto820
400 gosub900:ifrnd(ti)<.05thenprint" {home}":goto880
401 ifh=1andn$="waec"goto1000
402 ifh=1andn$="burg"goto1001
403 ifn$="gold"goto1016
404 ifh=2andn$="burg"goto1020
405 ifh=3andn$="feue"goto1110
406 ifh=3andn$="stal"goto1100
407 ifn$="feue"orn$="fulg"thenifpeek(49359)=.goto1030
408 ifh=3andn$="reit"andpeek(7153)=18goto1120
413 ifn$="name"thenprint"?{home}":goto820
414 ifn$="beru"goto860
415 ifn$="fick"orn$="piss"ormid$(n$,2)="otz"orn$="arsc"orn$="porn"goto449
420 ifn$="wied"thenprint"ersehen.{home}":goto880
421 ifn$="gesu"thenprint"ndheit?{home}":goto840
441 print" {home}":gosub800:print"dazu kann{home}":sys5681:print"ich dir nichts{home}":sys5681
442 print"sagen.%{home}
443 goto400
449 print" {home}":gosub800:print"du bist ein{home}":sys5681:print"altes ferkel!%{home}":goto400
800 gosub999:print"{yel}der ";
801 ifh=1thenprint"wächter{home}
802 ifh=2orh=3thenprint"feuerteufel{home}
810 ifh=5thenprint"feuerdämon{home}
819 sys5681:print"sagt:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"ich bin ";:ifh=1thenprint"ein{home}":sys5681:print"wächter";
821 ifh=2thensys5681:print"f'gor";
822 ifh=3thensys5681:print"n'lar";
839 print".%{home}":goto400
840 gosub800:ifh=1thenprint"ausgezeichnet,{home}":sys5681:print"danke";
841 ifh=2orh=3thenprint"ganz gut";
859 goto839
860 print"f?{home}":ifh=1goto820
862 gosub800:ifh=2thenprint"ich bin der";:sys5681:print"burgverwalter";
863 ifh=3thenprint"ich bin der{home}":sys5681:print"stallknecht";
879 goto839
880 gosub800:ifh=1thenprint"ich muss weiter{home}":sys5681:print"wache schieben";
881 ifh=3orh=2thenprint"feuer erhelle{home}":sys5681:print"deinen weg";
897 print".%{home}":sys5681:sys5681
898 print"{yel}er wendet sich{home}":sys5681:print"ab.{home}":sys5681:goto100
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
1000 print"hter{home}":gosub800:print"ich bewache die{home}":sys5681:print"burg.%{home}":goto400
1001 print" ":gosub800:print"das hier ist{home}":sys5681:print"die burg des{home}
1002 sys5681:print"mächtigen{home}":sys5681:print"feuerdämons{home}
1003 sys5681:print"fulgar.{home}":gosub960:print"stehst du in{home}":sys5681:print"seinem dienst?";
1004 gosub970:ifu$="n"thenprint"melde dich beim{home}":sys5681:print"burgverwalter.%{home}":goto400
1005 print"dann geh rasch{home}":sys5681:print"zu ihm und er-{home}
1006 sys5681:print"statte bericht.%{home}":goto400
1016 print" {home}":gosub800:print"ja, gold hätte{home}";:sys5681:print"ich auch gern!%{home}":goto400
1020 print" {home}":gosub800:print"dies ist die{home}":sys5681:print"burg des{home}
1022 sys5681:print"feuerdämons{home}":sys5681:print"fulgar.%{home}":goto400
1030 print" {home}":gosub800:print"fulgar mag{home}":sys5681:print"wohl bei den{home}
1032 sys5681:print"menschen einen{home}":sys5681:print"schlechten ruf{home}
1034 sys5681:print"haben, vor allem{home}":sys5681:print"wegen der in{home}
1036 sys5681:print"letzter zeit{home}":sys5681:print"maraudierenden{home}
1038 sys5681:print"feuerechsen.{home}":gosub960:print"aber lass mich{home}
1040 sys5681:print"dir folgendes{home}":sys5681:print"erklären.{home}
1042 gosub960:print"fulgar wird{home}":sys5681:print"zwar feuerdämon{home}
1043 sys5681:print"genannt, aber{home}":sys5681:print"das ist eigent-{home}
1044 sys5681:print"lich nicht ganz{home}":sys5681:print"richtig. er ist{home}
1045 sys5681:print"ein elementar-{home}":sys5681:print"wesen, nämlich{home}
1046 sys5681:print"das des feuers.{home}":gosub960:print"wir, seine die-{home}
1047 sys5681:print"ner, die feuer-{home}":sys5681:print"teufel, sind in{home}
1048 sys5681:print"wirklichkeit{home}":sys5681:print"auch elementar-{home}
1049 sys5681:print"geister, aber{home}":sys5681:print"niederer stufe.{home}
1050 gosub960:print"zu den menschen{home}":sys5681:print"hat fulgar ein{home}
1051 sys5681:print"eher neutrales{home}":sys5681:print"verhältnis, das{home}
1052 sys5681:print"heisst, er küm-{home}":sys5681:print"mert sich nicht{home}
1053 sys5681:print"um sie, sondern{home}":sys5681:print"geht seinen{home}
1054 sys5681:print"interessen nach,{home}":sys5681:print"die den menschen{home}
1055 sys5681:print"nicht schaden.{home}":gosub960:print"die feuerechsen{home}
1056 sys5681:print"werden von dem{home}":sys5681:print"erzdämon, der{home}
1057 sys5681:print"den kristall{home}":sys5681:print"zerstört hat,{home}
1058 sys5681:print"gegen die men-{home}":sys5681:print"schen gehetzt.{home}
1059 sys5681:print"dies ärgert ful-{home}":sys5681:print"gar, da wir hohe{home}
1060 sys5681:print"verluste an den{home}":sys5681:print"echsen haben.{home}
1061 gosub960:print"aber fulgar{home}":sys5681:print"stört das böse{home}
1062 sys5681:print"sonst nicht{home}":sys5681:print"weiter, und er{home}
1063 sys5681:print"geht nicht da-{home}":sys5681:print"gegen vor. er{home}
1064 sys5681:print"hat auch andere{home}":sys5681:print"probleme. des-{home}
1065 sys5681:print"halb hat er nach{home}":sys5681:print"dir geschickt.{home}
1066 gosub960:print"du bist der{home}":sys5681:print"erste mensch,{home}
1067 sys5681:print"dem er elaubt,{home}":sys5681:print"seine burg zu{home}
1068 sys5681:print"betreten.{home}":gosub960:print"er hat einen{home}":sys5681:print"auftrag für{home}
1069 sys5681:print"dich, für dessen{home}":sys5681:print"erledigung er{home}
1070 sys5681:print"dich bestimmt{home}":sys5681:print"mit etwas be-{home}
1071 sys5681:print"lohnt, was dir{home}":sys5681:print"im kampf gegen{home}
1072 sys5681:print"das böse hilft.{home}":sys5681:print"fulgar ist sehr{home}
1074 sys5681:print"grosszügig.{home}":gosub960:print"und nun geh zu{home}
1075 sys5681:print"ihm. er erwar-{home}":sys5681:print"tet dich schon.%{home}":goto400
1100 print"lknecht{home}":gosub800:print"ich kümmere{home}":sys5681:print"mich um die{home}
1102 sys5681:print"feuerechsen.%{home}":goto400
1110 print"rechsen{home}":gosub800:print"wir züchten sie{home}":sys5681:print"als reittiere.%{home}":goto400
1120 print"tiere{home}":gosub800:print"ja, normaler-{home}":sys5681:print"weise sind sie{home}
1122 sys5681:print"sehr zahm und{home}":sys5681:print"gehorsam. fulgar{home}
1124 sys5681:print"reitet immer das{home}":sys5681:print"albino in der{home}
1126 sys5681:print"mittleren box.{home}":gosub960:print"entschuldige{home}
1128 sys5681:print"mich, ich habe{home}":sys5681:print"viel zu tun";:goto897
2000 gosub800:print"sei willkommen,{home}":sys5681:print"              {home}
2002 fori=0to12:j=peek(49211+i):poke1968+i,j:ifj<>32thennext
2004 poke1968+i,33:sys5681:ifpeek(49359)goto2200
2010 print"ich habe schon{home}":sys5681:print"viel von dir ge-{home}":sys5681:print"hört und dich{home}
2012 sys5681:print"bereits erwar-{home}":sys5681:print"tet.{home}
2014 gosub960:print"und nicht nur{home}":sys5681:print"erwartet, son-{home}
2016 sys5681:print"sogar nach dir{home}":sys5681:print"geschickt. hast{home}
2018 sys5681:print"du meinen diener{home}":sys5681:print"t'kul in mubrak{home}
2020 sys5681:print"getroffen?";:gosub970:ifu$="j"goto2040
2022 print"hm, nicht weiter{home}":sys5681:print"schlimm, aber{home}":sys5681:print"du musst ihn{home}
2024 sys5681:print"noch aufsuchen,{home}":sys5681:print"falls du meinen{home}
2026 sys5681:print"auftrag an-{home}":sys5681:print"nimmst. er hat{home}
2028 sys5681:print"einen eichen-":sys5681:print"dolch, den du{home}
2030 sys5681:print"brauchst. lass":sys5681:print"dir ihn geben.%{home}":goto2100
2040 print"gut, dann weisst{home}":sys5681:print"du ja, dass ich{home}
2042 sys5681:print"einen auftrag{home}":sys5681:print"für dich habe.{home}":gosub960
2043 sys5681:print"dazu benötigst{home}
2044 sys5681:print"du aber den{home}":sys5681:print"eichendolch.{home}
2045 sys5681:print"hat t'kul ihn{home}":sys5681:print"dir gegeben?";:gosub970
2046 ifu$="j"thenprint"gut.{home}":goto2100
2050 print"dieser blöde{home}":sys5681:print"idiot. ich habe{home}":sys5681
2052 print"ihm extra ge-{home}":sys5681:print"sagt, er soll{home}":sys5681:print"ihn dir geben,{home}
2054 sys5681:print"aber der trottel{home}":sys5681:print"hatte wohl{home}
2056 sys5681:print"nur die spiel-{home}
2058 sys5681:print"hölle im kopf.{home}":gosub960:print"geh' noch einmal{home}
2060 sys5681:print"zu ihm und{home}":sys5681:print"verlange den{home}
2062 sys5681:print"eichendolch.{home}
2100 gosub960:print"mein auftrag für{home}":sys5681:print"dich lautet:{home}
2102 sys5681:print"geh in die burg{home}";:sys5681:print"des vampirgrafen{home}
2104 sys5681:print"kroloc, die in-{home}";:sys5681:print"mitten der to-{home}
2106 sys5681:print"dessümpfe liegt,";:sys5681:print"und töte den{home}
2108 sys5681:print"grafen kroloc.";:gosub960:print"ich bin mit{home}
2110 sys5681:print"diesem vampir-";:sys5681:print"fürsten bis zum{home}
2112 sys5681:print"tod verfeindet.{home}":sys5681:print"wenn du ihn tö-{home}
2114 sys5681:print"test, wäre das{home}":sys5681:print"auch ein vorteil{home}
2116 sys5681:print"für die men-{home}":sys5681:print"schen.{home}
2120 gosub960:print"ich könnte ihn{home}":sys5681:print"mit etwas{home}":sys5681:print"aufwand auch{home}
2122 sys5681:print"selbst töten,{home}":sys5681:print"aber als ein{home}
2124 sys5681:print"wesen des feuers{home}":sys5681:print"sind mir diese{home}
2126 sys5681:print"ekelhaften{home}":sys5681:print"sümpfe einfach{home}
2128 sys5681:print"zu nass.{home}":gosub960:print"die burg des{home}
2130 sys5681:print"grafen ist ein{home}":sys5681:print"dreistöckiges,{home}
2132 sys5681:print"halbzerfallenes{home}":sys5681:print"gewirr von gän-{home}
2134 sys5681:print"gen, das von{home}":sys5681:print"fallen und den{home}
2136 sys5681:print"schergen des{home}":sys5681:print"grafen wimmelt.{home}
2140 gosub960:print"der graf bewohnt{home}":sys5681:print"eine art gruft{home}
2142 sys5681:print"oberhalb des{home}":sys5681:print"dritten stocks.{home}
2144 sys5681:print"er beherrscht{home}":sys5681:print"die schwarze{home}
2146 sys5681:print"kunst und kann{home}":sys5681:print"nur mit dem{home}
2148 sys5681:print"eichendolch{home}":sys5681:print"vernichtet{home}
2150 sys5681:print"werden.{home}":gosub960:print"der dolch ist{home}
2151 sys5681:print"aus dem holz{home}":sys5681:print"seines sarges{home}
2152 sys5681:print"und wirkt nur{home}
2153 sys5681:print"gegen kroloc.{home}":sys5681:print"nimmst du den{home}
2154 sys5681:print"auftrag an?";:gosub970
2156 ifu$="n"thenprint"du elender{home}":sys5681:print"feigling";:goto897
2158 print"mein segen be-{home}":sys5681:print"gleitet dich";:goto897
2200 ifpeek(49348)goto2290
2202 print"herzlichen{home}";:sys5681:print"glückwunsch,{home}":sys5681:print"du hast kroloc{home}
2204 sys5681:print"vernichtet!{home}":gosub960:print"zum dank möchte{home}
2206 sys5681:print"ich dir etwas{home}":sys5681:print"ganz besonderes{home}":sys5681
2208 print"schenken.%{home}":gosub960:print"{yel}er zieht sich{home}":sys5681:print"einen ring von{home}
2210 sys5681:print"seinem finger{home}":sys5681:print"und reicht ihn{home}":sys5681
2212 print"dir.{home}":gosub960:gosub800:print"dies ist ein{home}":sys5681:print"feuerring. er{home}
2214 sys5681:print"erlaubt seinem{home}":sys5681:print"träger, flüssige{home}
2216 sys5681:print"lava sicher zu{home}":sys5681:print"durchqueren.{home}
2218 gosub960:print"du bist der ers-{home}":sys5681:print"te mensch, der{home}
2220 sys5681:print"so einen ring{home}":sys5681:print"bekommt. leider{home}
2222 poke49348,1:sys5681:print"schützt er nur{home}":sys5681:print"vor lava, nicht{home}
2224 sys5681:print"vor sonstigem{home}":sys5681:print"feuer.{home}
2226 gosub960:print"genügt er dir{home}":sys5681:print"als belohnung?";:gosub970
2228 ifu$="j"thenprint"nutze ihn gut";:goto897
2230 print"du bist dreist,{home}";:sys5681:print"aber ich bin{home}":sys5681:print"grosszügig.{home}
2232 sys5681:print"du sollst auch{home}";:sys5681:print"materiell be-{home}
2234 sys5681:print"lohnt werden.{home}";:sys5681:print"genügen dir 500{home}
2236 sys5681:print"goldstücke?";:gosub970
2238 ifu$="j"thenz=-500:gosub9004:sys5681:print"{lgrn}bitte sehr";:goto897
2240 print"jetzt reicht es!{home}":sys5681:print"du bist viel zu{home}":sys5681:print"unverschämt!{home}
2242 sys5681:print"nun bekommst du{home}":sys5681:print"gar kein gold";:goto897
2290 ifpeek(49161)<255goto2400
2300 print"fühl' dich in{home}":sys5681:print"meiner burg wie{home}":sys5681:print"zu hause";:goto897
2400 print"ich bin etwas{home}":sys5681:print"sauer auf dich,{home}
2410 sys5681:print"weil du ohne zu{home}";:sys5681:print"fragen, meine{home}
2412 sys5681:print"feuerechse ge-{home}";:sys5681:print"nommen hast.{home}
2414 gosub960:print"aber schön, ich{home}";:sys5681:print"leihe sie dir,{home}
2416 sys5681:print"solange, wie du{home}";:sys5681:print"das böse be-{home}
2418 sys5681:print"kämpfst, da ich{home}";:sys5681:print"wegen der beein-{home}
2420 sys5681:print"flussung meiner{home}";:sys5681:print"echsen groll{home}
2422 sys5681:print"gegen das böse{home}";:sys5681:print"hege.{home}
2426 gosub960:print"ich bekomme mein{home}";:sys5681:print"reittier ja auf{home}
2428 sys5681:print"alle fälle wie-{home}
2430 sys5681:print"der.{home}":gosub960:print"wenn das{home}
2432 sys5681:print"böse dich zer-{home}":sys5681:print"quetscht hat,{home}
2434 sys5681:print"findet sie schon{home}":sys5681:print"wieder zurück";:goto897
2500 poke892,11:sys4361:y=y-1:poke49157,5:poke7153,11
2502 sys5681:print"{yel}du schwingst{home}":sys5681:print"dich auf den{home}
2504 sys5681:print"{yel}rücken der{home}":sys5681:print"feuerechse!{home}":sys5681:fori=0to8
2506 forj=0to180:next:ifi/4=int(i/4)thensys6041:pokes+5,160:pokes+1,5:pokes+4,129
2510 y=y+1:poke2,x:poke182,y:sys6052:sys4482:poke892,18:sys4361
2520 next:goto6000
3300 print"{left}  {home}":sys5681:print"{yel}möchtest du{home}":sys5681:print"die feuerburg{home}
3301 sys5681:print"verlassen?";:gosub970:ifu$="n"theny=y-1:goto100
6000 sys5681:print"{lred}du verlässt{home}":sys5681:print"die burg.{home}
6010 fori=0to999:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
6020 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:poke2,0:new
6100 pokes+4,0:pokes+5,16:pokes+1,12:pokes+4,129:goto100
6200 poke892,22:sys5681:print"{lred}heisse lava{home}":sys5681:print"verbrennt dich!{home}
6210 sys5681:sys4361:sys6041:pokes+5,10:pokes+4,129:hp=hp-30:ifhp<1thenhp=.
6215 poke49231,hp/256:poke49230,hp-256*peek(49231)
6220 fori=0to60:pokes+1,130*rnd(ti):next:poke892,27:ifhp=.goto6300
6230 ifu$="@"theny=y+1
6232 ifu$="/"theny=y-1
6234 ifu$=":"thenx=x+1
6236 ifu$=";"thenx=x-1
6240 gosub10000:sys4361:q=peek(6144+x+35*y):goto6100
6300 poke892,10:sys4361:print"{home}"spc(72)"{lgrn}{down}00":sys5681:print"{wht}{$b0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$ae}{home}
6302 sys5681:print"# {yel}du bist tot! {wht}#{home}":sys5681:print"{wht}{$ad}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$c0}{$bd}{home}
6304 fori=0to3e3:next:fori=0to150:poke832+121*rnd(ti),20:sys4361:next
6306 poke2,20:sys5782:sys4361:fori=0to3e3:next:sys5681:sys5681
6310 print"{yel}oder doch nicht?{home}":fori=1to3e3:next:sys5681:sys5681
6312 print"du fühlst eine{home}";:sys5681:print"starke magie...{home}
6314 sys6041:pokes+5,12:k=5:pokes+4,33:fori=0to80step5:k=11-k
6316 poke53281,k:poke53280,k:forj=itoi+10step2:pokes+1,j:nextj,i
6320 poke53281,0:poke53280,0:poke49230,30:sys5681:sys5681
6322 print"{lred}die magie des{home}":sys5681:print"feuerdämons{home}":sys5681:print"rettet dich.{home}"
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
