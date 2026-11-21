0 rem@ öroutstart 7681:öheapend 40959
1 rem@ ösyson:ösystext"gdg":ösysnumber 1990
2 rem@ öbyte se(,ze(,wo(,qs(
5 poke198,0:ifp=13goto140
10 print"{clr}":poke53272,18:i=rnd(-ti):poke650,255:sys4546:sys4096:poke2040,0
20 dimse(65),ze(65),wo(65),qs(65):fori=0to65:readse(i),ze(i),wo(i),qs(i):next
100 poke5681,2:gosub9100:print"{down}{rvon}{rght}:;{rght}>?{rvof}{cyn}   ein fantasy-rollenspiel  {wht}{rvon}>?{rght}:;{rght}";
102 print"{rght}<={rght}{$c0}A{rvof}{down}{lgrn}{down}{left}(c) 1990 by {wht}german design group{left}{left}{up}{up}{rvon}{$c0}A{rght}<=
110 printspc(93)"{down}{down}{down}{down}{lred}möchtest du...
112 print"   {wht}{down}{rvon}P{$a4}{$a5}Q{down}{left}{left}{left}{left}R{$a6}{$a7}S{rvof} ein neues spiel beginnen?  {rvon}{up}BC{down}{left}{left}DE
114 print"   {down}{wht}{rvon}P{$ac}{$ad}Q{down}{left}{left}{left}{left}R{$ae}{$af}S{rvof} ein altes spiel nachladen? {rvon}{up}yz{down}{left}{left}äö
116 printspc(90)"{yel}deine entscheidung? {wht}G
120 getu$:ifu$="n"goto1000
122 ifu$<>"l"goto120
130 gosub9100:print"{down}{down}{down}{down}{down}{down}{down}{down}{rvon}yz{rvof} {yel}leg bitte die speicherdiskette ein {wht}{rvon}yz
132 print"{up}{rvon}äö{rvof} {yel}und wähle die speichernummer 0 - 9 {wht}{rvon}äö
134 getu$:ifu$<"0"oru$>"9"goto134
135 poke631,82:poke632,213:poke633,13:poke198,3
136 printspc(90)"{lred}lade spielstand "u$"{blk}":u$="ddd.sav"+u$:p=13:loadu$,8,1
140 gosub9100:print"{down}{down}{down}{down}{down}{down}{down}{down}  {rvon}yz{rvof} {lgrn}bitte wieder die spieldiskette {wht}{rvon}yz
141 print"  {rvon}äö{rvof} {lgrn}einlegen und %return% drücken. {wht}{rvon}äö
142 n$="":fori=0to12:u$=chr$(peek(49211+i)+64):ifasc(u$)<>96thenn$=n$+u$
143 next
144 getu$:ifu$<>chr$(13)goto144
146 goto1500
1000 gosub9100:printspc(48)"{rvon}BC{down}{left}{left}DE{rvof} {yel}ein neues spiel! {rvon}{wht}DE{up}{left}{left}BC{down}
1020 print"{cyn}{down}{down}{rght}{rght}{rght}erstellen wir zunächst einen neuen
1030 print"{rght}{rght}{rght}spielercharakter. bitte gib deinen
1040 printspc(11)"spielernamen ein:{down}":gosub4000
1164 print:printspc(86)"{wht}"n$"? - ich wette, du
1166 printspc(6)"bist "mid$("männweib",k*4+1,4)"lich, oder? (j/n)
1168 getu$:ifu$="j"thenprint"{down}{down}{down}{rght}{rght}{rght}siehst du, hatte ich doch recht!":goto1200
1170 ifu$<>"n"goto1168
1180 print"{down}{down}oh, entschuldige bitte, mein "mid$("mädchenjunge",k*7+1,7)", da
1182 print"habe ich mich wohl geirrt...":k=1-k
1200 fori=0to2e3:next:fori=49152to49400:pokei,0:next
1201 print"{clr}{cyn}so, nun wollen wir deine eigenschaften
1202 print"festlegen, "n$". auf jede der
1204 print"vier eigenschaften verteile ich zunächst
1206 print"{up}jeweils fünf punkte. da du aber "mid$("männweib",k*4+1,4)"lich
1208 print"{up}bist, bekommst du noch einen zusätzli-
1210 print"chen "mid$("stärke{rvof}{rvof}charisma",k*8+1,8)"punkt.
1220 fori=0to3:a(i)=5:next:a(k*3)=6:a(4)=7:a(5)=7
1225 printspc(87)"{wht}deine eigenschaftswerte:
1250 gosub9000:print"{down}{down}{yel}  gib bitte den ersten buchstaben der
1252 print"eigenschaft ein, die bei dir persönlich
1254 l=5:print" besonders ausgeprägt ist. ({wht}s{yel}/{wht}g{yel}/{wht}k{yel}/{wht}c{yel}) {wht}G
1260 getu$:ifu$="s"thenl=0
1262 ifu$="g"thenl=1
1264 ifu$="k"thenl=2
1265 ifu$="c"thenl=3
1266 ifl=5goto1260
1270 a(l)=a(l)+2:print"{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}":gosub9000:fori=0to50:print"    ";:next
1300 print"{up}{up}{rght}{up}{lred}du würdest bestimmt eine"left$("n",1-k)" gute"left$("n",1-k)" ";
1310 printspc(7)mid$("krieger{rvof}{rvof}{rvof}dieb{rvof}{rvof}{rvof}{rvof}{rvof}{rvof}magier{rvof}{rvof}{rvof}{rvof}abenteurer",l*10+1,10);
1320 printleft$("in",k*2)" abgeben, "n$".
1330 print"{yel}{down} so, nun werde ich noch zufällig einige
1332 print" eigenschaftspunkte verteilen. ihre an-
1334 print"  zahl hängt von dem von dir gewählten
1336 print" schwierigkeitsgrad ab. willst du es in
1338 print"   unserer welt {wht}l{yel}eicht, {wht}m{yel}ittel oder
1350 l=0:print"   {wht}s{yel}chwer haben? {wht}G{left}";
1360 getu$:ifu$="l"thenl=9:print"leicht! (9";
1362 ifu$="m"thenl=6:print"mittel! (6";
1364 ifu$="s"thenl=3:print"schwer! (3";
1366 ifl=0goto1360
1370 print" punkte){up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}":fori=1tol
1372 j=4*rnd(ti):ifa(j)=12goto1372
1374 a(j)=a(j)+1:forj=0to250:next:gosub9000:print"{up}{up}{up}{up}{up}":next
1376 print"{down}{down}{down}{down}":fori=0to90:print"    ";:next:print"{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}"
1380 print"{lgrn}  kannst du besser {wht}a{lgrn}ngreifen oder dich
1382 print"{up}  besser {wht}v{lgrn}erteidigen? {wht}G
1384 getu$:ifu$="a"thena(4)=9:goto1390
1386 ifu$="v"thena(5)=9:goto1390
1388 goto1384
1390 print"{up}{up}{up}{up}":fori=0to29:print"    ";:next
1392 printspc(7)"{up}{up}{up}{up}{pur}attacke:"a(4)"     {orng}parade:"a(5)
1393 print"{down}{grn} diese eigenschaften kannst du im laufe
1394 print" der zeit steigern, jedoch nicht über
1395 print"{up} 18 hinaus, da dies neunzig prozent      von perfekt ist...
1396 print"{down}{yel} bist du mit deine"mid$("mr",k+1,1)" held"mid$("ei",k+1,1);
1397 print"n zufrieden? {wht}G
1400 getu$:ifu$="j"goto1410
1402 ifu$="n"thenrun
1404 goto1400
1410 print"{clr}":fori=0to5:poke49224+i,a(i):next
1420 fori=0to12:poke49211+i,asc(mid$(n$+"          ",i+1))and63:next:poke49166,k
1430 poke49152,34:poke49153,177:poke49154,64:poke49155,89:poke49156,2
1440 fori=6to13:poke49152+i,255:next:poke49230,99:poke49232,99:poke49157,1
1450 poke49241,1:poke49244,50:poke49168,35:poke49178,1:poke49188,250:poke49198,2
1500 p=int(65*rnd(ti)):gosub2000:poke2,0:print"{clr}{down}{down}{down}{blk}lO"chr$(34)"ddd.konj"chr$(34)",8
1501 fori=0to9:print"rU":next:print"{home}":poke631,13:poke632,13:poke198,2:end
2000 gosub9100:print"{down}{yel}so, "n$", nun wollen wir noch
2002 print"sehen, ob du für dein abenteuer in der
2004 print"dunklen dimension auch gut vorbereitet
2006 print"bist und das richtige wissen mitbringst.
3000 printspc(6)"{down}{down}{cyn}gib bitte das folgende wort
3008 printspc(6)"aus dem anleitungs-buch ein:
3010 printspc(55)"{wht}seite:"se(p)"{left},
3012 printspc(14)mid$("ers{rvof}{rvof}zwei{rvof}drit{rvof}vier{rvof}fünf{rvof}sechssieb{rvof}ach{rvof}{rvof}neun",ze(p)*5-4,5);
3014 print"te zeile,
3016 printspc(14)mid$("ers{rvof}{rvof}zwei{rvof}drit{rvof}vier{rvof}fünf{rvof}sechssieb{rvof}ach{rvof}{rvof}neun",wo(p)*5-4,5);
3018 print"tes wort:{down}{down}":gosub4000:j=0:fori=1tot:j=j+asc(mid$(n$,i))*i:next:k=jand255
3020 ifk=qs(p)thenpoke5681,169:return
3024 print:printspc(55-len(n$)/2)"{yel}"n$" ist falsch!
3026 poke2040,peek(2040)+1:fori=1to2e3:next:ifpeek(2040)<3goto2000
3032 gosub9100:print"{down}{down}{down}{down}{down}{yel}"spc(87)"dreimal falsch! jetzt hast
3034 printspc(9)"du leider pech gehabt.
3036 printspc(49)"lade das spiel neu und
3038 printspc(9)"achte noch sorgfältiger":printspc(11)"auf deine eingaben.
3040 printspc(47)"{wht}- oder kaufe das original!":poke182,2:sys182
4000 printspc(50)"{lred}>>> {gry1}------------ {lred}<<<{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{wht}";:k=0:z=0:t=0:n$=""
4010 z=z+1:ifz>10thenz=.:k=1-k:ift<12thenprintmid$("{gry1}-{cyn}*",k+k+1,2)"{wht}{left}";
4020 getu$:ifu$=chr$(13)andt>2goto4080
4030 ifu$=chr$(20)andt>.goto4060
4040 ifu$<"a"oru$>"ü"ort=12goto4010
4050 n$=n$+u$:printu$;:k=.:z=10:t=t+1:goto4010
4060 k=.:z=10:t=t-1:n$=left$(n$,t):print"{left}{gry1}-{left}{wht}";:ift<11thenprint"{gry1}--{left}{left}{wht}";
4070 goto4010
4080 ift<12thenprint"{gry1}-";
4090 return
7000 data2,1,2,241,2,1,6,10,2,2,3,98,2,5,3,15,3,4,1,141,3,3,5,54,3,7,5,21
7001 data4,2,1,81,4,7,2,126,5,2,2,187,5,3,4,162,6,1,3,39,6,1,5,12,6,3,3,149
7002 data9,5,1,77,11,3,2,114,11,4,7,205,12,8,2,172,13,3,1,42,15,1,1,130,16,3,3,164
7003 data16,2,4,200,18,1,6,139,18,5,3,250,18,6,2,221,19,2,3,110,19,3,4,82
7004 data20,1,2,12,20,7,3,132,21,2,3,30,21,3,4,24,22,1,5,39,22,2,1,245,27,3,2,95
7005 data27,7,2,222,31,2,1,215,31,3,1,82,33,5,2,11,34,1,5,205,37,1,2,93
7006 data37,4,4,251,38,2,3,107,38,5,5,111,39,2,1,125,40,1,2,61,40,7,4,18
7007 data42,1,5,215,43,2,2,35,46,2,2,233,46,4,2,10,55,2,5,215,57,1,3,82,57,5,6
7008 data25,58,2,8,121,58,3,2,15,60,1,1,33,60,2,3,186,61,1,1,45,61,2,5,128
7009 data61,4,2,14,62,1,7,73,63,5,1,33,64,2,5,40,65,4,2,7,66,2,2,40,67,1,3,13
9000 printspc(8)"{down}{lred}stärke:"a(0)" {yel}geschickl.:"a(1)
9010 print"{down}{lgrn}{rght}{rght}{rght}{rght}{rght}{rght}klugheit:"a(2)"   {cyn}charisma:"a(3):return
9100 print"{clr}{wht}{rvon}PTUXY{$dc}{$dd}N{$a4}U{sspc}{$a1}{$a4}{$a5}{$a8}{$a9}{$ac}{$ad}{$dc}{$dd}N{$a4}UXY{$b0}{$b1}{$dc}{$dd}{$a4}{$a5}{$b4}{$b5}XY{$b8}{$b9}{$a4}{$a5}Q";
9110 print"{rvon}RVWZ{$db}{$ff}{$df}OVW{$a2}{$a3}{$a6}{$a7}{$aa}{$ab}{$ae}{$af}{$ff}{$df}OVWZ{$db}{$b2}{$b3}{$ff}{$df}{$a6}{$a7}{$b6}{$b7}Z{$db}{$ba}{$bb}{$a6}{$a7}S":return
