1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454:v=53248
2 poke51209,15:poke51200,1:poke51201,11:poke51211,12:poke51224,3:poke51225,3
3 poke51217,3:poke51221,3:poke51204,2:poke51208,2:poke650,255:poke51313,1
4 fori=0to7:readz$(i),kg(i),kp(i),ks(i):next:poke51226,11:x=rnd(-ti)
6 dima(3),p(3):fori=0to3:reada(i),p(i):next:deffnr(x)=int(x*rnd(ti)+1)
7 fori=0to7:poke4032+i*3,peek(2840+i):poke4033+i*3,peek(2848+i):poke4034+i*3,.
8 poke4056+i*3,peek(2856+i):poke4057+i*3,peek(2864+i):poke4058+i*3,.
9 poke960+i*3,peek(2872+i):poke961+i*3,peek(2880+i):poke962+i*3,.
10 poke984+i*3,peek(2888+i):poke985+i*3,peek(2896+i):poke986+i*3,.:next
11 fori=48to62:poke960+i,.:poke4032+i,.:next:pokev+39,7:pokev+40,7:pokev+21,0
12 pokev+23,0:pokev+29,0:pokev+28,0:pokev+27,0:poke2040,15:poke2041,63
13 poke51298,12
20 print"{home}{down}{down}"spc(24)"{lgrn}vital.:   (   )":printspc(24)"{up}{cyn}astral:   (   )
21 printspc(24)"{lred}ang.:   {grn}ver.:":printspc(24)"{up}{pur}str.:   {yel}ges.:
22 printspc(24)"{gry3}klg.:   {lblu}cha.:":printspc(24)"{up}{lgrn}erf.:      (  )
23 printspc(24)"{yel}goldstck.:":printspc(24)"{up}{orng}nahr.vorrat:
25 x=17:y=36:gosub10000:fori=0to31:poke49920+i,peek(3928+i):next
100 poke2,x:poke182,y:sys6052:sys4482:q0=peek(892):sys4537:sys4361:sys5440
101 ify<9andq0=10goto300
102 ifq0=11andfnr(21)=7goto400
105 sys5681:print"{wht}@G{left}";:z=0:ify=37goto3300
110 z=z+1:ifz>499goto200
120 getu$:ifu$=""goto110
122 ifu$=" "goto200
124 ifu$="{up}"goto210
125 ifu$="{down}"goto220
126 ifu$="{left}"goto230
127 ifu$="{rght}"goto234
128 ifu$="k"goto240
129 ifu$="w"thengosub3500:goto100
130 ifu$="r"thenprint"rüstung{home}":goto191
131 ifu$="i"thenprint"inventur{home}":goto191
132 ifu$="z"goto3000
133 ifu$="b"goto2000
190 print"wie bitte..?{home}":goto100
191 sys5681:print"{yel}mach das{home}":sys5681:print"draussen!{home}":goto100
200 print"warten...{home}":goto100
210 print"norden{home}":j=peek(881):ifj>11orj<10goto214
212 y=y-1:goto6100
214 sys5681:print"{lred}blockiert!{home}":sys5681:goto100
220 print"süden{home}":j=peek(903):ifj>11orj<10goto214
222 y=y+1:goto6100
230 print"westen{home}":j=peek(891):ifj>11orj<10orx=.goto214
232 x=x-1:goto6100
234 print"osten{home}":j=peek(893):ifj>11orj<10orx=32goto214
236 x=x+1:goto6100
240 print"kommuniziere";:sys5681:print"{lred}das hat hier{home}
241 sys5681:print"keinen sinn!{home}":goto100
290 onfnr(5)goto291,292,293,294,295
291 u$="stirb, narr":return
292 u$="sei des todes":return
293 u$="verschwinde":return
294 u$="ich töte dich":return
295 u$="brenne, wurm":return
300 sys5681:pokev+16,.:print"{lgrn}der erzdämon{home}":sys5681:print"ruft wütend:{home}
301 gosub290:sys5681:print"%"u$"!%{home}":poke51204,10:poke51208,10:sys4361
302 forj=0to250:next:poke51204,7:poke51208,7:sys4361:fori=0to200:next
304 pokev,352-x*16:pokev+2,400-x*16:pokev+1,170-16*y:pokev+3,peek(v+1)
306 pokev+21,3:sys6041:poke51204,2:poke51208,2:pokes+5,12:sys4361:k=15
308 pokes+4,33:fori=33to0step-1:pokes+1,i:next:fori=0to1:x(i)=112-peek(v+i+i)
310 y(i)=138-peek(v+1+i+i):next:fori=16to0step-1
312 forj=0to1:pokev+j+j,112-x(j)*i/16:next:pokev+1,138-y(0)*i/16:k=78-k
314 pokev+3,peek(v+1):poke2040,k:poke2041,k:next:poke892,22:poke51222,7:sys4361
316 pokev+33,10:pokev+21,0:sys6041
317 pokes+1,3+fnr(5):pokes+5,11:pokes+4,129:forj=0to99:next
318 pokev+33,.:poke892,27:hp=hp-21+fnr(7)-rs+(rs=6):ifhp<1thenhp=0:poke892,26
320 poke49231,hp/256:poke49230,hp-256*peek(49231):sys4361:gosub10000:ifhpgoto105
322 k=3:goto13000
400 sys5681:print"{yel}du wirst{home}":sys5681:print"angegriffen!{home}
401 sys6041:pokes+5,11:pokes+12,11:pokes+4,33:pokes+11,33
402 fori=0to70:pokes+1,5+i:pokes+8,75-i:next:poke2,11:sys5782:sys4537:sys4361
404 gosub999:print"{wht}--- konflikt ---{home}
410 gosub999:fori=0to31:poke3928+i,peek(2800+i):next:ma=fnr(2)-1
412 ifma=.thenprint"{yel}du bist von{home}":sys5681:print"unsichtbaren{home}
413 ifma=.thensys5681:print"{yel}phantomen{home}":sys5681:print"umstellt!{home}":goto420
414 print"{yel}die magie des{home}":sys5681:print"erzdämons lässt{home}
415 sys5681:print"steinerne golems{home}":sys5681:print"aus dem boden{home}
416 sys5681:print"wachsen!{home}
420 mn=fnr(8)+2:fori=1tomn:m(i)=30+30*ma
422 x(i)=fnr(9)-5:y(i)=fnr(9)-5:j=892+x(i)+11*y(i):ifpeek(j)<>11goto422
424 pokej,40:mp(i)=j:next:sys4361:poke198,0:ifma=.goto500
426 fori=0to16step16:forj=0to7:poke3928+i+j,peek(3080+i+j)
428 poke3936+i+j,peek(3088+i+j):fork=0to5:nextk,j,i
500 sys5681:print"{wht}@G{left}";:z=0
501 z=z+1:ifz>499goto519
502 getu$:ifu$=""goto501
503 ifu$=" "goto519
504 ifu$="{up}"goto530
505 ifu$="{down}"goto540
506 ifu$="{left}"goto550
507 ifu$="{rght}"goto560
508 ifu$="w"thengosub3500:goto1000
509 ifu$="a"goto600
510 ifu$="z"goto521
518 print"wie bitte..?{home}":goto1000
519 print"warten...{home}":goto1000
521 print"zauberspruch{home}":sys5681:print"{yel}der erzdämon{home}
522 sys5681:print"absorbiert alle{home}":sys5681:print"magie!{home}":goto1000
530 print"norden{home}":ifpeek(881)>11goto536
531 fori=1tomn:ifm(i)thenpokemp(i),11
532 next:fori=0tomn:ifm(i)theny(i)=y(i)+1:mp(i)=mp(i)+11:pokemp(i),40
534 next
535 sys4361:sys6041:pokes+5,16:pokes+1,12:pokes+4,129:goto1000
536 sys5681:print"{lred}blockiert!{home}":sys5681:goto1000
540 print"süden{home}":ifpeek(903)>11goto536
541 fori=1tomn:ifm(i)thenpokemp(i),11
542 next:fori=0tomn:ifm(i)theny(i)=y(i)-1:mp(i)=mp(i)-11:pokemp(i),40
544 next:goto535
550 print"westen{home}":ifpeek(891)>11goto536
551 fori=1tomn:ifm(i)thenpokemp(i),11
552 next:fori=0tomn:ifm(i)thenx(i)=x(i)+1:mp(i)=mp(i)+1:pokemp(i),40
554 next:goto535
560 print"osten{home}":ifpeek(893)>11goto536
561 fori=1tomn:ifm(i)thenpokemp(i),11
562 next:fori=0tomn:ifm(i)thenx(i)=x(i)-1:mp(i)=mp(i)-1:pokemp(i),40
564 next:goto535
570 print"{lred}mit dieser waffe{home}":sys5681:print"kannst du hier{home}
571 sys5681:print"keinen schaden{home}":sys5681:print"anrichten!{home}":goto1000
580 sys6041:j=peek(h):pokeh,87:poke51287,1:sys4361:pokes+5,9:pokes+4,129
582 fori=9to35:pokes+1,i:next:pokeh,j:sys4361:return
600 print"attacke{home}":sys5681:ifpeek(49246)<18goto570
601 print"{yel}-richtung? {wht}G{left}";:z=.
602 z=z+1:getu$:ifu$=""andz<599goto602
603 ifu$="{up}"goto610
604 ifu$="{down}"goto614
605 ifu$="{left}"goto616
606 ifu$="{rght}"goto618
607 print"keine{home}":goto1000
610 print"nord{home}":h=881:gosub580:ifj=40goto620
612 sys5681:print"{lred}daneben!{home}":goto1000
614 print"süd{home}":h=903:gosub580:ifj=40goto620
615 goto612
616 print"west{home}":h=891:gosub580:ifj=40goto620
617 goto612
618 print"ost{home}":h=893:gosub580:ifj=40goto620
619 goto612
620 forz=1tomn:ifm(z)>.andmp(z)=hgoto622
621 next:goto612
622 k=fnr(20):ifk<3goto630
623 ifat<kthensys5681:print"{lred}verfehlt!{home}":goto1000
624 if10+4*ma>fnr(20)goto630
626 poke51222,4:pokeh,22:sys6041:pokes+5,9:sys4361:pokes+1,fnr(20)+11
627 pokes+4,17:fori=0to30:next:sys5681:print"{pur}pariert!{home}":pokeh,j:sys4361:goto1000
630 poke51222,10:pokeh,22:sys6041:pokes+5,10:pokes+1,5+fnr(8):sys4361
632 pokes+4,129:pokeh,40:sys5681:ifk=1thenprint"{cyn}glückstreffer!{home}":sys5681:goto640
633 ifk=2thenprint"{cyn}guter treffer!{home}":sys5681
640 j=fnr(7)+9:ifk>1thenj=j-2-2*ma
642 m(z)=m(z)-j:ifm(z)<1thenm(z)=.
644 sys4361:print"{lgrn}"mid$("phantomgolem",7*ma+1,7)" ist{home}
646 j=m(z)/(1+ma):sys5681:ifj=0thenprint"getötet!{home}":goto660
650 ifj>24thenprint"kaum angekratzt{home}":goto1000
652 ifj>18thenprint"leicht verletzt{home}":goto1000
653 ifj>12thenprint"verwundet{home}":goto1000
654 ifj>6thenprint"schwer verletzt{home}":goto1000
655 print"fast schon tot{home}":goto1000
660 ifma=.goto664
662 pokeh,98:sys6041:pokes+5,10:pokes+1,fnr(9)+7:sys4361:pokes+4,129:fori=0to259:next
664 pokeh,11:sys4361:gosub13100:goto1000
970 print" {wht}G{left}";:poke198,0
971 getu$:ifu$="j"oru$="n"thenprintu$"{lgrn}{home}":goto999
972 goto971
990 poke56295,1:poke2023,71:poke198,0:wait198,1:poke2023,32:poke198,0
999 sys5681:sys5681:return
1000 poke198,.:zz=1:forn=1tomn:ifm(n)goto1100
1010 nextn:ifzzthengosub999:print"{wht}---- sieg! ----{home}":sys5681:poke198,0:goto100
1020 goto500
1100 zz=0:ifabs(x(n))<2andabs(y(n))<2goto1200
1110 j=x(n)-sgn(x(n)):k=y(n)-sgn(y(n))
1111 h=892+j+11*k:ifpeek(h)=11thenx(n)=j:y(n)=k:goto1120
1112 h=892+x(n)+11*k:ifpeek(h)=11theny(n)=k:goto1120
1114 h=892+j+11*y(n):ifpeek(h)=11thenx(n)=j:goto1120
1116 gosub1300:ifjgoto1130
1120 pokemp(n),11:mp(n)=892+x(n)+11*y(n):pokemp(n),40
1122 sys4361:sys6041:pokes+5,16:pokes+1,8:pokes+4,129
1130 ifabs(y(n))>4orabs(x(n))>4thenpokemp(n),11:m(n)=.:sys4361
1140 goto1010
1200 poke51287,7:poke892,87:sys4361:sys6041:pokes+5,8:pokes+4,129
1202 fori=13to30:pokes+1,i:next:iffnr(20)<13+4*magoto1210
1204 poke892,27:sys4361:goto1010
1210 iffnr(20)>pagoto1220
1212 poke51222,4:poke892,22:sys6041:pokes+5,8:sys4361:pokes+1,fnr(20)+8:pokes+4,17
1214 fori=0to25:next:sys5681:print"{pur}du parierst!{home}":poke892,27:sys4361:goto1010
1220 poke51222,10:poke892,22:sys6041:pokes+5,10:sys4361:pokes+1,fnr(9)+3
1222 pokes+4,129:fori=0to35:next:sys5681:print"{lred}"mid$("phantomgolem",1+7*ma,7);
1224 print" hat dich{home}":sys5681:k=ma+1:z=22+ma*5:z=z-fnr(z/3.5)
1226 z=z-rs+(rs=6):ifz<13thenprint"leicht{home}":goto1230
1228 print"schwer{home}
1230 sys5681:print"getroffen!{home}":poke892,27:sys4361:hp=hp-z
1231 ifhp<1thenhp=0:poke51226,15:poke892,26
1232 poke49231,hp/256:poke49230,hp-256*peek(49231):sys4361:gosub10000
1234 ifhp=.goto13000
1236 goto1010
1300 z=0:j=0:i=fnr(4)
1310 i=i+1+4*(i=5):z=z+1:ifz=5thenj=1:return
1312 onigoto1320,1330,1340,1350
1320 ifpeek(mp(n)-11)=11andy(n)>-4theny(n)=y(n)-1:return
1325 goto1310
1330 ifpeek(mp(n)+11)=11andy(n)<4theny(n)=y(n)+1:return
1335 goto1310
1340 ifpeek(mp(n)-1)=11andx(n)>-4thenx(n)=x(n)-1:return
1345 goto1310
1350 ifpeek(mp(n)+1)=11andx(n)<4thenx(n)=x(n)+1:return
1355 goto1310
2000 print"benutze {yel}- was?{home}{wht}":sys5681:k=0:a$=""
2010 print"G{left}";
2020 getu$:ifu$<"a"oru$>"ü"goto2020
2030 printu$;:a$=a$+u$:k=k+1:ifk<4goto2010
2040 ifa$="kris"thenprint"tallsplitter{home}":goto2100
2050 ifa$="spli"thenprint"tter{home}":goto2100
2060 sys5681:print"{lred}das hat hier{home}":sys5681:print"keinen sinn!{home}":goto100
2100 ifpeek(49351)goto2110
2102 sys5681:print"{pur}du hast den{home}":sys5681:print"splitter nicht!{home}":goto100
2110 ifx>14andx<19andy<7goto2120
2112 sys5681:print"{lred}du bist zu weit{home}":sys5681:print"vom kristall{home}
2114 sys5681:print"entfernt!{home}":goto100
2120 ifx=18andy=4goto2130
2122 sys5681:print"{lblu}du stehst nicht{home}":sys5681:print"neben der{home}
2123 sys5681:print"scharte im{home}":sys5681:print"kristall, wo der{home}
2124 sys5681:print"splitter fehlt!{home}":goto100
2130 sys5681:print"{cyn}du hebst den{home}":sys5681:print"splitter hoch{home}
2132 sys5681:print"über die narbe{home}":sys5681:print"im kristall. der{home}
2134 sys5681:print"splitter glüht{home}":sys5681:print"auf. gleich wird{home}
2136 sys5681:print"sich dein{home}":sys5681:print"schicksal{home}
2138 sys5681:print"erfüllen.{home}":gosub990:print"was rufst du,{home}
2140 sys5681:print"während du den{home}":sys5681:print"kristall heilst?{home}
2200 a$="":k=0:sys5681:sys5681:print"{yel}@@@{wht}";
2210 print"G{left}";
2220 getu$:ifu$=chr$(13)andk>.goto2300
2230 ifu$=chr$(20)andk>.goto2260
2240 ifu$<"a"oru$>"ü"ork=12goto2220
2250 a$=a$+u$:printu$;:k=k+1:goto2210
2260 k=k-1:a$=left$(a$,k):print" {left}{left}";:goto2210
2300 print" {home}":sys5681:sys5681:print"{cyn}der splitter{home}":sys5681:print"pulsiert warm in{home}
2302 sys5681:print"deiner hand. der{home}":sys5681:print"kristall beginnt{home}
2304 sys5681:print"zu vibrieren und{home}":sys5681:print"zu summen.{home}
2306 gosub990:print"du blickst dem{home}":sys5681:print"grauenhaften{home}
2308 sys5681:print"erzdämon fest{home}":sys5681:print"in seine unbe-{home}
2310 sys5681:print"schreiblichen{home}":sys5681:print"augen und{home}
2312 sys5681:print"brüllst aus{home}":sys5681:print"leibeskräften:{home}
2314 sys5681:print"{yel}%"a$"!%{home}":sys5681:print"{cyn}dann lässt du{home}
2316 sys5681:print"den splitter{home}":sys5681:print"herabsausen...{home}
2320 gosub990:ifa$="trofnih"goto2400
2321 ifa$="hinfort"goto5000
2322 print"{lgrn}der splitter{home}":sys5681:print"schlägt mit{home}
2324 sys6041:pokes+5,10:pokes+1,28:pokes+4,17:sys5681:print"einem singenden{home}
2326 sys5681:print"ton einen funken{home}":sys5681:print"auf der ober-{home}
2328 sys5681:print"fläche des kris-{home}":sys5681:print"talls, aber{home}
2330 sys5681:print"sonst passiert{home}":sys5681:print"nichts.{home}
2332 gosub990:print"der splitter{home}":sys5681:print"verschmilzt{home}
2334 sys5681:print"nicht mit dem{home}":sys5681:print"kristall; im{home}
2336 sys5681:print"gegenteil, eine{home}":sys5681:print"welle des bösen{home}
2337 sys5681:print"schlägt dir ent-{home}":sys5681:print"gegen und ver-{home}
2338 sys5681:print"mischt sich mit{home}":sys5681:print"dem gelächter{home}
2339 sys5681:print"des erzdämons...{home}":gosub990:goto100
2400 poke49231,0:poke49230,0:hp=0
2401 sys6041:pokes+5,14:pokes+12,14:pokes+19,14
2402 pokes+1,3:pokes+8,4:pokes+15,5:pokev+33,1:pokev+32,1
2404 pokes+4,129:pokes+11,129:pokes+18,129:fori=0to500:next:poke892,26
2406 pokev+33,7:pokev+32,7:pokev+23,3:pokev+29,3:pokev,80:pokev+1,138
2408 pokev+2,80:pokev+3,138:sys4361:fori=0to400:next:poke2040,15:poke2041,63
2410 pokev+33,10:pokev+32,10:pokev+21,3:poke891,10:poke890,10:poke902,10
2411 poke901,10:sys4361:fori=0to400:next:k=2
2420 pokev+33,2:pokev+32,2:fori=0to4:k=3-k:pokev+21,k:forj=0to88:nextj,i
2422 pokev+33,9:pokev+32,9:fori=0to4:k=3-k:pokev+21,k:forj=0to88:nextj,i
2424 pokev+33,11:pokev+32,11:fori=0to4:k=3-k:pokev+21,k:forj=0to88:nextj,i
2426 pokev+33,0:pokev+32,0:fori=0to4:k=3-k:pokev+21,k:forj=0to88:nextj,i
2428 pokev+21,0:print"{yel}was hast du{home}":sys5681:print"getan?{home}
2430 gosub999:print"der name des{home}":sys5681:print"bösen hat die{home}
2432 sys5681:print"ganze macht des{home}":sys5681:print"erzdämons frei-{home}
2434 sys5681:print"gesetzt. der{home}":sys5681:print"kristall ist{home}
2436 sys5681:print"regelrecht{home}":sys5681:print"explodiert.{home}
2438 sys5681:print"damit ist jede{home}":sys5681:print"hoffnung für{home}
2440 sys5681:print"diese welt{home}":sys5681:print"verloren!{home}":gosub990:print"aber du hast{home}
2442 sys5681:print"keine gelegen-{home}":sys5681:print"heit mehr,{home}
2444 sys5681:print"deinen fehler{home}":sys5681:print"zu bereuen.{home}
2446 gosub990:print"das letzte, was{home}":sys5681:print"du spürst, ist,{home}
2448 sys5681:print"wie der name des{home}":sys5681:print"bösen dir leib{home}
2450 sys5681:print"und seele ver-{home}":sys5681:print"brennt, während{home}
2452 sys5681:print"die splitter des{home}":sys5681:print"kristalls deinen{home}
2453 sys5681:print"körper zer-{home}":sys5681:print"fetzen...{home}":gosub990
2454 k=3:goto13000
3000 print"zauberspruch{home}":sys5681:sys5681:print"{cyn}der einzige{home}
3001 sys5681:print"zauber, der hier{home}":sys5681:print"ausgelöst werden{home}
3002 sys5681:print"kann, ist der{home}":sys5681:print"bannbrecher.{home}
3004 sys5681:sys5681:print"{yel}möchtest du{home}":sys5681:print"das?";:gosub970:ifu$="n"goto100
3006 ifpeek(49308)=.thenprint"{lred}du kannst den{home}":sys5681:print"spruch nicht!{home}":goto100
3008 ifas<30thenprint"{lred}zu wenig{home}":sys5681:print"astralenergie!{home}":goto100
3010 ifpeek(49340)=.orpeek(49341)=.orpeek(49343)=.thenprint"zu wenig zutaten{home}":goto100
3012 poke49340,peek(49340)-1:poke49341,peek(49341)-1:poke49343,peek(49343)-1
3014 as=as-30:poke49235,as/256:poke49234,as-256*peek(49235)
3016 print"{orng}du konzentrierst{home}":sys5681:print"dich...{home}
3018 sys5681:ifrnd(ti)*20+1>chthenprint"{lred}gelingt nicht!{home}":goto100
3020 print"{cyn}es gelingt!{home}":h=5934+35*y+x:fori=0to10:h=h+35
3021 forj=-5to5:ifpeek(h+j)=.thenpokeh+j,11
3022 nextj,i:poke53281,14:sys6041:pokes+5,10:pokes+4,33
3024 fori=5to50step5:forj=itoi+10:pokes+1,j:nextj,i:poke53281,0
3026 fori=0to500:next:poke51200,15:sys4361:fori=0to500:next:poke51200,12:sys4361
3028 fori=0to500:next:poke51200,11:sys4361:fori=0to500:next:poke51200,0:sys4361
3030 poke51200,1:goto100
3300 print"{left}  {home}":sys5681:print"{yel}möchtest du die{home}":sys5681:print"schädelfeste{home}
3301 sys5681:print"verlassen?";:gosub970:ifu$="n"theny=y-1:goto100
3302 goto6000
3500 print"waffe benutzen{home}":sys5681
3540 ifpeek(49265)=.goto3550
3542 print"{yel}zauberschwinge{home}":sys5681:print"bereit!{home}":poke49246,18:wa=18
3544 sh=0:poke49167,0:return
3550 print"{lred}die einzige{home}":sys5681:print"waffe, die dir{home}":sys5681:print"jetzt helfen{home}
3552 sys5681:print"könnte, hast du{home}":sys5681:print"noch nicht!{home}
3560 gosub990:print"{yel}du fliehst...{home}":fori=0to3e3:next:run
5000 poke891,30:poke890,23:poke902,51:poke901,34:poke51230,3:poke51223,3
5002 poke51251,3:poke51234,3:sys6041:pokes+5,12:pokes+12,12:sys4361
5004 pokes+4,129:pokes+11,17:fori=33to7step-1:pokes+1,i:pokes+8,i:next
5006 poke51230,1:poke51223,1:poke51251,1:poke51234,1:sys4361
5008 fori=8to120:pokes+1,i:pokes+8,i:next
5010 sys5681:print"geschafft! der{home}":sys5681:print"kristall glüht{home}
5011 sys5681:print"auf und ver-{home}":sys5681:print"schmilzt mit dem{home}
5012 sys5681:print"splitter wieder{home}":sys5681:print"zu einer ein-{home}
5013 sys5681:print"heit. gleich-{home}":sys5681:print"zeitig spürst{home}
5014 sys5681:print"du, wie sich in{home}":sys5681:print"ihm eine unvor-{home}
5015 sys5681:print"stellbar starke{home}":sys5681:print"macht ansammelt.{home}
5016 gosub990:print"der erzdämon{home}":sys5681:print"brüllt ein{home}
5018 poke867,8:poke870,4:sys4361:sys5681:print"verzweifeltes{home}
5020 gosub999:print"{yel}%{rvon}Z{rvof}{$b2}{$c0}{$ae}{$b0}{$c0}{$c0}{rvon}YXZ{rvof}{$b2}{$c0}{$ae}{rvon}X{rvof}%{home}
5021 sys5681:print"  # ##   # # ##{home}":sys5681:print"  # #{$ab}{$c0}{rvon}Y{rvof} # # #{rvon}W{home}
5022 sys5681:print"  # ##   # # #{rvon}X{home}":sys5681:print" {rvon}Z{rvof}{$bd}{rvon}Z{rvof}{$bd}{$ad}{$c0}{$c0}{rvon}YWZ{rvof}{$bd}{rvon}Z{rvof}{$bd}{rvon}W{home}
5024 gosub999:gosub990:print"{cyn}dann explodiert{home}":sys5681:print"der kristall{home}
5026 sys5681:print"förmlich in{home}":sys5681:print"einem reinen{home}
5028 sys5681:print"weissen licht...{home}":gosub990
5030 sys6041:pokes+5,12:k=12:pokev+33,1:pokev+32,1:pokes+4,33
5032 fori=0to200:k=65-k:pokes+1,k:next:poke51204,10:poke51208,10:sys4361
5034 forj=0to200:next:poke51204,7:poke51208,7:sys4361
5035 forj=0to400:next:poke51204,10:poke51208,10:sys4361
5036 forj=0to200:next:poke51204,2:poke51208,2:sys4361
5037 forj=0to200:next:poke51204,9:poke51208,9:sys4361
5038 forj=0to200:next:poke51204,11:poke51208,11:sys4361:fori=0to200:next
5040 poke867,1:poke870,1:sys4361:fori=0to300:next:pokev+33,3:pokev+32,3
5042 sys6041:pokes+5,76:pokes+4,129:fori=0to4:pokes+1,30+i*20:k=898-11*i
5044 forj=0to8:ifpeek(k+j)=1thenpokek+j,10
5046 next:sys4361:forj=0to99:nextj,i:pokev+33,14:pokev+32,14:poke892,10
5048 sys4361:fori=0to400:next:pokev+33,6:pokev+32,6:fori=0to400:next:gosub999
5050 pokev+33,0:pokev+32,0:gosub999:print"die macht des{home}":sys5681:print"kristalls hat{home}
5052 sys5681:print"den dämon wieder{home}":sys5681:print"in die finsteren{home}
5054 sys5681:print"abgründe der{home}":sys5681:print"hölle geschleu-{home}
5056 sys5681:print"dert, aus denen{home}":sys5681:print"er kam.{home}
5058 gosub990:print"mit dem dämon{home}":sys5681:print"verschwindet{home}":sys5681:print"auch alles übel,{home}
5060 sys5681:print"das das gleich-{home}":sys5681:print"gewicht der welt{home}
5062 sys5681:print"störte...{home}":gosub990:poke2,20:sys5782:sys4361:poke829,0
5064 fori=0to15:poke2600+i,peek(3336+i):next:poke829,1:poke2,1:sys5782
5066 poke51201,14:fori=0to31:poke3928+i,peek(49920+i):next:sys4361
5100 print"{home}{down}{down}{down}{down}"spc(9)"{cyn}GHGHGH":printspc(7)"{up}GHG{orng}{$b4}{$a2}{$b4}{$a2}{cyn}HGH
5102 printspc(6)"HG{orng}{rvon}{$af}{rvof}{$b6}{rvon}{$af}{rvof}{$b6}{rvon}{$af}{rvof}{$b6}{rvon}{$af}{rvof}{$b6}{cyn}HG":print"{up}{rght}{rght}{rght}{rght}{rght}GH{orng}{$a2}{$b4}{$a2}{$b4}{$a2}{$b4}{$a2}{$b4}{$a2}{$b4}{cyn}GH
5104 print"{rght}{rght}{rght}{rght}{rght}G{orng}{rvon}{$af}{rvof}{$b6}{rvon}{$af}{rvof}{$b6}{lred}GHGH{rvon}{orng}{$af}{rvof}{$b6}{rvon}{$af}{rvof}{$b6}{cyn}H":print"{up}{rght}{rght}{rght}{rght}{cyn}HG{orng}{$b4}{$a2}{$b4}{lred}GHGHGH{orng}{$a2}{$b4}{$a2}{cyn}HG
5106 print"{rght}{rght}{rght}{rght}{cyn}H{orng}{$b6}{rvon}{$af}{rvof}{$b6}{lred}HGHGHGHG{rvon}{orng}{$af}{rvof}{$b6}{rvon}{$af}{rvof}{cyn}G":print"{rght}{up}{rght}{rght}{rght}H{orng}{$a2}{$b4}{$a2}{lred}HGH{wht}{rvon}{$a8}{$a9}{rvof}{lred}GHG{orng}{$b4}{$a2}{$b4}{cyn}G
5108 print"{rght}{rght}{rght}{rght}{cyn}H{orng}{$b6}{rvon}{$af}{rvof}{$b6}{lred}HGH{rvon}{wht}{$aa}{rvof}${lred}GHG{rvon}{orng}{$af}{rvof}{$b6}{rvon}{$af}{rvof}{cyn}G":print"{rght}{up}{rght}{rght}{rght}H{orng}{$a2}{$b4}{$a2}{lred}HGHGHGHG{orng}{$b4}{$a2}{$b4}{cyn}G
5110 print"{rght}{rght}{rght}{rght}{cyn}HG{orng}{$b6}{rvon}{$af}{rvof}{$b6}{lred}GHGHGH{orng}{$b6}{rvon}{$af}{rvof}{$b6}{cyn}HG":print"{up}{rght}{rght}{rght}{rght}{rght}G{orng}{$a2}{$b4}{$a2}{$b4}{lred}GHGH{orng}{$b4}{$a2}{$b4}{$a2}{cyn}H
5112 print"{rght}{rght}{rght}{rght}{rght}GH{orng}{$b6}{rvon}{$af}{rvof}{$b6}{rvon}{$af}{gry3}JK{orng}{rvof}{$b6}{rvon}{$af}{rvof}{$b6}{rvon}{$af}{rvof}{cyn}GH":printspc(6)"{up}HG{orng}{$b4}{$a2}{rvon}{gry3}MLML{orng}{rvof}{$b4}{$a2}{cyn}HG
5114 printspc(7)"GHGH{rght}{rght}GHGH":gosub999:print"{lgrn}auch du wirst{home}
5116 sys5681:print"von der kraft{home}":sys5681:print"des kristalls{home}
5118 sys5681:print"erfasst und{home}":sys5681:print"emporgeschleu-{home}
5120 sys5681:print"dert.{home}":gosub990:print"aus grosser{home}":sys5681:print"höhe kannst{home}
5121 sys5681:print"du beobachten,{home}":sys5681:print"wie die vom{home}
5122 sys5681:print"dämon um den{home}":sys5681:print"kristall errich-{home}
5123 sys5681:print"tete schädel-{home}":sys5681:print"feste zerstört{home}
5124 sys5681:print"wird...{home}":gosub990
5130 pokev+23,1:pokev+29,1:pokev,104:pokev+1,130:sys6041:pokes+5,13:pokes+1,3
5132 k=15:pokev+21,1:pokes+4,129:fori=0to12:k=78-k:poke2040,k:forj=0to33:nextj,i
5134 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"spc(11)"{wht}{rvon}{$a4}{$a5}{down}{left}{left}{$a6}{$a7}";:pokev+21,0:fori=0to500:next
5136 print"{up}{left}{left}{cyn}{$a4}{$a5}{down}{left}{left}{$a6}{$a7}":gosub999:print"{lgrn}die wolkendecke{home}":sys5681:print"reisst auf,
5138 sys5681:print"und helles{home}":sys5681:print"sonnenlicht{home}":sys5681:print"überflutet das
5140 sys5681:print"land. das{home}":sys5681:print"gleichgewicht{home}":sys5681:print"ist wiederher-{home}
5142 sys5681:print"gestellt und{home}":sys5681:print"diese dimension{home}
5144 sys5681:print"ist nun nicht{home}":sys5681:print"länger dunkel.{home}":gosub990
5146 sys5681:print"deine aufgabe{home}":sys5681:print"hier ist somit{home}
5148 sys5681:print"erfüllt.{home}":gosub999:print"du hast gewon-{home}
5149 sys5681:print"nen, aber was{home}":sys5681:print"wird aus dir..?{home}":gosub990
5200 sys5681:print"{yel}du passt nun{home}
5202 sys5681:print"nicht mehr in{home}":sys5681:print"das gleichge-{home}
5204 sys5681:print"wicht dieser{home}":sys5681:print"welt. die kraft{home}
5206 sys5681:print"des kristalls{home}":sys5681:print"nimmt dir auch{home}
5208 sys5681:print"all deine hier{home}":sys5681:print"erworbenen dinge{home}
5210 sys5681:print"und fähigkeiten.{home}":gosub990:print"du wirst aus{home}
5212 sys5681:print"dieser welt zu-{home}":sys5681:print"rückgeschleudert{home}
5214 sys5681:print"in das unend-{home}":sys5681:print"liche wirbelnde{home}
5216 sys5681:print"nichts aus zeit{home}":sys5681:print"und raum...{home}
5220 poke56295,1:poke2023,71:sys49440:pokev-1,1:pokev-2,13:poke198,0
5222 sys49626:forj=0to75:next:getu$:ifu$=""goto5222
5224 poke2023,32:poke49665,15:fori=0to12:sys49626:forj=0to45:nextj,i
5226 poke49665,12:fori=0to18:sys49626:forj=0to38:nextj,i
5228 poke49665,11:fori=0to24:sys49626:forj=0to30:nextj,i:sys49440
5230 fori=0to25step.2:sys49607:forj=0to25-i:nextj,i:poke2,20:sys5782
5232 fori=0to99:sys49607:next:sys4361
5240 fori=0to9:gosub999:next:print"wo du wohl{home}":sys5681:print"landen wirst?{home}
5242 gosub999:gosub999:gosub990:forj=0to9:gosub999:next:print"wieder zu hause?{home}
5244 gosub999:gosub999:gosub990:forj=0to9:gosub999:next:print"vielleicht...{home}
5246 gosub999:gosub999:gosub990:forj=0to9:gosub999:next:print"...vielleicht{home}
5248 sys5681:print"aber auch schon{home}":sys5681:print"im zweiten teil{home}
5250 gosub999:print"{wht}  die schwarze
5252 sys5681:print"    festung{home}":gosub999:print"{yel}   -demnächst{home}
5254 sys5681:print"   auf diesem{home}":sys5681:print"   bildschirm
5255 sys5681:print"{lgrn}{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}    - e  n  d  e -{home}
5256 goto5256
6000 sys5681:poke2,0:print"{lred}du verlässt{home}":sys5681:print"die festung.{home}":fori=1to3e3:next
6010 print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
6020 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:new
6100 pokes+4,0:pokes+5,16:pokes+1,12:pokes+4,129:goto100
9003 ifgp<zthenprint"du hast nicht{home}":sys5681:print"genug gold!%{home}":goto400
9004 gp=gp-z:poke49243,gp/256:poke49242,gp-256*peek(49243)
10000 hp=peek(49230)+256*peek(49231):u$="00"+mid$(str$(hp),2)
10001 print"{home}{down}{down}"spc(31)"{lgrn}"right$(u$,3);
10002 hm=peek(49232)+256*peek(49233):u$="00"+mid$(str$(hm),2):print"{rght}"right$(u$,3)
10004 as=peek(49234)+256*peek(49235):u$="00"+mid$(str$(as),2)
10005 printspc(31)"{up}{cyn}"right$(u$,3);:wa=peek(49246)
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
12900 sys5681:print"{wht}****************{home}":return
12910 sys5681:print"*              *";:return
12920 printpeek(49208)+256*peek(49209)+65536*peek(49210);:return
13000 poke892,26:sys4361:poke49230,0:gosub10000:pokev+23,0:pokev+29,0
13002 sys5681:gosub12900:gosub12910:gosub12910:print"{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}du bist tot!{home}
13010 gosub12910:gosub12900:sys5681:sys5681:print"{yel}du hast";:gosub12920
13020 sys5681:print"züge gespielt.{home}":sys5681:sys5681:print"{wht}todesursache:{home}
13022 sys5681:ifk=1thenprint"{lgrn}ein phantom";
13024 ifk=2thenprint"{cyn}ein golem";
13025 ifk=3thenprint"{cyn}der dämon";
13026 print" hat{home}":sys5681:print"dich getötet.{home}
13030 poke56295,1:poke2023,71:poke198,0:wait198,1:poke2,17:goto6010
13100 sys5681:sys5681:print"du erhälst{home}
13110 l=8+ma*2:sys5681:printmid$(str$(l),2)" punkte.{home}
13130 sys5681:ef=ef+l:ifef>999999thenef=999999
13150 k=ef:l=int(k/65536):poke49240,l:k=k-65536*l:l=int(k/256):poke49239,l
13160 poke49238,k-256*l:goto10000
50000 datamagisch. licht,8,2,50,entgiftung,9,5,100,schutzschild,9,10,100
50001 datawunderheilung,10,10,150,bannbrecher,10,30,300,lichtschild,11,15,150
50002 datagewandheit,12,20,200,totenbann,13,20,250
50100 data-35,6400,1,6800,35,6820,-1,6990
