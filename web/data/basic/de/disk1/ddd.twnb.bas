1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272
2 poke51211,8:poke51209,15:poke51208,12:sys5454
20 print"{home}{down}{down}"spc(24)"{lgrn}vital.:   (   )":printspc(24)"{up}{cyn}astral:   (   )
21 printspc(24)"{lred}ang.:   {grn}ver.:":printspc(24)"{up}{pur}str.:   {yel}ges.:
22 printspc(24)"{gry3}klg.:   {lblu}cha.:":printspc(24)"{up}{lgrn}erf.:      (  )
23 printspc(24)"{yel}goldstck.:":printspc(24)"{up}{orng}nahr.vorrat:
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
128 ifu$="k"goto240
190 print"wie bitte..?{home}":goto100
200 print"warten...{home}":goto100
202 pokej,27:sys6041:pokes+5,16:pokes+1,12:pokes+4,129:goto100
210 print"norden{home}":j=821+x+11*y:ifpeek(j)>8andpeek(j)<>11goto214
212 pokej+11,11:y=y-1:goto202
214 sys5681:print"{lred}blockiert!{home}":sys5681:goto100
220 print"süden{home}":j=843+x+11*y:ifpeek(j)>8andpeek(j)<>11goto214
222 pokej-11,11:y=y+1:goto202
230 print"westen{home}":j=831+x+11*y:ifpeek(j)>8andpeek(j)<>11goto214
232 pokej+1,11:x=x-1:goto202
234 print"osten{home}":j=833+x+11*y:ifpeek(j)>8andpeek(j)<>11goto214
236 pokej-1,11:x=x+1:goto202
240 print"kommuniziere";:sys5681:print"{yel} - richt.? {wht}G{left}";:z=0
250 z=z+1:ifz>499goto258
252 getu$:ifu$=""goto252
254 ifu$="{up}"thenprint"nord{home}":j=-11:goto260
255 ifu$="{down}"thenprint"süd{home}":j=11:goto260
256 ifu$="{left}"thenprint"west{home}":j=-1:goto260
257 ifu$="{rght}"thenprint"ost{home}":j=1:goto260
258 print"nein{home}":sys5681:z=0:goto100
260 j=peek(832+x+11*y+j):sys5681:ifj=71goto400
270 ifj<>74thenprint"{lred}keine antwort!{home}":sys5681:goto100
280 sys5681:print"{cyn}du sprichst";:sys5681:print"eine katze an.{home}
290 sys5681:sys5681:print"{yel}die katze sagt:";:sys5681:j=int(4*rnd(1))
292 print"{lgrn}%"mid$("miau{rvof}{rvof}{rvof}maunz{rvof}{rvof}fauch{rvof}{rvof}schnurr",7*j+1,7)"!%{home}
294 sys5681:goto100
300 fori=0to1:j=int(4*rnd(ti)):dx=x(i)+(j=0)-(j=1):dy=y(i)+(j=2)-(j=3)
310 j=832+dx+11*dy:ifdx<.ordy<.ordx>10ordy>10orpeek(j)>20orpeek(j)=9goto390
320 poke832+x(i)+11*y(i),z(i):x(i)=dx:y(i)=dy:z(i)=peek(j):pokej,74
390 next:return
400 sys5681:print"{cyn}du sprichst den";:sys5681:print"druiden an.{home}
401 j=su*25-26:ifj>amgoto1000
402 ifrnd(ti)<.5goto454
410 gosub900:ifrnd(ti)<.05thenprint" {home}":goto451
413 ifn$="name"thenprint"?{home}":goto454
414 ifn$="beru"goto456
415 ifn$="fick"orn$="piss"ormid$(n$,2)="otz"orn$="arsc"orn$="porn"goto458
416 ifn$="drui"goto460
417 ifn$="hilf"thenprint"e{home}":goto465
418 ifn$="helf"goto464
419 ifn$="sehe"goto467
420 ifn$="wied"goto450
421 ifn$="gesu"goto500
422 ifn$="heil"thenprint"en{home}":gosub950:goto504
423 ifn$="boes"goto470
424 ifn$="welt"goto474                                    
425 ifn$="glei"goto476
426 ifn$="kris"goto490
427 ifn$="spli"goto530
440 print" {home}":gosub950:print"damit kann{home}":sys5681:print"ich dir nicht{home}":sys5681
441 print"weiterhelfen.%{home}
442 sys5681:goto410
450 print"ersehen.{home}"
451 gosub950:print"meine gebete{home}":sys5681
452 print"begleiten dich.%{home}":sys5681:goto100
454 gosub950:print"ich bin{home}":sys5681:print"cerfax.%{home}":goto442
456 print"f?{home}":gosub950:print"ich bin ein{home}":sys5681:print"druide.%{home}":goto442
458 print" {home}":gosub950:print"du bist ein{home}":sys5681:print"altes ferkel!%{home}":goto442
460 print"de{home}":gosub950:print"wir druiden":sys5681:print"sind weise alte{home}
461 sys5681:print"magier, aber{home}":sys5681:print"mehr naturver-{home}":sys5681
462 print"bunden als die{home}":sys5681:print"zauberer.{home}":gosub960:print"wir sehen, wir{home}
463 sys5681:print"heilen und{home}":sys5681:print"wir helfen.{home}":goto442
464 print"en{home}
465 gosub950:print"frage, was du{home}":sys5681:print"wissen willst.{home}":sys5681
466 print"ich weiss sehr{home}":sys5681:print"viel.%{home}":goto442
467 print"n{home}":gosub950:print"ich sehe wie{home}":sys5681:print"das{rght}böse unsere{home}
468 sys5681:print"welt erobert.%{home}":goto442
470 print"e{home}":gosub950:print"den namen des{home}":sys5681:print"bösen auszu-{home}
472 sys5681:print"sprechen bedeu-{home}":sys5681:print"tet unheil.%{home}":goto442
474 print" {home}":gosub950:print"das böse hat{home}":sys5681:print"das gleichge-{home}
475 sys5681:print"wicht unserer{home}":sys5681:print"welt zerstört.%{home}":goto442
476 print"chgewicht{home}":gosub950:print"kommst du von{home}":sys5681:print"einer anderen{home}
477 sys5681:print"welt?";:gosub970:ifu$="j"goto479
478 print"dann müsstest du{home}":sys5681:print"dies wissen!%{home}":goto442
479 print"einst war unsere{home}":sys5681:print"welt schön und{home}":sys5681
480 print"hell. die men-{home}":sys5681:print"schen lebten in{home}":sys5681
481 print"frieden und{home}":sys5681:print"waren glücklich.{home}":gosub960
482 print"doch das böse{home}":sys5681:print"brachte die{home}":sys5681
483 print"ewige dunkelheit{home}":sys5681:print"über uns, und{home}":sys5681
484 print"die kreaturen{home}":sys5681:print"der finsternis{home}":sys5681
485 print"kriechen aus ih-{home}":sys5681:print"ren löchern und{home}":sys5681
486 print"überfluten das{home}":sys5681:print"land.{home}":gosub960
487 print"die sonne wird{home}":sys5681:print"nie wieder auf-{home}":sys5681
488 print"gehen, denn der{home}":sys5681:print"kristall ist{home}":sys5681
489 print"zerbrochen.%{home}":goto442
490 print"tall{home}":gosub950:print"der kristall{home}":sys5681:print"des lichts, der{home}
491 sys5681:print"das gleichge-{home}":sys5681:print"wicht unserer{home}":sys5681
492 print"welt bewahrte.{home}":sys5681:print"getragen von{home}":sys5681
493 print"feuer und luft{home}":sys5681:print"schwebt er über{home}":sys5681
494 print"der lava des{home}":sys5681:print"grossen vulkans.{home}":gosub960
495 print"doch das böse{home}":sys5681:print"schlug mit all{home}":sys5681
496 print"seiner grausamen{home}":sys5681:print"macht zu, und{home}":sys5681
497 print"der kristall{home}":sys5681:print"zerbarst. ein{home}":sys5681
498 print"splitter brach{home}":sys5681:print"ab. der kristall{home}":sys5681
499 print"wurde schwarz.{home}":sys5681:print"mit ihm erlosch{home}":sys5681:goto520
500 print"ndheit?{home}":gosub950:print"ich bin er-{home}":sys5681:print"schöpft. geht es{home}
501 sys5681:print"dir denn gut?";:gosub970:ifu$="n"goto504
502 print"das freut mich{home}":sys5681:print"für dich.%{home}":goto442
504 print"lass mich dich{home}":sys5681:print"heilen...%{home}
510 pokes+5,201:pokes+12,201:pokes+11,129:pokes+4,17:k=5
512 fori=5to255step5:pokes+1,i:pokes+8,i:k=5-k:poke53281,k:poke53280,k:next
514 poke53281,0:poke53280,0:pokes+11,0:pokes+4,0
516 poke49230,peek(49232):poke49231,peek(49233):poke49245,0:gosub10000:goto442
520 print"auch die sonne.{home}":gosub620:print"der splitter{home}":sys5681
521 print"aber wurde in{home}":sys5681:print"eine andere{home}":sys5681
522 print"dimension ge-{home}":sys5681:print"schleudert. als{home}":sys5681
523 print"du ihn berühr-{home}":sys5681:print"test, brach ein{home}":sys5681
524 print"bann, und der{home}":sys5681:print"splitter und du{home}":sys5681
525 print"wurdet hierher{home}":sys5681:print"teleportiert.{home}":gosub960
526 print"hast du den{home}":sys5681:print"splitter?";:gosub970:ifu$="n"goto528
527 print"heile den {home}":sys5681:print"schwarzen{home}":sys5681:print"kristall!%{home}":goto442
528 print"geh und finde{home}":sys5681:print"ihn, sonst ist{home}":sys5681
529 print"unsere welt für{home}":sys5681:print"immer verloren.{home}":goto532
530 print"tter";:gosub950:print"der kristall{home}":sys5681:print"und der splitter{home}
531 sys5681:print"müssen wieder{home}":sys5681:print"vereint werden!%{home}":goto442
532 gosub960:print"du gehst am{home}":sys5681:print"besten nach{home}":sys5681
533 print"nordosten. dann{home}":sys5681:print"kommst du zum{home}":sys5681
534 print"schloss des{home}":sys5681:print"königs. dort{home}":sys5681:print"hilft man dir.%{home}":goto442
600 print"{left}  {home}":sys5681:print"{lred}du verlässt{home}":sys5681:print"das haus.{home}
610 fori=0to600:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
612 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:poke2,0:new
620 gosub960:print"der spliiter{home}":sys5681:print"brach aus{home}
622 sys5681:print"der rechten{home}":sys5681:print"oberen ecke des{home}
623 sys5681:print"kristalls.{home}":sys5681:print"merke dir diese{home}
624 sys5681:print"stelle!{home}":gosub960:print"das böse{home}":sys5681:print"errichtete eine{home}
625 sys5681:print"uneinnehmbare{home}":sys5681:print"festung in form{home}
626 sys5681:print"eines riesigen{home}":sys5681:print"schädels um den{home}
627 sys5681:print"kristall. dort{home}":sys5681:print"lauert es und{home}
628 sys5681:print"sendet das{home}":sys5681:print"verderben aus.{home}":goto960
900 sys5681:print"{yel}dein begehr?";:sys5681:print"{wht}@G{left}";:z=0:n$="":poke198,0
910 getu$:ifu$=chr$(13)andz=0thenn$="wied":printn$;:return
912 ifu$=chr$(20)andz>0thenz=z-1:n$=left$(n$,z):print" {left}{left}G{left}";
920 ifu$<"a"oru$>"z"goto910
930 printu$"G{left}";:n$=n$+u$:z=z+1:ifz=4thenreturn
940 goto910
950 gosub300:sys4361:gosub999:print"{yel}der druide sagt:";:sys4361
952 sys5681:print"{lgrn}%";:return
960 sys5681:printspc(15)"{wht}G{left}{lgrn}";:poke198,0:wait198,1:print" {home}":sys5681:return
970 print" {wht}G{left}";:poke198,0
971 getu$:ifu$="j"oru$="n"thenprintu$"{lgrn}{home}":gosub999:return
972 goto971
999 sys5681:sys5681:return
1000 poke49237,j/256:poke49236,j-256*peek(49237):gosub950:print"oh, ich sehe,{home}
1001 sys5681:print"du bist jezt auf{home}":sys5681:print"stufe"su"{left}. darum{home}
1002 sys5681:print"erhöhe ich nun{home}":sys5681:print"deine empfäng-{home}
1003 sys5681:print"lichkeit für{home}":sys5681:print"magie.%{home}
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
