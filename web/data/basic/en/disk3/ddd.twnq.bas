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
20 print"{home}{down}{down}"spc(24)"{lgrn}health:   (   )":printspc(24)"{up}{cyn}astral:   (   )
21 printspc(24)"{lred}att.:   {grn}def.:":printspc(24)"{up}{pur}str.:   {yel}dex.:
22 printspc(24)"{gry3}int.:   {lblu}cha.:":printspc(24)"{up}{lgrn}exp.:      (  )
23 printspc(24)"{yel}gold pcs.:":printspc(24)"{up}{orng}food supply:
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
128 ifu$="t"goto240
129 ifu$="r"thengosub3500:goto100
130 ifu$="w"thenprint"armour{home}":goto191
131 ifu$="i"thenprint"inventory{home}":goto191
132 ifu$="c"goto3000
133 ifu$="u"goto2000
190 print"what..?{home}":goto100
191 sys5681:print"{yel}do that{home}":sys5681:print"outside!{home}":goto100
200 print"waiting...{home}":goto100
210 print"north{home}":j=peek(881):ifj>11orj<10goto214
212 y=y-1:goto6100
214 sys5681:print"{lred}blocked!{home}":sys5681:goto100
220 print"south{home}":j=peek(903):ifj>11orj<10goto214
222 y=y+1:goto6100
230 print"west{home}":j=peek(891):ifj>11orj<10orx=.goto214
232 x=x-1:goto6100
234 print"east{home}":j=peek(893):ifj>11orj<10orx=32goto214
236 x=x+1:goto6100
240 print"talk";:sys5681:print"{lred}that makes no{home}
241 sys5681:print"sense here!{home}":goto100
290 onfnr(5)goto291,292,293,294,295
291 u$="die, fool":return
292 u$="thou art doomed":return
293 u$="begone":return
294 u$="i'll kill you":return
295 u$="burn, worm":return
300 sys5681:pokev+16,.:print"{lgrn}the archdemon{home}":sys5681:print"cries angrily:{home}
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
400 sys5681:print"{yel}you are{home}":sys5681:print"attacked!{home}
401 sys6041:pokes+5,11:pokes+12,11:pokes+4,33:pokes+11,33
402 fori=0to70:pokes+1,5+i:pokes+8,75-i:next:poke2,11:sys5782:sys4537:sys4361
404 gosub999:print"{wht}--- combat! ---{home}
410 gosub999:fori=0to31:poke3928+i,peek(2800+i):next:ma=fnr(2)-1
412 ifma=.thenprint"{yel}you are{home}":sys5681:print"surrounded by{home}
413 ifma=.thensys5681:print"{yel}invisible{home}":sys5681:print"phantoms!{home}":goto420
414 print"{yel}the archdemon's{home}":sys5681:print"magic makes{home}
415 sys5681:print"stone golems{home}":sys5681:print"grow out of{home}
416 sys5681:print"the ground!{home}
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
508 ifu$="r"thengosub3500:goto1000
509 ifu$="a"goto600
510 ifu$="c"goto521
518 print"what..?{home}":goto1000
519 print"waiting...{home}":goto1000
521 print"spell{home}":sys5681:print"{yel}the archdemon{home}
522 sys5681:print"absorbs all{home}":sys5681:print"magic!{home}":goto1000
530 print"north{home}":ifpeek(881)>11goto536
531 fori=1tomn:ifm(i)thenpokemp(i),11
532 next:fori=0tomn:ifm(i)theny(i)=y(i)+1:mp(i)=mp(i)+11:pokemp(i),40
534 next
535 sys4361:sys6041:pokes+5,16:pokes+1,12:pokes+4,129:goto1000
536 sys5681:print"{lred}blocked!{home}":sys5681:goto1000
540 print"south{home}":ifpeek(903)>11goto536
541 fori=1tomn:ifm(i)thenpokemp(i),11
542 next:fori=0tomn:ifm(i)theny(i)=y(i)-1:mp(i)=mp(i)-11:pokemp(i),40
544 next:goto535
550 print"west{home}":ifpeek(891)>11goto536
551 fori=1tomn:ifm(i)thenpokemp(i),11
552 next:fori=0tomn:ifm(i)thenx(i)=x(i)+1:mp(i)=mp(i)+1:pokemp(i),40
554 next:goto535
560 print"east{home}":ifpeek(893)>11goto536
561 fori=1tomn:ifm(i)thenpokemp(i),11
562 next:fori=0tomn:ifm(i)thenx(i)=x(i)-1:mp(i)=mp(i)-1:pokemp(i),40
564 next:goto535
570 print"{lred}with this weapon{home}":sys5681:print"you can do{home}
571 sys5681:print"no damage{home}":sys5681:print"here!{home}":goto1000
580 sys6041:j=peek(h):pokeh,87:poke51287,1:sys4361:pokes+5,9:pokes+4,129
582 fori=9to35:pokes+1,i:next:pokeh,j:sys4361:return
600 print"attack{home}":sys5681:ifpeek(49246)<18goto570
601 print"{yel}-direction? {wht}G{left}";:z=.
602 z=z+1:getu$:ifu$=""andz<599goto602
603 ifu$="{up}"goto610
604 ifu$="{down}"goto614
605 ifu$="{left}"goto616
606 ifu$="{rght}"goto618
607 print"none{home}":goto1000
610 print"north{home}":h=881:gosub580:ifj=40goto620
612 sys5681:print"{lred}off target!{home}":goto1000
614 print"south{home}":h=903:gosub580:ifj=40goto620
615 goto612
616 print"west{home}":h=891:gosub580:ifj=40goto620
617 goto612
618 print"east{home}":h=893:gosub580:ifj=40goto620
619 goto612
620 forz=1tomn:ifm(z)>.andmp(z)=hgoto622
621 next:goto612
622 k=fnr(20):ifk<3goto630
623 ifat<kthensys5681:print"{lred}missed!{home}":goto1000
624 if10+4*ma>fnr(20)goto630
626 poke51222,4:pokeh,22:sys6041:pokes+5,9:sys4361:pokes+1,fnr(20)+11
627 pokes+4,17:fori=0to30:next:sys5681:print"{pur}parried!{home}":pokeh,j:sys4361:goto1000
630 poke51222,10:pokeh,22:sys6041:pokes+5,10:pokes+1,5+fnr(8):sys4361
632 pokes+4,129:pokeh,40:sys5681:ifk=1thenprint"{cyn}lucky hit!{home}":sys5681:goto640
633 ifk=2thenprint"{cyn}good hit!{home}":sys5681
640 j=fnr(7)+9:ifk>1thenj=j-2-2*ma
642 m(z)=m(z)-j:ifm(z)<1thenm(z)=.
644 sys4361:print"{lgrn}"mid$("phantomgolem",7*ma+1,7)" is{home}
646 j=m(z)/(1+ma):sys5681:ifj=0thenprint"killed!{home}":goto660
650 ifj>24thenprint"just scratched{home}":goto1000
652 ifj>18thenprint"lightly wounded{home}":goto1000
653 ifj>12thenprint"wounded{home}":goto1000
654 ifj>6thenprint"badly wounded{home}":goto1000
655 print"almost dead{home}":goto1000
660 ifma=.goto664
662 pokeh,98:sys6041:pokes+5,10:pokes+1,fnr(9)+7:sys4361:pokes+4,129:fori=0to259:next
664 pokeh,11:sys4361:gosub13100:goto1000
970 print" {wht}G{left}";:poke198,0
971 getu$:ifu$="y"oru$="n"thenprintu$"{lgrn}{home}":goto999
972 goto971
990 poke56295,1:poke2023,71:poke198,0:wait198,1:poke2023,32:poke198,0
999 sys5681:sys5681:return
1000 poke198,.:zz=1:forn=1tomn:ifm(n)goto1100
1010 nextn:ifzzthengosub999:print"{wht}--- victory! ---{home}":sys5681:poke198,0:goto100
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
1214 fori=0to25:next:sys5681:print"{pur}you parry!{home}":poke892,27:sys4361:goto1010
1220 poke51222,10:poke892,22:sys6041:pokes+5,10:sys4361:pokes+1,fnr(9)+3
1222 pokes+4,129:fori=0to35:next:sys5681:print"{lred}"mid$("phantomgolem",1+7*ma,7);
1224 print" hits you{home}":sys5681:k=ma+1:z=22+ma*5:z=z-fnr(z/3.5)
1226 z=z-rs+(rs=6):ifz<13thenprint"lightly.{home}":goto1230
1228 print"hard.{home}
1230 sys5681:print"{home}":poke892,27:sys4361:hp=hp-z
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
2000 print"use {yel}- what?{home}{wht}":sys5681:k=0:a$=""
2010 print"G{left}";
2020 getu$:ifu$<"a"oru$>"ü"goto2020
2030 printu$;:a$=a$+u$:k=k+1:ifk<4goto2010
2040 ifa$="crys"thenprint"tal shard{home}":goto2100
2050 ifa$="shar"thenprint"d{home}":goto2100
2060 sys5681:print"{lred}that makes no{home}":sys5681:print"sense here!{home}":goto100
2100 ifpeek(49351)goto2110
2102 sys5681:print"{pur}you don't have{home}":sys5681:print"the shard!{home}":goto100
2110 ifx>14andx<19andy<7goto2120
2112 sys5681:print"{lred}you are too far{home}":sys5681:print"from the{home}
2114 sys5681:print"crystal!{home}":goto100
2120 ifx=18andy=4goto2130
2122 sys5681:print"{lblu}you are not{home}":sys5681:print"standing by the{home}
2123 sys5681:print"notch in the{home}":sys5681:print"crystal where{home}
2124 sys5681:print"the shard is!{home}":goto100
2130 sys5681:print"{cyn}you raise the{home}":sys5681:print"shard high{home}
2132 sys5681:print"above the scar{home}":sys5681:print"in the crystal.{home}
2134 sys5681:print"the shard glows.{home}":sys5681:print"in a moment{home}
2136 sys5681:print"your destiny{home}":sys5681:print"will be{home}
2138 sys5681:print"fulfilled.{home}":gosub990:print"what do you cry{home}
2140 sys5681:print"out as you heal{home}":sys5681:print"the crystal?{home}
2200 a$="":k=0:sys5681:sys5681:print"{yel}@@@{wht}";
2210 print"G{left}";
2220 getu$:ifu$=chr$(13)andk>.goto2300
2230 ifu$=chr$(20)andk>.goto2260
2240 ifu$<"a"oru$>"ü"ork=12goto2220
2250 a$=a$+u$:printu$;:k=k+1:goto2210
2260 k=k-1:a$=left$(a$,k):print" {left}{left}";:goto2210
2300 print" {home}":sys5681:sys5681:print"{cyn}the shard{home}":sys5681:print"pulses warm in{home}
2302 sys5681:print"your hand. the{home}":sys5681:print"crystal begins{home}
2304 sys5681:print"to vibrate and{home}":sys5681:print"to hum.{home}
2306 gosub990:print"you stare the{home}":sys5681:print"horrible{home}
2308 sys5681:print"archdemon right{home}":sys5681:print"in his{home}
2310 sys5681:print"indescribable{home}":sys5681:print"eyes and{home}
2312 sys5681:print"roar with all{home}":sys5681:print"your might:{home}
2314 sys5681:print"{yel}%"a$"!%{home}":sys5681:print"{cyn}then you bring{home}
2316 sys5681:print"the shard{home}":sys5681:print"crashing down...{home}
2320 gosub990:ifa$="trofnih"goto2400
2321 ifa$="hinfort"goto5000
2322 print"{lgrn}with a singing{home}":sys5681:print"tone the shard{home}
2324 sys6041:pokes+5,10:pokes+1,28:pokes+4,17:sys5681:print"strikes a spark{home}
2326 sys5681:print"on the surface{home}":sys5681:print"of the crystal,{home}
2328 sys5681:print"but nothing{home}":sys5681:print"else{home}
2330 sys5681:print"happens.{home}":sys5681:print"{home}
2332 gosub990:print"the shard{home}":sys5681:print"does not fuse{home}
2334 sys5681:print"with the{home}":sys5681:print"crystal; on the{home}
2336 sys5681:print"contrary, a wave{home}":sys5681:print"of evil{home}
2337 sys5681:print"surges against{home}":sys5681:print"you and{home}
2338 sys5681:print"mingles with{home}":sys5681:print"the laughter{home}
2339 sys5681:print"of the archdemon{home}":gosub990:goto100
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
2428 pokev+21,0:print"{yel}what have you{home}":sys5681:print"done?{home}
2430 gosub999:print"the name of evil{home}":sys5681:print"has unleashed{home}
2432 sys5681:print"the full power{home}":sys5681:print"of the{home}
2434 sys5681:print"archdemon. the{home}":sys5681:print"crystal has{home}
2436 sys5681:print"literally{home}":sys5681:print"exploded.{home}
2438 sys5681:print"with it all hope{home}":sys5681:print"for this{home}
2440 sys5681:print"world{home}":sys5681:print"is lost!{home}":gosub990:print"but you have{home}
2442 sys5681:print"no chance{home}":sys5681:print"left{home}
2444 sys5681:print"to regret{home}":sys5681:print"your mistake.{home}
2446 gosub990:print"the last thing{home}":sys5681:print"you feel is{home}
2448 sys5681:print"the name of evil{home}":sys5681:print"burning your{home}
2450 sys5681:print"body and soul,{home}":sys5681:print"while the{home}
2452 sys5681:print"crystal's shards{home}":sys5681:print"tear your{home}
2453 sys5681:print"body to{home}":sys5681:print"pieces...{home}":gosub990
2454 k=3:goto13000
3000 print"spell{home}":sys5681:sys5681:print"{cyn}the only{home}
3001 sys5681:print"spell that can{home}":sys5681:print"be cast{home}
3002 sys5681:print"here is{home}":sys5681:print"break curse.{home}
3004 sys5681:sys5681:print"{yel}would you like{home}":sys5681:print"that?";:gosub970:ifu$="n"goto100
3006 ifpeek(49308)=.thenprint"{lred}you don't know{home}":sys5681:print"that spell!{home}":goto100
3008 ifas<30thenprint"{lred}not enough{home}":sys5681:print"astral energy!{home}":goto100
3010 ifpeek(49340)=.orpeek(49341)=.orpeek(49343)=.thenprint"not enough herbs{home}":goto100
3012 poke49340,peek(49340)-1:poke49341,peek(49341)-1:poke49343,peek(49343)-1
3014 as=as-30:poke49235,as/256:poke49234,as-256*peek(49235)
3016 print"{orng}you concentrate{home}":sys5681:print"...{home}
3018 sys5681:ifrnd(ti)*20+1>chthenprint"{lred}it fails!{home}":goto100
3020 print"{cyn}it works!{home}":h=5934+35*y+x:fori=0to10:h=h+35
3021 forj=-5to5:ifpeek(h+j)=.thenpokeh+j,11
3022 nextj,i:poke53281,14:sys6041:pokes+5,10:pokes+4,33
3024 fori=5to50step5:forj=itoi+10:pokes+1,j:nextj,i:poke53281,0
3026 fori=0to500:next:poke51200,15:sys4361:fori=0to500:next:poke51200,12:sys4361
3028 fori=0to500:next:poke51200,11:sys4361:fori=0to500:next:poke51200,0:sys4361
3030 poke51200,1:goto100
3300 print"{left}  {home}":sys5681:print"{yel}do you want to{home}":sys5681:print"leave the keep{home}
3301 sys5681:print"now?";:gosub970:ifu$="n"theny=y-1:goto100
3302 goto6000
3500 print"ready weapon{home}":sys5681
3540 ifpeek(49265)=.goto3550
3542 print"{yel}spellwing{home}":sys5681:print"ready!{home}":poke49246,18:wa=18
3544 sh=0:poke49167,0:return
3550 print"{lred}the only{home}":sys5681:print"weapon that{home}":sys5681:print"could help you{home}
3552 sys5681:print"now, you don't{home}":sys5681:print"have yet!{home}
3560 gosub990:print"{yel}you flee...{home}":fori=0to3e3:next:run
5000 poke891,30:poke890,23:poke902,51:poke901,34:poke51230,3:poke51223,3
5002 poke51251,3:poke51234,3:sys6041:pokes+5,12:pokes+12,12:sys4361
5004 pokes+4,129:pokes+11,17:fori=33to7step-1:pokes+1,i:pokes+8,i:next
5006 poke51230,1:poke51223,1:poke51251,1:poke51234,1:sys4361
5008 fori=8to120:pokes+1,i:pokes+8,i:next
5010 sys5681:print"done it! the{home}":sys5681:print"crystal flares{home}
5011 sys5681:print"up and fuses{home}":sys5681:print"with the shard{home}
5012 sys5681:print"into one{home}":sys5681:print"whole again.{home}
5013 sys5681:print"at the same{home}":sys5681:print"time you sense{home}
5014 sys5681:print"an unimaginably{home}":sys5681:print"strong power{home}
5015 sys5681:print"gathering{home}":sys5681:print"within it.{home}
5016 gosub990:print"the archdemon{home}":sys5681:print"lets out a{home}
5018 poke867,8:poke870,4:sys4361:sys5681:print"desperate{home}
5020 gosub999:print"{yel}%{rvon}Z{rvof}{$b2}{$c0}{$ae}{$b0}{$c0}{$c0}{rvon}YXZ{rvof}{$b2}{$c0}{$ae}{rvon}X{rvof}%{home}
5021 sys5681:print"  # ##   # # ##{home}":sys5681:print"  # #{$ab}{$c0}{rvon}Y{rvof} # # #{rvon}W{home}
5022 sys5681:print"  # ##   # # #{rvon}X{home}":sys5681:print" {rvon}Z{rvof}{$bd}{rvon}Z{rvof}{$bd}{$ad}{$c0}{$c0}{rvon}YWZ{rvof}{$bd}{rvon}Z{rvof}{$bd}{rvon}W{home}
5024 gosub999:gosub990:print"{cyn}then the crystal{home}":sys5681:print"virtually{home}
5026 sys5681:print"explodes in{home}":sys5681:print"a pure{home}
5028 sys5681:print"white light...{home}":gosub990
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
5050 pokev+33,0:pokev+32,0:gosub999:print"the power of the{home}":sys5681:print"crystal has{home}
5052 sys5681:print"hurled the demon{home}":sys5681:print"back into the{home}
5054 sys5681:print"dark abysses{home}":sys5681:print"of hell{home}
5056 sys5681:print"from which{home}":sys5681:print"it came.{home}
5058 gosub990:print"with the demon{home}":sys5681:print"vanishes all{home}":sys5681:print"the evil that{home}
5060 sys5681:print"disturbed the{home}":sys5681:print"balance of the{home}
5062 sys5681:print"world...{home}":gosub990:poke2,20:sys5782:sys4361:poke829,0
5064 fori=0to15:poke2600+i,peek(3336+i):next:poke829,1:poke2,1:sys5782
5066 poke51201,14:fori=0to31:poke3928+i,peek(49920+i):next:sys4361
5100 print"{home}{down}{down}{down}{down}"spc(9)"{cyn}GHGHGH":printspc(7)"{up}GHG{orng}{$b4}{$a2}{$b4}{$a2}{cyn}HGH
5102 printspc(6)"HG{orng}{rvon}{$af}{rvof}{$b6}{rvon}{$af}{rvof}{$b6}{rvon}{$af}{rvof}{$b6}{rvon}{$af}{rvof}{$b6}{cyn}HG":print"{up}{rght}{rght}{rght}{rght}{rght}GH{orng}{$a2}{$b4}{$a2}{$b4}{$a2}{$b4}{$a2}{$b4}{$a2}{$b4}{cyn}GH
5104 print"{rght}{rght}{rght}{rght}{rght}G{orng}{rvon}{$af}{rvof}{$b6}{rvon}{$af}{rvof}{$b6}{lred}GHGH{rvon}{orng}{$af}{rvof}{$b6}{rvon}{$af}{rvof}{$b6}{cyn}H":print"{up}{rght}{rght}{rght}{rght}{cyn}HG{orng}{$b4}{$a2}{$b4}{lred}GHGHGH{orng}{$a2}{$b4}{$a2}{cyn}HG
5106 print"{rght}{rght}{rght}{rght}{cyn}H{orng}{$b6}{rvon}{$af}{rvof}{$b6}{lred}HGHGHGHG{rvon}{orng}{$af}{rvof}{$b6}{rvon}{$af}{rvof}{cyn}G":print"{rght}{up}{rght}{rght}{rght}H{orng}{$a2}{$b4}{$a2}{lred}HGH{wht}{rvon}{$a8}{$a9}{rvof}{lred}GHG{orng}{$b4}{$a2}{$b4}{cyn}G
5108 print"{rght}{rght}{rght}{rght}{cyn}H{orng}{$b6}{rvon}{$af}{rvof}{$b6}{lred}HGH{rvon}{wht}{$aa}{rvof}${lred}GHG{rvon}{orng}{$af}{rvof}{$b6}{rvon}{$af}{rvof}{cyn}G":print"{rght}{up}{rght}{rght}{rght}H{orng}{$a2}{$b4}{$a2}{lred}HGHGHGHG{orng}{$b4}{$a2}{$b4}{cyn}G
5110 print"{rght}{rght}{rght}{rght}{cyn}HG{orng}{$b6}{rvon}{$af}{rvof}{$b6}{lred}GHGHGH{orng}{$b6}{rvon}{$af}{rvof}{$b6}{cyn}HG":print"{up}{rght}{rght}{rght}{rght}{rght}G{orng}{$a2}{$b4}{$a2}{$b4}{lred}GHGH{orng}{$b4}{$a2}{$b4}{$a2}{cyn}H
5112 print"{rght}{rght}{rght}{rght}{rght}GH{orng}{$b6}{rvon}{$af}{rvof}{$b6}{rvon}{$af}{gry3}JK{orng}{rvof}{$b6}{rvon}{$af}{rvof}{$b6}{rvon}{$af}{rvof}{cyn}GH":printspc(6)"{up}HG{orng}{$b4}{$a2}{rvon}{gry3}MLML{orng}{rvof}{$b4}{$a2}{cyn}HG
5114 printspc(7)"GHGH{rght}{rght}GHGH":gosub999:print"{lgrn}you too are{home}
5116 sys5681:print"seized by the{home}":sys5681:print"power of the{home}
5118 sys5681:print"crystal and{home}":sys5681:print"flung{home}
5120 sys5681:print"upwards.{home}":gosub990:print"from a great{home}":sys5681:print"height you{home}
5121 sys5681:print"watch the{home}":sys5681:print"skull keep{home}
5122 sys5681:print"the demon built{home}":sys5681:print"around the{home}
5123 sys5681:print"crystal being{home}":sys5681:print"destroyed{home}
5124 sys5681:print"...{home}":gosub990
5130 pokev+23,1:pokev+29,1:pokev,104:pokev+1,130:sys6041:pokes+5,13:pokes+1,3
5132 k=15:pokev+21,1:pokes+4,129:fori=0to12:k=78-k:poke2040,k:forj=0to33:nextj,i
5134 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"spc(11)"{wht}{rvon}{$a4}{$a5}{down}{left}{left}{$a6}{$a7}";:pokev+21,0:fori=0to500:next
5136 print"{up}{left}{left}{cyn}{$a4}{$a5}{down}{left}{left}{$a6}{$a7}":gosub999:print"{lgrn}the clouds{home}":sys5681:print"part,
5138 sys5681:print"and bright{home}":sys5681:print"sunlight{home}":sys5681:print"floods the
5140 sys5681:print"land. the{home}":sys5681:print"balance{home}":sys5681:print"is restored{home}
5142 sys5681:print"and this{home}":sys5681:print"dimension{home}
5144 sys5681:print"is no longer{home}":sys5681:print"dark.{home}":gosub990
5146 sys5681:print"your task{home}":sys5681:print"here is thus{home}
5148 sys5681:print"fulfilled.{home}":gosub999:print"you have won,{home}
5149 sys5681:print"but what will{home}":sys5681:print"become of you..?{home}":gosub990
5200 sys5681:print"{yel}you no longer{home}
5202 sys5681:print"fit into the{home}":sys5681:print"balance of{home}
5204 sys5681:print"this world. the{home}":sys5681:print"crystal's power{home}
5206 sys5681:print"also takes from{home}":sys5681:print"you all the{home}
5208 sys5681:print"things and{home}":sys5681:print"abilities you{home}
5210 sys5681:print"gained here.{home}":gosub990:print"you are hurled{home}
5212 sys5681:print"back out of{home}":sys5681:print"this world{home}
5214 sys5681:print"into the endless{home}":sys5681:print"whirling{home}
5216 sys5681:print"void of time{home}":sys5681:print"and space...{home}
5220 poke56295,1:poke2023,71:sys49440:pokev-1,1:pokev-2,13:poke198,0
5222 sys49626:forj=0to75:next:getu$:ifu$=""goto5222
5224 poke2023,32:poke49665,15:fori=0to12:sys49626:forj=0to45:nextj,i
5226 poke49665,12:fori=0to18:sys49626:forj=0to38:nextj,i
5228 poke49665,11:fori=0to24:sys49626:forj=0to30:nextj,i:sys49440
5230 fori=0to25step.2:sys49607:forj=0to25-i:nextj,i:poke2,20:sys5782
5232 fori=0to99:sys49607:next:sys4361
5240 fori=0to9:gosub999:next:print"where will you{home}":sys5681:print"land?{home}
5242 gosub999:gosub999:gosub990:forj=0to9:gosub999:next:print"back home?{home}
5244 gosub999:gosub999:gosub990:forj=0to9:gosub999:next:print"perhaps...{home}
5246 gosub999:gosub999:gosub990:forj=0to9:gosub999:next:print"...or perhaps{home}
5248 sys5681:print"already in{home}":sys5681:print"part two{home}
5250 gosub999:print"{wht}  the black
5252 sys5681:print"    fortress{home}":gosub999:print"{yel}  -coming soon{home}
5254 sys5681:print"   to this{home}":sys5681:print"   screen
5255 sys5681:print"{lgrn}{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}  - t h e  e n d -{home}
5256 goto5256
6000 sys5681:poke2,0:print"{lred}you leave{home}":sys5681:print"the fortress.{home}":fori=1to3e3:next
6010 print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
6020 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:new
6100 pokes+4,0:pokes+5,16:pokes+1,12:pokes+4,129:goto100
9003 ifgp<zthenprint"you don't have{home}":sys5681:print"enough gold!%{home}":goto400
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
13002 sys5681:gosub12900:gosub12910:gosub12910:print"you are dead{home}
13010 gosub12910:gosub12900:sys5681:sys5681:print"{yel}you played";:gosub12920
13020 sys5681:print"moves.{home}":sys5681:sys5681:print"{wht}cause of death:{home}
13022 sys5681:ifk=1thenprint"{lgrn}a phantom";
13024 ifk=2thenprint"{cyn}a golem";
13025 ifk=3thenprint"{cyn}the demon";
13026 print"{home}":sys5681:print"killed you.{home}
13030 poke56295,1:poke2023,71:poke198,0:wait198,1:poke2,17:goto6010
13100 sys5681:sys5681:print"you receive{home}
13110 l=8+ma*2:sys5681:printmid$(str$(l),2)" points.{home}
13130 sys5681:ef=ef+l:ifef>999999thenef=999999
13150 k=ef:l=int(k/65536):poke49240,l:k=k-65536*l:l=int(k/256):poke49239,l
13160 poke49238,k-256*l:goto10000
50000 datamagic light,8,2,50,cure poison,9,5,100,shield,9,10,100
50001 datamiracle cure,10,10,150,break curse,10,30,300,light shield,11,15,150
50002 dataagility,12,20,200,turn undead,13,20,250
50100 data-35,6400,1,6800,35,6820,-1,6990
