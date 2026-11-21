1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454
2 poke51200,1:poke51205,8:poke51208,12:poke51211,11:poke51209,15:poke51228,1
3 poke51219,1:poke51204,5:poke51223,15:poke51221,1:poke650,255
4 fori=0to7:readz$(i),kg(i),kp(i),ks(i):next
6 dima(3),p(3):fori=0to3:reada(i),p(i):next
20 print"{home}{down}{down}"spc(24)"{lgrn}health:   (   )":printspc(24)"{up}{cyn}astral:   (   )
21 printspc(24)"{lred}att.:   {grn}def.:":printspc(24)"{up}{pur}str.:   {yel}dex.:
22 printspc(24)"{gry3}int.:   {lblu}cha.:":printspc(24)"{up}{lgrn}exp.:      (  )
23 printspc(24)"{yel}gold pcs.:":printspc(24)"{up}{orng}food supply:
25 x=17:y=36:p=40721:q=11:gosub10000
100 poke2,x:poke182,y:sys6052:sys4482:sys4537:sys4361:sys5440:sys5681
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
132 ifu$="c"goto3000
190 print"what..?{home}":goto100
191 sys5681:print"{yel}do that{home}":sys5681:print"outside!{home}":goto100
200 print"waiting...{home}":goto100
210 print"north{home}":j=peek(881):if(j<>11andj>0andj<>8)or(j+bb=0)goto214
212 pokep,q:q=j:p=p-35:y=y-1:goto6100
214 sys5681:print"{lred}blocked!{home}":sys5681:goto100
220 print"south{home}":j=peek(903):if(j<>11andj>0andj<>8)or(j+bb=0)goto214
222 pokep,q:q=j:p=p+35:y=y+1:goto6100
230 print"west{home}":j=peek(891):if(j<>11andj>0andj<>8)or(j+bb=0)goto214
232 pokep,q:q=j:p=p-1:x=x-1:goto6100
234 print"east{home}":j=peek(893):if(j<>11andj>0andj<>8)or(j+bb=0)goto214
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
261 ifj=18andy>26andx>18thenh=2
262 ifj=18andy>26andx<18thenh=3
263 ifj=18andy>20andy<24andx>18thenh=4
264 ifj=18andy>20andy<24andx<18thenh=5
265 ifj=18andy<10andx>18thenh=6
267 ifj=18andy<10andx<18thenh=7
268 ifj=18andy>12andy<18andx>18thenh=8
269 ifj=18andy>12andy<18andx<18thenh=9
279 ifh=.thenprint"{lred}no answer!{home}":sys5681:goto100
280 sys5681:print"{cyn}you talk to{home}":sys5681
281 ifh=1thenprint"the white{home}":sys5681:print"archmage{home}":sys5681
282 ifh>1thenprint"a white{home}":sys5681:print"wizard.";
297 print"{home}":ifh=13orrnd(ti)<.5goto400
299 goto820
400 gosub900:ifrnd(ti)<.05thenprint" {home}":goto880
401 ifn$="whit"thenprint"e circle{home}":goto1000
402 ifn$="circ"thenprint"le{home}":goto1000
403 ifn$="wiza"thenprint"rd{home}":goto1000
404 ifn$="magi"thenprint"c{home}":goto1010
405 ifh=2andn$="ligh"goto2000
406 ifh=3andn$="cure"goto2100
407 ifh=4andn$="shie"goto2200
408 ifh=5andn$="mira"goto2300
409 ifh=6andn$="brea"goto2400
410 ifh=7andn$="ligh"goto2500
411 ifh=8andn$="agil"goto2600
412 ifh=9andn$="turn"goto2700
413 ifn$="name"thenprint"?{home}":goto820
414 ifn$="job"goto860
415 ifn$="fuck"orn$="piss"ormid$(n$,2)="ung"orn$="shit"orn$="porn"goto449
420 ifn$="bye"thenprint"!{home}":goto880
421 ifn$="heal"thenprint"th?{home}":goto840
430 ifh=1andn$="mast"goto2800
431 ifh=1andn$="stud"goto2810
432 ifh=1andn$="evil"goto2820
433 ifn$="evil"goto2890
440 print" {home}":gosub800:print"i can't tell{home}":sys5681:print"you anything{home}":sys5681
441 print"about that.%{home}
442 goto400
449 print" {home}":gosub800:print"you are a{home}":sys5681:print"dirty old pig!%{home}":goto400
800 gosub999:print"{yel}the ";
802 ifh=1thenprint"arch-{home}":sys5681:print"mage{home}
803 ifh>1thenprint"mage{home}
819 sys5681:print"says:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"i am ";:ifh=1thensys5681:print"garthim";
821 ifh=2thenprint"ralph";
822 ifh=3thensys5681:print"jaanth";
823 ifh=4thensys5681:print"schmendrik";
824 ifh=5thensys5681:print"harcon";
825 ifh=6thensys5681:print"disdychus";
826 ifh=7thensys5681:print"chrolon";
827 ifh=8thenprint"vulpa";
829 ifh=9thensys5681:print"aspensor";
839 print".%{home}":goto400
840 gosub800:ifh=1thenprint"excellent,{home}":sys5681:print"thank you";
841 ifh>1thenprint"quite well";
859 goto839
860 print"?{home}":gosub800
862 ifh=1thenprint"i am the";:sys5681:print"master";
863 ifh>1thenprint"i am a{home}":sys5681:print"wizard";
864 print" of";:sys5681:print"the white{home}":sys5681:print"circle";:goto839
880 gosub800:print"i must meditate{home}":sys5681:print"now. go";
881 sys5681:print"in peace.%{home}":sys5681:sys5681
882 print"{yel}he turns{home}":sys5681:print"away.{home}":sys5681:goto100
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
1000 gosub800:print"the wizards{home}":sys5681:print"of our brother-{home}
1001 sys5681:print"hood master{home}":sys5681:print"white magic.%{home}":goto400
1010 gosub800:ifh=1thenprint"i teach it{home}":sys5681:print"to my{home}
1011 ifh=1thensys5681:print"students.%{home}":goto400
1012 goto1020
1016 print" {home}":gosub800:print"yes, i'd like{home}";:sys5681:print"some gold too!%{home}":goto400
1020 print"i have mastered{home}":sys5681:print"the mighty{home}
1021 sys5681:printz$(h-2)"{home}":sys5681:print"spell.%{home}":goto400
2000 gosub800:print"this is a{home}":sys5681:print"fairly simple{home}
2001 sys5681:print"spell that one{home}":sys5681:print"learns as a{home}
2002 sys5681:print"beginner. it{home}":sys5681:print"replaces a{home}
2003 sys5681:print"torch when it{home}":sys5681:print"is dark.{home}
2004 gosub960:print"would you like{home}":sys5681:print"to learn it? ";:gosub970
2005 ifu$="n"thenprint"every good{home}":sys5681:print"wizard should{home}
2006 ifu$="n"thensys5681:print"master{home}":sys5681:print"it.%{home}":goto400
2010 ifkg<kg(h-2)thenprint"sadly you are{home}":sys5681:print"not clever{home}
2011 ifkg<kg(h-2)thensys5681:print"enough to grasp{home}":sys5681:print"the very{home}
2012 ifkg<kg(h-2)thensys5681:print"complicated{home}":sys5681:print"ritual of{home}
2013 ifkg<kg(h-2)thensys5681:print"invocation.%{home}":goto400
2020 z=ks(h-2):print"give me"z;:sys5681:print"gold pieces and{home}
2021 sys5681:print"i'll teach it{home}":sys5681:print"to you, ok? ";:gosub970
2022 ifu$="n"goto2005
2023 ifgp<zthenprint"you don't have{home}":sys5681:print"enough gold!%{home}":goto400
2030 gosub9004:sys5681:print"thanks. so, the{home}":sys5681:print"spell goes thus:{home}":gosub960
2031 poke49302+h,1:ifh>2goto2110
2032 print"you need only{home}":sys5681:print"sulphur and{home}
2033 sys5681:print"pinewort. toss{home}":sys5681:print"them into the{home}
2034 sys5681:print"air, focus on{home}":sys5681:print"brightness and{home}
2035 sys5681:print"speak the{home}":sys5681:print"magic{home}
2036 sys5681:print"words.{home}":gosub960:print"if it works,{home}
2037 sys5681:print"a ball of cold{home}":sys5681:print"light appears{home}
2038 sys5681:print"above your head,{home}":sys5681:print"as bright as{home}
2039 sys5681:print"a torch, but{home}":sys5681:print"without smoke{home}
2040 sys5681:print"or{home}":sys5681:z=8:print"heat.{home}
2050 gosub960:print"the invocation{home}":sys5681:print"costs you"kp(h-2);
2052 sys5681:print"astral points";
2060 ifh=3thensys5681:print"plus 2 more{home}":sys5681:print"for each degree{home}
2061 ifh=3thensys5681:print"of{home}":sys5681:print"poisoning";
2070 ifh=5thensys5681:print"plus the amount{home}":sys5681:print"converted";
2090 print".%{home}":goto400
2100 gosub800:print"there are many{home}":sys5681:print"kinds of poison{home}
2101 sys5681:print"and many ways{home}":sys5681:print"to be{home}
2102 sys5681:print"poisoned.{home}":sys5681:print"fortunately{home}
2103 sys5681:print"this spell{home}":sys5681:print"removes all{home}
2104 sys5681:print"substances that{home}":sys5681:print"do not belong{home}
2105 sys5681:print"in the body.{home}":goto2004
2110 ifh>3goto2210
2111 print"this spell{home}":sys5681:print"requires a{home}
2112 sys5681:print"mixture of{home}":sys5681:print"ginseng and{home}
2113 sys5681:print"blood moss,{home}":sys5681:print"which is{home}
2114 sys5681:print"rubbed onto{home}":sys5681:print"the skin{home}
2115 sys5681:print"while speaking{home}":sys5681:print"the magic{home}
2116 sys5681:print"formula.{home}
2117 gosub960:print"if it succeeds,{home}":sys5681:print"the skin glows{home}
2118 sys5681:print"briefly, and{home}":sys5681:print"the poisoning{home}
2119 sys5681:print"is{home}":sys5681:print"cured.{home}":goto2050
2200 gosub800:print"against the{home}":sys5681:print"blows of strong{home}
2201 sys5681:print"foes, shield and{home}":sys5681:print"armour are often{home}
2202 sys5681:print"not enough. this{home}":sys5681:print"spell doubles{home}
2203 sys5681:print"your protection{home}":sys5681:print"- though not{home}
2204 sys5681:print"against magic -{home}":sys5681:print"for twelve{home}
2205 sys5681:print"combat turns.{home}":goto2004
2210 ifh>4goto2310
2211 print"simply mix{home}":sys5681:print"sulphur,{home}
2212 sys5681:print"ginseng and{home}":sys5681:print"blood moss,{home}
2213 sys5681:print"sprinkle it on{home}":sys5681:print"your armour and{home}
2214 sys5681:print"call out the{home}":sys5681:print"formula.{home}
2217 gosub960:print"if it works, an{home}":sys5681:print"'s' lights up{home}
2218 sys5681:print"for as long as{home}":sys5681:print"the spell lasts.{home}
2219 sys5681:print"sadly it cannot{home}":sys5681:print"be used together{home}
2220 sys5681:print"with the light{home}":sys5681:print"shield{home}
2221 sys5681:print"spell.{home}":goto2050
2300 gosub800:print"if you are badly{home}":sys5681:print"wounded and{home}
2301 sys5681:print"want to escape{home}":sys5681:print"death, and have{home}
2302 sys5681:print"enough astral{home}":sys5681:print"energy, this{home}
2303 sys5681:print"spell can turn{home}":sys5681:print"astral energy{home}
2304 sys5681:print"into life{home}":sys5681:print"energy and{home}
2305 sys5681:print"heal wounds.{home}":goto2004
2310 ifh>5goto2410
2311 print"the healing{home}":sys5681:print"essences of{home}
2312 sys5681:print"garlic,{home}":sys5681:print"ginseng and{home}
2313 sys5681:print"blood moss,{home}":sys5681:print"together with{home}
2314 sys5681:print"the magic words,{home}":sys5681:print"heal all{home}
2315 sys5681:print"wounds.{home}":goto2050
2400 gosub800:print"many a mighty{home}":sys5681:print"mage can create{home}
2401 sys5681:print"impenetrable{home}":sys5681:print"energy{home}
2402 sys5681:print"fields, like{home}":sys5681:print"our master,{home}
2403 sys5681:print"for example.{home}":sys5681:print"this spell can{home}
2404 sys5681:print"shatter such{home}":sys5681:print"barriers{home}
2405 sys5681:print"and dispel them.{home}":goto2004
2410 ifh>6goto2510
2411 print"the spell is{home}":sys5681:print"difficult. you{home}
2412 sys5681:print"need blood moss,{home}":sys5681:print"deathbloom and{home}
2413 sys5681:print"the rare{home}":sys5681:print"mandrake{home}
2414 sys5681:print"root. speak the{home}":sys5681:print"formula and{home}
2415 sys5681:print"throw it all{home}":sys5681:print"into the field.{home}
2416 gosub960:print"if the powers{home}":sys5681:print"are gracious,{home}
2417 sys5681:print"the field will{home}":sys5681:print"slowly{home}
2418 sys5681:print"dissolve.{home}":goto2050
2500 gosub800:print"when facing{home}":sys5681:print"hostile{home}
2501 sys5681:print"magic, this{home}":sys5681:print"spell can{home}
2502 sys5681:print"protect you{home}":sys5681:print"against any{home}
2503 sys5681:print"magic very{home}":sys5681:print"effectively{home}
2504 sys5681:print"for twelve{home}":sys5681:print"combat{home}
2505 sys5681:print"turns.{home}":goto2004
2510 ifh>7goto2610
2511 print"the combination{home}":sys5681:print"of sulphur,{home}
2512 sys5681:print"pinewort and{home}":sys5681:print"blood moss,{home}
2513 sys5681:print"sprinkled over{home}":sys5681:print"you with the{home}
2514 sys5681:print"formula, gives{home}":sys5681:print"you protection.{home}
2517 gosub960:print"if it works, an{home}":sys5681:print"'l' lights up{home}
2518 sys5681:print"for as long as{home}":sys5681:print"the spell lasts.{home}
2519 sys5681:print"sadly it cannot{home}":sys5681:print"be used together{home}
2520 sys5681:print"with the shield{home}":sys5681:print"spell{home}
2521 sys5681:print"spell.{home}":goto2050
2600 gosub800:print"this difficult{home}":sys5681:print"spell raises{home}
2601 sys5681:print"your natural{home}":sys5681:print"speed of{home}
2602 sys5681:print"movement, and{home}":sys5681:print"in combat you{home}
2603 sys5681:print"can move for{home}":sys5681:print"12 turns at{home}
2604 sys5681:print"twice your{home}":sys5681:print"normal{home}
2605 sys5681:print"speed.{home}":goto2004
2610 ifh=9goto2710
2611 print"mix garlic,{home}":sys5681:print"blood moss{home}
2612 sys5681:print"and{home}":sys5681:print"deathbloom,{home}
2613 sys5681:print"rub it on your{home}":sys5681:print"arms and legs{home}
2614 sys5681:print"and call out{home}":sys5681:print"the formula.{home}
2617 gosub960:print"if all goes well{home}":sys5681:print"a 'g' lights up{home}
2618 sys5681:print"for as long as{home}":sys5681:print"the spell lasts.{home}":goto2050
2700 gosub800:print"the undead are{home}":sys5681:print"dangerous foes{home}
2701 sys5681:print"in all their{home}":sys5681:print"forms. but{home}
2702 sys5681:print"the light of{home}":sys5681:print"the sun{home}
2703 sys5681:print"destroys them.{home}":sys5681:print"since the sun{home}
2704 sys5681:print"never shines{home}":sys5681:print"here, magic{home}
2705 sys5681:print"must help.{home}":goto2004
2710 print"a mixture of{home}":sys5681:print"garlic,{home}
2712 sys5681:print"deathbloom and{home}":sys5681:print"rare mandrake{home}
2713 sys5681:print"root, thrown{home}":sys5681:print"into the air{home}
2714 sys5681:print"with the magic{home}":sys5681:print"words,{home}
2715 sys5681:print"is needed for{home}":sys5681:print"this spell.{home}
2716 gosub960:print"if the good{home}":sys5681:print"powers hear you,{home}
2717 sys5681:print"the clouds above{home}":sys5681:print"you will part{home}
2718 sys5681:print"for a moment,{home}":sys5681:print"and the sun{home}
2719 sys5681:print"will destroy{home}":sys5681:print"all undead{home}
2720 sys5681:print"and stone{home}":sys5681:print"trolls.{home}":goto2050
2800 print"er{home}":gosub800:print"of white{home}":sys5681:print"magic.{home}":goto400
2810 print"ents{home}":gosub800:print"they can teach{home}":sys5681:print"them to you.%{home}":goto400
2820 gosub800:print"the name of{home}":sys5681:print"evil, which is{home}
2821 sys5681:print"so terrible{home}":sys5681:print"that it burns{home}
2822 sys5681:print"anyone who{home}":sys5681:print"speaks or{home}
2823 sys5681:print"writes it, is at{home}":sys5681:print"the same time{home}
2824 sys5681:print"the mightiest{home}":sys5681:print"weapon against{home}
2826 sys5681:print"evil itself.{home}":gosub960:print"i do not know{home}
2828 sys5681:print"it, and my{home}":sys5681:print"colleague of{home}
2830 sys5681:print"the black circle{home}":sys5681:print"was killed{home}
2832 sys5681:print"by it.{home}":gosub960:print"but you can{home}
2834 sys5681:print"find it out.{home}":sys5681:print"you must{home}
2836 sys5681:print"call it out{home}":sys5681:print"in the face{home}
2838 sys5681:print"of evil while{home}":sys5681:print"you heal{home}
2840 sys5681:print"the crystal.{home}":gosub960:print"but call it{home}
2842 sys5681:print"{wht}backwards{lgrn}!{home}":gosub960
2844 sys5681:print"this will heal{home}":sys5681:print"the crystal{home}
2846 sys5681:print"for good. the{home}":sys5681:print"crystal will{home}
2848 sys5681:print"kept the{home}":sys5681:print"balance of our{home}
2850 sys5681:print"restore our{home}":sys5681:print"world.{home}
2852 gosub960:print"then evil will{home}":sys5681:print"be destroyed,{home}
2854 sys5681:print"and the sun{home}":sys5681:print"will rise for us{home}
2856 sys5681:print"again.{home}":gosub960:print"and for you{home}
2858 sys5681:print"there will be no{home}":sys5681:print"more room in the{home}
2860 sys5681:print"balance, and you{home}":sys5681:print"will probably{home}
2862 sys5681:print"be hurled back{home}":sys5681:print"home.%{home}":goto400
2890 print"{home}":gosub800:print"ask our master{home}":sys5681:print"about it.%{home}":goto400
3000 print"spell{home}":sys5681:sys5681:print"{cyn}the only{home}
3001 sys5681:print"spell that can{home}":sys5681:print"be cast{home}
3002 sys5681:print"here is{home}":sys5681:print"break curse.{home}
3004 sys5681:sys5681:print"{yel}would you like{home}":sys5681:print"that?";:gosub970:sys5681:ifu$="n"goto100
3006 ifpeek(49308)=.thenprint"{lred}you don't know{home}":sys5681:print"that spell!{home}":goto100
3008 ifas<30thenprint"{lred}not enough{home}":sys5681:print"astral energy!{home}":goto100
3010 ifpeek(49340)=.orpeek(49341)=.orpeek(49343)=.thenprint"not enough herbs{home}":goto100
3012 poke49340,peek(49340)-1:poke49341,peek(49341)-1:poke49343,peek(49343)-1
3014 as=as-30:poke49235,as/256:poke49234,as-256*peek(49235)
3016 print"{orng}you concentrate{home}":sys5681:print"...{home}
3018 sys5681:gosub10000:ifrnd(ti)*20+1>chthenprint"{lred}it fails!{home}":goto100
3020 print"{cyn}it works!{home}":fori=6262to6411:ifpeek(i)=.thenpokei,11
3022 next:poke53281,14:sys6041:pokes+5,10:pokes+4,33
3024 fori=5to50step5:forj=itoi+10:pokes+1,j:nextj,i:poke53281,0
3026 fori=0to500:next:poke51200,15:sys4361:fori=0to500:next:poke51200,12:sys4361
3028 fori=0to500:next:poke51200,11:sys4361:fori=0to500:next:poke51200,0:sys4361:goto100
3300 print"{left}  {home}":sys5681:print"{yel}do you want to{home}":sys5681:print"leave the temple{home}
3301 sys5681:print"now?";:gosub970:ifu$="n"theny=y-1:goto100
6000 sys5681:print"{lred}you leave{home}":sys5681:print"the temple.{home}
6010 fori=0to2e3:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
6020 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:poke2,0:new
6100 pokes+4,0:pokes+5,16:pokes+1,12:pokes+4,129:goto100
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
50000 datamagic light,8,2,50,cure poison,9,5,100,shield,9,10,100
50001 datamiracle cure,10,10,150,break curse,10,30,300,light shield,11,15,150
50002 dataagility,12,20,200,turn undead,13,20,250
50100 data-35,6400,1,6800,35,6820,-1,6990
