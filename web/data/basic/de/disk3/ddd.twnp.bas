10 gosub11000:p=6551:a=.:a(.)=-20:a(1)=1:a(2)=20:a(3)=-1
20 d$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}":gosub15000:gosub300:poke50840,.
99 fori=0to6:poke49279+i,1:next:gosub3500
100 sys5440:wh=peek(49157):kp=.:ifpeek(49245)theniffnr(3)=1andu$="@"thengosub3250
102 gosub3300:ifpeek(49244)=.thengosub3280
104 if(peek(49208)and31)=.thenifpeek(49244)thenpoke49244,peek(49244)-1:gosub10000
106 z=0:sys5681:print"{wht}@G{left}";
110 z=z+1:ifz>600goto200
112 getu$:ifu$=""goto110
120 ifu$="{up}"andpeek(p)<>5goto210
121 ifu$="{down}"andpeek(p)=5goto5700
122 ifu$="{down}"thenprint"umdrehen{home}":a=a+2+4*(a>1):t=.:gosub300:goto240
124 ifu$="{rght}"andpeek(p)<>5thenprint"rechts drehen{home}":a=a+1+4*(a=3):t=.:gosub300:goto240
126 ifu$="{left}"andpeek(p)<>5thent=.:print"links drehen{home}":a=a-1-4*(a=.):gosub300:goto240
130 ifu$=" "goto200
136 ifu$="w"thengosub3000:goto100
137 ifu$="e"goto800
138 ifu$="r"thengosub3100:goto100
140 ifu$="z"thenh=0:gosub4000:goto100
142 ifu$="i"thengosub14000:goto100
143 ifu$="k"goto900
148 ifu$="s"goto6000
149 ifu$="_"thengosub31000:goto100
199 print"wie bitte..?{home}":goto100
200 print"warten...{home}":goto100
210 print"vorwärts{home}":j=p+a(a)
212 ifpeek(j)=1or(peek(j)=2andt=.)thensys5681:print"{lred}rumms!{home}":gosub30053:goto100
214 ifpeek(j)=5andt=.thensys5681:print"{lred}die tür lässt{home}":sys5681:print"sich nicht{home}
216 ifpeek(j)=5andt=.thensys5681:print"öffnen.{home}":goto100
220 p=j:gosub30000:t=.:iff=1thensys5681:print"{lblu}das licht ist{home}":sys5681:print"verbraucht!{home}
222 f=f-1:iff<1thenf=.
225 ifpeek(p)=5goto5600
230 gosub300:iffnr(7)=1goto5200
240 iffnr(5)=1thenm=fnr(32)-1:ifint(m/11)<int((p-5922)/400)goto1000
250 goto100
300 ifpeek(49354)thenprintd$spc(7)"{up}{lblu}{$b1} {wht}"mid$("nordenosten süden westen",1+6*a,6)" {lblu}${home}
301 iffgoto308
302 poke49666,76:sys49650:poke49666,32:printleft$(d$,12)"{rght}{rght}{rght}{rght}{rght}{gry1}es ist dunkel!":return
308 fori=1to5:j=peek(p+a(a)*i):poke832+i,.:ifj=1orj=2orj=5thenpoke832+i,1
310 j=peek(p+a(a)*(i-1)+a(a-1-4*(a=.))):poke837+i,.:ifj=1orj=2orj=5thenpoke837+i,1
320 j=peek(p+a(a)*(i-1)+a(a+1+4*(a=3))):poke842+i,.:ifj=1orj=2orj=5thenpoke842+i,1
330 next:sys49650
340 fori=0to5:j=peek(p+a(a)*i):ifj=.thennext:return
341 if(j=1orj=2orj=5)andi>.thenreturn
342 ifj=4andi=5thenprintleft$(d$,13)spc(11)"{gry1}{$df}{sspc}
344 ifj=3andi=5thenprintleft$(d$,12)spc(11)"{gry1}{$dd}{$ff}
352 ifj=4andi=4thenprintleft$(d$,14)spc(11)"{gry1}{$a3}{$a4}
354 ifj=3andi=4thenprintleft$(d$,11)spc(11)"{gry1}{$a1}{$a2}
362 ifj=4andi=3thenprintleft$(d$,14)spc(11)"{gry2}{$a5}{$a6}{down}{left}{left}{$a7}{$a8}
364 ifj=3andi=3thenprintleft$(d$,10)spc(11)"{gry2}{$a9}{$aa}{down}{left}{left}{$af}{$ac}
366 ifj=4andi=2thenprintleft$(d$,15)spc(11)"{gry2}{$b3}{$b4}{down}{left}{left}{$b5}{$b6}{down}{left}{left}{left}{$b7}{$b8}{$b9}{$ba}
368 ifj=3andi=2thenprintleft$(d$,9)spc(10)"{gry2}{rvon}@abc{rvof}{down}{left}{left}{left}{$bb}{$bc}{down}{left}{left}{$be}{$bf}
370 ifj=4andi=1thenprintleft$(d$,15)spc(10)"{gry3}{rvon}e{down}{left}kffm{up}{left}h{down}{down}{left}h{left}{left}{left}{left}e{down}{left}kffm";
371 ifj=4andi=1thenprint"{down}{left}{left}{left}{left}{left}{left}dkkffmmi{down}{left}{left}{left}{left}{left}{left}{left}{left}{left}dgekffmhji{down}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}";
372 ifj=4andi=1thenprint"ffffffffff
374 ifj=3andi=1thenprintleft$(d$,6)spc(6)"{gry3}{rvon}j!fkkffmmfcl{down}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}jiekffmhdg";
375 ifj=3andi=1thenpoke1240,162:print"{down}{left}{left}{left}{left}{left}{left}{left}{left}{left}jfkffmfg{down}{left}{left}{left}{left}{left}{left}kffm{down}{left}{left}{left}{left}e{down}{left}kffm{up}{left}h
380 ifj=4andi=.thenprintleft$(d$,14)spc(9);:fork=1to3
381 ifj=4andi=.thenprint"{gry3}{rvon}t{down}{left}t{down}{left}üssss^{up}{left}u{up}{left}u{down}{down}{down}{left}{left}{left}{left}{left}{left}";:next
382 ifj=4andi=.thenprint"t{left}{left}{left}{left}{left}dge{up}{left}{left}dkf{rght}{rght}{rght}{rght}{rght}{down}u{up}fmi{down}{left}{left}hji{home}
385 ifj=3andi=.thenprint"{home}{down}{rght}{rght}{rght}{rght}{rght}{rvon}{gry3}i{down}{left}ji{down}{left}jff{up}{up}t{down}{left}t{down}{left}üssss^{up}{left}u{up}{left}u{down}{down}ffg{up}{left}dg{up}{left}d";
386 ifj=3andi=.thenprint"{down}{down}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}";:fork=1to3
387 ifj=3andi=.thenprint"{rvon}ü{down}{left}t{down}{left}t{up}{up}ssss^{down}{left}u{down}{left}u{down}{left}{left}{left}{left}{left}{left}{rvof}";:next
390 next:return
800 print"entzünde ";:ifpeek(49355)thenprint"lampe{home}":f=1e38:goto810
801 print"fackel{home}":iffthensys5681:print"{lred}wozu?{home}":goto100
802 ifpeek(49356)=.thensys5681:print"{lred}keine vorhanden!{home}":goto100
804 poke49356,peek(49356)-1:f=100
810 sys5681:print"{yel}brennt!{home}":sys6041:pokes+5,10:pokes+4,129
812 fori=30to99:pokes+1,i:next:gosub300:goto100
900 print"klettern{home}":sys5681:ifpeek(p)<>3andpeek(p)<>4thenprint"{lred}nicht hier!{home}":goto100
910 print"{yel}du kletterst die{home}
920 sys5681:print"leiter hinab";:p=p-400:ifpeek(p+400)=3thenp=p+800:print"{left}uf{home}
930 sys5681:j=int((p-5922)/400):print"nach gewölbe"j"{left}.{home}{wht}"spc(15)j
940 ifjthengosub300:goto100
950 sys5681:print"{up}{yel}nach draussen. {home}":poke833,1:poke838,1:poke843,1:sys49650
960 gosub6100:print"{cyn}":fori=1to9:printleft$(d$,9+i)spc(10)"IIII":ifi=7thenprint"{brn}
970 next:fori=0to4e3:next:poke2,0
975 print"{blk}{clr}lO"chr$(34)"ddd.konj"chr$(34)",8
980 print"{down}{down}{down}{down}rU":poke631,19:poke632,13:poke633,13:poke198,3:new
1000 poke830,peek(50420+m):poke831,peek(50452+m):sys50976
1010 sys5681:print"{yel}"m$(m);:sys5681:print"greift an!{home}":sys5681:sys6041
1012 pokes+6,250:pokes+13,250:pokes+4,33:pokes+11,33
1016 fori=5to80:pokes+1,i:pokes+8,90-i:next:pokes+4,32:pokes+11,32:poke198,0
1070 ld=2:sys5681:print"{wht}--- konflikt ---{home}":sys5681:sys5681:print"{yel}du benutzt{home}
1072 sys5681:wa=peek(49246):printw$(wa)",{home}":sys5681:rs=peek(49247)
1074 sh=peek(49167):printw$(rs+19);
1075 ifshthenprint",{home}":sys5681:printmid$("kleinergrosser",sh*7-6,7)" schild";
1076 print".{home}":sys5681:ml=int(1.5*peek(50628+m)):mg=.
1100 kp=1:gosub3500:sys5681
1108 ifpeek(49279)thenprint"{pur}du bist betäubt.{home}":goto2000
1109 print"{wht}@G{left}";:z=.
1110 z=z+1:ifz>600thenprint"warten...{home}":goto2000
1120 getu$:ifu$=""goto1110
1130 ifu$="{up}"oru$="{left}"oru$="{rght}"goto1200
1132 ifu$="{down}"goto1800
1134 ifu$=" "thenz=666:goto1110
1135 ifu$="a"goto1300
1136 ifu$="w"thengosub3000:goto2000
1137 ifu$="z"thenh=1:zz=0:gosub4000:goto1210
1138 ifu$="_"thengosub31000:goto2000
1140 ifu$="i"thengosub14000:goto2000
1190 print"wie bitte..?{home}":goto2000
1200 print"bewegen...?{home}":sys5681:print"{yel}erst kämpfen!{home}":goto2000
1210 ifzzgoto1310
1220 goto2000
1300 if(wa>10andwa<16)orwa=17thenifld<2goto1900
1301 zz=.:print"attacke mit{home}":sys5681:printw$(wa);
1310 ld=0:z=0:ifwa>10andwa<18thenz=1
1315 ifzzthenz=1:ld=2
1316 ifzz>2thenifzz=5thenz=0
1510 sys5681:print"{lred}"m$(m);:sys5681:j=fnr(20):ifzzthenj=3
1511 ifj<=atgoto1520
1512 print"verfehlt!{home}";:gosub30050:goto2000
1520 ifj<3thenprint"ist durch einen{home}":sys5681:poke53281,6:gosub30054
1521 ifj=2thenprint"guten treffer{home}":goto1602
1522 ifj=1thenprint"glückstreffer{home}":goto1602
1530 ifpeek(50756+m)<fnr(20)orzz>.goto1600
1540 gosub30052:print"hat pariert.{home}":goto2000
1600 print"ist ";:poke53281,5:gosub30054
1602 k=peek(50512+wa):l=int(k/3+.8):k=l+fnr(k-l):ifsr>11thenk=k+int((sr-10)/2)
1603 ifzzthenk=13:ifzz>1thenk=.:ifzz>2thenk=21:ifzz>3thenk=13:ifzz=5thenk=36
1604 l=peek(50692+m):ifj=1thenl=.
1606 k=k-l:ifk<1thenk=1
1610 ml=ml-k:poke53281,0:ifml<.thenml=.:z2=1:goto1700
1620 sys5681:l=ml/peek(50628+m):ifl>.8thenprint"kaum{home}":sys5681:print"angekratzt.{home}":goto1632
1622 ifl>.6thenprint"leicht{home}":sys5681:print"verletzt.{home}":goto1632
1624 ifl>.4thenprint"verwundet.{home}":goto1632
1626 ifl>.2thenprint"schwer{home}":sys5681:print"verletzt.{home}":goto1632
1628 print"auf der{home}":sys5681:print"flucht.{home}
1632 if(zz>.andzz<>2)or(zz=.andwa<>13)goto2000
1640 mg=mg+1-(zz=2):ifmg>9thenmg=9
1650 sys5681:print"{lgrn}"m$(m);:sys5681:print"ist mit faktor"mg;
1660 sys5681:print"vergiftet.{home}":goto2000
1700 gosub13100
1710 g=fnr(int((p-6178)/144)*4)+1:goto3200
1800 print"rückzug{home}":sys6041:pokes+5,10:pokes+4,33:fori=5to50:pokes+1,i:next
1802 sys5681:sys5681:print"-- du fliehst --{home}":sys5681:sys5681
1810 l=peek(50596+m)
1820 i=0:print"{yel}für deine{home}":sys5681:print"feigheit werden{home}
1822 sys5681:print"dir "l"punkte{home}":sys5681:print"abgezogen!{home}
1830 l=-l:sys5681:j=99:gosub13130:a=a+2+4*(a>1):t=.:gosub300:goto99
1900 ld=1:printw$(wa);:sys5681:print"laden...{home}
2000 ld=ld+1:poke198,0
2002 ifpeek(49283)goto1100
2004 j=peek(49282):ifjthenifj/2>int(j/2)goto1100
2005 iffnr(7)=7andas<amthengosub3302
2012 ifmg=.goto2020
2013 ml=ml-fnr(mg):ifmlgoto2020
2015 sys5681:print"{lred}"m$(m);:sys5681:print"wurde durch gift{home}
2016 z2=2:goto1700
2020 z1=1:ifml/peek(50628+m)<.21and1=fnr(3)goto2800
2030 ifm=11orm=23orm=29goto2910
2040 ifm=19andfnr(3)=1goto2940
2050 iffnr(20)>peek(50724+m)thengosub30050:goto1100
2320 iffnr(20)>paorpeek(49279)>.goto2340
2330 gosub30052:sys5681:print"{pur}du parierst.{home}":goto1100
2340 poke53281,2:gosub30054:k=peek(50660+m)/2+2
2341 zz=rs:ifpeek(49284)thenzz=zz+zz
2342 l=int(k/3+.8):k=l+fnr(k-l)-zz+sh*(peek(49279)=0):ifk<1thenk=1
2344 sys5681:print"{lgrn}"m$(m);:sys5681:print"hat dich{home}":sys5681
2345 ifk=1ork>12thenprint"sehr ";
2346 ifk<4thenprint"schwach{home}":goto2350
2347 ifk<7thenprint"leicht{home}":goto2350
2348 ifk<10goto2350
2349 print"schwer{home}
2350 sys5681:print"getroffen!{left}";:poke53281,0:hp=hp-k:ifhp<1thenhp=.:k=3:goto13000
2351 poke49231,hp/256:poke49230,hp-256*peek(49231)
2360 j=peek(50788+m):ifj=.orfnr(20)<=gegoto2490
2400 print" {home}":sys5681:print"und ";:ifj=1goto2420
2410 print"betäubt!{home}":poke49279,fnr(6)+1:sys5681:poke55723,4:poke1451,2:goto2490
2420 print"vergiftet!{home}":j=peek(49245)+1:ifj>9thenj=9
2430 poke49245,j:poke1449,j+48:poke55720,13
2490 print"{home}{down}{down}"spc(31)"{lgrn}"right$("00"+mid$(str$(hp),2),3):goto1100
2800 gosub30052:sys5681:print"{lgrn}"m$(m);
2810 sys5681:print"ist geflohen.{home}":gosub300:l=1:goto1710
2910 ifrnd(ti)>.2goto2050
2920 poke53281,1:sys5681:gosub30052:iffnr(20)<=kgthenpoke53281,0:goto1100
2922 ifpeek(49285)thenpoke53281,10:poke53280,10:gosub30052:poke53281,0:poke53280,0
2924 ifpeek(49285)thensys5681:print"{lblu}zauberbann{home}":sys5681:print"abgewehrt!{home}":goto1100
2925 print"{pur}die magie des{home}":sys5681:printm$(m)"s{home}":sys5681:print"hat dich{home}
2930 sys5681:poke53281,0:gosub30054:goto2410
2940 poke53281,8:sys5681:gosub30052
2942 print"{orng}kobold stiehlt{home}":sys5681:print"dir nahrung!{home}
2944 poke53281,0:na=na-fnr(na/4)-4:ifna<1thenna=.
2946 poke49244,na:gosub10000:goto1100
3000 print"waffe benutzen{home}":sys5681:print"{yel}-welche? (a-s) {wht}G{left}";:z=0
3010 z=z+1:getu$:ifz<600andu$=""goto3010
3020 ifu$<"a"oru$>"s"thenu$=chr$(peek(49246)+65)
3030 printu$;:sys5681:j=asc(u$)-65:print"{lred}"w$(j);:sys5681
3040 ifjthenifpeek(49247+j)=.thenprint"hast du nicht!{home}":sys5681:return
3042 ifge<peek(50540+j)thenprint"du bist nicht{home}":sys5681:print"geschickt genug,{home}
3044 ifge<peek(50540+j)thensys5681:print"eine solche{home}":sys5681:print"waffe zu führen.{home}":return
3050 wa=j:poke49246,j:print"bereit.{home}":sys5681:sh=0:poke49167,0:ifj>6andj<18thenreturn
3060 i=49274:ifj<18thensys5681:goto3080
3070 print"{yel}-schild? (j/n) {wht}G{left}";
3072 getu$:ifu$="n"thenprint"n{home}":return
3074 ifu$="j"thenprint"j{home}":sys5681:goto3080
3076 goto3072
3080 ifpeek(i)thensh=2:poke49167,2:print"{lred}du benutzt den{home}":sys5681:print"grossen schild.{home}":return
3082 ifpeek(49273)thensh=1:poke49167,1:print"{lred}du benutzt den{home}":sys5681:print"kleinen schild.{home}
3084 return
3100 print"rüstung anlegen{home}":sys5681:print"{yel}-welche? (a-g) {wht}G{left}";:z=0
3110 z=z+1:getu$:ifz<600andu$=""goto3110
3120 ifu$<"a"oru$>"g"thenu$=chr$(peek(49247)+65)
3130 printu$;:sys5681:j=asc(u$)-65:print"{lred}"w$(j+19);:sys5681
3140 ifjthenifpeek(49266+j)=.thenprint"hast du nicht!{home}":sys5681:return
3142 ifsr<peek(50559+j)thenprint"du bist zu{home}":sys5681:print"schwach, um eine{home}":sys5681
3144 ifsr<peek(50559+j)thenprint"so schwere rüs-{home}":sys5681:print"tung zu tragen.{home}":return
3150 rs=j:poke49247,j:print"angelegt.{home}":sys5681:return
3200 sys5681:print"{wht}----- sieg -----{home}":sys5681:ifl<1orpeek(50820+m)=.goto99
3210 sys5681:print"{yel}du erbeutest{home}":sys5681:printmid$(str$(g),2)" goldstücke!{home}
3220 sys5681:gp=gp+g:ifgp>5e4thengp=5e4
3230 poke49243,gp/256:poke49242,gp-256*peek(49243):gosub10000:goto99
3250 gosub30054:sys5681
3252 print"{lgrn}das gift wirkt!":hp=hp-fnr(peek(49245)):k=1
3260 ifhp<1thenhp=.:goto13000
3262 poke49231,hp/256:poke49230,hp-256*peek(49231):goto10000
3280 gosub30054:sys5681
3282 print"{cyn}du hungerst!":hp=hp-1:k=2:goto3260
3296 poke49245,j:poke1449,j+48:poke55720,13:return
3300 iffnr(2)>1oras=>amthenreturn
3302 as=as+1:poke49235,as/256:poke49234,as-256*peek(49235)
3304 print"{home}{down}{down}{down}{cyn}"spc(31)right$("00"+mid$(str$(as),2),3):return
3404 print"{lgrn}vergiftet!{home}":sys5681:j=peek(49245)+1:ifj>9thenj=9
3405 goto3296
3500 j=peek(49282):ifjthenpoke49282,j-1:ifj=1thenpoke1456,32
3502 j=peek(49283):ifjthenpoke49283,j-1:ifj=1thenpoke1458,32
3504 j=peek(49284):ifjthenpoke49284,j-1:ifj=1thenpoke1454,32
3505 j=peek(49285):ifjthenpoke49285,j-1:ifj=1thenpoke1454,32
3506 j=peek(49279):ifjthenpoke49279,j-1:ifj=1thenpoke1451,32
3590 return
4000 print"zauberspruch{home}":sys5681:print"{yel}-welcher? {wht}G{left}";:z=0
4010 z=z+1:getu$:ifz<600andu$=""goto4010
4020 ifu$=>"a"andu$<="p"goto4040
4030 print"{yel}keiner{home}":return
4040 printu$;:sys5681:j=asc(u$)-64:printz$(j-1);:sys5681
4041 ifj=5orj=12orj=13orj=8orj=16goto4060
4042 ifpeek(49303+j)=0thenprint"{lred}kannst du nicht!{home}":sys5681:return
4044 z=peek(50495+j):fori=0to7:if(2^iandz)=.goto4046
4045 ifpeek(49336+i)=.thenprint"{lred}zu wenig{home}":sys5681:print"ingredenzien!{home}":sys5681:return
4046 next:print"{orng}du konzentrierst{home}":sys5681:print"dich...{home}":sys5681
4047 fori=0to7:if(2^iandz)thenpoke49336+i,peek(49336+i)-1
4048 next
4050 ifj<9thenonjgoto4120,4150,4250,4200,4060,4350,4400,4060
4052 onj-8goto4500,4550,4600,4060,4050,4750,4800,4060
4060 sys5681:print"{lred}wozu jetzt?{home}":sys5681:return
4085 sys5681:print"{lred}nicht genug{home}":sys5681:print"astralenergie!{home}":return
4090 sys5681:sys6041:print"{lred}gelingt nicht!{home}
4091 sys5681:pokes+5,10:pokes+4,33:fori=0to45:pokes+1,46-i:next:goto3304
4100 as=as-z:poke49235,as/256:poke49234,as-256*peek(49235):goto10000
4110 sys5681:print"{cyn}es gelingt!{home}":return
4120 z=2:ifas<zgoto4085
4121 ifh=1goto4060
4124 gosub4100:iffnr(20)>chgoto4090
4126 gosub4110:gosub3304:poke53281,7:fori=1to9:gosub30050:next:poke53281,0:f=100
4128 goto300
4150 z=5:ifas<zgoto4085
4154 gosub4100:iffnr(20)>chgoto4090
4160 gosub4110:gosub3304:sys6041:pokes+5,10:poke53281,13:poke53281,13:pokes+4,17
4162 fori=1to66:pokes+1,i:next:poke53281,0:poke53280,0
4170 ifpeek(49245)=0oras<2thenreturn
4172 poke49245,peek(49245)-1:as=as-3:gosub3302:gosub10008:goto4170
4200 ifas<10goto4085
4201 z=10:gosub4100:iffnr(20)>chgoto4090
4202 gosub4110:sys5681:print"{yel}-wieviel? ";
4204 print"{blu}000{left}{left}{left}";:j=0:fori=0to2
4206 getu$:ifu$=chr$(20)thenprintleft$("{left}{left}",i);:goto4204
4208 ifu$<"0"oru$>"9"goto4206
4210 print"{wht}"u$;:j=j+(asc(u$)-48)*10^(2-i):next:ifj>asthenj=as
4214 gosub3304:sys6041:pokes+5,10:poke53281,5:poke53281,5:pokes+4,17
4216 fori=1to55:pokes+1,i:next:fori=1to55:pokes+1,56-i:next:poke53281,0:poke53280,0
4218 ifj>hm-hpthenj=hm-hp
4220 as=as-j-1:hp=hp+j:gosub3302:poke49231,hp/256:poke49230,hp-256*peek(49231):goto10000
4250 z=10:ifas<zgoto4085
4251 ifkp=.goto4060
4252 ifpeek(49285)goto4090
4253 gosub4100:iffnr(20)>chgoto4090
4254 gosub4110:gosub3304:sys6041:pokes+5,10:poke53281,2:poke53281,2:pokes+4,33
4262 fori=0to150step3:pokes+1,153-i:next:poke53281,0:poke53280,0
4264 poke49284,13:poke55726,7:poke1454,19:return
4350 z=15:ifas<zgoto4085
4351 ifkp=.goto4060
4352 ifpeek(49284)goto4090
4353 gosub4100:iffnr(20)>chgoto4090
4354 gosub4110:gosub3304:sys6041:pokes+5,10:poke53281,10:poke53281,10:pokes+4,33
4362 fori=3to193step2:pokes+1,i:next:poke53281,0:poke53280,0
4364 poke49285,13:poke55726,7:poke1454,12:return
4400 z=20:ifas<zgoto4085
4401 ifkp=.goto4060
4403 gosub4100:iffnr(20)>chgoto4090
4404 gosub4110:gosub3304:sys6041:pokes+5,11:pokes+4,17:fori=3to150step3
4406 pokes+1,i:poke53281,3:poke53280,3:pokes+1,153-i:poke53281,0:poke53280,0:next
4408 poke49282,23:poke55728,3:poke1456,7:return
4500 z=5:ifas<zgoto4085
4501 ifkp=.goto4060
4503 gosub4100:iffnr(20)>chgoto4090
4504 gosub4110:gosub3304:sys6041:pokes+5,10:pokes+4,33:poke53281,14:poke53280,14
4506 fori=153to3step-3:pokes+1,i:next:poke53281,0:poke53280,0:zz=1:return
4550 z=7:ifas<zgoto4085
4551 ifkp=.goto4060
4552 gosub4100:iffnr(20)>chgoto4090
4554 gosub4110:gosub3304:sys6041:pokes+5,10:pokes+4,129:poke53281,13:poke53280,13
4556 fori=123to3step-3:pokes+1,i:next:poke53281,0:poke53280,0:zz=2:return
4600 z=10:ifas<zgoto4085
4601 ifkp=.goto4060
4602 gosub4100:iffnr(20)>chgoto4090
4604 gosub4110:gosub3304:sys6041:pokes+5,10:pokes+4,129:poke53281,10:poke53280,10
4606 fori=3to123step3:pokes+1,i:next:poke53281,0:poke53280,0:zz=3:return
4750 z=25:ifas<zgoto4085
4751 ifkp=.goto4060
4752 gosub4100:iffnr(20)>chgoto4090
4754 gosub4110:gosub3304:sys6041:pokes+5,11:pokes+4,17:poke53281,15:poke53280,15
4756 fori=1to7:forj=3to99step3:pokes+1,j:nextj,i:poke53281,0:poke53280,0
4758 poke49283,13:poke55730,15:poke1458,26:return
4800 z=20:ifas<zgoto4085
4801 ifkp=.goto4060
4802 gosub4100:iffnr(20)>chgoto4090
4804 gosub4110:gosub3304:sys6041:pokes+5,11:pokes+4,129:poke53281,6:poke53280,6
4806 fori=10to80step10:forj=itoi+30:pokes+1,j:nextj,i:poke53281,0:poke53280,0
4808 zz=5:return
4990 sys6041:pokes+5,11:pokes+1,3:pokes+4,129
4992 poke53281,z:poke53280,z:forj=0to99:next:return
5200 k=int((p-5922)/400):h=fnr(9)-1:ifh/2.5>kgoto240
5202 ifh=.theng=fnr(k*4)+1:sys5681:print"{yel}du findest{home}":sys5681:print"eine";
5204 ifh=.thenprintmid$("n beutel truhe",fnr(1)*8+1,8)" mit{home}
5206 ifh=.thensys5681:printmid$(str$(g),2)" goldstücken!{home}":fori=1tog*1.5:gosub30052:next
5208 ifh=.goto3220
5210 sys5681:print"{yel}in eine falle{home}":sys5681:print"gelaufen:{home}":sys5681
5212 ifge>fnr(22)thengosub30052:print"{gry3}gerade noch{home}":sys5681:print"ausgewichen.{home}":goto100
5220 ifh>1goto5230
5221 poke53281,4:gosub30054:print"{gry3}steinschlag!{home}":j=fnr(6)+1
5222 poke53281,0:sys5681:print"{lred}"mid$(str$(j),2)" schadenspkt.{home}
5223 hp=hp-j:ifhp<1thenhp=.
5224 poke49231,hp/256:poke49230,hp-256*peek(49231):gosub10000:ifhpgoto100
5225 k=4:goto13000
5230 ifh>2goto5240
5231 iff=.goto100
5232 print"{lblu}magischer wind{home}":sys5681:print"bläst licht aus!{home}
5233 f=.:gosub30050:gosub300:goto100
5240 ifh>3goto5250
5241 poke53281,3:print"{gry3}säure tropft{home}":sys5681:print"herab!{home}":fori=0to9:gosub30000:next
5242 j=fnr(11)+1:goto5222
5250 ifh>4goto5260
5251 poke53281,13:gosub30050:print"{lgrn}gas strömt aus;{home}":sys5681:print"du bist{home}
5252 sys5681:poke53281,0:gosub3404:goto100
5260 ifh>5goto5270
5261 j=fnr(19)+1:print"{pur}magisches feld{home}":sys5681:print"entzieht dir"j;:sys5681
5262 print"astralpunkte!{home}":fori=0to9:poke53281,3:gosub30050:poke53281,4:gosub30054:next
5263 poke53281,.:as=as-j:ifas<1thenas=.
5264 poke49235,as/256:poke49234,as-256*peek(49235):gosub10000:goto100
5270 ifh>6goto5280
5271 poke53281,14:print"{gry3}ein pfeil aus{home}":sys5681:print"dem dunkel!{home}":gosub30050
5272 j=fnr(17)+1:goto5222
5280 ifh>7goto5290
5281 poke53281,5:gosub30054:print"{lgrn}durch eine{home}":sys5681:print"nadelfalle{home}
5282 poke49245,peek(49245)+1:sys5681:print"um zwei stufen{home}":goto5252
5290 poke53281,7:print"{orng}explosion!{home}":sys6041:pokes+5,12:pokes+1,3:pokes+4,129
5292 j=fnr(26)+1:goto5222
5300 print"benutze{home}":sys5681:print"{yel}-was? {wht}";:n$="":j=0
5310 print"G{left}";
5320 getu$:ifu$<"a"oru$>"z"goto5320
5330 printu$;:n$=n$+u$:j=j+1:ifj<4goto5310
5340 ifn$="dolc"orn$="eich"goto5370
5360 sys5681:print"{lred}nicht jetzt{home}":goto5631
5370 ifpeek(49349)=.thensys5681:print"{lred}hast du nicht!{home}":goto5631
5380 sys5681:sys5681:print"{yel}du stösst dem{home}":sys5681:print"grafen kroloc{home}
5381 sys5681:print"den eichendolch{home}":sys5681:print"genau in sein{home}
5382 sys5681:print"untotes herz!{home}":sys5681:printspc(15)"{wht}G{left}";:poke198,0:wait198,1
5383 print" {home}":fori=0to48:poke831,fnr(15):gosub30054:sys50976:next:sys49650
5384 sys5681:print"{cyn}graf kroloc{home}":sys5681:print"ist tot!":sys5681
5385 poke49359,1:poke198,0:goto100
5600 poke833,0:poke834,1:poke838,1:poke843,1:poke839,1:poke844,1:sys49650
5610 sys5681:print"{cyn}du betrittst{home}":sys5681:print"einen grösseren{home}":sys5681:print"raum - die{home}
5611 sys5681:print"gruft des grafen{home}":sys5681:print"kroloc!{home}
5612 ifpeek(49359)goto100
5614 sys5681:printspc(15)"{wht}G{left}";:poke198,0:wait198,1:poke198,0:print" {home}":sys5681
5615 poke830,24:poke831,1:sys50976
5616 sys5681:print"{cyn}der graf greift{home}":sys5681:print"dich sofort an!{home}
5617 sys6041:pokes+6,250:pokes+13,250:pokes+4,33:pokes+11,33
5618 fori=5to120:pokes+1,i:pokes+8,130-i:next:pokes+4,32:pokes+11,32:poke198,0
5620 sys5681:print"{wht}@G{left}";:z=.
5621 z=z+1:ifz>100thenprint"warten...{home}":goto5631
5622 getu$:ifu$=" "thenz=666:u$=""
5623 ifu$="a"goto5640
5624 ifu$="b"goto5300
5625 ifu$="{down}"goto5700
5626 ifu$="z"goto5644
5627 ifu$="w"thengosub3000:goto5631
5628 ifu$="i"thengosub14000:goto5631
5629 ifu$=""goto5621
5630 print"wie bitte...?{home}
5631 sys5681:print"{cyn}der graf greift{home}":sys5681:print"dich an!{home}":sys5681:sys5681
5632 iffnr(20)<6thenprint"{lred}er verfehlt.{home}":gosub30050:goto5620
5633 iffnr(20)<=pathenprint"{pur}du parierst.{home}":gosub30052:goto5620
5634 print"{lred}er trifft dich!{home}":poke53281,2:gosub30054:poke53281,0
5635 hp=hp-30+rs+sh:ifhp<1thenhp=.
5636 poke49231,hp/256:poke49230,hp-256*peek(49231):gosub10000:ifhp=.thenk=9:goto13000
5637 goto5620
5640 print"attackiere{home}":sys5681:print"graf kroloc{home}":sys5681:sys5681
5641 iffnr(20)>atthenprint"{lred}du verfehlst.{home}":gosub30050:goto5631
5642 print"{pur}der vampirgraf{home}":sys5681:print"pariert.{home}":gosub30052:goto5631
5644 print"zauberspruch{home}";:sys5681:sys5681:print"{lblu}der vampirgraf{home}
5645 sys5681:print"absorbiert alle{home}";:sys5681:print"magie...{home}":gosub30052:goto5631
5700 print"du verlässt{home}":sys5681:print"die gruft.{home}":p=p-a(a):gosub300:goto100
6000 print"suchen";:fori=0to4:print".";:forj=0to200:nextj,i:sys5681:print"{yel}du findest";
6010 h=.:ifpeek(p+a(a))=2thenh=1
6012 ifpeek(p+a(a))=5andf>.thenh=2
6020 ifh=1thenprint" einen{home}":sys5681:print"geheimgang!{home}
6022 ifh=1thengosub30050:t=1:iffthengosub6100
6030 ifh=2thenprint" eine{home}":sys5681:print"schwere holztür!{home}":goto6200
6090 ifh=.thensys5681:print"nichts.{home}
6099 goto100
6100 printleft$(d$,9)spc(8)"{gry1}YZIIII{$db}{$dc}
6102 fori=1to9:printleft$(d$,9+i)spc(8)"II    II":next
6104 printspc(8)"IL    MI{down}{left}{left}{left}{left}{left}{left}{left}{left}L      M":return
6200 printleft$(d$,9)"{rght}{rght}{rght}{rght}{rght}{rght}{gry1}YZIIIIIIII{$db}{$dc}
6202 fori=1to9:printleft$(d$,9+i)"{rght}{rght}{rght}{rght}{rght}{rght}II{brn}IIIIIIII{gry1}II":next
6204 t=1:print"{rght}{rght}{rght}{rght}{rght}{rght}IL        MI":print"{up}{rght}{rght}{rght}{rght}{rght}{rght}L          M
6206 poke1432,165:poke1672,165:poke1558,164:fori=1to9:gosub30052:next:ifrs<6goto100
6207 sys5681:sys5681:print"{cyn}ob sie wohl ver-{home}
6208 sys5681:print"schlossen ist?{home}":gosub6230
6210 gosub30050:fori=1to9:printleft$(d$,9+i)spc(8)"        ":next:t=1
6211 sys5681:print"{cyn}nein, ein druck{home}":sys5681:print"auf die klinke,{home}
6212 sys5681:print"{cyn}und die tür{home}":sys5681:print"schwingt auf...{home}":goto100
6230 sys5681:printspc(15)"{wht}G";:poke198,0:wait198,1:poke198,0:print"{left} {home}":sys5681:return
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
10019 printspc(24)"{lgrn}g ";:po=peek(49245):poke1449,32-16*(po>0)+po:ifpo=.thenprint"{left}{left}{wht}g
10020 wf=peek(49246):rs=peek(49247):sh=peek(49248):return
11000 poke53281,0:poke53280,0:poke53272,18:sys5454:sys4812:s=54272:poke650,255
11001 print"{home}{rght}{rght}{rght}{rght}{rght}{lblu}{$b1} {wht}";:j=peek(49246):ifjthenifpeek(49247+j)=0thenpoke49246,0
11002 dimm$(31),w$(27):fori=0to31:readm$(i):next:fori=0to27:readw$(i):next
11003 print"gewölbe  1 {lblu}$":j=peek(49247):ifjthenifpeek(49266+j)=.thenpoke49247,.
11004 deffnr(x)=int(x*rnd(ti)+1):fori=0to2:poke55723+i,4:next
11005 j=peek(49167):ifjthenifpeek(49272+j)=0thenpoke49167,0
11006 dimz$(15),g$(7):fori=0to15:readz$(i):next:fori=0to7:readg$(i):next
11110 print"{home}{down}{down}"spc(24)"{lgrn}vital.:   (   )":printspc(24)"{up}{cyn}astral:   (   )
11111 printspc(24)"{lred}ang.:   {grn}ver.:":printspc(24)"{up}{pur}str.:   {yel}ges.:
11112 printspc(24)"{gry3}klg.:   {lblu}cha.:":printspc(24)"{up}{lgrn}erf.:      (  )
11113 printspc(24)"{yel}goldstck.:":printspc(24)"{up}{orng}nahr.vorrat:":goto10000
12900 sys5681:print"{wht}****************{home}":return
12910 sys5681:print"{wht}*              *";:return
12920 printpeek(49208)+256*peek(49209)+65536*peek(49210);:return
13000 poke49230,0:gosub10000
13002 sys5681:gosub12900:gosub12910:gosub12910:print"{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}du bist tot!{home}
13010 gosub12910:gosub12900:sys5681:sys5681:print"{yel}du hast";:gosub12920
13020 sys5681:print"züge gespielt.{home}":sys5681:sys5681:print"{wht}todesursache:{home}
13022 sys5681:ifk=1thenprint"{lgrn}gift{home}
13024 ifk=2thenprint"{cyn}verhungert{home}
13026 ifk=3thenprint"{lred}"m$(m)" hat{home}":sys5681:print"dich getötet.{home}
13028 ifk=4thenprint"{cyn}in eine falle{home}":sys5681:print"gelaufen{home}
13029 ifk=9thenprint"{cyn}graf kroloc hat{home}":sys5681:print"dich getötet.{home}
13030 poke56295,1:poke2023,71:poke198,0:wait198,1:poke2,17:goto975
13100 sys5681:print"getötet!{home}":gosub300:sys5681:sys5681:print"{lred}du erhälst{home}
13101 ifpeek(50820+m)=.thensys5681:print"keine punkte,{home}":sys5681:print"da es ein tier{home}
13102 ifpeek(50820+m)=.thensys5681:print"war.":l=0:goto13130
13110 l=int((peek(50596+m)+.5)/z2):sys5681:printmid$(str$(l),2)" punkte.";
13115 ifl=1thenprint"{left}{left}. ";
13130 sys5681:ef=ef+l:ifef<.thenef=.
13140 ifef>999999thenef=999999
13150 k=ef:z=int(k/65536):poke49240,z:k=k-65536*z:z=int(k/256):poke49239,z
13160 poke49238,k-256*z:goto10000
14000 print"inventur{home}":gosub14920:i=2:gosub14910:print"{wht}einhandwaffen:
14010 i=3:forj=0to6:ifpeek(49247+j)orj=0theni=i+1:gosub14910:printchr$(j+65)" "w$(j)
14020 next:poke198,0:wait198,1:gosub14900:i=2:gosub14910:print"{wht}zweihandwaffen:
14030 i=3:forj=7to10:ifpeek(49247+j)theni=i+1:gosub14910:printchr$(j+65)" "w$(j)
14040 next:poke198,0:wait198,1:gosub14900:i=2:gosub14910:print"{wht}fernwaffen:
14050 i=3:forj=11to15:ifpeek(49247+j)theni=i+1:gosub14910:printchr$(j+65)" "w$(j)
14060 next:poke198,0:wait198,1:gosub14900:i=2:gosub14910:print"{wht}magische waffen
14070 i=3:forj=16to18:ifpeek(49247+j)theni=i+1:gosub14910:printchr$(j+65)" "w$(j)
14072 next:poke198,0:wait198,1:gosub14900:i=2:gosub14910:print"{wht}rüstungen:
14074 i=3:forj=19to25:ifpeek(49247+j)orj=19theni=i+1:gosub14910:printchr$(j+46)" "w$(j)
14076 next:poke198,0:wait198,1:gosub14900:i=2:gosub14910:print"{wht}schilde:
14078 i=3:forj=26to27:ifpeek(49247+j)theni=i+1:gosub14910:printw$(j)
14080 next:poke198,0:wait198,1:gosub14900:i=2:gosub14910:print"{wht}weisse magie:
14090 i=3:forj=0to7:ifpeek(49304+j)theni=i+1::gosub14910:printchr$(j+65)" "z$(j)
14100 next:poke198,0:wait198,1:gosub14900:i=2:gosub14910:print"{wht}schwarze magie:
14110 i=3:forj=8to15:ifpeek(49304+j)theni=i+1::gosub14910:printchr$(j+65)" "z$(j)
14120 next:poke198,0:wait198,1:gosub14900:i=2:gosub14910:print"{wht}ingredenzien:
14130 i=3:forj=0to7:i=i+1:gosub14910:printright$("0"+mid$(str$(peek(49336+j)),2),2);
14132 print" "g$(j)
14140 next:poke198,0:wait198,1:gosub14900:i=2:gosub14910:print"{wht}sonstiges:
14150 i=3:ifpeek(49351)=.goto14153
14152 i=i+1:gosub14910:print"splitter":goto14155
14153 ifpeek(49358)=.goto14155
14154 i=i+1:gosub14910:print"drachenkralle
14155 ifpeek(49350)=.goto14158
14156 i=i+1:gosub14910:print"glasflöte
14158 ifpeek(49348)=.goto14162
14160 i=i+1:gosub14910:print"feuerring
14162 ifpeek(49349)=.goto14166
14164 i=i+1:gosub14910:print"eichendolch
14166 ifpeek(49354)=.goto14170
14168 i=i+1:gosub14910:print"kompass
14170 ifpeek(49347)=.goto14174
14172 i=i+1:gosub14910:print"sextant
14174 ifpeek(49355)=.goto14178
14176 i=i+1:gosub14910:print"lampe
14178 ifpeek(49356)=.goto14182
14180 i=i+1:gosub14910:printmid$(str$(peek(49356)),2)" fackeln
14182 poke198,0:wait198,1:poke198,0:gosub14900:sys5558:goto11110
14900 fori=2to11:gosub14910:print"               ":next:return
14910 printleft$("{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}",i)spc(24);:return
14920 gosub14900:i=2:gosub14910:print"du trägst deine
14922 printspc(24)"kleidung";:j=peek(49247):ifj=0goto14928
14924 print" und":printspc(24)"{up}darüber ein";:ifj=4orj=1thenprint"en
14925 ifj=2orj>4thenprint"e
14926 ifj=3thenprint
14927 printspc(24)w$(19+j);
14928 print".":printspc(24)"{up}als waffe hälst
14930 printspc(24)"du jetzt dein";:j=peek(49246)
14932 ifj=1orj=3orj=4orj=5orj=8orj=13thenprint:goto14940
14934 print"e";:ifj=2orj=6orj=7orj=10orj=12orj=14orj=17thenprint"n":goto14940
14936 print
14940 printspc(24)"{up}"w$(j):printspc(24)"bereit.":j=peek(49167)
14950 printspc(24)"{up}du benutzt ";:ifj=0thenprint"aber":printspc(24)"kein";
14952 ifj=1thenprint"den":printspc(24)"klein";
14954 ifj=2thenprint"den":printspc(24)"gross";
14956 print"en schild.":poke198,0:wait198,1:goto14900
15000 sys5681:print"{yel}du bist in den{home}":sys5681:print"dunklen, feuch-{home}
15001 sys5681:print"ten gängen der{home}":sys5681:print"burg.{home}":sys5681:return
30000 sys6041:pokes+5,16:pokes+1,12:pokes+4,129:return
30050 sys6041:pokes+5,86:pokes+1,99:pokes+4,129:return
30052 sys6041:pokes+5,8:pokes+1,40+fnr(50):pokes+4,21:return
30053 poke53281,2:sys6041:pokes+5,64:pokes+1,1+fnr(4):pokes+4,33:j=9^40:poke53281,.
30054 sys6041:pokes+5,41:pokes+1,20+fnr(20):pokes+4,129:return
31000 gosub30052:fori=1to7:sys5681:next:print"{rght}{rght}{rght}{rght}{blk}p a u s e{home}":fori=1to5:sys5681:next
31002 fori=0to4:poke56044+i+i,fnr(15):next:getu$:ifu$=""goto31002
31004 fori=1to7:sys5681:next:return
60000 datafledermaus,goblin,zombie,schleim,sandviper,ork,räuber,höhlenschrat
60001 datariesenratte,torso,skelett,zauberer,riesenpython,oger,ghoul,golem
60002 datahöhlenspinne,höhlentroll,vampir,kobold,speikobra,zweihaupt,werwolf
60003 datadämon,zyklop,mumie,polypenpflanze,kriechendes auge,minotaurus,balrog
60004 datalebende statue,phantom
60100 datahände,messer,dolch,kurzschwert,handbeil,schwert,morgenstern,kampfstab
60101 databastardschw.,streitaxt,zweihänder,schleuder,kurzbogen,blasrohr
60102 datalangbogen,armbrust,magische axt,elbenbogen,zauberschwin.,kleidung
60103 datawaffenrock,lederrüstung,kettenhemd,schuppenpanz.,ritterrüstung
60104 datamag. rüstung,kleiner schild,grosser schild
60200 datamag. licht,gift neutral.,schutzschild,wunderheilung,bannbrecher
60201 datalichtschild,gewandtheit,totenbann,donnerkeil,gift u. galle,feuerball
60202 dataflammenspur,furchtfluch,zeit gefrier.,todesblitz,mag. bombe
60300 dataschwefel,knoblauch,ginseng,blutflechte,zirbelkraut,totenblume
60301 datag. d. nacht,alraune
