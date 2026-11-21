1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454:i=rnd(-ti)
5 dimw$(26):fori=0to26:readw$(i):next:gosub11000
6 poke51206,1:dima(3),p(3),q(3),h(3):fori=0to3:reada(i),p(i),q(i),h(i):next:goto20
7 fori=0to3:j=int(4*rnd(ti)):k=p(i)+a(j):z=peek(k):ifk=6144+x+35*ygoto9
8 ifz=3orz=8orz=11thenifk<7400thenpokep(i),q(i):p(i)=k:q(i)=z:pokep(i),h(i)
9 next:return
20 print"{home}{down}{down}"spc(24)"{lgrn}vital.:   (   )":printspc(24)"{up}{cyn}astral:   (   )
21 printspc(24)"{lred}att.:   {grn}par.:":printspc(24)"{up}{pur}str.:   {yel}ges.:
22 printspc(24)"{gry3}klg.:   {lblu}cha.:":printspc(24)"{up}{lgrn}erf.:      (  )
23 printspc(24)"{yel}goldstck.:":printspc(24)"{up}{orng}nahr.vorrat:
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
279 ifh=.thenprint"{lred}keine antwort!{home}":sys5681:goto100
280 sys5681:print"{cyn}du sprichst{home}":sys5681:ifh=1thenprint"eine wache ";
281 ifh=2thenprint"den rüstungs-{home}":sys5681:print"macher ";
282 ifh=3thenprint"den waffen-{home}":sys5681:print"schmied ";
283 ifh=4thenprint"einen heiler{home}":sys5681
284 ifh=5thenprint"einen koch{home}":sys5681
285 ifh=6thenprint"einen mann{home}":sys5681
286 ifh=7thenprint"einen bettler{home}":sys5681
287 ifh=8thenprint"einen croupier{home}":sys5681
288 ifh=13thenprint"ein leichtes{home}":sys5681:print"mädchen ";
289 ifh=15thenprint"eine kellnerin{home}":sys5681
291 ifh=14thenprint"eine alte frau{home}":sys5681
292 ifh=9thenprint"einen zuberer{home}":sys5681
293 ifh=10thenprint"einen druiden{home}":sys5681
294 ifh>8andh<8.5thenprint"einen spieler{home}":sys5681
295 ifh=8.5thenprint"einen feuer-{home}":sys5681:print"teufel ";
296 ifh=8.8thenprint"einen krieger{home}":sys5681
297 print"an.{home}":ifpeek(49352)goto1200
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
411 ifh=6andn$="peep"goto1100
412 ifh=7andn$="bett"andpeek(49350)=.goto1120
413 ifn$="name"thenprint"?{home}":goto820
414 ifn$="beru"goto860
415 ifn$="fick"orn$="piss"ormid$(n$,2)="otz"orn$="arsc"orn$="porn"goto499
416 ifh=15andn$="kell"goto1140
417 ifh=15andn$="kopf"goto1150
419 ifh=8andn$="crou"goto4000
420 ifn$="wied"thenprint"ersehen.{home}":goto880
421 ifn$="gesu"thenprint"ndheit?{home}":goto840
422 ifh=7andn$="bett"thenprint"ler{home}":gosub800:goto1125
423 ifh=7andn$="floe"andpeek(49350)=.goto1130
424 ifh=9andn$="zaub"goto3000
425 ifh=9andn$="adep"goto3010
426 ifh=9andn$="tafe"goto3030
427 ifh=9andn$="gift"goto3020
428 ifh=10andn$="drui"goto3100
429 ifh=10andn$="helf"goto3110
430 ifh=10andn$="tafe"goto3120
431 ifh=10thenifn$="boes"orn$="spli"orn$="kris"orn$="glei"orn$="umst"goto3130
432 ifh=13andn$="koer"goto1050
433 ifh=13andn$="helf"goto1060
434 ifh=8.1andn$="spie"goto1160
435 ifh=8.1andn$="plei"andpeek(49354)=.goto1162
436 ifh=8.2andn$="spie"goto1180
437 ifh=8.3andn$="spie"goto1185
438 ifh=8.3andn$="geld"goto1187
439 ifh=14andn$="gift"goto1070
440 ifh=8andn$="spie"goto4010
441 ifh=14andn$="domi"goto1072
442 ifh=8.5andn$="eich"andpeek(49349)=.goto1210
443 ifh=8.5andn$="dien"goto860
444 ifh=8.5andn$="fulg"goto1220
445 ifh=8.8andn$="krie"goto1300
446 ifh=8.8andn$="elit"goto1310
447 ifh=8.8andn$="ries"goto1320
448 ifh=8.8thenifn$="shei"orn$="prin"goto1340
449 ifh=3andn$="blas"goto2200
497 print" {home}":gosub800:print"dazu kann{home}":sys5681:print"ich dir nichts{home}":sys5681
498 print"sagen.%{home}":goto400
499 print" {home}":gosub800:print"du bist ein{home}":sys5681:print"altes ferkel!%{home}":goto400
800 gosub999:print"{yel}der ";:ifh>12thenprint"{left}{left}{left}ie ";:ifh=13thenprint"{left}{left}{left}as ";
801 ifh=1thenprint"wächter{home}
802 ifh=2thenprint"rüstungs-{home}":sys5681:print"macher{home}
803 ifh=3thenprint"waffen-{home}":sys5681:print"schmied{home}
804 ifh=4thenprint"heiler{home}
805 ifh=5thenprint"koch{home}
806 ifh=6thenprint"mann{home}
807 ifh=7thenprint"bettler{home}
808 ifh=8.8thenprint"krieger{home}
810 ifh=9thenprint"zauberer{home}
811 ifh=10thenprint"druide{home}
812 ifh=14thenprint"alte{home}
813 ifh=13thenprint"mädchen{home}
814 ifh=8thenprint"croupier{home}
815 ifh=15thenprint"kellnerin{home}
816 ifh>8andh<8.5thenprint"spieler{home}
817 ifh=8.5thenprint"feuerteufel{home}
819 sys5681:print"sagt:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"ich bin ";:ifh=1thenprint"ein{home}":sys5681:print"wächter";
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
840 gosub800:ifh=1orh=8.2thenprint"ausgezeichnet,{home}":sys5681:print"danke";
841 ifh=2orh=3thenprint"ganz gut";
843 ifh=4thenprint"ich fühle mich{home}":sys5681:print"natürlich wohl";
844 ifh=5thenprint"mir ist heiss";
845 ifh=6orh=9orh=8.2thenprint"geht so";
846 ifh=7thenprint"ich habe{home}":sys5681:print"hunger";
849 ifh=8orh=8.3thenprint"es geht{home}":sys5681:print"mir gut";
850 ifh=13thenprint"das geschäft{home}":sys5681:print"läuft gut";
851 ifh=15thenprint"ich habe{home}":sys5681:print"kopfschmerzen";
852 ifh=14thenprint"das rheuma{home}":sys5681:print"plagt mich";
853 ifh=10thenprint"den umständen{home}":sys5681:print"entsprechend";
855 ifh=8.1thenprint"ich bin{home}":sys5681:print"pleite";
856 ifh=8.5thenprint"mir ist kalt";
857 ifh=8.8thenprint"beschissen";
859 goto839
860 print"f?{home}":ifh=1goto820
862 gosub800:ifh=2thenprint"ich fertige";:sys5681:print"rüstungen";
863 ifh=3thenprint"ich mache und{home}":sys5681:print"handle mit";:sys5681:print"waffen";
864 ifh=5thenprint"ich bereite das{home}":sys5681:print"essen";
865 ifh=6thenprint"ich leite diese{home}":sys5681:print"peep show";
866 ifh=7thenprint"ich bin ein{home}":sys5681:print"bettler";
867 ifh=4thenprint"ich bin ein{home}":sys5681:print"heiler";
868 ifh=9thenprint"ich bin ein{home}":sys5681:print"zauberer";
869 ifh=10thenprint"ich bin ein{home}":sys5681:print"druide";
870 ifh=15thenprint"ich bin die{home}":sys5681:print"kellnerin";
871 ifh=14thenprint"ich bin ein{home}":sys5681:print"kräuterweib";
872 ifh=13thenprint"ich verkaufe{home}":sys5681:print"meinen körper";
873 ifh=8.8thenprint"ich bin ein{home}":sys5681:print"krieger";
874 ifh=8thenprint"ich bin der{home}":sys5681:print"croupier";
875 ifh>8andh<8.5thenprint"ich bin ein{home}":sys5681:print"spieler";
876 ifh=8.5thenprint"ich bin ein{home}":sys5681:print"diener fulgars";
879 goto839
880 gosub800:ifh=1thenprint"ich muss weiter{home}":sys5681:print"wache schieben";
881 ifh=3orh=2thenprint"beehre mich{home}":sys5681:print"bald wieder";
882 ifh=4thenprint"halte dich{home}":sys5681:print"immer gesund";
883 ifh=5thenprint"hau 'rein";
884 ifh=6thenprint"guck doch mal";
885 ifh=7thenprint"hab' mitleid";
886 ifh=15orh=8.5thenprint"tschüs";
887 ifh>8andh<8.5thenprint"viel glück";
888 ifh=10thenprint"das licht sei{home}":sys5681:print"mit dir";
889 ifh=8.8thenprint"lebe wohl";
890 ifh=13thenprint"adieu, cherie";
892 ifh=14orh=9thenprint"möge die magie{home}":sys5681:print"mit dir sein";
896 ifh=8thenprint"pech im spiel,{home}":sys5681:print"glück in der{home}":sys5681:print"liebe";
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
1001 print"t":gosub800:print"das hier ist{home}":sys5681:print"mubrak, die{home}
1002 sys5681:print"unabhängige{home}":sys5681:print"stadt.";:ifpeek(7385)<>21goto400
1003 print" willst du{home}":sys5681:print"hinein?";:gosub970
1004 ifu$="n"thenprint"dann bleibst du{home}":sys5681:print"eben draussen";:goto897
1005 print"wer hier herein{home}":sys5681:print"will, muss aber{home}
1006 sys5681:print"steuern zahlen,{home}":sys5681:print"die wir für die{home}
1007 sys5681:print"instandhaltung{home}":sys5681:print"der stadt benö-{home}
1008 sys5681:print"tigen. siehst du{home}":sys5681:print"das ein?";:gosub970:ifu$="n"goto1004
1009 z=50:gosub9000:sys5681:print"{lgrn}danke, dein{home}":sys5681:print"weg ist frei";
1010 poke7385,8:poke7386,8:poke7384,21:poke7387,21
1011 sys6041:pokes+5,16:pokes+1,12:pokes+4,129:goto897
1012 sys5681:sys5681:print"der mindestein-{home}":sys5681:print"satz sind fünf{home}
1013 sys5681:print"goldstücke.{home}":goto4100
1016 print" {home}":gosub800:print"ja, gold hätte{home}";:sys5681:print"ich auch gern!%{home}":goto400
1030 print"en{home}";:gosub800:print"ich kann dich{home}":sys5681:print"entgiften oder{home}":sys5681
1031 print"regenerieren.{home}":sys5681:print"was möchtest{home}":sys5681:print"du?%{home}":goto400
1032 print"iften{home}";:gosub800:z=4*peek(49245)-ch:ifz<2thenz=2
1033 gosub9000:poke49245,0:z=5
1034 pokes+5,201:pokes+12,201:pokes+11,129:pokes+4,17:k=5
1035 fori=5to255step5:pokes+1,i:pokes+8,i:k=z-k:poke53281,k:poke53280,k:next
1036 poke53281,0:poke53280,0:pokes+11,0:pokes+4,0:sys5681:ifh=12thengosub10000:goto400
1037 print"{lgrn}nun bist du{home}":sys5681:print"geheilt.%{home}":gosub10000:goto400
1038 print"nerieren{home}";:gosub800:z=80-4*(ch-su):ifz<10thenz=10
1039 gosub9000:poke49230,peek(49232):poke49231,peek(49233):z=18:goto1034
1040 print"n{home}":gosub800:print"die pommesbude{home}":sys5681:print"braucht zwar{home}
1041 sys5681:print"dringend einen{home}":sys5681:print"ölwechsel, aber{home}
1042 sys5681:print"möchtest du{home}":sys5681:print"trotzdem{home}":sys5681:print"10 rationen?";
1043 gosub970:ifu$="n"thenprint"dann lass es.%{home}":goto400
1044 z=15-int(ch/1.5):gosub9000:sys5681:na=na+10:ifna>250thenna=250
1045 poke49244,na:gosub10000:sys5681:print"{lgrn}noch mehr?";:goto1043
1050 print"per{home}":gosub800:print"darüber möchte{home}":sys5681:print"ich nun wirklich{home}
1051 sys5681:print"nicht sprechen.{home}":gosub960:print"aber mal was an-{home}
1052 sys5681:print"deres: ich habe{home}":sys5681:print"gehört, dass du{home}
1053 sys5681:print"von einer ande-{home}":sys5681:print"ren welt kommst{home}
1054 sys5681:print"und uns retten{home}":sys5681:print"willst, stimmt{home}
1055 sys5681:print"das?";:gosub970:ifu$="n"thenprint"dann hau ab";:goto897
1056 sys5681:print"dann kann ich{home}":sys5681:print"dir vielleicht{home}
1057 sys5681:print"helfen.%{home}":goto400
1060 print"en{home}":gosub800:print"ein druide, der{home}":sys5681:print"bei mir war, hat{home}
1061 sys5681:print"mir etwas{home}":sys5681:print"erzählt.{home}":gosub960:print"nur die druiden{home}
1062 sys5681:print"kennen die rich-{home}":sys5681:print"tige reihenfolge{home}
1063 sys5681:print"der tafeln mit{home}":sys5681:print"dem namen des{home}
1064 sys5681:print"bösen, die auf{home}":sys5681:print"die städte{home}
1065 sys5681:print"verteilt sind.{home}
1066 gosub960:print"frag die druiden{home}":sys5681:print"in den städten{home}
1067 sys5681:print"nach den{home}":sys5681:print"tafeln.%{home}":goto400
1070 print" der nacht{home}":gosub800:print"psst!{home}":fori=1to2e3:next:sys5681
1071 sys5681:print"sprich doch{home}":sys5681:print"leiser!{home}":fori=1to2e3:next:goto1090
1072 print"ck{home}":gosub800:print"für ganz beson-{home}":sys5681:print"dere kunden habe{home}
1073 sys5681:print"ich einen klei-{home}":sys5681:print"nen vorrat die-{home}
1074 sys5681:print"ser machtvollen{home}":sys5681:print"reagenz.{home}
1075 sys5681:print"möchtest du{home}":sys5681:print"etwas davon?";
1076 gosub970:ifu$="n"thenprint"wie du willst.%{home}":goto400
1077 print"ein pilz reicht{home}":sys5681:print"für vier zauber{home}":sys5681
1078 print"sprüche aus.{home}":z=10:sys5681:gosub9000:j=peek(49342)+4:ifj>99thenj=99
1079 poke49342,j:sys5681:print"{lgrn}gut, du hast{home}":sys5681:print"jetzt"j;
1080 sys5681:print"portionen. noch{home}":sys5681:print"mehr?";:goto1076
1090 sys5681:sys5681:print"wer hat dir das{home}":sys5681:print"erzählt?{home}":goto400
1100 print" show{home}":gosub800:print"heh, bist du{home}":sys5681:print"überhaupt schon{home}
1101 sys5681:print"achtzehn?";:gosub970:ifu$="n"thenprint"dann aber raus";:goto897
1102 print"sprich mal eine{home}":sys5681:print"der luken an{home}
1103 sys5681:print"der wand an und{home}":sys5681:print"wirf eine münze{home}
1104 sys5681:print"ein. dann wirst{home}":sys5681:print"du schon sehen.%{home}":goto400
1110 sys5681:print"{yel}willst du eine{home}":sys5681:print"münze ein-{home}
1111 sys5681:print"werfen?";:gosub970:ifu$="n"orgp=.goto100
1112 z=1:gosub9004:sys5681:print"{yel}zehn sekunden!{home}":fori=0to2:poke6248+x+i,11:next
1113 poke2,x:poke182,y:sys6052:sys4482:sys4537:sys4361:fori=0to2:poke6248+x+i,9:next
1114 fori=0to6e3:next:goto100
1120 print"ler{home}":gosub800:print"ich spiele{home}":sys5681:print"melodien auf{home}
1122 sys5681:print"meiner flöte und{home}":sys5681:print"hoffe, von den{home}
1123 sys5681:print"passanten ein{home}":sys5681:print"paar münzen zu{home}
1124 sys5681:print"bekommen.{home}":gosub960
1125 print"hast du ein{home}":sys5681:print"goldstück für{home}":sys5681:print"mich?";:gosub970
1126 ifu$="n"thenprint"geizhals";:goto897
1127 z=1:gosub9003:sys5681:print"{lgrn}ich danke dir.{home}":sys5681:print"frage doch den{home}
1128 sys5681:print"waffenschmied{home}":sys5681:print"mal nach einem{home}
1129 sys5681:print"blasrohr";:goto897
1130 print"te{home}":gosub800:print"is'n komisches{home}":sys5681:print"ding, so ganz{home}
1131 sys5681:print"aus glas, nich?{home}":gosub960:print"hat aber 'nen{home}":sys5681:print"guten klang.{home}
1132 sys5681:print"will'ze se{home}":sys5681:print"vielleicht{home}":sys5681:print"kaufen?";
1133 gosub970:ifu$="n"thenprint"hrmmpf!%{home}":goto400
1134 z=200:gosub9000:sys5681:print"{lgrn}bitte sehr.%{home}":poke49350,1:goto400
1140 print"nerin{home}":gosub800:print"blöde frage,{home}":sys5681:print"du wirsst doch{home}
1141 sys5681:print"wohl wissen, was{home}":sys5681:print"eine kellnerin{home}":sys5681:print"ist.{home}
1142 gosub960:print"ach, ";:goto844
1150 print"schmerzen{home}":gosub800:print"ja, der bettler{home}":sys5681:print"da draussen{home}
1151 sys5681:print"dudelt den gan-{home}":sys5681:print"zen tag auf sei-{home}
1152 sys5681:print"ner flöte herum.{home}":sys5681:print"es ist zum wahn-{home}
1153 sys5681:print"sinnig werden.{home}":gosub960:print"ist übrigens 'ne{home}
1154 sys5681:print"ganz merkwürdige{home}":sys5681:print"flöte. frag' ihn{home}
1155 sys5681:print"mal danach. ich{home}":sys5681:print"wette, die hat{home}
1156 sys5681:print"er gestohlen.%{home}":goto400
1160 print"ler{home}":gosub800:print"ich habe alles{home}":sys5681:print"verspielt. nun{home}
1161 sys5681:print"bin ich völlig{home}":sys5681:print"pleite.%{home}":goto400
1162 print"te{home}":gosub800:print"ich brauche{home}":sys5681:print"dringend geld.{home}
1163 sys5681:print"vielleicht{home}":sys5681:print"kannst du mir{home}
1164 sys5681:print"etwas geben.{home}":gosub960:print"oh, nicht um-{home}
1165 sys5681:print"sonst. ich habe{home}":sys5681:print"ein seltsames{home}
1166 sys5681:print"stück eisen, das{home}":sys5681:print"anderes eisen{home}
1167 sys5681:print"anzieht und das,{home}":sys5681:print"wenn man es auf-{home}
1168 sys5681:print"hängt, immer{home}":sys5681:print"nach norden{home}
1169 sys5681:print"zeigt. möchtest{home}":sys5681:print"du es haben?";:gosub970
1170 ifu$="n"thenprint"schade.%{home}":goto400
1171 z=150:gosub9000:sys5681:print"{lgrn}bitte sehr.%{home}":poke49354,1:goto400
1180 print"ler{home}":gosub800:print"spiel doch ein-{home}":sys5681:print"fach mal mit.{home}
1181 gosub960:print"quatsch einfach{home}":sys5681:print"den croupier{home}
1182 sys5681:print"über den tisch{home}":sys5681:print"hinweg an. er{home}
1183 sys5681:print"lässt dich{home}":sys5681:print"sicher sofort{home}
1184 sys5681:print"in das spiel{home}":sys5681:print"einsteigen.%{home}":goto400
1185 print"ler{home}":gosub800:print"ja, ich spiele,{home}":sys5681:print"weil ich vorhin{home}
1186 sys5681:print"viel geld ver-{home}":sys5681:print"dient habe.%{home}":goto400
1187 print" {home}":gosub800:print"sagst du es{home}":sys5681:print"auch nicht{home}":sys5681:print"weiter?";
1188 gosub970:ifu$="j"thenprint"dann sage ich{home}":sys5681:print"es nicht!%{home}":goto400
1189 print"ich habe tief in{home}":sys5681:print"den wäldern eine{home}":sys5681:print"ganze menge des{home}
1190 sys5681:print"pilzes 'gift der{home}":sys5681:print"nacht' gefunden{home}
1191 sys5681:print"und hier an die{home}":sys5681:print"kräutertante{home}
1192 sys5681:print"verkloppt.{home}":gosub960:print"frag sie danach,{home}
1193 sys5681:print"wenn du was{home}":sys5681:print"davon brauchst.{home}":goto400
1200 gosub800:print"du hast unsere{home}":sys5681:print"stadt an den{home}
1201 sys5681:print"könig verraten,{home}":sys5681:print"und da wagst du{home}
1202 sys5681:print"es noch, dich{home}":sys5681:print"hier blicken zu{home}
1203 sys5681:print"lassen?{home}":gosub960:print"verschwinde{home}
1204 sys5681:print"bloss von hier,{home}":sys5681:print"bevor wir dich{home}
1205 sys5681:print"erschlagen";:poke198,0:goto897
1210 print"endolch{home}":gosub800:print"oh, ich hatte{home}":sys5681:print"ganz vergessen,{home}
1211 sys5681:print"ihn dir zu{home}":sys5681:print"geben. hier hast{home}":sys5681:print"du ihn.%{home}
1212 poke49349,1:goto400
1220 print"ar{home}":gosub800:print"fulgar, mein{home}":sys5681:print"herr, hat mich{home}
1221 sys5681:print"beauftragt, den{home}":sys5681:print"zu suchen, der{home}
1222 sys5681:print"von einer ande-{home}":sys5681:print"ren welt kommt.{home}
1223 sys5681:print"bist du das{home}":sys5681:print"zufällig?";:gosub970:ifu$="n"goto1170
1224 sys5681:print"mein herr hätte{home}":sys5681:print"gern mit dir ge-{home}
1225 sys5681:print"sprochen. ich{home}":sys5681:print"glaube, er hat{home}
1226 sys5681:print"einen lohnenden{home}":sys5681:print"auftrag für{home}
1227 sys5681:print"dich. hast du{home}":sys5681:print"interesse?";:gosub970:ifu$="n"goto1170
1228 sys5681:print"geh zu fulgars{home}":sys5681:print"burg. sie liegt{home}
1229 sys5681:print"in den feuer-{home}":sys5681:print"bergen weit im{home}
1230 sys5681:print"nordosten.{home}":gosub960:print"du kannst sie{home}
1231 sys5681:print"nur erreichen,{home}":sys5681:print"wenn du mit dem{home}
1232 sys5681:print"schiff im süd-{home}":sys5681:print"osten der gros-{home}
1233 sys5681:print"sen steilküste{home}":sys5681:print"in der bucht der{home}
1234 sys5681:print"tausend riffe{home}":sys5681:print"anlandest.{home}
1235 gosub960:print"geh dann durch{home}":sys5681:print"das felsenlaby-{home}
1236 sys5681:print"rinth, bis du{home}":sys5681:print"seine burg{home}
1237 sys5681:print"findest. er wird{home}":sys5681:print"dir alles wei-
1238 sys5681:print"tere erklären.%{home}":goto400
1300 print"ger{home}":gosub800:print"ich war ange-{home}":sys5681:print"höriger einer{home}
1301 sys5681:print"elitetruppe.%{home}":goto400
1310 print"etruppe{home}":gosub800:print"die truppe{home}":sys5681:print"gibt es nicht{home}
1311 sys5681:print"mehr.{home}":gosub960:print"der könig hatte{home}":sys5681:print"uns ausgesandt,{home}
1312 sys5681:print"den riesenlind-{home}":sys5681:print"wurm zu töten.%{home}":goto400
1320 print"enlindwurm{home}":gosub800:print"es war furcht-{home}
1321 sys5681:print"bar. unsere leu-{home}":sys5681:print"te hatten keine{home}
1322 sys5681:print"chance gegen das{home}":sys5681:print"untier.
1323 gosub960:print"nur die berühmte{home}":sys5681:print"magische rüs-{home}
1324 sys5681:print"tung wäre stark{home}":sys5681:print"genug, seinem{home}
1325 sys5681:print"feuer zu wider-{home}":sys5681:print"stehen, und nur{home}
1326 sys5681:print"die berühmte{home}":sys5681:print"zauberschwinge{home}
1327 sys5681:print"könnte seine{home}":sys5681:print"schuppenhaut{home}
1328 sys5681:print"durchdringen.{home}":gosub960:print"leider sind{home}
1329 sys5681:print"diese waffen nur{home}":sys5681:print"eine legende. so{home}
1330 sys5681:print"wird die holde{home}":sys5681:print"prinzessin{home}
1332 sys5681:print"sheila wohl bald{home}":sys5681:print"vom drachen ge-{home}
1333 sys5681:print"tötet werden.%{home}":goto400
1340 print" ":gosub800:print"frag den könig{home}":sys5681:print"selbst danach.%{home}":goto400
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
2122 sys5681:print"{lgrn}bitte sehr!{home}":sys5681:j=peek(49336+k)+zz:ifj>99thenj=99
2123 poke49336+k,j:gosub9004:sys5681:print"{lgrn}du hast nun":sys5681:printmid$(str$(j),2);
2124 print" einheit.";:ifj>1thenprint"{left}en.{home}
2125 sys5681:print"noch eine?";:goto2120
2200 print"rohr":gosub800:ifpeek(49260)thenprint"hast du doch.%{home}":goto400
2210 print"aber das ist{home}":sys5681:print"doch verboten.%{home}":sys5681
2220 print"{yel}er flüstert:{home}":sys5681:print"{lgrn}%";:z=500:gosub9000:poke49260,1
2230 sys5681:print"{lgrn}hier, aber sag's{home}":sys5681:print"nicht weiter.%{home}":goto400
3000 print"erer{home}":gosub800:print"naja, eigent-{home}":sys5681:print"lich bin ich{home}
3001 sys5681:print"noch ein adept.%{home}":goto400
3010 print"t{home}":gosub800:print"ich übe den{home}":sys5681:print"gift und galle-{home}
3011 sys5681:print"zaberspruch.%{home}":goto400
3020 print" und galle{home}":gosub800:print"ein verbotener,{home}":sys5681:print"aber nützlicher{home}
3021 sys5681:print"kampfzauber.{home}":sys5681:print"kannst du{home}":sys5681:print"ihn?";:gosub970
3022 ifu$="j"thenprint"gut für dich.%{home}":goto400
3024 print"geh mal zum{home}":sys5681:print"schwarzen{home}":sys5681:print"zirkel.%{home}":goto400
3030 print"l{home}":gosub800:print"geh' mal in die{home}":sys5681:print"peep show. wenn{home}
3031 sys5681:print"du die luke{home}":sys5681:print"ganz rechts be-{home}
3032 sys5681:print"nutzt, siehst du{home}":sys5681:print"die tafel.%{home}":goto400
3100 print"de{home}":gosub800:print"wir druiden{home}":sys5681:print"wollen dir{home}
3101 sys5681:print"helfen.%{home}":goto400
3110 print"en{home}":gosub800:print"frage, was du{home}":sys5681:print"wissen willst.%{home}":goto400
3120 print"l{home}":gosub800:print"die erste tafel{home}":sys5681:print"findest du in{home}
3121 sys5681:print"gaht.%{home}":goto400
3130 print"...":gosub800:print"dazu kann dir{home}":sys5681:print"cerfax mehr{home}
3131 sys5681:print"sagen als ich.%{home}":goto400
3200 print"suchen";:fori=1to5:print".";:forj=.to400:nextj,i
3201 sys5681:print"{yel}du findest{home}":sys5681:print"nichts.{home}":goto100
3300 print"{left}  {home}":sys5681:print"{yel}möchtest du{home}":sys5681:print"die stadt mubrak{home}
3301 sys5681:print"verlassen?";:gosub970:ifu$="n"theny=y-1:goto100
3302 goto6000
4000 print"pier{home}":gosub800:print"ich leite hier{home}":sys5681:print"das spiel.%{home}":goto400
4010 print"l{home}":gosub800:print"wir spielen das{home}":sys5681:print"spiel 'teufel'.{home}
4011 sys5681:print"kennst du die{home}":sys5681:print"regeln?";:gosub970:ifu$="j"goto4100
4012 print"die regeln sind{home}":sys5681:print"eigentlich ganz{home}":sys5681:print"einfach:{home}":gosub960
4013 print"wir spielen mit{home}":sys5681:print"karten, die ei-{home}
4014 sys5681:print"nen wert zwi-{home}":sys5681:print"schen einem und{home}
4015 sys5681:print"sieben punkten{home}":sys5681:print"haben können.{home}
4016 gosub960:print"man bekommt am{home}":sys5681:print"anfang zwei kar-{home}
4017 sys5681:print"ten und kann{home}":sys5681:print"nach wunsch noch{home}
4018 sys5681:print"bis zu vier da-{home}":sys5681:print"zubekommen.{home}
4019 gosub960:print"ziel des spieles{home}":sys5681:print"ist es, dreizehn{home}
4020 sys5681:print"punkte (einen{home}":sys5681:print"satan) zu errei-{home}":sys5681:print"chen, oder so{home}
4021 sys5681:print"nahe wie möglich{home}":sys5681:print"an die dreizehn{home}
4022 sys5681:print"heranzukommen.{home}":gosub960:print"kommt man schon{home}
4023 sys5681:print"mit den ersten{home}":sys5681:print"beiden karten{home}
4024 sys5681:print"auf dreizehn,{home}":sys5681:print"hat man einen{home}
4025 sys5681:print"'teufel' und{home}":sys5681:print"gewinnt sofort.{home}
4026 gosub960:print"kommt man aber{home}":sys5681:print"über dreizehn{home}
4027 sys5681:print"punkte, heisst{home}":sys5681:print"es dann 'pfui,{home}
4028 sys5681:print"teufel', und das{home}":sys5681:print"spiel ist ver-{home}
4029 sys5681:print"loren.{home}":gosub960:print"der spieler legt{home}
4030 sys5681:print"vor, dann komme{home}":sys5681:print"ich. bei einem{home}
4031 sys5681:print"gleichstand ge-{home}":sys5681:print"winne ich. dafür{home}
4032 sys5681:print"hast du ja den{home}":sys5681:print"'teufel'.{home}
4033 gosub960:print"hast du alles{home}":sys5681:print"verstanden?";:gosub970:ifu$="n"goto4013
4100 sys5681:print"willst du ein{home}":sys5681:print"spielchen{home}":sys5681:print"wagen?";
4110 gosub970:ifu$="n"goto888
4120 print"wieviel willst{home}":sys5681:print"du setzen? {blu}00{left}{left}{wht}";
4122 getu$:ifu$<"0"oru$>"9"goto4122
4124 e=val(u$)*10:printu$;
4126 getu$:ifu$<"0"oru$>"9"goto4126
4128 e=e+val(u$):printu$"{lgrn}{home}":ife<5goto1012
4129 z=e:ife>gpthensys5681:print"hast du nicht!{home}":sys5681:goto4100
4130 gosub9004:fori=0to9:sys5681:next:printd$spc(24)"{lgrn}ich mische...{home}
4140 fori=77to99:sys6041:pokes+5,5:pokes+1,i:pokes+4,129:forj=0to9:nextj,i
4150 printd$spc(25)"{yel}{up}du:"d$spc(28)"{lgrn}gebe...  {home}
4160 z=.:p=.:k=.:fori=1to2:gosub5000:next
4170 ifp>13goto4400
4180 ifp=13andk=2goto4500
4190 ifp=13ork=6goto4300
4200 printd$spc(24)"{lgrn}noch eine? {wht}G{left}";
4210 getu$:ifu$<>"j"andu$<>"n"goto4210
4220 printu$;:ifu$="j"thengosub5000:goto4170
4300 printd$spc(24)"{yel}ich:        {home}":n=p:z=1:k=.:p=.:fori=1to2:gosub5000:next
4310 ifp>13thensys5681:goto4500
4320 ifp<nandk<6thengosub5000:goto4310
4330 sys5681:ifp<ngoto4500
4400 printd$spc(24)"{lred}du hast     {home}":sys5681:print"verloren!{home}
4405 poke56295,1:poke2023,71:poke198,0:wait198,1:poke198,0:poke2023,32
4410 sys5681:sys5681:print"deine"e"gold-{home}":sys5681:print"stücke sind weg!{home}
4420 sys5681:sys5681:print"{lgrn}noch einmal?";:gosub970:ifu$="n"goto888
4430 goto4120
4500 e=e+e:printd$spc(24)"{lgrn}du hast     {home}":sys5681:print"gewonnen!{home}
4505 poke56295,1:poke2023,71:poke198,0:wait198,1:poke198,0:poke2023,32
4510 sys5681:sys5681:print"du erhälst"e;:sys5681:print"goldstücke.{home}
4520 z=-e:gosub9004:goto4420
4999 end
5000 printleft$(d$,15+z+z)spc(25-z+k+k)"{gry3}{$b0}";:ifkthenprint"{left}X";
5010 print"{$c0}{$c0}{$c0}{$ae}{down}{left}{left}{left}{left}{left}";:forj=1to4:print"#{lblu};;;{gry3}#{down}{left}{left}{left}{left}{left}";:next:print"{$ad}";:ifkthenprint"{left}Y";
5020 print"{$c0}{$c0}{$c0}{$bd}{up}{up}{up}{up}{left}{left}{left}{left}";:sys6041:pokes+5,7:pokes+1,99:pokes+4,129:forj=0to250:next
5030 l=int(7*rnd(ti)+1):u$=mid$(str$(l),2)
5040 print"{wht}"u$" "u$"{down}{left}{left}{left}"mid$("{cyn}{pur}{grn}{yel}{orng}{lred}{lgrn}{lblu}",rnd(ti)*8+1,1);
5050 print"={rvon}5%{down}{left}{left}{left}{rvof}{$a2}{$ba}{rvon}&{rvof}{down}{left}{left}{left}{wht}"u$" "u$:p=p+l:k=k+1
5060 sys6041:pokes+5,5:pokes+1,66:pokes+4,129
5070 printleft$(d$,23+z)spc(28)"{yel}"p;:ifp=13thenprint"{left}, satan!";:ifk=2thenprint"{left}{left}{left}{left}{left}{left}teufel!{home}
5080 ifp>13thenfori=.to800:next:print"{left}{left}{left}{left}{left}{left}{left}{left}  pfui, teufel!{home}
5090 return
5999 end
6000 sys5681:print"{lred}du verlässt{home}":sys5681:print"die stadt.{home}
6010 fori=0to999:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
6020 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:poke2,0:new
6100 sys6041:pokes+5,16:pokes+1,12:pokes+4,129:goto100
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
11000 poke51208,12:poke51223,15:poke51211,2:poke51221,1:poke51209,15
11001 poke51228,8:poke51219,1:poke51217,8:poke52232,82:poke51976,82:poke51307,1
11002 poke52233,86:poke51977,86:poke52263,128:poke52007,127:poke51751,43
11003 poke51495,42:fori=0to3:poke51502+256*i,59:poke51488+256*i,59:poke650,255
11004 poke51544+256*i,184-(i>1):next:poke52340,217:poke51828,245:poke51225,1
11005 fori=.to3:poke51487+256*i,90+i:poke51499+256*i,226+i+144*(i>1):next
11006 poke51486,124:poke51742,126:d$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}":return
50000 datamesser,dolch,kurzschwert,handbeil,schwert,morgenstern,kampfstab
50001 databastardschwert,streitaxt,zweihänder,schleuder,kurzbogen,,langbogen
50002 dataarmbrust,,,,kleidung,waffenrock,lederrüstung,kettenhemd,schuppenpanzer
50003 dataritterrüstung,magische rüstung,kleiner schild,grosser schild
50100 data-35,6600,11,17,1,6720,3,17,35,6853,11,21,-1,6968,3,21
