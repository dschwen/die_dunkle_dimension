1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454:i=rnd(-ti)
2 poke51208,12:poke51223,15:poke51211,2:poke51221,1:poke51209,15:poke51307,1
3 poke650,255:poke51219,1:poke51224,1:poke51228,8:deffnr(x)=int(x*rnd(ti)+1)
5 dimw$(26):fori=0to26:readw$(i):next:poke51217,15:poke6216,18:poke6626,28
6 dima(3),p(3),q(3),h(3):fori=0to3:reada(i),p(i),q(i),h(i):next:goto20
7 fori=0to3:j=int(4*rnd(ti)):k=p(i)+a(j):z=peek(k):ifk=6144+x+35*ygoto9
8 ifz=3orz=8orz=11thenifk<7400thenpokep(i),q(i):p(i)=k:q(i)=z:pokep(i),h(i)
9 next:return
20 print"{home}{down}{down}"spc(24)"{lgrn}health:   (   )":printspc(24)"{up}{cyn}astral:   (   )
21 printspc(24)"{lred}att.:   {grn}def.:":printspc(24)"{up}{pur}str.:   {yel}dex.:
22 printspc(24)"{gry3}int.:   {lblu}cha.:":printspc(24)"{up}{lgrn}exp.:      (  )
23 printspc(24)"{yel}gold pcs.:":printspc(24)"{up}{orng}food supply:
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
128 ifu$="t"goto240
129 ifu$="r"thenprint"weapon{home}":goto191
130 ifu$="w"thenprint"armour{home}":goto191
131 ifu$="i"thenprint"inventory{home}":goto191
132 ifu$="s"goto3200
190 print"what..?{home}":goto100
191 sys5681:print"{yel}do that{home}":sys5681:print"outside!{home}":goto100
200 print"waiting...{home}":goto100
210 print"north{home}":j=peek(881):ifj<3orj=5orj=9orj>11goto214
212 pokep,q:q=j:p=p-35:y=y-1:goto6100
214 sys5681:print"{lred}blocked!{home}":sys5681:goto100
220 print"south{home}":j=peek(903):ifj<3orj=5orj=9orj>11goto214
222 pokep,q:q=j:p=p+35:y=y+1:goto6100
230 print"west{home}":j=peek(891):ifj<3orj=5orj=9orj>11goto214
232 pokep,q:q=j:p=p-1:x=x-1:goto6100
234 print"east{home}":j=peek(893):ifj<3orj=5orj=9orj>11goto214
236 pokep,q:q=j:p=p+1:x=x+1:goto6100
240 print"talk";:sys5681:print"{yel} -where? {wht}G{left}";:z=0
250 z=z+1:ifz>499goto258
252 getu$:ifu$=""goto252
254 ifu$="{up}"thenprint"north{home}":j=-11:goto260
255 ifu$="{down}"thenprint"south{home}":j=11:goto260
256 ifu$="{left}"thenprint"west{home}":j=-1:goto260
257 ifu$="{rght}"thenprint"east{home}":j=1:goto260
258 print"no{home}":sys5681:z=0:goto100
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
279 ifh=.thenprint"{lred}no answer!{home}":sys5681:goto100
280 sys5681:print"{cyn}you talk to{home}":sys5681:ifh=1thenprint"a guard.";
281 ifh=2thenprint"the{home}":sys5681:print"armourer.";
282 ifh=3thenprint"the{home}":sys5681:print"weaponsmith.";
283 ifh=4thenprint"a healer.{home}":sys5681
284 ifh=5thenprint"the innkeeper.{home}":sys5681
285 ifh=6thenprint"a young{home}":sys5681:print"elf.";
286 ifh=7thenprint"a wizard.{home}":sys5681
287 ifh=10thenprint"a druid.{home}":sys5681
288 ifh=9thenprint"a stable{home}";:sys5681:print"boy.";
291 ifh=14thenprint"an old woman.{home}":sys5681
295 ifh>14thenprint"an elf maiden.{home}":sys5681
297 print"{home}":ifh=12goto1200
298 ifh=13orrnd(ti)<.5goto400
299 goto820
400 gosub900:ifrnd(ti)<.05thenprint" {home}":goto880
401 ifh=1andn$="guar"goto1000
402 ifh=1andn$="town"goto1001
403 ifn$="gold"goto1016
404 ifh=2andn$="armo"goto2000
405 ifh=3andn$="weap"goto2040
406 ifh=4andn$="heal"goto1030
407 ifh=4andn$="pois"goto1032
408 ifh=4andn$="rest"goto1038
409 ifh=5andn$="food"goto1040
410 ifh=6andn$="thie"goto1100
411 ifh=15andn$="prin"goto1120
412 ifh=15andn$="elve"goto1130
413 ifn$="name"thenprint"?{home}":goto820
414 ifn$="job"goto860
415 ifn$="fuck"orn$="piss"ormid$(n$,2)="ung"orn$="shit"orn$="porn"goto449
416 ifh=3andn$="elve"andpeek(49264)=.goto1140
417 ifh=3andn$="thyr"andpeek(49264)=.goto1144
420 ifn$="bye"thenprint"!{home}":goto880
421 ifn$="heal"thenprint"th?{home}":goto840
422 ifh=9andn$="unic"andpeek(49157)=1goto1200
423 ifh=7andn$="wiza"goto3000
424 ifh=7andn$="adep"goto3010
425 ifh=7andn$="cure"goto3020
426 ifh=7andn$="tabl"goto3030
427 ifh=7andn$="ghor"goto3034
428 ifh=7andn$="cama"goto3035
429 ifh=7andn$="ackb"goto3036
430 ifh=10andn$="drui"goto3100
431 ifh=10andn$="help"goto3110
432 ifh=10andn$="tabl"goto3120
433 ifh=10thenifn$="crys"orn$="shar"orn$="evil"orn$="bala"goto3130
434 ifh=16andn$="bard"goto2200
436 ifh=16andn$="song"thenprint"s{home}":goto2210
437 ifh=16andn$="sing"thenprint"{home}":goto2210
438 ifh=14andn$="herb"goto2100
440 print" {home}":gosub800:print"i can't tell{home}":sys5681:print"you anything{home}":sys5681
441 print"about that.%{home}
442 goto400
449 print" {home}":gosub800:print"you are a{home}":sys5681:print"dirty old pig!%{home}":goto400
800 gosub999:print"{yel}the ";
801 ifh=1thenprint"guard{home}
802 ifh=2thenprint"armour-{home}":sys5681:print"smith{home}
803 ifh=3thenprint"weapon-{home}":sys5681:print"smith{home}
804 ifh=4thenprint"healer{home}
805 ifh=5thenprint"innkeeper{home}
806 ifh=6thenprint"elf{home}
807 ifh=7thenprint"wizard{home}
808 ifh=10thenprint"druid{home}
809 ifh=9thenprint"stable boy{home}
812 ifh=14thenprint"old woman{home}
815 ifh=15thenprint"elf maiden{home}
819 sys5681:print"says:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"i am ";:ifh=1thenprint"a{home}":sys5681:print"guard";
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
840 gosub800:ifh=1thenprint"excellent,{home}":sys5681:print"thank you";
841 ifh=2orh=3thenprint"quite well";
843 ifh=4thenprint"i feel fine,{home}":sys5681:print"of course";
844 ifh=5orh=16thenprint"i am quite{home}":sys5681:print"content";
845 ifh=6thenprint"i get{home}":sys5681:print"by";
846 ifh=7thenprint"excellent";
847 ifh=10thenprint"thank you";
848 ifh=9thenprint"i have a lot{home}":sys5681:print"to do";
852 ifh=14thenprint"i am blind{home}":sys5681:print"but i see{home}":sys5681:print"everything";
855 ifh=15thenprint"i have had{home}":sys5681:print"a little{home}":sys5681:print"wine";
859 goto839
860 print"?{home}":ifh=1goto820
862 gosub800:ifh=2thenprint"i make";:sys5681:print"armour";
863 ifh=3thenprint"i make and{home}":sys5681:print"trade in";:sys5681:print"weapons";
864 ifh=5thenprint"i serve and{home}":sys5681:print"do the cooking";
865 ifh=6thenprint"i am a{home}":sys5681:print"nimble thief";
866 ifh=7thenprint"i am a{home}":sys5681:print"wizard";
867 ifh=4thenprint"i am a{home}":sys5681:print"healer";
868 ifh=9thenprint"i breed{home}":sys5681:print"unicorns";
869 ifh=10thenprint"i am a{home}":sys5681:print"druid";
870 ifh=16thenprint"i am a{home}":sys5681:print"bard";
871 ifh=14thenprint"i am a{home}":sys5681:print"herb woman";
875 ifh=15thenprint"i am the{home}":sys5681:print"princess of the";:sys5681:print"elves";
879 goto839
880 gosub800:ifh=1thenprint"i must get back{home}":sys5681:print"to guard duty";
881 ifh=3orh=2thenprint"do come{home}":sys5681:print"again soon";
882 ifh=4thenprint"stay healthy,{home}":sys5681:print"always";
883 ifh=5thenprint"have a beer";
884 ifh=6orh=16thenprint"good luck";
885 ifh=10thenprint"act wisely";
889 ifh=9thenprint"safe journey";
892 ifh=14orh=7thenprint"may the magic{home}":sys5681:print"be with you";
895 ifh=15thenprint"i want the sun{home}":sys5681:print"to shine{home}":sys5681:
896 ifh=15thenprint"again. save{home}":sys5681:print"our world";
897 print".%{home}":sys5681:sys5681:print"{yel}he";:ifh>13thenprint"{left}{left}she";
898 print" turns{home}":sys5681:print"away.{home}":sys5681:goto100
899 print"i'm a hangman";:return
900 gosub999:print"{yel}your business?";:sys5681:print"{wht}@G{left}";:z=0:n$="":poke198,0
910 getu$:ifu$=chr$(13)thenn$=n$+mid$("bye",1,-3*(z=0)):printmid$("bye",1,-3*(z=0));:return
912 ifu$=chr$(20)andz>0thenz=z-1:n$=left$(n$,z):print" {left}{left}G{left}";
920 ifu$<"a"oru$>"z"goto910
930 printu$"G{left}";:n$=n$+u$:z=z+1:ifz=4thenreturn
940 goto910
960 sys5681:printspc(15)"{wht}G{left}{lgrn}";:poke198,0:wait198,1:print" {home}":sys5681:return
970 print" {wht}G{left}";:poke198,0
971 getu$:ifu$="y"oru$="n"thenprintu$"{lgrn}{home}":goto999
972 goto971
980 gosub800:print"do you want to{home}":sys5681:print"buy or{home}":sys5681:print"sell? {wht}G{left}";
981 getu$:ifu$<>"b"andu$<>"s"goto981
982 printu$"{lgrn}";:goto999
999 sys5681:sys5681:return
1000 print"d{home}":gosub800:print"i guard the{home}":sys5681:print"town.%{home}":goto400
1001 print"{home}":gosub800:print"this is gaht,{home}":sys5681:print"the town of the{home}
1002 sys5681:print"elves. are you{home}":sys5681:print"an elf too? ";
1003 gosub970:ifu$="n"thenprint"we don't like{home}":sys5681:print"strangers{home}
1004 ifu$="n"thensys5681:print"here.%{home}":goto400
1005 print"i don't believe{home}":sys5681:print"you. you are{home}
1006 sys5681:print"clearly a{home}":sys5681:print"human.%{home}":goto400
1016 print" {home}":gosub800:print"yes, i'd like{home}";:sys5681:print"some gold too!%{home}":goto400
1030 print"{home}";:gosub800:print"i can cure your{home}":sys5681:print"poison or{home}":sys5681
1031 print"restore you.{home}":sys5681:print"which would{home}":sys5681:print"you like?%{home}":goto400
1032 print"on{home}";:gosub800:z=4*peek(49245)-ch:ifz<2thenz=2
1033 gosub9000:poke49245,0:z=5
1034 pokes+5,201:pokes+12,201:pokes+11,129:pokes+4,17:k=5
1035 fori=5to255step5:pokes+1,i:pokes+8,i:k=z-k:poke53281,k:poke53280,k:next
1036 poke53281,0:poke53280,0:pokes+11,0:pokes+4,0:sys5681:ifh=12thengosub10000:goto400
1037 print"now you are{home}":sys5681:print"cured.%{home}":gosub10000:goto400
1038 print"ore{home}";:gosub800:z=80-4*(ch-su):ifz<10thenz=10
1039 gosub9000:poke49230,peek(49232):poke49231,peek(49233):z=18:goto1034
1040 print"{home}":gosub800:print"i prepare the{home}";:sys5681:print"delicious elven{home}
1041 sys5681:print"specialities.{home}":sys5681:print"how about{home}
1042 sys5681:print"ten{home}":sys5681:print"rations?";
1043 gosub970:ifu$="n"thenprint"then don't.%{home}":goto400
1044 z=14-int(ch/1.6):gosub9000:sys5681:na=na+10:ifna>250thenna=250
1045 poke49244,na:gosub10000:sys5681:print"another one?";:goto1043
1100 print"f{home}":gosub800:print"yes, we elves{home}":sys5681:print"are famous for{home}
1102 sys5681:print"our{home}":sys5681:print"dexterity.{home}
1104 gosub960:print"shall i show{home}":sys5681:print"you how to{home}
1106 sys5681:print"become more{home}":sys5681:print"dexterous?";:gosub970
1108 ifu$="n"thenprint"but you will{home}":sys5681:print"need it!%{home}":goto400
1110 ifge=18thenprint"you are already{home}":sys5681:print"as dexterous{home}":sys5681:print"as i am.%{home}
1111 ifge=18goto400
1112 j=peek(49287):ifj=.thenprint"for that you{home}":sys5681:print"must first gain{home}
1113 ifj=.thensys5681:print"more{home}":sys5681:print"experience.%{home}":goto400
1114 print"all right, let's{home}":sys5681:print"practise...{home}":sys5681:fori=0to6:sys6041
1115 poke53280,13:pokes+5,74:pokes+1,fnr(20)+10:pokes+4,33:k=fnr(200)+50
1116 poke53280,.:forl=0tok:nextl,i:poke49287,j-1:poke49225,peek(49225)+1:gosub10000
1117 sys5681:print"there, now you{home}":sys5681:print"are defter.%{home}":goto400
1120 print"cess{home}":gosub800:print"i am the{home}":sys5681:print"daughter of the{home}
1121 sys5681:print"elf queen{home}":sys5681:print"mithra. do you{home}":sys5681:print"know her?";
1122 gosub970:print"she is a{home}":sys5681:print"great queen.";:ifu$="y"thenprint"%{home}":goto400
1123 sys5681:print"she made{home}":sys5681:print"the elven{home}":sys5681:print"bow.%{home}
1124 goto400
1130 print"n bow{home}":gosub800:print"it is a magic{home}":sys5681:print"bow, whose{home}
1131 sys5681:print"arrows go{home}":sys5681:print"straight through{home}
1132 sys5681:print"any{home}":sys5681:print"obstacle. elrik{home}":sys5681:print"keeps it.%{home}
1133 goto400
1140 print"n bow{home}":gosub800:print"who sent you{home}":sys5681:print"to me?%{home}":goto400
1144 print"a{home}":gosub800:print"hm, i am{home}":sys5681:print"supposed to{home}
1145 sys5681:print"keep the elven{home}":sys5681:print"bow, but{home}
1146 sys5681:print"i hear you{home}":sys5681:print"are trying to{home}
1147 sys5681:print"save the{home}":sys5681:print"world?";:gosub970
1148 ifu$="n"thenprint"you are not{home}":sys5681:print"worthy of this{home}
1149 ifu$="n"thensys5681:print"weapon.%{home}":goto400
1150 print"well, i think i{home}":sys5681:print"could give you{home}
1151 sys5681:print"the bow. do you{home}":sys5681:print"want to{home}
1152 sys5681:print"buy it?";:gosub970:ifu$="n"thenprint"then not.%{home}":goto400
1153 z=1e3:gosub9000:sys5681:print"it is yours!{home}":poke49264,1:goto400
1200 print"orns{home}":gosub800:print"yes, we elves{home}":sys5681:print"use them as{home}
1202 sys5681:print"mounts. i sell{home}":sys5681:print"them too.{home}":sys5681:print"would you like{home}
1204 sys5681:print"to buy one of{home}":sys5681:print"these splendid{home}
1206 sys5681:print"beasts?";:gosub970:ifu$="n"thenprint"pity.%{home}":goto400
1208 ifge<12thenprint"but you are too{home}":sys5681:print"clumsy to{home}
1210 ifge<12thensys5681:print"ride them.%{home}":goto400
1220 z=900-ch*25:gosub9000:sys5681:print"{lgrn}pick one{home}":sys5681:print"out";
1222 x=6:y=36:poke49159,255:poke49163,255:goto897
2000 print"ur{home}":gosub980:ifu$="b"goto2020
2001 print"what? (b-i) {wht}G{left}";
2002 getu$:ifu$=""goto2002
2003 ifu$>"a"andu$<"j"andu$<>"g"goto2006
2004 print" {lgrn}{home}":gosub999:print"sorry, but{home}":sys5681:print"i don't buy{home}
2005 sys5681:print"that.%{home}":goto400
2006 printu$"{lgrn}{home}":gosub999:k=asc(u$)-47:printw$(k);
2007 ifpeek(49248+k)=.thensys5681:print"you don't own it{home}":goto400
2008 print",{home}":sys5681:print"hm - used, i'll{home}";:sys5681:print"give you{home}
2009 sys5681:print"- let's{home}";:sys5681:print"say -";
2010 z=int(peek(50569+k)*4*(1+(ch-15)/15)):printz"gold{home}":sys5681
2011 print"pieces, ok?";:gosub970:ifu$="n"goto9002
2012 print"it's a deal!{home}":poke49248+k,0:ifgp+z>5e4thenz=5e4-gp
2013 z=-z:gosub9004:gosub10000:goto400
2020 print"i offer:{home}":sys5681:fori=1to8:ifi=6theni=7
2021 sys5681:printchr$(65+i)" "w$(i+18);:next:gosub999:print"what would you{home}
2022 sys5681:print"buy? (b-i) {wht}G{left}";
2023 getu$:ifu$=""goto2023
2024 ifu$>"a"andu$<"j"andu$<>"g"goto2026
2025 print" {lgrn}{home}":gosub999:print"sorry, but i{home}":sys5681:print"don't have{home}";:goto2005
2026 printu$;:gosub999:k=asc(u$)-47:print"{lgrn}"w$(k);
2027 ifpeek(49248+k)thensys5681:print"you have one.{home}":goto400
2028 print",{home}":sys5681:print"a fine";:sys5681:print"piece. and for{home}
2029 sys5681:z=int(peek(50569+k)*8*(1-(ch-12)/25)):print"only"z"gold{home}":sys5681
2030 print"pieces it's{home}":sys5681:print"yours, ok?";:gosub970
2031 ifu$="n"goto9002
2032 ifz>gpgoto9003
2033 print"it's a deal!{home}":poke49248+k,1:gosub9004:gosub10000:goto400
2040 print"ons{home}":gosub980:ifu$="b"goto2050
2041 print"what? (b-p) {wht}G{left}";
2042 getu$:ifu$=""goto2042
2043 ifu$>"a"andu$<"q"andu$<>"n"goto2045
2044 goto2004
2045 printu$"{lgrn}{home}":gosub999:k=asc(u$)-66:printw$(k);:goto2007
2050 print"i offer:{home}":sys5681:fori=1to15:ifi=13theni=14
2051 sys5681:printchr$(65+i)" "w$(i-1);:ifi=6ori=10thengosub960
2052 next:gosub999:print"what would you{home}
2053 sys5681:print"buy? (b-p) {wht}G{left}";:poke198,0
2054 getu$:ifu$=""goto2054
2055 ifu$>"a"andu$<"q"andu$<>"n"goto2057
2056 goto2025
2057 printu$;:gosub999:k=asc(u$)-66:print"{lgrn}"w$(k);:goto2027
2100 print"s{home}":gosub800:print"ah, are you{home}":sys5681:print"a magic user?";:gosub970
2101 ifu$="n"thenprint"then why do{home}":sys5681:print"you need{home}":sys5681:print"ingredients?{home}
2102 ifu$="n"goto400
2103 print"i have:{home}":gosub999:print"a sulphur{home}":sys5681:print"b garlic{home}
2104 sys5681:print"c ginseng{home}":sys5681:print"d deathbloom{home}":gosub999
2105 print"what'll it be? {wht}G{left}";
2106 getu$:ifu$=""goto2106
2107 ifu$<"a"oru$>"d"goto2025
2108 printu$"{lgrn}";:gosub999:k=asc(u$)-65:zz=10:ifk>.thenzz=6:ifk>1thenzz=3:ifk>2thenzz=1:k=5
2109 ifk<3thenprint"in packs of"zz"{left}{home}":sys5681:print"for{home}":sys5681
2110 print"1 gold piece";:sys5681:print"each, ok?";
2120 z=1:gosub970:ifu$="n"goto9002
2121 ifgp<zgoto9003
2122 print"here you are!{home}":sys5681:j=peek(49336+k)+zz:ifj>99thenj=99
2123 poke49336+k,j:gosub9004:sys5681:print"you now have":sys5681:printmid$(str$(j),2);
2124 print" unit.";:ifj>1thenprint"{left}s.{home}
2125 gosub10000:sys5681:print"another one?";:goto2120
2200 print"{home}":gosub800:print"i sing{home}":sys5681:print"songs.%{home}":goto400
2210 gosub800:print"shall i sing{home}":sys5681:print"something{home}":sys5681:print"for you?";:gosub970
2212 ifu$="n"thenprint"as you like.%{home}":goto400
2214 print"i once had{home}":sys5681:print"a flute{home}
2216 sys5681:sys5681:print"oh what a{home}":sys5681:print"beaut!{home}
2218 sys5681:sys5681:print"it was made{home}":sys5681:print"of glass{home}
2220 sys5681:sys5681:print"which gave it{home}":sys5681:print"magic and class{home}
2222 gosub960:print"whenever i{home}":sys5681:print"would play{home}
2224 sys5681:sys5681:print"the crystal'd{home}":sys5681:print"ring and sway{home}
2226 sys5681:sys5681:print"and the holy{home}":sys5681:print"crystal's call{home}
2228 sys5681:sys5681:print"sent my song{home}":sys5681:print"to one and all{home}
2230 gosub960:print"when the crystal{home}":sys5681:print"broke apart{home}
2232 sys5681:sys5681:print"its ringing{home}":sys5681:print"lost its heart{home}
2234 sys5681:sys5681:print"only the shard{home}":sys5681:print"still rang so{home}
2236 sys5681:sys5681:print"as if it still{home}":sys5681:print"had hope to show{home}
2238 gosub960:print"but that was{home}":sys5681:print"long ago, i fear{home}
2240 sys5681:sys5681:print"and the flute's{home}":sys5681:print"no longer here{home}
2242 sys5681:sys5681:print"if you had it,":sys5681:print"you'd bring{home}
2243 sys5681:sys5681:print"the shard here":sys5681:print"with its ring{home}
2244 gosub960:print"did you like{home}":sys5681:print"my little{home}":sys5681:print"song?";
2245 gosub970:ifu$="n"goto2212
2246 print"it's all true.{home}":sys5681:print"but the flute{home}
2247 sys5681:print"was stolen{home}":sys5681:print"from me{home}
2248 sys5681:print"once when i{home}":sys5681:print"was in mubrak.%{home}":goto400
3000 print"rd{home}":gosub800:print"well, actually{home}":sys5681:print"i'm still{home}
3001 sys5681:print"an adept.%{home}":goto400
3010 print"t{home}":gosub800:print"i'm practising{home}":sys5681:print"the cure poison{home}
3011 sys5681:print"spell.%{home}":goto400
3020 print" poison{home}":gosub800:print"a spell{home}":sys5681:print"against poison.{home}
3021 sys5681:print"do you know{home}":sys5681:print"it?";:gosub970
3022 ifu$="y"thenprint"good for you.%{home}":goto400
3024 print"go to the{home}":sys5681:print"white{home}":sys5681:print"circle.%{home}":goto400
3030 print"et{home}":gosub800:print"hm, i am{home}":sys5681:print"new here and{home}
3031 sys5681:print"don't know{home}":sys5681:print"you. i don't{home}
3032 sys5681:print"think i am{home}":sys5681:print"allowed to{home}
3033 sys5681:print"tell you.%{home}":goto400
3034 print" {home}":gosub800:print"who sent{home}":sys5681:print"you?%{home}":goto400
3035 print"ch{home}":gosub800:print"where is he{home}":sys5681:print"now?%{home}":goto400
3036 print"ah{home}":gosub800:print"good, i think{home}":sys5681:print"i can tell you{home}
3037 sys5681:print"that the tablet{home}":sys5681:print"lies in the{home}
3038 sys5681:print"north-eastern{home}":sys5681:print"corner of the{home}":sys5681:print"town.%{home}":goto400
3100 print"d{home}":gosub800:print"we druids{home}":sys5681:print"want to{home}
3101 sys5681:print"help you.%{home}":goto400
3110 print"{home}":gosub800:print"ask what you{home}":sys5681:print"want to know.%{home}":goto400
3120 print"et{home}":gosub800:print"go to{home}":sys5681:print"worthal. there{home}
3121 sys5681:print"you'll find the{home}":sys5681:print"third tablet.%{home}":goto400
3130 print"...":gosub800:print"cerfax can tell{home}":sys5681:print"you more about{home}
3131 sys5681:print"that than i.%{home}":goto400
3200 print"search";:fori=1to5:print".";:forj=.to400:nextj,i
3201 sys5681:print"{yel}you find{home}":sys5681
3202 ifx<>32ory<>2thenprint"nothing.{home}":goto100
3204 print"a clay tablet:{home}":sys5681:sys5681:print"{orng}{rght}{rght}{rght}{rght}{rght}{rght}{rvon}:>?;{home}
3206 sys5681:print"{rght}{rght}{rght}{rght}{rght}{rght}{rvon}<{$ae}{$af}={home}":sys5681:sys5681:goto100
3300 print"{left}  {home}":sys5681:print"{yel}do you want to{home}":sys5681:print"leave gaht{home}
3301 sys5681:print"now?";:gosub970:ifu$="n"theny=y-1:goto100
6000 sys5681:print"{lred}you leave{home}":sys5681:print"the town.{home}
6010 fori=0to999:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
6015 ifx=6thenpoke49157,3
6020 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:poke2,0:new
6100 pokes+4,0:pokes+5,16:pokes+1,12:pokes+4,129:goto100
9000 print"but that costs{home}":sys5681:print"you"z"gold{home}":sys5681:print"pieces. do you{home}
9001 sys5681:print"want to pay?";:gosub970:ifu$="y"goto9003
9002 print"well, then not.%{home}":goto400
9003 ifgp<zthenprint"you don't have{home}":sys5681:print"enough gold!%{home}":goto400
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
50000 dataknife,dagger,short sword,hand axe,sword,morning star,quarterstaff
50001 databastard sword,battle axe,greatsword,sling,short bow,,long bow
50002 datacrossbow,,,,clothes,gambeson,leather armour,chain mail,scale mail
50003 dataplate armour,,small shield,large shield
50100 data-35,6400,8,17,1,6800,11,17,35,6820,8,21,-1,6975,11,21
