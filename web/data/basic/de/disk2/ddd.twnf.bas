1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454:i=rnd(-ti)
2 poke51208,12:poke51223,15:poke51211,2:poke51221,1:poke51209,15:poke51307,1
3 poke650,255:poke51219,1:poke51224,1:poke51228,8:deffnr(x)=int(x*rnd(ti)+1)
5 dimw$(26):fori=0to26:readw$(i):next:poke51217,15:poke6216,18:poke6626,28
6 dima(3),p(3),q(3),h(3):fori=0to3:reada(i),p(i),q(i),h(i):next:goto20
7 fori=0to3:j=int(4*rnd(ti)):k=p(i)+a(j):z=peek(k):ifk=6144+x+35*ygoto9
8 ifz=3orz=8orz=11thenifk<7400thenpokep(i),q(i):p(i)=k:q(i)=z:pokep(i),h(i)
9 next:return
20 print"{home}{down}{down}"spc(24)"{lgrn}vital.:   (   )":printspc(24)"{up}{cyn}astral:   (   )
21 printspc(24)"{lred}ang.:   {grn}ver.:":printspc(24)"{up}{pur}str.:   {yel}ges.:
22 printspc(24)"{gry3}klg.:   {lblu}cha.:":printspc(24)"{up}{lgrn}erf.:      (  )
23 printspc(24)"{yel}goldstck.:":printspc(24)"{up}{orng}nahr.vorrat:
25 x=17:y=36:p=40721:q=11:gosub10000
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
260 j=peek(892+j):sys5681:h=0:ifj=21thenh=1
262 ifj=110thenh=4
263 ifj=111thenh=5
264 ifj=16andx=27andy=31thenh=6
265 ifj=18thenh=7
267 ifj=16andy>33thenh=9
268 ifj=28thenh=10
269 ifj=114thenh=16
274 ifj=16andy<9thenh=3:ifx>15thenh=2
275 ifj=34thenh=14
276 ifj=30thenh=15
279 ifh=.thenprint"{lred}keine antwort!{home}":sys5681:goto100
280 sys5681:print"{cyn}du sprichst{home}":sys5681:ifh=1thenprint"eine wache ";
281 ifh=2thenprint"den rüstungs-{home}":sys5681:print"macher ";
282 ifh=3thenprint"den waffen-{home}":sys5681:print"schmied ";
283 ifh=4thenprint"einen heiler{home}":sys5681
284 ifh=5thenprint"den gastwirt{home}":sys5681
285 ifh=6thenprint"einen jungen{home}":sys5681:print"elfen ";
286 ifh=7thenprint"einen zauberer{home}":sys5681
287 ifh=10thenprint"einen druiden{home}":sys5681
288 ifh=9thenprint"einen stall-{home}";:sys5681:print"burschen ";
291 ifh=14thenprint"eine alte frau{home}":sys5681
295 ifh>14thenprint"ein elfenmädchen{home}":sys5681
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
410 ifh=6andn$="dieb"goto1100
411 ifh=15andn$="prin"goto1120
412 ifh=15andn$="elbe"goto1130
413 ifn$="name"thenprint"?{home}":goto820
414 ifn$="beru"goto860
415 ifn$="fick"orn$="piss"ormid$(n$,2)="otz"orn$="arsc"orn$="porn"goto449
416 ifh=3andn$="elbe"andpeek(49264)=.goto1140
417 ifh=3andn$="thyr"andpeek(49264)=.goto1144
420 ifn$="wied"thenprint"ersehen.{home}":goto880
421 ifn$="gesu"thenprint"ndheit?{home}":goto840
422 ifh=9andn$="einh"andpeek(49157)=1goto1200
423 ifh=7andn$="zaub"goto3000
424 ifh=7andn$="adep"goto3010
425 ifh=7andn$="entg"goto3020
426 ifh=7andn$="tafe"goto3030
427 ifh=7andn$="ghor"goto3034
428 ifh=7andn$="cama"goto3035
429 ifh=7andn$="ackb"goto3036
430 ifh=10andn$="drui"goto3100
431 ifh=10andn$="helf"goto3110
432 ifh=10andn$="tafe"goto3120
433 ifh=10thenifn$="kris"orn$="spli"orn$="boes"orn$="glei"goto3130
434 ifh=16andn$="bard"goto2200
436 ifh=16andn$="lied"thenprint"er{home}":goto2210
437 ifh=16andn$="sing"thenprint"e{home}":goto2210
438 ifh=14andn$="krae"goto2100
440 print" {home}":gosub800:print"dazu kann{home}":sys5681:print"ich dir nichts{home}":sys5681
441 print"sagen.%{home}
442 goto400
449 print" {home}":gosub800:print"du bist ein{home}":sys5681:print"altes ferkel!%{home}":goto400
800 gosub999:print"{yel}der ";:ifh>13thenprint"{left}{left}{left}ie ";
801 ifh=1thenprint"wächter{home}
802 ifh=2thenprint"rüstungs-{home}":sys5681:print"macher{home}
803 ifh=3thenprint"waffen-{home}":sys5681:print"schmied{home}
804 ifh=4thenprint"heiler{home}
805 ifh=5thenprint"wirt{home}
806 ifh=6thenprint"elf{home}
807 ifh=7thenprint"zauberer{home}
808 ifh=10thenprint"druide{home}
809 ifh=9thenprint"bursche{home}
812 ifh=14thenprint"alte{home}
815 ifh=15thenprint"elfin{home}
819 sys5681:print"sagt:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"ich bin ";:ifh=1thenprint"ein{home}":sys5681:print"wächter";
821 ifh=2thensys5681:print"garwin";
822 ifh=3thensys5681:print"elrik";
823 ifh=4thensys5681:print"apothekus";
824 ifh=5thensys5681:print"elrond";
825 ifh=6thensys5681:print"questor";
826 ifh=7thensys5681:print"thelom";
827 ifh=10thensys5681:print"bennt";
829 ifh=9thensys5681:print"anatol";
832 ifh=14thensys5681:print"chreola";
836 ifh=15thensys5681:print"thyra";
837 ifh=16thensys5681:print"ijale";
839 print".%{home}":goto400
840 gosub800:ifh=1thenprint"ausgezeichnet,{home}":sys5681:print"danke";
841 ifh=2orh=3thenprint"ganz gut";
843 ifh=4thenprint"ich fühle mich{home}":sys5681:print"natürlich wohl";
844 ifh=5orh=16thenprint"ich bin ganz{home}":sys5681:print"zufrieden";
845 ifh=6thenprint"man schlägt{home}":sys5681:print"sich so durch";
846 ifh=7thenprint"ausgezeichnet";
847 ifh=10thenprint"danke";
848 ifh=9thenprint"ich habe viel{home}":sys5681:print"zu tun";
852 ifh=14thenprint"ich bin blind{home}":sys5681:print"aber ich sehe{home}":sys5681:print"alles";
855 ifh=15thenprint"ich habe ein{home}":sys5681:print"wenig wein ge-{home}":sys5681:print"trunken";
859 goto839
860 print"f?{home}":ifh=1goto820
862 gosub800:ifh=2thenprint"ich fertige";:sys5681:print"rüstungen";
863 ifh=3thenprint"ich mache und{home}":sys5681:print"handle mit";:sys5681:print"waffen";
864 ifh=5thenprint"ich bediene und{home}":sys5681:print"mach's essen";
865 ifh=6thenprint"ich bin ein{home}":sys5681:print"gewandter dieb";
866 ifh=7thenprint"ich bin ein{home}":sys5681:print"zauberer";
867 ifh=4thenprint"ich bin ein{home}":sys5681:print"heiler";
868 ifh=9thenprint"ich züchte{home}":sys5681:print"einhörner";
869 ifh=10thenprint"ich bin ein{home}":sys5681:print"druide";
870 ifh=16thenprint"ich bin eine{home}":sys5681:print"bardin";
871 ifh=14thenprint"ich bin ein{home}":sys5681:print"kräuterweib";
875 ifh=15thenprint"ich bin die{home}":sys5681:print"prinzessin der";:sys5681:print"elfen";
879 goto839
880 gosub800:ifh=1thenprint"ich muss weiter{home}":sys5681:print"wache schieben";
881 ifh=3orh=2thenprint"beehre mich{home}":sys5681:print"bald wieder";
882 ifh=4thenprint"halte dich{home}":sys5681:print"immer gesund";
883 ifh=5thenprint"trink 'n bier";
884 ifh=6orh=16thenprint"viel glück";
885 ifh=10thenprint"handle weise";
889 ifh=9thenprint"gute reise";
892 ifh=14orh=7thenprint"möge die magie{home}":sys5681:print"mit dir sein";
895 ifh=15thenprint"ich will, dass{home}":sys5681:print"wieder die sonne{home}":sys5681:
896 ifh=15thenprint"scheint. rette{home}":sys5681:print"unsere welt";
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
1001 print"t":gosub800:print"dies ist gaht,{home}":sys5681:print"die stadt der{home}
1002 sys5681:print"elfen. bist du{home}":sys5681:print"auch ein elf? ";
1003 gosub970:ifu$="n"thenprint"fremde sehen wir{home}":sys5681:print"hier nicht{home}
1004 ifu$="n"thensys5681:print"gern.%{home}":goto400
1005 print"das glaube ich{home}":sys5681:print"dir nicht. du{home}
1006 sys5681:print"bist doch ein{home}":sys5681:print"mensch.%{home}":goto400
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
1040 print"n{home}":gosub800:print"ich bereite die{home}";:sys5681:print"köstlichen spe-{home}
1041 sys5681:print"zialitäten der{home}":sys5681:print"elfen zu. wie{home}
1042 sys5681:print"wär's mit zehn{home}":sys5681:print"rationen?";
1043 gosub970:ifu$="n"thenprint"dann lass es.%{home}":goto400
1044 z=14-int(ch/1.6):gosub9000:sys5681:na=na+10:ifna>250thenna=250
1045 poke49244,na:gosub10000:sys5681:print"noch eins?";:goto1043
1100 print" {home}":gosub800:print"ja, wir elfen{home}":sys5681:print"sind berühmt für{home}
1102 sys5681:print"unsere geschick-{home}":sys5681:print"lichkeit.{home}
1104 gosub960:print"soll ich dir{home}":sys5681:print"zeigen, wie man{home}
1106 sys5681:print"geschickter{home}":sys5681:print"wird?";:gosub970
1108 ifu$="n"thenprint"du wirst es aber{home}":sys5681:print"brauchen!%{home}":goto400
1110 ifge=18thenprint"du bist schon so{home}":sys5681:print"geschickt wie{home}":sys5681:print"ich.%{home}
1111 ifge=18goto400
1112 j=peek(49287):ifj=.thenprint"dazu musst du{home}":sys5681:print"erst noch etwas{home}
1113 ifj=.thensys5681:print"erfahrener{home}":sys5681:print"werden.%{home}":goto400
1114 print"also gut, lass{home}":sys5681:print"uns üben...{home}":sys5681:fori=0to6:sys6041
1115 poke53280,13:pokes+5,74:pokes+1,fnr(20)+10:pokes+4,33:k=fnr(200)+50
1116 poke53280,.:forl=0tok:nextl,i:poke49287,j-1:poke49225,peek(49225)+1:gosub10000
1117 sys5681:print"so, nun bist du{home}":sys5681:print"geschickter.%{home}":goto400
1120 print"zessin{home}":gosub800:print"ich bin die{home}":sys5681:print"tochter der{home}
1121 sys5681:print"elfenkönigin{home}":sys5681:print"mithra. kennst{home}":sys5681:print"du sie?";
1122 gosub970:print"sie ist eine{home}":sys5681:print"grosse königin.";:ifu$="j"thenprint"%{home}":goto400
1123 sys5681:print"sie hat den{home}":sys5681:print"elbenbogen ange-{home}":sys5681:print"fertigt.%{home}
1124 goto400
1130 print"nbogen{home}":gosub800:print"das ist ein ma-{home}":sys5681:print"gischer bogen,{home}
1131 sys5681:print"dessen pfeile{home}":sys5681:print"jedes hindernis{home}
1132 sys5681:print"durchschlagen.{home}":sys5681:print"elrik bewahrt{home}":sys5681:print"ihn auf.%{home}
1133 goto400
1140 print"nbogen{home}":gosub800:print"wer hat dich zu{home}":sys5681:print"mir geshickt?%{home}":goto400
1144 print"a{home}":gosub800:print"hm, ich soll{home}":sys5681:print"den elbenbogen{home}
1145 sys5681:print"eigentlich auf-{home}":sys5681:print"bewahren, aber{home}
1146 sys5681:print"ich hörte, dass{home}":sys5681:print"du die welt zu{home}
1147 sys5681:print"retten ver-{home}":sys5681:print"suchst?";:gosub970
1148 ifu$="n"thenprint"du bist nicht{home}":sys5681:print"würdig für diese{home}
1149 ifu$="n"thensys5681:print"waffe.%{home}":goto400
1150 print"nun, ich glaube,{home}":sys5681:print"ich könnte dir{home}
1151 sys5681:print"den bogen geben.{home}":sys5681:print"willst du ihn{home}
1152 sys5681:print"kaufen?";:gosub970:ifu$="n"thenprint"dann nicht.%{home}":goto400
1153 z=1e3:gosub9000:sys5681:print"er sei dein!{home}":poke49264,1:goto400
1200 print"örner{home}":gosub800:print"ja, wir elfen{home}":sys5681:print"benutzen sie als{home}
1202 sys5681:print"reittiere. ich{home}":sys5681:print"verkaufe sie{home}":sys5681:print"auch. möchtest{home}
1204 sys5681:print"du eines dieser{home}":sys5681:print"herrlichen tiere{home}
1206 sys5681:print"erwerben?";:gosub970:ifu$="n"thenprint"schade.%{home}":goto400
1208 ifge<12thenprint"du bist aber zu{home}":sys5681:print"ungeschickt, um{home}
1210 ifge<12thensys5681:print"sie zu reiten.%{home}":goto400
1220 z=900-ch*25:gosub9000:sys5681:print"{lgrn}such dir eines{home}":sys5681:print"aus";
1222 x=6:y=36:poke49159,255:poke49163,255:goto897
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
2101 ifu$="n"thenprint"wozu brauchst{home}":sys5681:print"denn dann{home}":sys5681:print"ingredienzen?{home}
2102 ifu$="n"goto400
2103 print"ich habe:{home}":gosub999:print"a schwefel{home}":sys5681:print"b knoblauch{home}
2104 sys5681:print"c ginseng{home}":sys5681:print"d totenblume{home}":gosub999
2105 print"was willst du? {wht}G{left}";
2106 getu$:ifu$=""goto2106
2107 ifu$<"a"oru$>"d"goto2025
2108 printu$"{lgrn}";:gosub999:k=asc(u$)-65:zz=10:ifk>.thenzz=6:ifk>1thenzz=3:ifk>2thenzz=1:k=5
2109 ifk<3thenprint"gibt's im"zz"{left}'er{home}":sys5681:print"pack und{home}":sys5681
2110 print"kostet 1 gold-";:sys5681:print"stück, ok?";
2120 z=1:gosub970:ifu$="n"goto9002
2121 ifgp<zgoto9003
2122 print"bitte sehr!{home}":sys5681:j=peek(49336+k)+zz:ifj>99thenj=99
2123 poke49336+k,j:gosub9004:sys5681:print"du hast nun":sys5681:printmid$(str$(j),2);
2124 print" einheit.";:ifj>1thenprint"{left}en.{home}
2125 gosub10000:sys5681:print"noch eine?";:goto2120
2200 print"in{home}":gosub800:print"ich singe{home}":sys5681:print"lieder.%{home}":goto400
2210 gosub800:print"soll ich dir{home}":sys5681:print"mal etwas{home}":sys5681:print"vorsingen?";:gosub970
2212 ifu$="n"thenprint"wie du meinst.%{home}":goto400
2214 print"ich hatte mal{home}":sys5681:print"'ne flöte{home}
2216 sys5681:sys5681:print"das war 'ne{home}":sys5681:print"tolle tröte{home}
2218 sys5681:sys5681:print"sie war gemacht{home}":sys5681:print"aus glas{home}
2220 sys5681:sys5681:print"weshalb sie zau-{home}":sys5681:print"berkraft besass{home}
2222 gosub960:print"wenn ich sie{home}":sys5681:print"liess erklingen{home}
2224 sys5681:sys5681:print"begann kristall{home}":sys5681:print"zu schwingen{home}
2226 sys5681:sys5681:print"und der heilige{home}":sys5681:print"kristall{home}
2228 sys5681:sys5681:print"schickt mein{home}":sys5681:print"lied durch's all{home}
2230 gosub960:print"als der kristall{home}":sys5681:print"zerbrach{home}
2232 sys5681:sys5681:print"liess auch sein{home}":sys5681:print"schwingen nach{home}
2234 sys5681:sys5681:print"nur der splitter{home}":sys5681:print"klang noch so{home}
2236 sys5681:sys5681:print"als wäre er noch{home}":sys5681:print"hoffnungsfroh{home}
2238 gosub960:print"doch das ist{home}":sys5681:print"schon lange her{home}
2240 sys5681:sys5681:print"und die flöte{home}":sys5681:print"gibts nicht mehr{home}
2242 sys5681:sys5681:print"hättest du sie":sys5681:print"könnt's gelingen{home}
2243 sys5681:sys5681:print"den splitter an":sys5681:print"dich zu bringen{home}
2244 gosub960:print"hat dir mein{home}":sys5681:print"kleines lied{home}":sys5681:print"gefallen?";
2245 gosub970:ifu$="n"goto2212
2246 print"es ist alles{home}":sys5681:print"wahr. die flöte{home}
2247 sys5681:print"ist mir jedoch{home}":sys5681:print"gestohlen worden{home}
2248 sys5681:print"als ich einmal{home}":sys5681:print"in mubrak war.%{home}":goto400
3000 print"erer{home}":gosub800:print"naja, eigent-{home}":sys5681:print"lich bin ich{home}
3001 sys5681:print"noch ein adept.%{home}":goto400
3010 print"t{home}":gosub800:print"ich übe den{home}":sys5681:print"entgiftungs-{home}
3011 sys5681:print"zauberspruch.%{home}":goto400
3020 print"iftung{home}":gosub800:print"ein zauber{home}":sys5681:print"gegen gift.{home}
3021 sys5681:print"kannst du{home}":sys5681:print"ihn?";:gosub970
3022 ifu$="j"thenprint"gut für dich.%{home}":goto400
3024 print"geh mal zum{home}":sys5681:print"weissen{home}":sys5681:print"zirkel.%{home}":goto400
3030 print"l{home}":gosub800:print"hm, ich bin{home}":sys5681:print"neu hier und{home}
3031 sys5681:print"kenne dich{home}":sys5681:print"nicht. ich{home}
3032 sys5681:print"glaube nicht,{home}":sys5681:print"dass ich dir das{home}
3033 sys5681:print"sagen darf.%{home}":goto400
3034 print" {home}":gosub800:print"wer hat dich{home}":sys5681:print"geschickt?%{home}":goto400
3035 print"ch{home}":gosub800:print"wo ist er{home}":sys5681:print"jetzt?%{home}":goto400
3036 print"ah{home}":gosub800:print"gut, ich denke,{home}":sys5681:print"ich kann dir{home}
3037 sys5681:print"verraten, dass{home}":sys5681:print"die tafel in der{home}
3038 sys5681:print"nordöstlichen{home}":sys5681:print"ecke der stadt{home}":sys5681:print"liegt.%{home}":goto400
3100 print"de{home}":gosub800:print"wir druiden{home}":sys5681:print"wollen dir{home}
3101 sys5681:print"helfen.%{home}":goto400
3110 print"en{home}":gosub800:print"frage, was du{home}":sys5681:print"wissen willst.%{home}":goto400
3120 print"l{home}":gosub800:print"geh' mal nach{home}":sys5681:print"worthal. dort{home}
3121 sys5681:print"findest du die{home}":sys5681:print"dritte tafel.%{home}":goto400
3130 print"...":gosub800:print"dazu kann dir{home}":sys5681:print"cerfax mehr{home}
3131 sys5681:print"sagen als ich.%{home}":goto400
3200 print"suchen";:fori=1to5:print".";:forj=.to400:nextj,i
3201 sys5681:print"{yel}du findest{home}":sys5681
3202 ifx<>32ory<>2thenprint"nichts.{home}":goto100
3204 print"eine tontafel:{home}":sys5681:sys5681:print"{orng}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}:>?;{home}
3206 sys5681:print"{rght}{rght}{rght}{rght}{rght}{rght}{rvon}<{$ae}{$af}={home}":sys5681:sys5681:goto100
3300 print"{left}  {home}":sys5681:print"{yel}möchtest du{home}":sys5681:print"die stadt gaht{home}
3301 sys5681:print"verlassen?";:gosub970:ifu$="n"theny=y-1:goto100
6000 sys5681:print"{lred}du verlässt{home}":sys5681:print"die stadt.{home}
6010 fori=0to999:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
6015 ifx=6thenpoke49157,3
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
50100 data-35,6400,8,17,1,6800,11,17,35,6820,8,21,-1,6975,11,21
