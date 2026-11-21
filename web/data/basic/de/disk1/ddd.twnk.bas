1 poke53281,0:poke53280,0:poke53272,18:i=rnd(-ti):s=54272:sys5454
2 poke51200,1:poke51205,8:poke51208,12:poke51211,11:poke51209,15:poke51228,1
3 poke51219,1:poke51204,5:poke51223,15:poke51221,1:poke650,255
4 fori=0to7:readz$(i),kg(i),kp(i),ks(i):next
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
260 j=peek(892+j):sys5681:h=0:ifj=21thenh=1
261 ifj=18andy>26andx>18thenh=2
262 ifj=18andy>26andx<18thenh=3
263 ifj=18andy>20andy<24andx>18thenh=4
264 ifj=18andy>20andy<24andx<18thenh=5
265 ifj=18andy<10andx>18thenh=6
267 ifj=18andy<10andx<18thenh=7
268 ifj=18andy>12andy<18andx>18thenh=8
269 ifj=18andy>12andy<18andx<18thenh=9
279 ifh=.thenprint"{lred}keine antwort!{home}":sys5681:goto100
280 sys5681:print"{cyn}du sprichst{home}":sys5681
281 ifh=1thenprint"den weissen{home}":sys5681:print"zaubermeister{home}":sys5681
282 ifh>1thenprint"einen weissen{home}":sys5681:print"zauberer ";
297 print"an.{home}":ifh=13orrnd(ti)<.5goto400
299 goto820
400 gosub900:ifrnd(ti)<.05thenprint" {home}":goto880
401 ifn$="weis"thenprint"ser zirkel{home}":goto1000
402 ifn$="zirk"thenprint"el{home}":goto1000
403 ifn$="zaub"thenprint"erer{home}":goto1000
404 ifn$="magi"thenprint"e{home}":goto1010
405 ifh=2andn$="lich"goto2000
406 ifh=3andn$="entg"goto2100
407 ifh=4andn$="schu"goto2200
408 ifh=5andn$="wund"goto2300
409 ifh=6andn$="bann"goto2400
410 ifh=7andn$="lich"goto2500
411 ifh=8andn$="gewa"goto2600
412 ifh=9andn$="tote"goto2700
413 ifn$="name"thenprint"?{home}":goto820
414 ifn$="beru"goto860
415 ifn$="fick"orn$="piss"ormid$(n$,2)="otz"orn$="arsc"orn$="porn"goto449
420 ifn$="wied"thenprint"ersehen.{home}":goto880
421 ifn$="gesu"thenprint"ndheit?{home}":goto840
430 ifh=1andn$="meis"goto2800
431 ifh=1andn$="schu"goto2810
432 ifh=1andn$="boes"goto2820
433 ifn$="boes"goto2890
440 print" {home}":gosub800:print"dazu kann{home}":sys5681:print"ich dir nichts{home}":sys5681
441 print"sagen.%{home}
442 goto400
449 print" {home}":gosub800:print"du bist ein{home}":sys5681:print"altes ferkel!%{home}":goto400
800 gosub999:print"{yel}der ";
802 ifh=1thenprint"zauber-{home}":sys5681:print"meister{home}
803 ifh>1thenprint"magier{home}
819 sys5681:print"sagt:{home}":sys5681:print"{lgrn}%";:return
820 gosub800:print"ich bin ";:ifh=1thensys5681:print"garthim";
821 ifh=2thenprint"ralph";
822 ifh=3thensys5681:print"jaanth";
823 ifh=4thensys5681:print"schmendrik";
824 ifh=5thensys5681:print"harcon";
825 ifh=6thensys5681:print"disdychus";
826 ifh=7thensys5681:print"chrolon";
827 ifh=8thenprint"vulpa";
829 ifh=9thensys5681:print"aspensor";
839 print".%{home}":goto400
840 gosub800:ifh=1thenprint"ausgezeichnet,{home}":sys5681:print"danke";
841 ifh>1thenprint"ganz gut";
859 goto839
860 print"f?{home}":gosub800
862 ifh=1thenprint"ich bin der";:sys5681:print"meister";
863 ifh>1thenprint"ich bin ein{home}":sys5681:print"zauberer";
864 print" des";:sys5681:print"weissen{home}":sys5681:print"zirkels";:goto839
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
1001 sys5681:print"beherrschen die{home}":sys5681:print"weisse magie.%{home}":goto400
1010 gosub800:ifh=1thenprint"ich lehre sie{home}":sys5681:print"an meine{home}
1011 ifh=1thensys5681:print"schüler.%{home}":goto400
1012 goto1020
1016 print" {home}":gosub800:print"ja, gold hätte{home}";:sys5681:print"ich auch gern!%{home}":goto400
1020 print"ich beherrsche{home}":sys5681:print"den mächtigen{home}
1021 sys5681:printz$(h-2)"-{home}":sys5681:print"zauberspruch.%{home}":goto400
2000 gosub800:print"dies ist ein{home}":sys5681:print"recht einfacher{home}
2001 sys5681:print"spruch, den man{home}":sys5681:print"als anfänger{home}
2002 sys5681:print"erlernt. er{home}":sys5681:print"ersetzt eine{home}
2003 sys5681:print"fackel wenn es{home}":sys5681:print"dunkel ist.{home}
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
2031 poke49302+h,1:ifh>2goto2110
2032 print"du benötigst nur{home}":sys5681:print"schwefel und{home}
2033 sys5681:print"zirbelkraut.{home}":sys5681:print"wirf es in die{home}
2034 sys5681:print"luft, konzen-{home}":sys5681:print"triere dich auf{home}
2035 sys5681:print"helligkeit und{home}":sys5681:print"sprich die ma-{home}
2036 sys5681:print"gischen worte.{home}":gosub960:print"wenn es klappt,{home}
2037 sys5681:print"erscheint über{home}":sys5681:print"deinem kopf eine{home}
2038 sys5681:print"kugel aus kaltem{home}":sys5681:print"licht, die hell{home}
2039 sys5681:print"ist wie eine{home}":sys5681:print"fackel, aber{home}
2040 sys5681:print"nicht qualmt{home}":sys5681:z=8:print"oder heiss ist.{home}
2050 gosub960:print"die beschwörung{home}":sys5681:print"kostet dich"kp(h-2);
2052 sys5681:print"astralpunkte";
2060 ifh=3thensys5681:print"und 2 weitere{home}":sys5681:print"für jeden grad{home}
2061 ifh=3thensys5681:print"der vergif-{home}":sys5681:print"tung";
2070 ifh=5thensys5681:print"und die höhe der{home}":sys5681:print"umwandlung";
2090 print".%{home}":goto400
2100 gosub800:print"es gibt viele{home}":sys5681:print"arten von giften{home}
2101 sys5681:print"und viele mög-{home}":sys5681:print"lichkeiten, ver-{home}
2102 sys5681:print"giftet zu wer-{home}":sys5681:print"den. zum glück{home}
2103 sys5681:print"entfernt dieser{home}":sys5681:print"zauber alle{home}
2104 sys5681:print"stoffe, die{home}":sys5681:print"nicht in den{home}
2105 sys5681:print"körper gehören.{home}":goto2004
2110 ifh>3goto2210
2111 print"für diesen{home}":sys5681:print"spruch ist eine{home}
2112 sys5681:print"mischung aus{home}":sys5681:print"ginseng und{home}
2113 sys5681:print"blutflechte{home}":sys5681:print"erforderlich,{home}
2114 sys5681:print"die auf die{home}":sys5681:print"haut gerieben{home}
2115 sys5681:print"wird während man{home}":sys5681:print"die zauberformel{home}
2116 sys5681:print"spricht.{home}
2117 gosub960:print"gelingt es, so{home}":sys5681:print"leuchtet kurz{home}
2118 sys5681:print"die haut auf,{home}":sys5681:print"und die vergif-{home}
2119 sys5681:print"tung ist aus-{home}":sys5681:print"kuriert.{home}":goto2050
2200 gosub800:print"gegen die hiebe{home}":sys5681:print"starker gegner{home}
2201 sys5681:print"genügen schild{home}":sys5681:print"und rüstung oft-{home}
2202 sys5681:print"mals nicht. die-{home}":sys5681:print"ser zauber ver-{home}
2203 sys5681:print"doppelt deinen{home}":sys5681:print"schutz - leider{home}
2204 sys5681:print"nicht gegen{home}":sys5681:print"magie - für{home}
2205 sys5681:print"zwölf kampfzüge.{home}":goto2004
2210 ifh>4goto2310
2211 print"man mischt{home}":sys5681:print"nur schwefel,{home}
2212 sys5681:print"ginseng und{home}":sys5681:print"blutflechte,{home}
2213 sys5681:print"streut es auf{home}":sys5681:print"die rüstung und{home}
2214 sys5681:print"ruft die zauber-{home}":sys5681:print"formel.{home}
2217 gosub960:print"wenn's klappt,{home}":sys5681:print"leuchtet ein 's'{home}
2218 sys5681:print"auf, solange der{home}":sys5681:print"zauber wirkt.{home}
2219 sys5681:print"leider kann er{home}":sys5681:print"nicht gemeinsam{home}
2220 sys5681:print"mit dem licht-{home}":sys5681:print"schildzauber{home}
2221 sys5681:print"benutzt werden.{home}":goto2050
2300 gosub800:print"wenn man schwer{home}":sys5681:print"verletzt ist und{home}
2301 sys5681:print"dem tod entgehen{home}":sys5681:print"will und genug{home}
2302 sys5681:print"astralenergie{home}":sys5681:print"hat, kann dieser{home}
2303 sys5681:print"zauber astral-{home}":sys5681:print"energie in{home}
2304 sys5681:print"lebensenergie{home}":sys5681:print"umwandeln und{home}
2305 sys5681:print"wunden heilen.{home}":goto2004
2310 ifh>5goto2410
2311 print"die heilenden{home}":sys5681:print"essenzen von{home}
2312 sys5681:print"knoblauch,{home}":sys5681:print"ginseng und{home}
2313 sys5681:print"blutflechte{home}":sys5681:print"zusammen mit den{home}
2314 sys5681:print"magischen worten{home}":sys5681:print"heilen alle{home}
2315 sys5681:print"wunden.{home}":goto2050
2400 gosub800:print"manch mächtiger{home}":sys5681:print"magier kann{home}
2401 sys5681:print"undurchdringli-{home}":sys5681:print"che energie-{home}
2402 sys5681:print"felder erzeugen,{home}":sys5681:print"z.b. wie unser{home}
2403 sys5681:print"meister. dieser{home}":sys5681:print"zauber kann{home}
2404 sys5681:print"solche barrieren{home}":sys5681:print"zerschmettern{home}
2405 sys5681:print"und auflösen.{home}":goto2004
2410 ifh>6goto2510
2411 print"der spruch ist{home}":sys5681:print"schwierig. man{home}
2412 sys5681:print"braucht blut-{home}":sys5681:print"flechte, toten-{home}
2413 sys5681:print"blume und die{home}":sys5681:print"seltene alraune-{home}
2414 sys5681:print"wurzel. sprich{home}":sys5681:print"die formel und{home}
2415 sys5681:print"wirf alles in{home}":sys5681:print"das feld.{home}
2416 gosub960:print"sind die mächte{home}":sys5681:print"gnädig, wird{home}
2417 sys5681:print"sich das feld{home}":sys5681:print"langsam auflö-{home}
2418 sys5681:print"sen.{home}":goto2050
2500 gosub800:print"ist man mit{home}":sys5681:print"feindlicher{home}
2501 sys5681:print"magie konfron-{home}":sys5681:print"tiert, kann{home}
2502 sys5681:print"man sich mit{home}":sys5681:print"diesem zauber{home}
2503 sys5681:print"vor jedweder{home}":sys5681:print"magie für{home}
2504 sys5681:print"zwölf kampfzüge{home}":sys5681:print"sehr wirksam{home}
2505 sys5681:print"schützen.{home}":goto2004
2510 ifh>7goto2610
2511 print"die kombination{home}":sys5681:print"von schwefel,{home}
2512 sys5681:print"zirbelkraut{home}":sys5681:print"und blutflechte{home}
2513 sys5681:print"mit der zauber-{home}":sys5681:print"formel über dich{home}
2514 sys5681:print"gestreut, gibt{home}":sys5681:print"dir schutz.{home}
2517 gosub960:print"wenn's gelingt,{home}":sys5681:print"leuchtet ein 'l'{home}
2518 sys5681:print"auf, solange der{home}":sys5681:print"zauber wirkt.{home}
2519 sys5681:print"leider kann er{home}":sys5681:print"nicht gemeinsam{home}
2520 sys5681:print"mit dem schutz-{home}":sys5681:print"schildzauber{home}
2521 sys5681:print"benutzt werden.{home}":goto2050
2600 gosub800:print"dieser schwere{home}":sys5681:print"zauberspruch{home}
2601 sys5681:print"erhöht deine{home}":sys5681:print"natürliche bewe-{home}
2602 sys5681:print"gungsgeschwin-{home}":sys5681:print"digkeit, und{home}
2603 sys5681:print"du kannst dich{home}":sys5681:print"im kampf für{home}
2604 sys5681:print"12 züge doppelt{home}":sys5681:print"so schnell{home}
2605 sys5681:print"bewegen.{home}":goto2004
2610 ifh=9goto2710
2611 print"mische knob-{home}":sys5681:print"lauch, blut-{home}
2612 sys5681:print"flechte und{home}":sys5681:print"totenblume,{home}
2613 sys5681:print"reibe es auf{home}":sys5681:print"arme und beine{home}
2614 sys5681:print"und rufe die{home}":sys5681:print"zauberformel.{home}
2617 gosub960:print"klappt alles,{home}":sys5681:print"leuchtet ein 'g'{home}
2618 sys5681:print"auf, solange der{home}":sys5681:print"zauber wirkt.{home}":goto2050
2700 gosub800:print"untote sind{home}":sys5681:print"in allen ihren{home}
2701 sys5681:print"erscheinungs-{home}":sys5681:print"formen gefährli-{home}
2702 sys5681:print"che gegner. aber{home}":sys5681:print"das licht der{home}
2703 sys5681:print"sonne zerstört{home}":sys5681:print"sie. da hier{home}
2704 sys5681:print"niemals die{home}":sys5681:print"sonne scheint,{home}
2705 sys5681:print"hilft die magie.{home}":goto2004
2710 print"eine mit den{home}":sys5681:print"magischen worten{home}
2712 sys5681:print"in die luft ge-{home}":sys5681:print"worfene mixtur{home}
2713 sys5681:print"aus knoblauch,{home}":sys5681:print"totenblume und{home}
2714 sys5681:print"der seltenen{home}":sys5681:print"alraunewurzel{home}
2715 sys5681:print"ist notwendig zu{home}":sys5681:print"diesem zauber.{home}
2716 gosub960:print"erhören dich die{home}":sys5681:print"guten mächte, so{home}
2717 sys5681:print"wird für einen{home}":sys5681:print"moment die wol-{home}
2718 sys5681:print"kendecke über{home}":sys5681:print"dir aufreissen,{home}
2719 sys5681:print"und die sonne{home}":sys5681:print"vernichtet alle{home}
2720 sys5681:print"untoten und{home}":sys5681:print"steintrolle.{home}":goto2050
2800 print"ter{home}":gosub800:print"der weissen{home}":sys5681:print"magie.{home}":goto400
2810 print"{left}üler{home}":gosub800:print"sie können sie{home}":sys5681:print"an dich lehren.%{home}":goto400
2820 gosub800:print"der name des{home}":sys5681:print"bösen, der so{home}
2821 sys5681:print"schrecklich ist,{home}":sys5681:print"dass er jeden{home}
2822 sys5681:print"verbrennt, der{home}":sys5681:print"ihn ausspricht{home}
2823 sys5681:print"oder schreibt,{home}":sys5681:print"ist zugleich die{home}
2824 sys5681:print"mächtigste waffe{home}":sys5681:print"gegen das böse{home}
2826 sys5681:print"selbst.{home}":gosub960:print"ich kenne ihn{home}
2828 sys5681:print"nicht, und mein{home}":sys5681:print"kollege vom{home}
2830 sys5681:print"schwarzen zirkel{home}":sys5681:print"ist durch ihn{home}
2832 sys5681:print"getötet worden.{home}":gosub960:print"aber du kannst{home}
2834 sys5681:print"ihn in erfahrung{home}":sys5681:print"bringen. du{home}
2836 sys5681:print"musst ihn im{home}":sys5681:print"angesicht des{home}
2838 sys5681:print"bösen rufen,{home}":sys5681:print"während du den{home}
2840 sys5681:print"kristall heilst.{home}":gosub960:print"aber rufe ihn{home}
2842 sys5681:print"{wht}rückwärts{lgrn}!{home}":gosub960
2844 sys5681:print"dies heilt den{home}":sys5681:print"kristall end-{home}
2846 sys5681:print"gültig. der{home}":sys5681:print"kristall wird{home}
2848 sys5681:print"das gleichge-{home}":sys5681:print"wicht unserer{home}
2850 sys5681:print"welt wiederher-{home}":sys5681:print"stellen.{home}
2852 gosub960:print"dann wird das{home}":sys5681:print"böse vernichtet,{home}
2854 sys5681:print"und für uns wird{home}":sys5681:print"wieder die sonne{home}
2856 sys5681:print"aufgehen.{home}":gosub960:print"und für dich ist{home}
2858 sys5681:print"dann kein platz{home}":sys5681:print"mehr im gleich-{home}
2860 sys5681:print"gewicht, und du{home}":sys5681:print"wirst wohl nach{home}
2862 sys5681:print"hause zurückge-{home}":sys5681:print"schleudert.%{home}":goto400
2890 print"e{home}":gosub800:print"frage unseren{home}":sys5681:print"meister danach.%{home}":goto400
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
3020 print"{cyn}es gelingt!{home}":fori=6262to6411:ifpeek(i)=.thenpokei,11
3022 next:poke53281,14:sys6041:pokes+5,10:pokes+4,33
3024 fori=5to50step5:forj=itoi+10:pokes+1,j:nextj,i:poke53281,0
3026 fori=0to500:next:poke51200,15:sys4361:fori=0to500:next:poke51200,12:sys4361
3028 fori=0to500:next:poke51200,11:sys4361:fori=0to500:next:poke51200,0:sys4361:goto100
3300 print"{left}  {home}":sys5681:print"{yel}möchtest du{home}":sys5681:print"den tempel{home}
3301 sys5681:print"verlassen?";:gosub970:ifu$="n"theny=y-1:goto100
6000 sys5681:print"{lred}du verlässt{home}":sys5681:print"den tempel.{home}
6010 fori=0to2e3:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
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
50000 datamagisch. licht,8,2,50,entgiftung,9,5,100,schutzschild,9,10,100
50001 datawunderheilung,10,10,150,bannbrecher,10,30,300,lichtschild,11,15,150
50002 datagewandheit,12,20,200,totenbann,13,20,250
50100 data-35,6400,1,6800,35,6820,-1,6990
