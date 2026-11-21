1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272
2 poke51211,8:poke51209,15:poke51208,12:sys5454
20 print"{home}{down}{down}"spc(24)"{lgrn}health:   (   )":printspc(24)"{up}{cyn}astral:   (   )
21 printspc(24)"{lred}att.:   {grn}def.:":printspc(24)"{up}{pur}str.:   {yel}dex.:
22 printspc(24)"{gry3}int.:   {lblu}cha.:":printspc(24)"{up}{lgrn}exp.:      (  )
23 printspc(24)"{yel}gold pcs.:":printspc(24)"{up}{orng}food supply:
25 x(0)=2:y(0)=7:x(1)=7:y(1)=8:z(0)=11:z(1)=11:x=5:y=9
30 gosub10000
100 gosub300:sys4361:sys5681:sys5440:print"{wht}@G{left}";:z=0:ify>9goto600
110 z=z+1:ifz>299goto200
120 getu$:ifu$=""goto110
122 ifu$=" "goto200
124 ifu$="{up}"goto210
125 ifu$="{down}"goto220
126 ifu$="{left}"goto230
127 ifu$="{rght}"goto234
128 ifu$="t"goto240
190 print"what..?{home}":goto100
200 print"waiting...{home}":goto100
202 pokej,27:sys6041:pokes+5,16:pokes+1,12:pokes+4,129:goto100
210 print"north{home}":j=821+x+11*y:ifpeek(j)>8andpeek(j)<>11goto214
212 pokej+11,11:y=y-1:goto202
214 sys5681:print"{lred}blocked!{home}":sys5681:goto100
220 print"south{home}":j=843+x+11*y:ifpeek(j)>8andpeek(j)<>11goto214
222 pokej-11,11:y=y+1:goto202
230 print"west{home}":j=831+x+11*y:ifpeek(j)>8andpeek(j)<>11goto214
232 pokej+1,11:x=x-1:goto202
234 print"east{home}":j=833+x+11*y:ifpeek(j)>8andpeek(j)<>11goto214
236 pokej-1,11:x=x+1:goto202
240 print"talk";:sys5681:print"{yel} -direction? {wht}G{left}";:z=0
250 z=z+1:ifz>499goto258
252 getu$:ifu$=""goto252
254 ifu$="{up}"thenprint"north{home}":j=-11:goto260
255 ifu$="{down}"thenprint"south{home}":j=11:goto260
256 ifu$="{left}"thenprint"west{home}":j=-1:goto260
257 ifu$="{rght}"thenprint"east{home}":j=1:goto260
258 print"no{home}":sys5681:z=0:goto100
260 j=peek(832+x+11*y+j):sys5681:ifj=71goto400
270 ifj<>74thenprint"{lred}no answer!{home}":sys5681:goto100
280 sys5681:print"{cyn}you talk to";:sys5681:print"a cat.{home}
290 sys5681:sys5681:print"{yel}the cat says:";:sys5681:j=int(4*rnd(1))
292 print"{lgrn}%"mid$("meow{rvof}{rvof}{rvof}mew{rvof}{rvof}{rvof}{rvof}hiss{rvof}{rvof}{rvof}purr",7*j+1,7)"!%{home}
294 sys5681:goto100
300 fori=0to1:j=int(4*rnd(ti)):dx=x(i)+(j=0)-(j=1):dy=y(i)+(j=2)-(j=3)
310 j=832+dx+11*dy:ifdx<.ordy<.ordx>10ordy>10orpeek(j)>20orpeek(j)=9goto390
320 poke832+x(i)+11*y(i),z(i):x(i)=dx:y(i)=dy:z(i)=peek(j):pokej,74
390 next:return
400 sys5681:print"{cyn}you talk to the";:sys5681:print"druid.{home}
401 j=su*25-26:ifj>amgoto1000
402 ifrnd(ti)<.5goto454
410 gosub900:ifrnd(ti)<.05thenprint" {home}":goto451
413 ifn$="name"thenprint"?{home}":goto454
414 ifn$="job"goto456
415 ifn$="fuck"orn$="piss"ormid$(n$,2)="ung"orn$="shit"orn$="porn"goto458
416 ifn$="drui"goto460
417 ifn$="help"thenprint"{home}":goto465
418 ifn$="aid"goto464
419 ifn$="see"orn$="seei"goto467
420 ifn$="bye"goto450
421 ifn$="heal"goto500
422 ifn$="cure"thenprint"{home}":gosub950:goto504
423 ifn$="evil"goto470
424 ifn$="worl"goto474                                    
425 ifn$="bala"goto476
426 ifn$="crys"goto490
427 ifn$="shar"goto530
440 print" {home}":gosub950:print"i can't help{home}":sys5681:print"you with{home}":sys5681
441 print"that.%{home}
442 sys5681:goto410
450 print"!{home}"
451 gosub950:print"my prayers{home}":sys5681
452 print"go with you.%{home}":sys5681:goto100
454 gosub950:print"i am{home}":sys5681:print"cerfax.%{home}":goto442
456 print"?{home}":gosub950:print"i am a{home}":sys5681:print"druid.%{home}":goto442
458 print" {home}":gosub950:print"you are a{home}":sys5681:print"dirty old pig!%{home}":goto442
460 print"d{home}":gosub950:print"we druids":sys5681:print"are wise old{home}
461 sys5681:print"mages, but more{home}":sys5681:print"bound to nature{home}":sys5681
462 print"than the{home}":sys5681:print"sorcerers.{home}":gosub960:print"we see, we{home}
463 sys5681:print"cure and{home}":sys5681:print"we help.{home}":goto442
464 print"{home}
465 gosub950:print"ask what you{home}":sys5681:print"want to know.{home}":sys5681
466 print"i know a great{home}":sys5681:print"deal.%{home}":goto442
467 print"{home}":gosub950:print"i see how evil{home}":sys5681:print"is conquering{home}
468 sys5681:print"our world.%{home}":goto442
470 print"{home}":gosub950:print"to speak the{home}":sys5681:print"name of evil{home}
472 sys5681:print"aloud brings{home}":sys5681:print"disaster.%{home}":goto442
474 print"d{home}":gosub950:print"evil has{home}":sys5681:print"destroyed the{home}
475 sys5681:print"balance of our{home}":sys5681:print"world.%{home}":goto442
476 print"nce{home}":gosub950:print"do you come from{home}":sys5681:print"another{home}
477 sys5681:print"world?";:gosub970:ifu$="y"goto479
478 print"then you should{home}":sys5681:print"know this!%{home}":goto442
479 print"once our world{home}":sys5681:print"was fair and{home}":sys5681
480 print"bright. people{home}":sys5681:print"lived in peace{home}":sys5681
481 print"and were{home}":sys5681:print"happy.{home}":gosub960
482 print"but evil{home}":sys5681:print"brought eternal{home}":sys5681
483 print"darkness upon{home}":sys5681:print"us, and the{home}":sys5681
484 print"creatures of{home}":sys5681:print"the night{home}":sys5681
485 print"crawl out of{home}":sys5681:print"their holes and{home}":sys5681
486 print"flood the{home}":sys5681:print"land.{home}":gosub960
487 print"the sun will{home}":sys5681:print"never rise{home}":sys5681
488 print"again, for the{home}":sys5681:print"crystal is{home}":sys5681
489 print"broken.%{home}":goto442
490 print"tal{home}":gosub950:print"the crystal{home}":sys5681:print"of light, which{home}
491 sys5681:print"kept the{home}":sys5681:print"balance of our{home}":sys5681
492 print"world. borne by{home}":sys5681:print"fire and air{home}":sys5681
493 print"it floats above{home}":sys5681:print"the lava of{home}":sys5681
494 print"the great{home}":sys5681:print"volcano.{home}":gosub960
495 print"but evil struck{home}":sys5681:print"with all its{home}":sys5681
496 print"cruel might,{home}":sys5681:print"and the{home}":sys5681
497 print"crystal burst.{home}":sys5681:print"a shard{home}":sys5681
498 print"broke off. the{home}":sys5681:print"crystal{home}":sys5681
499 print"turned black.{home}":sys5681:print"with it died{home}":sys5681:goto520
500 print"th?{home}":gosub950:print"i am exhausted.{home}":sys5681:print"but are you{home}
501 sys5681:print"well?";:gosub970:ifu$="n"goto504
502 print"i am glad to{home}":sys5681:print"hear it.%{home}":goto442
504 print"let me heal{home}":sys5681:print"you...%{home}
510 pokes+5,201:pokes+12,201:pokes+11,129:pokes+4,17:k=5
512 fori=5to255step5:pokes+1,i:pokes+8,i:k=5-k:poke53281,k:poke53280,k:next
514 poke53281,0:poke53280,0:pokes+11,0:pokes+4,0
516 poke49230,peek(49232):poke49231,peek(49233):poke49245,0:gosub10000:goto442
520 print"the sun, too.{home}":gosub620:print"but the shard{home}":sys5681
521 print"was hurled into{home}":sys5681:print"another{home}":sys5681
522 print"dimension. when{home}":sys5681:print"you touched it,{home}":sys5681
523 print"a spell{home}":sys5681:print"broke, and the{home}":sys5681
524 print"shard and you{home}":sys5681:print"were{home}":sys5681
525 print"teleported{home}":sys5681:print"here.{home}":gosub960
526 print"do you have the{home}":sys5681:print"shard?";:gosub970:ifu$="n"goto528
527 print"heal the{home}":sys5681:print"black{home}":sys5681:print"crystal!%{home}":goto442
528 print"go and find it,{home}":sys5681:print"or else our{home}":sys5681
529 print"world will be{home}":sys5681:print"lost forever.{home}":goto532
530 print"d";:gosub950:print"the crystal{home}":sys5681:print"and the shard{home}
531 sys5681:print"must be united{home}":sys5681:print"again!%{home}":goto442
532 gosub960:print"you had best go{home}":sys5681:print"north-east.{home}":sys5681
533 print"there you will{home}":sys5681:print"reach the{home}":sys5681
534 print"king's castle.{home}":sys5681:print"they will help{home}":sys5681:print"you there.%{home}":goto442
600 print"{left}  {home}":sys5681:print"{lred}you leave{home}":sys5681:print"the house.{home}
610 fori=0to600:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
612 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:poke2,0:new
620 gosub960:print"the shard broke{home}":sys5681:print"off the upper{home}
622 sys5681:print"right corner{home}":sys5681:print"of the{home}
623 sys5681:print"crystal.{home}":sys5681:print"remember this{home}
624 sys5681:print"spot!{home}":gosub960:print"evil built an{home}":sys5681:print"impregnable{home}
625 sys5681:print"fortress in the{home}":sys5681:print"shape of a huge{home}
626 sys5681:print"skull around{home}":sys5681:print"the crystal.{home}
627 sys5681:print"there it lurks{home}":sys5681:print"and sends out{home}
628 sys5681:print"ruin and{home}":sys5681:print"destruction.{home}":goto960
900 sys5681:print"{yel}your business?";:sys5681:print"{wht}@G{left}";:z=0:n$="":poke198,0
910 getu$:ifu$=chr$(13)thenn$=n$+mid$("bye",1,-3*(z=0)):printmid$("bye",1,-3*(z=0));:return
912 ifu$=chr$(20)andz>0thenz=z-1:n$=left$(n$,z):print" {left}{left}G{left}";
920 ifu$<"a"oru$>"z"goto910
930 printu$"G{left}";:n$=n$+u$:z=z+1:ifz=4thenreturn
940 goto910
950 gosub300:sys4361:gosub999:print"{yel}the druid says:";:sys4361
952 sys5681:print"{lgrn}%";:return
960 sys5681:printspc(15)"{wht}G{left}{lgrn}";:poke198,0:wait198,1:print" {home}":sys5681:return
970 print" {wht}G{left}";:poke198,0
971 getu$:ifu$="y"oru$="n"thenprintu$"{lgrn}{home}":gosub999:return
972 goto971
999 sys5681:sys5681:return
1000 poke49237,j/256:poke49236,j-256*peek(49237):gosub950:print"oh, i see that{home}
1001 sys5681:print"you are now at{home}":sys5681:print"level"su"{left}. so i{home}
1002 sys5681:print"will now raise{home}":sys5681:print"your receptive-{home}
1003 sys5681:print"ness to{home}":sys5681:print"magic.%{home}
1004 s=54272:sys6041:pokes+5,10+160:pokes+4,33:k=7:poke49235,peek(49237)
1005 fori=0to66:k=10-k:pokes+1,k*8:poke53281,k:poke53280,k:next:sys6041
1006 poke49234,peek(49236):poke53281,0:poke53280,0:gosub10000:goto442
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
10019 printspc(24)"{wht}g{lgrn} ":po=peek(49245):ifpothenpoke1449,48+po:poke55720,13
10020 wf=peek(49246):rs=peek(49247):sh=peek(49248):return
