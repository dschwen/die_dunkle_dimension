1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454
2 poke51200,1:poke51208,12:poke51211,11:poke51209,15:poke51228,1:poke51224,1
3 poke51219,1:poke51223,15:poke51221,1:poke650,255:poke51226,12:poke51313,7
4 fori=0to7:readz$(i),kg(i),ka(i),ks(i):next
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
240 print"talk";:sys5681:print"{yel} -direction? {wht}G{left}";:z=0
250 z=z+1:ifz>499goto258
252 getu$:ifu$=""goto252
254 ifu$="{up}"thenprint"north{home}":j=-11:goto260
255 ifu$="{down}"thenprint"south{home}":j=11:goto260
256 ifu$="{left}"thenprint"west{home}":j=-1:goto260
257 ifu$="{rght}"thenprint"east{home}":j=1:goto260
258 print"no{home}":sys5681:z=0:goto100
260 j=peek(892+j):sys5681:h=0:ifj<>18thenprint"{yel}no answer!{home}":sys5681:goto100
261 ify>19andx=6thenh=2
262 ifh=.andx<9thenh=3
263 ifx=11thenh=4
264 ify>25andx<17thenh=5
265 ify>26andx>17thenh=6
266 ify=20andx=21thenh=7
267 ify=22andx=29thenh=8
268 ify=10andx=23thenh=9
280 sys5681:print"{cyn}you talk to{home}":sys5681
282 ifh>1thenprint"a black{home}":sys5681:print"wizard.";
297 print"{home}":ifrnd(ti)<.5goto400
299 goto820
400 gosub900:ifrnd(ti)<.05thenprint" {home}":goto880
401 ifn$="blac"thenprint"k circle{home}":goto1000
402 ifn$="circ"thenprint"le{home}":goto1000
403 ifn$="wiza"thenprint"rd{home}":goto1000
404 ifn$="magi"thenprint"c{home}":gosub800:goto1020
405 ifh=2andn$="thun"goto2000
406 ifh=3andn$="pois"goto2100
407 ifh=4andn$="fire"goto2200
408 ifh=5andn$="flam"goto2300
409 ifh=6andn$="fear"goto2400
410 ifh=7andn$="time"goto2500
411 ifh=8andn$="deat"goto2600
412 ifh=9andn$="bomb"goto2700
413 ifn$="name"thenprint"?{home}":goto820
414 ifn$="job"goto860
415 ifn$="fuck"orn$="piss"ormid$(n$,2)="ung"orn$="shit"orn$="porn"goto449
420 ifn$="bye"thenprint"!{home}":goto880
421 ifn$="heal"thenprint"th?{home}":goto840
427 ifn$="mast"goto2800
428 ifn$="evil"goto2810
440 print" {home}":gosub800:print"i can't tell{home}":sys5681:print"you anything{home}":sys5681
441 print"about that.%{home}
442 goto400
449 print" {home}":gosub800:print"you are a{home}":sys5681:print"dirty old pig!%{home}":goto400
800 gosub999:print"{yel}the mage{home}
819 sys5681:print"says:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"i am{home}":sys5681:ifh=2thenprint"ortwin";
822 ifh=3thenprint"diabolus";
823 ifh=4thenprint"fuchar";
824 ifh=5thenprint"fulminictus";
825 ifh=6thenprint"borallus";
826 ifh=7thenprint"horax";
827 ifh=8thenprint"necronomos";
829 ifh=9thenprint"archaror";
839 print".%{home}":goto400
840 gosub800:print"quite well,{home}":sys5681:print"thanks";
859 goto839
860 print"?{home}":gosub800
863 ifh>1thenprint"i am a{home}":sys5681:print"wizard of the{home}
864 sys5681:print"black{home}":sys5681:print"circle";:goto839
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
1001 sys5681:print"hood master{home}":sys5681:print"black{home}
1002 sys5681:print"magic.%{home}":goto400
1016 print" {home}":gosub800:print"yes, i'd like{home}";:sys5681:print"some gold too!%{home}":goto400
1020 print"i have mastered{home}":sys5681:print"the mighty{home}
1021 sys5681:printz$(h-2)"{home}":sys5681:print"spell.%{home}":goto400
2000 gosub800:print"this is a{home}":sys5681:print"beginner spell.{home}
2001 sys5681:print"it fires a{home}":sys5681:print"magic missile{home}
2002 sys5681:print"with an{home}":sys5681:print"impressive{home}
2003 sys5681:print"blue flash at{home}":sys5681:print"your opponent.{home}
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
2031 poke49310+h,1:ifh>2goto2110
2032 print"you need only{home}":sys5681:print"sulphur and{home}
2033 sys5681:print"ginseng. focus{home}":sys5681:print"for a moment,{home}
2034 sys5681:print"call out the{home}":sys5681:print"magic words{home}
2035 sys5681:print"and hurl it{home}":sys5681:print"at your{home}
2036 sys5681:print"opponent.{home}":gosub960:print"if it works,{home}
2037 sys5681:print"a blue lightning{home}":sys5681:print"bolt howls into{home}
2038 sys5681:print"the body of{home}":sys5681:print"the one it hits{home}
2039 sys5681:print"and wounds him.{home}
2050 gosub960:print"the invocation{home}":sys5681:print"costs you"ka(h-2)
2052 sys5681:print"astral points.{home}":goto400
2100 gosub800:print"before i explain{home}":sys5681:print"it, i must{home}
2101 sys5681:print"point out that{home}":sys5681:print"the king has{home}
2102 sys5681:print"forbidden the{home}":sys5681:print"use of this{home}
2103 sys5681:print"spell. this{home}":sys5681:print"curse{home}
2104 sys5681:print"poisons{home}":sys5681:print"whoever{home}
2105 sys5681:print"it strikes.{home}":goto2004
2110 ifh>3goto2210
2111 print"this spell{home}":sys5681:print"requires a{home}
2112 sys5681:print"mixture of{home}":sys5681:print"sulphur, pine-{home}
2113 sys5681:print"wort and the{home}":sys5681:print"forbidden{home}
2114 sys5681:print"nightshade is{home}":sys5681:print"required. hurl{home}
2115 sys5681:print"it at your foe{home}":sys5681:print"while speaking{home}
2116 sys5681:print"the formula.{home}
2117 gosub960:print"if it succeeds,{home}":sys5681:print"your opponent is{home}
2118 sys5681:print"poisoned and{home}":sys5681:print"suffers a slow{home}
2119 sys5681:print"and agonizing{home}":sys5681:print"death.{home}":goto2050
2200 gosub800:print"surely you{home}":sys5681:print"already know{home}
2201 sys5681:print"the thunderbolt.{home}":sys5681:print"a fireball is{home}
2202 sys5681:print"even more{home}":sys5681:print"impressive and,{home}
2203 sys5681:print"above all, a{home}":sys5681:print"more effective{home}
2204 sys5681:print"combat spell{home}":sys5681:print"whose power no{home}
2205 sys5681:print"weapon matches.{home}":goto2004
2210 ifh>4goto2310
2211 print"simply mix{home}":sys5681:print"sulphur and{home}
2212 sys5681:print"blood moss,{home}":sys5681:print"call out the{home}
2213 sys5681:print"magic words and{home}":sys5681:print"hurl it at{home}
2214 sys5681:print"your{home}":sys5681:print"opponent.{home}
2217 gosub960:print"if it works, a{home}":sys5681:print"mighty fireball{home}
2218 sys5681:print"hisses towards{home}":sys5681:print"your opponent,{home}
2219 sys5681:print"and the magic{home}":sys5681:print"flames{home}
2220 sys5681:print"burn him{home}":sys5681:print"to ashes.{home}":goto2050
2300 gosub800:print"this is a{home}":sys5681:print"combat spell.{home}
2301 sys5681:print"its force is{home}":sys5681:print"only that of{home}
2302 sys5681:print"the thunderbolt,{home}":sys5681:print"but it can be{home}
2303 sys5681:print"more useful{home}":sys5681:print"than a fire-{home}
2304 sys5681:print"ball. the flames{home}":sys5681:print"pass through{home}
2305 sys5681:print"everything.{home}":goto2004
2310 ifh>5goto2410
2311 print"mixing the fire-{home}":sys5681:print"ball recipe with{home}
2312 sys5681:print"some garlic,{home}":sys5681:print"calling out the{home}
2313 sys5681:print"formula and{home}":sys5681:print"hurling it at{home}
2314 sys5681:print"your foe creates{home}":sys5681:print"a torrent{home}
2315 sys5681:print"of flames that{home}":sys5681:print"passes through{home}
2316 sys5681:print"everything.{home}":goto2050
2400 gosub800:print"sometimes the{home}":sys5681:print"attacks of{home}
2401 sys5681:print"animals can be a{home}":sys5681:print"real nuisance.{home}
2402 sys5681:print"this curse{home}":sys5681:print"awakens the{home}
2403 sys5681:print"natural instinct{home}":sys5681:print"to flee and{home}
2404 sys5681:print"makes all higher{home}":sys5681:print"animals{home}
2405 sys5681:print"flee in panic.{home}":goto2004
2410 ifh>6goto2510
2411 print"the spell is{home}":sys5681:print"difficult. you{home}
2412 sys5681:print"you need ginseng{home}":sys5681:print"blood moss and{home}
2413 sys5681:print"deathbloom.{home}":sys5681:print"speak the{home}
2414 sys5681:print"formula and toss{home}":sys5681:print"it all in the{home}
2415 gosub960:print"air. if the{home}":sys5681:print"powers are kind,{home}
2416 sys5681:print"all higher{home}":sys5681:print"animals{home}
2417 sys5681:print"will flee. do{home}":sys5681:print"not keep{home}
2418 sys5681:print"attacking them,{home}":sys5681:print"it would be{home}
2419 gosub960:print"their death.{home}":sys5681:print"sadly it does{home}
2420 sys5681:print"not work on{home}":sys5681:print"primitive beasts{home}
2421 sys5681:print"such as snakes,{home}":sys5681:print"spiders, squids.{home}":goto2050
2500 gosub800:print"this spell{home}":sys5681:print"is very hard.{home}
2501 sys5681:print"sometimes you{home}":sys5681:print"want not only to{home}
2502 sys5681:print"be faster than{home}":sys5681:print"your opponent,{home}
2503 sys5681:print"but to take away{home}":sys5681:print"his every chance{home}
2504 sys5681:print"to act without{home}":sys5681:print"paralysing{home}
2505 sys5681:print"each one.{home}":goto2004
2510 ifh>7goto2610
2511 print"the combination{home}":sys5681:print"of pinewort,{home}
2512 sys5681:print"blood moss and{home}":sys5681:print"deathbloom with{home}
2513 sys5681:print"the formula,{home}":sys5681:print"sprinkled over{home}
2514 sys5681:print"you, can make{home}":sys5681:print"time stand still{home}
2517 gosub960:print"if it works, a{home}":sys5681:print"'z' lights up.{home}
2518 sys5681:print"for as long as{home}":sys5681:print"the spell lasts.{home}
2519 sys5681:print"for twelve{home}":sys5681:print"combat turns{home}
2520 sys5681:print"only you can{home}":sys5681:print"act.{home}":goto2050
2600 gosub800:print"this difficult{home}":sys5681:print"spell raises{home}
2601 sys5681:print"creates a{home}":sys5681:print"terrible{home}
2602 sys5681:print"lightning bolt{home}":sys5681:print"that strikes{home}
2603 sys5681:print"at your feet. if{home}":sys5681:print"an enemy stands{home}
2604 sys5681:print"there, it hits{home}":sys5681:print"him with{home}
2605 sys5681:print"uncanny force.{home}":goto2004
2610 ifh=9goto2710
2611 print"mix sulphur,{home}":sys5681:print"deathbloom and{home}
2612 sys5681:print"the rare{home}":sys5681:print"mandrake root.{home}
2613 sys5681:print"hurl it out{home}":sys5681:print"in front of you{home}
2614 sys5681:print"and call out{home}":sys5681:print"the formula.{home}
2617 gosub960:print"if all goes well{home}":sys5681:print"a destructive{home}
2618 sys5681:print"force arises{home}":sys5681:print"which has only{home}
2619 sys5681:print"a short reach{home}":sys5681:print"but is almost{home}
2620 sys5681:print"twice as strong{home}":sys5681:print"as a{home}
2621 sys5681:print"fireball.{home}":goto2050
2700 gosub800:print"before i explain{home}":sys5681:print"it, i must{home}
2701 sys5681:print"point out that{home}":sys5681:print"the king has{home}
2702 sys5681:print"forbidden the{home}":sys5681:print"use of this{home}
2703 sys5681:print"spell. this{home}":sys5681:print"spell causes{home}
2704 sys5681:print"a powerful{home}":sys5681:print"detonation.{home}
2705 sys5681:print"the force of{home}":gosub960:print"the blast costs{home}
2706 sys5681:print"everyone present{home}":sys5681:print"20 points of{home}
2707 sys5681:print"life{home}":sys5681:print"energy.{home}
2708 sys5681:print"including you!{home}":goto2004
2710 print"a mixture of{home}":sys5681:print"garlic,{home}
2712 sys5681:print"deathbloom and{home}":sys5681:print"rare mandrake{home}
2713 sys5681:print"of garlic,{home}":sys5681:print"nightshade{home}
2714 sys5681:print"and the rare{home}":sys5681:print"mandrake root{home}
2715 sys5681:print"is needed for{home}":sys5681:print"this spell.{home}
2716 gosub960:print"if the evil{home}":sys5681:print"powers hear you,{home}
2717 sys5681:print"a firestorm{home}":sys5681:print"destroys the{home}
2718 sys5681:print"weak and{home}":sys5681:print"weakens the{home}
2719 sys5681:print"strong - but{home}":sys5681:print"you as well.{home}":goto2050
2800 print"er{home}":gosub800:print"the name of evil{home}":sys5681:print"killed him{home}
2801 sys5681:print".%{home}":goto400
2810 print"{home}":gosub800:print"all was well,{home}":sys5681:print"the{home}
2811 sys5681:print"world was in{home}":sys5681:print"balance.{home}
2812 sys5681:print"then our master{home}":sys5681:print"tried to{home}
2813 sys5681:print"summon evil{home}":sys5681:print"itself, to{home}
2814 sys5681:print"learn its{home}":sys5681:print"magical{home}
2815 sys5681:print"secrets.{home}":gosub960:print"he did not know{home}
2816 sys5681:print"how strong evil{home}":sys5681:print"really{home}
2817 sys5681:print"was. so he wrote{home}":sys5681:print"the name of{home}
2818 sys5681:print"evil, which he{home}":sys5681:print"had somehow{home}
2819 sys5681:print"found, on{home}
2820 sys5681:print"a clay tablet{home}":sys5681:print"and with it he{home}
2821 sys5681:print"summoned evil.{home}":gosub960:print"then disaster{home}
2822 sys5681:print"struck.{home}":sys5681:print"evil had{home}
2823 sys5681:print"so much{home}":sys5681:print"power that{home}
2824 sys5681:print"through this{home}":sys5681:print"summoning it{home}
2825 sys5681:print"could break into{home}":sys5681:print"our world.{home}
2826 gosub960:print"the energy it{home}":sys5681:print"released{home}
2827 sys5681:print"burned our{home}":sys5681:print"master and{home}
2828 sys5681:print"blasted a{home}":sys5681:print"shard off the{home}
2829 sys5681:print"crystal,{home}":sys5681:print"whereupon{home}
2830 sys5681:print"it went dark.{home}":gosub960:print"the balance of{home}
2831 sys5681:print"our world{home}":sys5681:print"was{home}
2832 sys5681:print"destroyed. now{home}":sys5681:print"darkness{home}
2833 sys5681:print"reigns.{home}":gosub960:print"the tablet with{home}
2834 sys5681:print"the name of{home}":sys5681:print"evil broke{home}
2835 sys5681:print"into seven parts{home}":sys5681:print"each of these{home}
2836 sys5681:print"seven tablets{home}":sys5681:print"holds one{home}
2837 sys5681:print"letter of the{home}":sys5681:print"dreadful name.{home}
2838 gosub960:print"we gave the{home}":sys5681:print"tablets to seven{home}
2839 sys5681:print"druids, who{home}":sys5681:print"took them to{home}
2840 sys5681:print"all seven towns.":sys5681:print"there a wizard{home}
2841 sys5681:print"received{home}":sys5681:print"each{home}
2842 sys5681:print"of them.{home}":sys5681:print"{home}
2843 gosub960:print"the wizards{home}":sys5681:print"then hid their{home}
2844 sys5681:print"tablets as they{home}":sys5681:print"saw fit some-{home}
2845 sys5681:print"where in town.{home}":sys5681:print"in this way{home}
2846 sys5681:print"no one knows{home}":sys5681:print"the name of{home}
2847 sys5681:print"evil anymore.{home}":gosub960:print"but you need{home}
2848 sys5681:print"it, don't{home}":sys5681:print"you?";
2849 gosub970:ifu$="n"thenprint"lucky you.%{home}":goto400
2850 sys5681:print"ask the wizards{home}":sys5681:print"in the towns{home}
2851 sys5681:print"about the{home}":sys5681:print"tablets. but{home}
2852 sys5681:print"they don't know{home}":sys5681:print"the order of{home}
2853 sys5681:print"the letters.%{home}":goto400
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
3020 print"{cyn}it works!{home}":fori=6332to6411:ifpeek(i)=.thenpokei,11
3022 next:poke53281,14:sys6041:pokes+5,10:pokes+4,33
3024 fori=5to50step5:forj=itoi+10:pokes+1,j:nextj,i:poke53281,0
3026 fori=0to500:next:poke51200,15:sys4361:fori=0to500:next:poke51200,12:sys4361
3028 fori=0to500:next:poke51200,11:sys4361:fori=0to500:next:poke51200,0:sys4361:goto100
3300 print"{left}  {home}":sys5681:print"{yel}do you want to{home}":sys5681:print"leave the tower{home}
3301 sys5681:print"now?";:gosub970:ifu$="n"theny=y-1:goto100
6000 sys5681:print"{lred}you leave{home}":sys5681:print"the tower.{home}
6010 fori=0to1599:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
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
40000 poke51200,1:poke51208,12:poke51211,11:poke51209,15:poke51228,1
40001 poke51219,1:poke51223,15:poke51221,1:poke51226,12:poke51313,1:poke51224,1
50000 datathunderbolt,8,5,100,poison & gall,10,7,200,fireball,10,10,150
50001 dataflame trail,12,20,200,fear curse,7,15,200,time freeze,13,25,250
50002 datadeath bolt,14,20,300,magic bomb,15,25,400
50100 data-35,6400,1,6800,35,6820,-1,6990
