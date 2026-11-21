1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454
2 poke51200,1:poke51208,12:poke51211,11:poke51209,15:poke51228,1:poke51224,1
3 poke51219,1:poke51223,15:poke51221,1:poke650,255:poke51226,12:poke51313,7
4 fori=0to7:readz$(i),kg(i),ka(i),ks(i):next
6 dima(3),p(3):fori=0to3:reada(i),p(i):next
20 print"{home}{down}{down}"spc(24)"{lgrn}vital.:   (   )":printspc(24)"{up}{cyn}astral:   (   )
21 printspc(24)"{lred}ang.:   {grn}ver.:":printspc(24)"{up}{pur}str.:   {yel}ges.:
22 printspc(24)"{gry3}klg.:   {lblu}cha.:":printspc(24)"{up}{lgrn}erf.:      (  )
23 printspc(24)"{yel}goldstck.:":printspc(24)"{up}{orng}nahr.vorrat:
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
128 ifu$="k"goto240
129 ifu$="w"thenprint"waffe{home}":goto191
130 ifu$="r"thenprint"rüstung{home}":goto191
131 ifu$="i"thenprint"inventur{home}":goto191
132 ifu$="z"goto3000
190 print"wie bitte..?{home}":goto100
191 sys5681:print"{yel}mach das{home}":sys5681:print"draussen!{home}":goto100
200 print"warten...{home}":goto100
210 print"norden{home}":j=peek(881):if(j<>11andj>0andj<>8)or(j+bb=0)goto214
212 pokep,q:q=j:p=p-35:y=y-1:goto6100
214 sys5681:print"{lred}blockiert!{home}":sys5681:goto100
220 print"süden{home}":j=peek(903):if(j<>11andj>0andj<>8)or(j+bb=0)goto214
222 pokep,q:q=j:p=p+35:y=y+1:goto6100
230 print"westen{home}":j=peek(891):if(j<>11andj>0andj<>8)or(j+bb=0)goto214
232 pokep,q:q=j:p=p-1:x=x-1:goto6100
234 print"osten{home}":j=peek(893):if(j<>11andj>0andj<>8)or(j+bb=0)goto214
236 pokep,q:q=j:p=p+1:x=x+1:goto6100
240 print"kommuniziere";:sys5681:print"{yel} - richt.? {wht}G{left}";:z=0
250 z=z+1:ifz>499goto258
252 getu$:ifu$=""goto252
254 ifu$="{up}"thenprint"nord{home}":j=-11:goto260
255 ifu$="{down}"thenprint"süd{home}":j=11:goto260
256 ifu$="{left}"thenprint"west{home}":j=-1:goto260
257 ifu$="{rght}"thenprint"ost{home}":j=1:goto260
258 print"nein{home}":sys5681:z=0:goto100
260 j=peek(892+j):sys5681:h=0:ifj<>18thenprint"{yel}keine antwort!{home}":sys5681:goto100
261 ify>19andx=6thenh=2
262 ifh=.andx<9thenh=3
263 ifx=11thenh=4
264 ify>25andx<17thenh=5
265 ify>26andx>17thenh=6
266 ify=20andx=21thenh=7
267 ify=22andx=29thenh=8
268 ify=10andx=23thenh=9
280 sys5681:print"{cyn}du sprichst{home}":sys5681
282 ifh>1thenprint"einen schwarzen{home}":sys5681:print"zauberer ";
297 print"an.{home}":ifrnd(ti)<.5goto400
299 goto820
400 gosub900:ifrnd(ti)<.05thenprint" {home}":goto880
401 ifn$="schw"thenprint"arzer zirk.{home}":goto1000
402 ifn$="zirk"thenprint"el{home}":goto1000
403 ifn$="zaub"thenprint"erer{home}":goto1000
404 ifn$="magi"thenprint"e{home}":gosub800:goto1020
405 ifh=2andn$="donn"goto2000
406 ifh=3andn$="gift"goto2100
407 ifh=4andn$="feue"goto2200
408 ifh=5andn$="flam"goto2300
409 ifh=6andn$="furc"goto2400
410 ifh=7andn$="zeit"goto2500
411 ifh=8andn$="tode"goto2600
412 ifh=9andn$="bomb"goto2700
413 ifn$="name"thenprint"?{home}":goto820
414 ifn$="beru"goto860
415 ifn$="fick"orn$="piss"ormid$(n$,2)="otz"orn$="arsc"orn$="porn"goto449
420 ifn$="wied"thenprint"ersehen.{home}":goto880
421 ifn$="gesu"thenprint"ndheit?{home}":goto840
427 ifn$="meis"goto2800
428 ifn$="boes"goto2810
440 print" {home}":gosub800:print"dazu kann{home}":sys5681:print"ich dir nichts{home}":sys5681
441 print"sagen.%{home}
442 goto400
449 print" {home}":gosub800:print"du bist ein{home}":sys5681:print"altes ferkel!%{home}":goto400
800 gosub999:print"{yel}der magier{home}
819 sys5681:print"sagt:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"ich bin{home}":sys5681:ifh=2thenprint"ortwin";
822 ifh=3thenprint"diabolus";
823 ifh=4thenprint"fuchar";
824 ifh=5thenprint"fulminictus";
825 ifh=6thenprint"borallus";
826 ifh=7thenprint"horax";
827 ifh=8thenprint"necronomos";
829 ifh=9thenprint"archaror";
839 print".%{home}":goto400
840 gosub800:print"ganz gut,{home}":sys5681:print"danke";
859 goto839
860 print"f?{home}":gosub800
863 ifh>1thenprint"ich bin ein{home}":sys5681:print"zauberer des{home}
864 sys5681:print"schwarzen{home}":sys5681:print"zirkels";:goto839
880 gosub800:print"ich muss jetzt{home}":sys5681:print"meditieren. geh";
881 sys5681:print"in frieden.%{home}":sys5681:sys5681
882 print"{yel}er wendet sich{home}":sys5681:print"ab.{home}":sys5681:goto100
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
1000 gosub800:print"die zauberer{home}":sys5681:print"unserer bruder-{home}
1001 sys5681:print"schaft beherr-{home}":sys5681:print"schen die{home}
1002 sys5681:print"schwarze magie.%{home}":goto400
1016 print" {home}":gosub800:print"ja, gold hätte{home}";:sys5681:print"ich auch gern!%{home}":goto400
1020 print"ich beherrsche{home}":sys5681:print"den mächtigen{home}
1021 sys5681:printz$(h-2)"-{home}":sys5681:print"zauberspruch.%{home}":goto400
2000 gosub800:print"dies ist ein{home}":sys5681:print"anfänger-spruch.{home}
2001 sys5681:print"er feuert ein{home}":sys5681:print"magisches ge-{home}
2002 sys5681:print"schoss mit einem{home}":sys5681:print"eindrucksvollen{home}
2003 sys5681:print"blauen blitz auf{home}":sys5681:print"deinen gegner.{home}
2004 gosub960:print"möchtest du ihn{home}":sys5681:print"erlernen? ";:gosub970
2005 ifu$="n"thenprint"jeder gute{home}":sys5681:print"zauberer muss{home}
2006 ifu$="n"thensys5681:print"ihn beherr-{home}":sys5681:print"schen.%{home}":goto400
2010 ifkg<kg(h-2)thenprint"du bist leider{home}":sys5681:print"nicht klug{home}
2011 ifkg<kg(h-2)thensys5681:print"genug, das sehr{home}":sys5681:print"komplizierte{home}
2012 ifkg<kg(h-2)thensys5681:print"beschwörungs-{home}":sys5681:print"ritual zu{home}
2013 ifkg<kg(h-2)thensys5681:print"begreifen.%{home}":goto400
2020 z=ks(h-2):print"gib mir"z;:sys5681:print"goldstücke, dann{home}
2021 sys5681:print"lehre ich ihn{home}":sys5681:print"dich, ja? ";:gosub970
2022 ifu$="n"goto2005
2023 ifgp<zthenprint"du hast nicht{home}":sys5681:print"genug gold!%{home}":goto400
2030 gosub9004:sys5681:print"danke, also der{home}":sys5681:print"spruch geht so:{home}":gosub960
2031 poke49310+h,1:ifh>2goto2110
2032 print"du benötigst nur{home}":sys5681:print"schwefel und{home}
2033 sys5681:print"ginseng. kon-{home}":sys5681:print"zentriere dich{home}
2034 sys5681:print"kurz, rufe die{home}":sys5681:print"magischen worte{home}
2035 sys5681:print"und wirf es{home}":sys5681:print"deinem gegner{home}
2036 sys5681:print"entgegen.{home}":gosub960:print"wenn es klappt,{home}
2037 sys5681:print"heult ein blauer{home}":sys5681:print"blitz in den{home}
2038 sys5681:print"körper des ge-{home}":sys5681:print"troffenen und{home}
2039 sys5681:print"verwundet ihn.{home}
2050 gosub960:print"die beschwörung{home}":sys5681:print"kostet dich"ka(h-2)
2052 sys5681:print"astralpunkte.{home}":goto400
2100 gosub800:print"bevor ich ihn{home}":sys5681:print"erkläre, muss{home}
2101 sys5681:print"ich darauf hin-{home}":sys5681:print"weisen, dass die{home}
2102 sys5681:print"anwendung dieses{home}":sys5681:print"zaubers vom{home}
2103 sys5681:print"könig verboten{home}":sys5681:print"wurde. dieser{home}
2104 sys5681:print"fluch vergiftet{home}":sys5681:print"den von ihm{home}
2105 sys5681:print"getroffenen.{home}":goto2004
2110 ifh>3goto2210
2111 print"für diesen{home}":sys5681:print"spruch ist eine{home}
2112 sys5681:print"mischung aus{home}":sys5681:print"schwefel, zir-{home}
2113 sys5681:print"belkraut und dem{home}":sys5681:print"verbotenen gift{home}
2114 sys5681:print"der nacht erfor-{home}":sys5681:print"derlich. wirf{home}
2115 sys5681:print"es deinem gegner{home}":sys5681:print"mit der formel{home}
2116 sys5681:print"entgegen.{home}
2117 gosub960:print"gelingt es, so{home}":sys5681:print"ist dein gegner{home}
2118 sys5681:print"vergiftet und{home}":sys5681:print"hat einen lang-{home}
2119 sys5681:print"samen und qual-{home}":sys5681:print"vollen tod.{home}":goto2050
2200 gosub800:print"du kennst be-{home}":sys5681:print"stimmt schon den{home}
2201 sys5681:print"donnerkeil. ein{home}":sys5681:print"feuerball ist{home}
2202 sys5681:print"noch eindrucks-{home}":sys5681:print"voller und vor{home}
2203 sys5681:print"allem ein wirk-{home}":sys5681:print"samerer kampf-{home}
2204 sys5681:print"zauber, dessen{home}":sys5681:print"kraft keine{home}
2205 sys5681:print"waffe erreicht.{home}":goto2004
2210 ifh>4goto2310
2211 print"man mischt nur{home}":sys5681:print"schwefel und{home}
2212 sys5681:print"blutflechte,{home}":sys5681:print"ruft die magi-{home}
2213 sys5681:print"schen worte und{home}":sys5681:print"schleudert es{home}
2214 sys5681:print"dem gegner ent-{home}":sys5681:print"gegen.{home}
2217 gosub960:print"wenn's klappt,{home}":sys5681:print"faucht ein ge-{home}
2218 sys5681:print"waltiger feuer-{home}":sys5681:print"ball auf den{home}
2219 sys5681:print"gegner zu, und{home}":sys5681:print"die magischen{home}
2220 sys5681:print"flammen ver-{home}":sys5681:print"brennen ihn.{home}":goto2050
2300 gosub800:print"dies ist ein{home}":sys5681:print"kampfzauber. die{home}
2301 sys5681:print"wucht entspricht{home}":sys5681:print"zwar nur der des{home}
2302 sys5681:print"donnerkeils,{home}":sys5681:print"aber er kann{home}
2303 sys5681:print"nützlicher sein{home}":sys5681:print"als ein feuer-{home}
2304 sys5681:print"ball. die flam-{home}":sys5681:print"men gehen durch{home}
2305 sys5681:print"alles hindurch.{home}":goto2004
2310 ifh>5goto2410
2311 print"das feuerball-{home}":sys5681:print"rezept mit etwas{home}
2312 sys5681:print"knoblauch mixen,{home}":sys5681:print"die zauberformel{home}
2313 sys5681:print"rufen und es dem{home}":sys5681:print"gegner entgegen-{home}
2314 sys5681:print"werfen, erzeugt{home}":sys5681:print"einen flammen-{home}
2315 sys5681:print"schwall, der{home}":sys5681:print"durch alles{home}
2316 sys5681:print"hindurchgeht.{home}":goto2050
2400 gosub800:print"manchmal koen-{home}":sys5681:print"nen angriffe von{home}
2401 sys5681:print"tieren sehr läs-{home}":sys5681:print"tig sein. dieser{home}
2402 sys5681:print"fluch weckt den{home}":sys5681:print"natürlichen{home}
2403 sys5681:print"fluchtinstinkt{home}":sys5681:print"und lässt alle{home}
2404 sys5681:print"höher entwickel-{home}":sys5681:print"ten tiere in{home}
2405 sys5681:print"panik fliehen.{home}":goto2004
2410 ifh>6goto2510
2411 print"der spruch ist{home}":sys5681:print"schwierig. man{home}
2412 sys5681:print"braucht ginseng,{home}":sys5681:print"blutflechte und{home}
2413 sys5681:print"totenblume.{home}":sys5681:print"sprich die for-{home}
2414 sys5681:print"mel und wirf al-{home}":sys5681:print"les in die luft.{home}
2415 gosub960:print"sind die mächte{home}":sys5681:print"gnädig, werden{home}
2416 sys5681:print"alle höher ent-{home}":sys5681:print"wickelten tiere{home}
2417 sys5681:print"fliehen. attak-{home}":sys5681:print"kiere sie nicht{home}
2418 sys5681:print"weiter, es wäre{home}":sys5681:print"ihr tod.{home}
2419 gosub960:print"leider funktio-{home}":sys5681:print"niert es bei{home}
2420 sys5681:print"primitiven tie-{home}":sys5681:print"ren, wie schlan-{home}
2421 sys5681:print"gen, spinnen und{home}":sys5681:print"kraken nicht.{home}":goto2050
2500 gosub800:print"dieser spruch{home}":sys5681:print"ist sehr schwer.{home}
2501 sys5681:print"manchmal möchte{home}":sys5681:print"man nicht nur{home}
2502 sys5681:print"schneller sein{home}":sys5681:print"als sein gegner,{home}
2503 sys5681:print"sondern ihm auch{home}":sys5681:print"jede aktionsmög-{home}
2504 sys5681:print"lichkeit nehmen,{home}":sys5681:print"ohne jeden ein-{home}
2505 sys5681:print"zeln zu lähmen.{home}":goto2004
2510 ifh>7goto2610
2511 print"die kombination{home}":sys5681:print"von zirbelkraut,{home}
2512 sys5681:print"blutflechte und{home}":sys5681:print"totenblume mit{home}
2513 sys5681:print"der zauberformel{home}":sys5681:print"über dich ge-{home}
2514 sys5681:print"streut, kann die{home}":sys5681:print"zeit anhalten.{home}
2517 gosub960:print"wenn's gelingt,{home}":sys5681:print"leuchtet ein 'z'{home}
2518 sys5681:print"auf, solange der{home}":sys5681:print"zauber wirkt.{home}
2519 sys5681:print"für zwölf kampf-{home}":sys5681:print"züge kannst dann{home}
2520 sys5681:print"nur du etwas{home}":sys5681:print"machen.{home}":goto2050
2600 gosub800:print"dieser schwere{home}":sys5681:print"zauberspruch{home}
2601 sys5681:print"erzeugt einen{home}":sys5681:print"furchtbaren{home}
2602 sys5681:print"blitz, der vor{home}":sys5681:print"deinen füssen{home}
2603 sys5681:print"einschlägt. wenn{home}":sys5681:print"ein gegner dort{home}
2604 sys5681:print"steht, trifft{home}":sys5681:print"ihn eine unheim-{home}
2605 sys5681:print"liche wucht.{home}":goto2004
2610 ifh=9goto2710
2611 print"mische schwefel,{home}":sys5681:print"totenblume und{home}
2612 sys5681:print"die seltene{home}":sys5681:print"alraunewurzel.{home}
2613 sys5681:print"schleudere es{home}":sys5681:print"vor dich hin{home}
2614 sys5681:print"und rufe die{home}":sys5681:print"zauberformel.{home}
2617 gosub960:print"klappt alles,{home}":sys5681:print"entsteht eine{home}
2618 sys5681:print"vernichtungs-{home}":sys5681:print"kraft, die zwar{home}
2619 sys5681:print"geringe reich-{home}":sys5681:print"weite hat, aber{home}
2620 sys5681:print"fast doppelt so{home}":sys5681:print"stark ist wie{home}
2621 sys5681:print"ein feuerball.{home}":goto2050
2700 gosub800:print"bevor ich ihn{home}":sys5681:print"erkläre, muss{home}
2701 sys5681:print"ich darauf hin-{home}":sys5681:print"weisen, dass die{home}
2702 sys5681:print"anwendung dieses{home}":sys5681:print"zaubers vom{home}
2703 sys5681:print"könig verboten{home}":sys5681:print"wurde. dieser{home}
2704 sys5681:print"spruch erzeugt{home}":sys5681:print"eine starke{home}
2705 sys5681:print"detonation.{home}":gosub960:print"die explosions-{home}
2706 sys5681:print"kraft kostet{home}":sys5681:print"jeden anwesenden{home}
2707 sys5681:print"20 punkte le-{home}":sys5681:print"bensenergie.{home}
2708 sys5681:print"dich aber auch!{home}":goto2004
2710 print"eine mit den{home}":sys5681:print"magischen worten{home}
2712 sys5681:print"in die luft ge-{home}":sys5681:print"worfene mixtur{home}
2713 sys5681:print"aus knoblauch,{home}":sys5681:print"gift der nacht{home}
2714 sys5681:print"und der seltenen{home}":sys5681:print"alraunewurzel{home}
2715 sys5681:print"ist notwendig zu{home}":sys5681:print"diesem zauber.{home}
2716 gosub960:print"erhören dich die{home}":sys5681:print"bösen mächte, so{home}
2717 sys5681:print"vernichtet ein{home}":sys5681:print"feuersturm die{home}
2718 sys5681:print"schwachen und{home}":sys5681:print"schwächt die{home}
2719 sys5681:print"starken - aber{home}":sys5681:print"auch dich.{home}":goto2050
2800 print"ter{home}":gosub800:print"der name des{home}":sys5681:print"bösen hat ihn{home}
2801 sys5681:print"getötet.%{home}":goto400
2810 print"e{home}":gosub800:print"es war alles{home}":sys5681:print"in ordnung, die{home}
2811 sys5681:print"welt war im{home}":sys5681:print"gleichgewicht.{home}
2812 sys5681:print"dann hat unser{home}":sys5681:print"meister ver-{home}
2813 sys5681:print"sucht, das böse{home}":sys5681:print"selbst zu be-{home}
2814 sys5681:print"schwören, um an{home}":sys5681:print"magische geheim-{home}
2815 sys5681:print"nisse zu kommen.{home}":gosub960:print"er ahnte nicht,{home}
2816 sys5681:print"wie stark das{home}":sys5681:print"böse wirklich{home}
2817 sys5681:print"war. so schrieb{home}":sys5681:print"er den namen des{home}
2818 sys5681:print"bösen, den er{home}":sys5681:print"irgendwie gefun-{home}
2819 sys5681:print"den hatte, auf{home}
2820 sys5681:print"eine tontafel{home}":sys5681:print"und beschwor{home}
2821 sys5681:print"damit das böse.{home}":gosub960:print"dann brach die{home}
2822 sys5681:print"katastrophe{home}":sys5681:print"herein. das böse{home}
2823 sys5681:print"hatte so viel{home}":sys5681:print"macht, dass es{home}
2824 sys5681:print"durch diese be-{home}":sys5681:print"schwörung in{home}
2825 sys5681:print"unsere welt ein-{home}":sys5681:print"dringen konnte.{home}
2826 gosub960:print"die energie, die{home}":sys5681:print"es dabei frei-{home}
2827 sys5681:print"setzte, ver-{home}":sys5681:print"brannte unseren{home}
2828 sys5681:print"meister und{home}":sys5681:print"sprengte einen{home}
2829 sys5681:print"splitter vom{home}":sys5681:print"kristall ab, wo-{home}
2830 sys5681:print"rauf er erlosch.{home}":gosub960:print"das gleichge-{home}
2831 sys5681:print"wicht unserer{home}":sys5681:print"welt war zer-{home}
2832 sys5681:print"stört. nun{home}":sys5681:print"herrscht die{home}
2833 sys5681:print"finsternis.{home}":gosub960:print"die tafel mit{home}
2834 sys5681:print"dem namen des{home}":sys5681:print"bösen zerbrach{home}
2835 sys5681:print"in sieben teile.{home}":sys5681:print"jede dieser sie-{home}
2836 sys5681:print"ben tafeln ent-{home}":sys5681:print"hält einen buch-{home}
2837 sys5681:print"staben des grau-{home}":sys5681:print"samen namens.{home}
2838 gosub960:print"wir gaben die{home}":sys5681:print"tafeln sieben{home}
2839 sys5681:print"druiden mit, die{home}":sys5681:print"sie in alle{home}
2840 sys5681:print"sieben städte":sys5681:print"brachten. dort{home}
2841 sys5681:print"nahm sie dann{home}":sys5681:print"jeweils ein{home}
2842 sys5681:print"zauberer in{home}":sys5681:print"empfang.{home}
2843 gosub960:print"die zauberer{home}":sys5681:print"versteckten ihre{home}
2844 sys5681:print"tafeln dann nach{home}":sys5681:print"belieben irgend-{home}
2845 sys5681:print"wo in der stadt.{home}":sys5681:print"auf diese weise{home}
2846 sys5681:print"weiss nun keiner{home}":sys5681:print"mehr den namen{home}
2847 sys5681:print"des bösen.{home}":gosub960:print"aber du benö-{home}
2848 sys5681:print"tigst ihn, nicht{home}":sys5681:print"wahr?";
2849 gosub970:ifu$="n"thenprint"du glücklicher.%{home}":goto400
2850 sys5681:print"frag die zaube-{home}":sys5681:print"rer in den{home}
2851 sys5681:print"städten nach den{home}":sys5681:print"tafeln. aber sie{home}
2852 sys5681:print"wissen nicht die{home}":sys5681:print"reihenfolge der{home}
2853 sys5681:print"buchstaben.%{home}":goto400
3000 print"zauberspruch{home}":sys5681:sys5681:print"{cyn}der einzige{home}
3001 sys5681:print"zauber, der hier{home}":sys5681:print"ausgelöst werden{home}
3002 sys5681:print"kann, ist der{home}":sys5681:print"bannbrecher.{home}
3004 sys5681:sys5681:print"{yel}möchtest du{home}":sys5681:print"das?";:gosub970:sys5681:ifu$="n"goto100
3006 ifpeek(49308)=.thenprint"{lred}du kannst den{home}":sys5681:print"spruch nicht!{home}":goto100
3008 ifas<30thenprint"{lred}zu wenig{home}":sys5681:print"astralenergie!{home}":goto100
3010 ifpeek(49340)=.orpeek(49341)=.orpeek(49343)=.thenprint"zu wenig zutaten{home}":goto100
3012 poke49340,peek(49340)-1:poke49341,peek(49341)-1:poke49343,peek(49343)-1
3014 as=as-30:poke49235,as/256:poke49234,as-256*peek(49235)
3016 print"{orng}du konzentrierst{home}":sys5681:print"dich...{home}
3018 sys5681:gosub10000:ifrnd(ti)*20+1>chthenprint"{lred}gelingt nicht!{home}":goto100
3020 print"{cyn}es gelingt!{home}":fori=6332to6411:ifpeek(i)=.thenpokei,11
3022 next:poke53281,14:sys6041:pokes+5,10:pokes+4,33
3024 fori=5to50step5:forj=itoi+10:pokes+1,j:nextj,i:poke53281,0
3026 fori=0to500:next:poke51200,15:sys4361:fori=0to500:next:poke51200,12:sys4361
3028 fori=0to500:next:poke51200,11:sys4361:fori=0to500:next:poke51200,0:sys4361:goto100
3300 print"{left}  {home}":sys5681:print"{yel}möchtest du{home}":sys5681:print"den turm{home}
3301 sys5681:print"verlassen?";:gosub970:ifu$="n"theny=y-1:goto100
6000 sys5681:print"{lred}du verlässt{home}":sys5681:print"den turm.{home}
6010 fori=0to1599:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
6020 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:poke2,0:new
6100 pokes+4,0:pokes+5,16:pokes+1,12:pokes+4,129:goto100
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
40000 poke51200,1:poke51208,12:poke51211,11:poke51209,15:poke51228,1
40001 poke51219,1:poke51223,15:poke51221,1:poke51226,12:poke51313,1:poke51224,1
50000 datadonnerkeil,8,5,100,gift und galle,10,7,200,feuerball,10,10,150
50001 dataflammenspur,12,20,200,furchtfluch,7,15,200,zeitgefrier,13,25,250
50002 datatodesblitz,14,20,300,mag. bombe,15,25,400
50100 data-35,6400,1,6800,35,6820,-1,6990
