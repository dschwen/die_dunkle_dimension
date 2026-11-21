10 poke53265,11:gosub11000:gosub5000:ifkgoto5200
20 y=10:x=5:dimm(2):fori=0to2:m(i)=100:next:poke53264,0:goto5300
100 z=0:sys5440:sys5681:print"{wht}@G{left}";
110 z=z+1:ifz>600goto200
112 getu$:ifu$=""goto110
120 ifu$="{up}"goto210
122 ifu$="{down}"goto212
124 ifu$="{left}"goto214
126 ifu$="{rght}"goto216
128 ifu$="a"goto300
130 ifu$=" "goto200
136 ifu$="w"thengosub3000:goto2000
140 ifu$="z"thengosub4000:goto2000
199 print"wie bitte..?{home}":goto2000
200 print"warten...{home}":goto2000
210 print"norden{home}":ify=9goto220
211 y=9:printleft$(d$,20)spc(1+x+x)"{wht}{rvon}yz{down}{left}{left}äö{down}{left}{left}";:goto218
212 print"süden{home}":ify>9orx=2orx=7goto222
213 y=10:printleft$(d$,22)spc(1+x+x)"{wht}{rvon}yz{down}{left}{left}äö{up}{up}{up}{left}{left}";:goto218
214 print"westen{home}":ifx<y-6goto220
215 x=x-1:printleft$(d$,2+y+y)spc(1+x+x)"{wht}{rvon}yz{down}{left}{left}äö{up}";:goto218
216 print"osten{home}":ifx>15-ygoto220
217 x=x+1:printleft$(d$,2+y+y)spc(1+x+x)"{wht}{rvon}yz{down}{left}{left}äö{up}{left}{left}{left}{left}";
218 print"{rvof}{gry2}RS{down}{left}{left}TU{home}":gosub30010:goto2000
220 sys5681:print"{lred}blockiert!{home}":sys5681:goto100
222 ify>9goto1800
223 goto220
300 print"attacke{home}":sys5681:ifwa=18goto310
301 print"{lred}mit dieser waffe{home}":sys5681:print"kannst du den{home}
302 sys5681:print"riesenlindwurm{home}":sys5681:print"nicht verletzen!{home}":goto100
310 h=985+y*80+x+x:z=peek(h+s):i=peek(h):j=peek(h+1):k=peek(h+40):l=peek(h+41)
312 printleft$(d$,y+y)spc(1+x+x)"{wht}{rvon}ij{down}{left}{left}kl{up}{left}{left}{rvof}";
314 gosub30050:zz=fnr(20):ifzz<=atgoto320
315 sys5681:print"{up}{yel}verfehlt!{home}":goto318
316 sys5681:print"{up}{yel}daneben!{home}
318 pokeh+s,z:pokeh+s+1,z:pokeh+s+40,z:pokeh+s+41,z:pokeh,i:pokeh+1,j
319 pokeh+40,k:pokeh+41,l:goto2000
320 ify>9or(x<>2andx<>4andx<>6)goto316
322 k=x/2-1:ifm(k)=.thensys5681:print"{up}{yel}daneben"d$spc(x+x+1)"{up}{up}{up}{up}{up}{up}{gry2}U{red}Y{up}{left}{left}VW":goto2000
324 ifzz<3orfnr(20)>10goto330
326 print"{pur}{$b0}{$ae}{down}{left}{left}{$ad}{$bd}{up}{left}{left}";:sys5681:print"{up}drache pariert{home}":gosub30052
328 printleft$(d$,18)spc(1+x+x)"{grn}{rvon}ef{down}{left}{left}gh":goto2000
330 print"{lred}{rvon}uv{down}{left}{left}wx":gosub30054:sys5681:ifzz>2thenprint"{lgrn}{up}getroffen!
331 ifzz=2thenprint"{cyn}{up}guter treffer!
332 ifzz=1thenprint"{cyn}{up}glückstreffer!
334 z=fnr(7)+9:ifzz>1thenz=z-7
336 m(k)=m(k)-z:sys5681:print"{lgrn}drachenkopf ist{home}
337 printleft$(d$,18)spc(1+x+x);:ifm(k)<1goto350
340 print"{grn}{rvon}ef{down}{left}{left}gh{lgrn}":sys5681:ifm(k)>80thenprint"kaum angekratzt.{home}":goto2000
341 ifm(k)>60thenprint"leicht verletzt.{home}":goto2000
342 ifm(k)>40thenprint"verwundet.{home}":goto2000
343 ifm(k)>20thenprint"schwer verletzt.{home}":goto2000
344 print"kaum am leben.{home}":goto2000
350 m(k)=.:print"{red}{rvon}uv{down}{left}{left}wx{up}{left}{left}":sys5681:print"{lred}abgeschlagen!{red}{home}":gosub30054
352 forj=0to200:next:printleft$(d$,18)spc(x+x+1)"{rvof}VW{down}{left}Y{left}{left}{gry2}U":goto2000
899 end
900 sys5681
901 poke56295,1:poke2023,71
902 poke198,0:wait198,1:poke198,0:poke2023,32:sys5681:return
1800 printd$spc(x+x+1)"{up}{up}{gry2}TU{up}{left}{left}RS{home}
1801 sys6041:pokes+5,10:pokes+4,33:fori=5to50:pokes+1,i:next
1802 sys5681:sys5681:print"-- du fliehst --{home}":sys5681:sys5681
1820 i=0:print"{yel}für deine{home}":sys5681:print"feigheit werden{home}
1822 sys5681:print"dir 200 punkte{home}":sys5681:print"abgezogen!{home}
1830 sys5681:ef=ef-200:ifef<1thenef=0
1840 gosub13150:gosub901:poke2,0:goto6200
2000 poke198,.:sys5681:sys5681:ifm(0)+m(1)+m(2)=.goto6000
2005 iffnr(20)<16goto2020
2010 sys6041:pokes+5,197:print"{cyn}der drache holt{home}":sys5681:print"tief luft...{home}
2012 pokes+4,129:fori=100to200:pokes+1,i/10:next:goto100
2020 z=0:fori=0to2:ifm(i)>.thenz=z+2^i
2022 next:ifz=.goto6000
2024 poke829,0:sys6041:pokes+5,144+12:pokes+12,128+11:sys6336
2026 print"{lred}der drache speit{home}":sys5681:print"feuer!{home}":pokes+1,7:pokes+8,4
2028 pokes+4,129:pokes+11,129:pokev+21,z:gosub2300:pokev+23,7:pokev+33,2:pokev+32,2
2030 gosub2300:pokev+33,10:pokev+32,10::gosub2300:pokev+33,2:pokev+32,2:gosub2300
2032 pokev+33,0:pokev+32,.:pokev+23,.:gosub2300:pokev+21,0:forj=0to60:next
2040 zz=1:ifz=3orz=6orz=5thenzz=2
2042 ifz=7thenzz=3
2044 k=0:fori=1tozz:k=k+fnr(5)+3:next:sys5681:sys5681:print"{lgrn}du erleidest"k;
2046 poke829,1:sys5681:print"schadenspunkte!{home}":hp=hp-k:ifhp<1thenhp=0
2050 poke49231,hp/256:poke49230,hp-256*peek(49231)
2052 ifhp=.thenprintleft$(d$,2+y+y)spc(1+x+x)"{gry3}{rvon}ü^{down}{left}{left}_ ":gosub10000:goto13000
2054 gosub10000:goto100
2300 forj=0to60:next:sys6348:forj=0to60:next:sys6336
2310 forj=0to60:next:sys6360:forj=0to60:next:sys6336:return
3000 print"waffe benutzen{home}":sys5681
3040 ifpeek(49265)=.goto3050
3042 print"{yel}zauberschwinge{home}":sys5681:print"bereit!{home}":poke49246,18:wa=18
3044 sh=0:poke49167,0:return
3050 print"{lred}die einzige{home}":sys5681:print"waffe, die dir{home}":sys5681:print"jetzt helfen{home}
3052 sys5681:print"könnte, hast du{home}":sys5681:print"noch nicht!{home}":return
4000 print"zauberspruch{home}":sys5681:print"{lred}die magie des{home}
4010 sys5681:print"riesenlindwurms{home}":sys5681:print"absorbiert jeden{home}
4020 sys5681:print"zauber!{home}":return
5000 print"{home}{down}{rght}  {gry3}{rvon}qrqrqrqrqrqrqrqrqr{rvof}
5001 print"{rght}  {gry3}{rvon}ststststststststst{rvof}
5002 print"{up}{rght}{gry3}{rvon}qrqr{gry2}mn{grn}ab!"chr$(34)"ab!"chr$(34)"{gry2}{rvof}RS{rvon}mn{gry3}qrqr
5003 print"{rght}{gry3}{rvon}stst{gry2}op{grn}cd#$cd#${rvof}{gry2}TU{rvon}op{gry3}stst
5004 print"{up}{rght}{gry3}{rvon}qr{gry2}mn{grn}%&/0)*/034{rvof}{gry2}RSRS{rvon}mn{gry3}qr
5005 print"{rght}{rvon}{gry3}st{gry2}op{grn}'(12+(1256{rvof}{gry2}TUTU{rvon}op{gry3}st
5006 print"{up}{rght}{gry3}{rvon}qr{rvof}{gry2}RS{rvon}{grn}78LI>?LMPQTUY{rvof}{gry2}SRS{gry3}{rvon}qr
5007 print"{rght}{gry3}{rvon}st{gry2}{rvof}TU{rvon}{grn}9:JK{$c0}ANORS{rvof};;{rvon}{$db}{$dc}{rvof}{gry2}TU{rvon}{gry3}st
5008 print"{up}{rght}{rvon}{gry3}qr{rvof}{gry2}R{rvon}{grn}{sspc}{$a3}{$a4}{$a7}{$a8}{$ab}{rvof};{rvon}{$af}{rvof};{rvon}{$b5}{$b6}{$b9}{rvof};;{rvon}{$bd}V{gry2}{rvof}S{rvon}{gry3}qr
5009 print"{rght}{rvon}{gry3}st{grn}{$a1}{$a2}{$a5}{$a6}{$a9}{rvof};{rvon}{$ad}{$ae}{$b1}{$b2}{$b7}{$b8}{$bb}{$bc}{$be}{$bf}WX{gry3}st
5010 print"{up}{rght}{gry3}{rvon}qr{grn}-.{rvof};{rvon}{$aa}{$df}{$b3}{rvof};{rvon}F{$dd}@{rvof}{gry2}RS{cyn}{$a7}{$a8}{gry2}RS{grn}{$be}{$bf}{gry3}{rvon}qr
5011 print"{rght}{rvon}{gry3}st{grn};<{$ac}{$b0}{$b4}{$ba}GH,{rvof}{gry2}UTU{cyn}{$a9}{$aa}{gry2}TU{grn}{$bb}{$bc}{rvon}{gry3}st
5012 print"{up}{rght}{rvon}{gry3}qr{rvof}{gry2}R{rvon}{grn}B{rvof}{$ba}{rvon}={rvof}{$b9}{$b4}&{$a2}{gry2}RSRSRSRS{grn}{$ff}{$df}{rvon}{gry3}qr
5013 print"{rght}{rvon}{gry3}st{rvof}{gry2}T{rvon}{grn}DE{rvof}{gry2}U{grn}{$b8}{$b7}{$b3}{$a3}{$a5}{$a6}{gry2}TUTUTU{grn}{sspc}{$a1}{gry3}{rvon}st
5014 print"{up}{rght}{rvon}{gry3}qr{rvof}{gry2}R{rvon}{grn}=C{rvof}{gry2}SR{grn}{$b5}${$a4}{$ac}{$af}{rvon}V{rvof}{gry2}SRSRS{grn}Z{$db}{rvon}{gry3}qr
5015 print"{rvon}{gry3}{rght}st{rvof}{gry2}TU{rvon}{grn}Z{$dd}{rvof}{gry2}TU{rvon}{grn}Z{$dd}{rvof}{gry2}TU{rvon}{grn}Z{$dd}{rvof}{gry2}TUTUTU{rvon}{gry3}st
5016 print"{up}{rght}{rvon}{gry3}qr{rvof}{gry2}RS{grn}{rvon}ef{rvof}{gry2}RS{rvon}{grn}ef{rvof}{gry2}RS{rvon}{grn}ef{rvof}{gry2}RS{rvon}mnmn{gry3}qr
5017 print"{rght}{rvon}{gry3}st{rvof}{gry2}TU{grn}{rvon}gh{rvof}{gry2}TU{rvon}{grn}gh{rvof}{gry2}TU{rvon}{grn}gh{rvof}{gry2}TU{rvon}opop{gry3}st
5018 print"{up}{rght}{rvon}{gry3}qr{gry2}mn{rvof}RSRSRSRSRSRS{rvon}mn{gry3}qrqr
5019 print"{rght}{rvon}{gry3}st{gry2}op{rvof}TUTUTUTUTUTU{rvon}op{gry3}stst
5020 print"{up}{rght}{rvon}{gry3}qrqr{gry2}mn{rvof}RSRS{wht}{rvon}yz{rvof}{gry2}RS{rvon}{gry3}qrqrqr
5021 print"{rght}{rvon}{gry3}stst{gry2}op{rvof}TUTU{rvon}{wht}äö{rvof}{gry2}TU{rvon}{gry3}ststst{home}
5030 k=peek(49358):ifk=.goto5090
5040 printleft$(d$,18)"{rght}{rght}{rght}";:fori=1to3:print"{rght}{rght}{red}VW{down}{left}{left}{gry2}U{red}Y{up}";:next
5050 print"{up}{up}{up}{up}{up}{cyn}{$dc}{$dd}{up}{left}{left}{$dc}{$dd}
5090 poke53265,27:return
5100 poke2,0:sys5681:print"{yel}du verlässt die{home}":sys5681:print"drachenhöhle.{home}
5102 fori=0to2e3:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
5104 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:new
5200 x=5:sys5681:print"{lgrn}hier gibt es für{home}":sys5681:print"dich nichts mehr{home}
5210 sys5681:print"zu tun. ausser-{home}":sys5681:print"dem stinkt der{home}
5220 sys5681:print"kadaver des{home}":sys5681:print"riesenlindwurms{home}
5221 sys5681:print"entsetzlich.{home}":sys5681:print"eilig gehst du{home}
5222 sys5681:print"wieder hinaus.{home}
5224 gosub900:printd$spc(1+x+x)"{up}{up}{gry2}TU{up}{left}{left}RS":gosub30010:poke2,0:goto6200
5240 pokes+5,11:pokes+6,6:pokes+12,9
5242 pokes+4,33:pokes+11,33:forj=0toi:next:return
5300 sys5681:print"{lgrn}du betrittst die{home}":sys5681:print"höhle des fürch-{home}
5302 wa=peek(49246):sys5681:print"terlichen rie-{home}":sys5681:print"senlindwurms.{home}
5310 sys5681:i=400:sys6041:pokes+1,8:pokes,180:pokes+8,11:pokes+7,158:gosub5240
5311 i=200:sys6041:pokes+1,9:pokes,196:pokes+8,13:pokes+7,10:gosub5240
5312 sys6041:pokes+1,8:pokes,180:pokes+8,11:pokes+7,158:gosub5240
5313 i=400:sys6041:pokes+1,8:pokes,55:pokes+8,10:pokes+7,247:gosub5240
5314 i=200:sys6041:pokes+1,7:pokes,81:pokes+8,9:pokes+7,196:gosub5240
5315 sys6041:pokes+1,8:pokes,55:pokes+8,10:pokes+7,247:gosub5240
5316 i=400:sys6041:pokes+1,8:pokes,180:pokes+8,11:pokes+7,158:gosub5240
5317 i=200:sys6041:pokes+1,9:pokes,196:pokes+8,13:pokes+7,10:gosub5240
5318 sys6041:pokes+1,8:pokes,180:pokes+8,11:pokes+7,158:gosub5240
5319 i=400:sys6041:pokes+1,8:pokes,55:pokes+8,10:pokes+7,247:gosub5240:gosub901
5320 sys5681:print"das schreckliche{home}":sys5681:print"ungeheuer be-{home}
5321 sys5681:print"wacht die prin-{home}":sys5681:print"zessin, die{home}
5322 sys5681:print"zwischen zwei{home}":sys5681:print"pfosten angeket-{home}
5323 sys5681:print"tet ist.{home}":gosub900:sys5681:print"sie blickt dir{home}
5324 sys5681:print"entgegen, rüt-{home}":sys5681:print"telt an ihren{home}
5325 sys5681:print"ketten und ruft{home}":sys5681:print"flehend:{home}
5326 sys5681:print"%bitte hilf mir.{home}":sys5681:print"töte den drachen{home}
5327 sys5681:print"und rette mich!%{home}":gosub900:sys5681:print"der riesenlind-{home}
5328 sys5681:print"wurm hebt seine{home}":sys5681:print"drei köpfe und{home}
5329 sys5681:print"faucht dich böse{home}":sys5681:print"an...{home}
5330 gosub900:ifrs=6goto5340
5331 sys5681:print"mit dem feuer-{home}":sys5681:print"atem des drachen{home}
5332 sys5681:print"schlägt dir eine{home}":sys5681:print"ungeheure hitze{home}
5333 sys5681:print"entgegen, die{home}":sys5681:print"dir deine klei-{home}
5334 sys5681:print"dung, deine haut{home}":sys5681:print"und deine haare{home}
5335 sys5681:print"versengt.{home}":gosub900:sys5681:print"die rüstung, die{home}
5336 sys5681:print"du trägst, kann{home}":sys5681:print"dich nicht dage-{home}
5337 sys5681:print"gen schützen. du{home}":sys5681:print"wirst wieder{home}
5338 sys5681:print"zurückgetrieben.{home}":x=5:goto5224
5340 sys5681:print"der drache be-{home}":sys5681:print"nutzt im kampf{home}
5341 sys5681:print"nur seine flam-{home}":sys5681:print"men. deine magi-{home}
5342 sys5681:print"sche rüstung{home}":sys5681:print"schützt dich nur{home}
5347 sys5681:print"leidlich.";:ifwa<18thengosub900:goto100
5348 print" du um-{home}":sys5681:print"fasst den griff{home}
5349 sys5681:print"deiner schwinge{home}":sys5681:print"fest mit beiden{home}
5350 sys5681:print"händen...{home}":gosub900:goto100
6000 print"{wht} --- sieg! ---{home}":sys5681:sys5681:print"{yel}der drache ist{home}
6001 sys5681:print"getötet!{home}
6002 i=400:sys6041:pokes+1,17:pokes,103:pokes+8,21:pokes+7,237:gosub5240
6003 i=200:sys6041:pokes+1,19:pokes,137:pokes+8,23:pokes+7,59:gosub5240
6004 i=400:sys6041:pokes+1,17:pokes,103:pokes+8,21:pokes+7,237:gosub5240
6005 i=600:sys6041:pokes+1,21:pokes,237:pokes+8,26:pokes+7,20:gosub5240
6006 i=400:sys6041:pokes+1,17:pokes,103:pokes+8,21:pokes+7,237:gosub5240
6007 i=200:sys6041:pokes+1,19:pokes,137:pokes+8,23:pokes+7,59:gosub5240
6008 sys6041:pokes+1,17:pokes,103:pokes+8,21:pokes+7,237:gosub5240
6009 i=400:sys6041:pokes+1,23:pokes,59:pokes+8,29:pokes+7,69:gosub5240
6010 i=200:sys6041:pokes+1,21:pokes,237:pokes+8,26:pokes+7,20:gosub5240
6011 sys6041:pokes+1,19:pokes,137:pokes+8,23:pokes+7,59:gosub5240
6012 i=400:sys6041:pokes+1,16:pokes,109:pokes+8,19:pokes+7,137:gosub5240
6013 i=200:sys6041:pokes+1,17:pokes,103:pokes+8,21:pokes+7,237:gosub5240
6014 i=600:sys6041:pokes+1,16:pokes,109:pokes+8,19:pokes+7,137:gosub5240
6015 sys6041:pokes+1,19:pokes,137:pokes+8,23:pokes+7,59:gosub5240
6016 i=200:sys6041:pokes+1,21:pokes,237:pokes+8,26:pokes+7,20:gosub5240
6017 sys6041:pokes+1,16:pokes,109:pokes+8,19:pokes+7,137:gosub5240
6018 i=600:sys6041:pokes+1,17:pokes,103:pokes+8,21:pokes+7,237:gosub5240
6020 gosub13100:fori=0to2e3:next:sys5681:sys5681:print"{lgrn}du kannst jetzt
6021 sys5681:print"die prinzessin{home}":sys5681:print"befreien!{home}
6022 printleft$(d$,20)spc(1+x+x);
6024 ifx<7thenprint"{rvof}{gry2}RS{down}{left}{left}TU{wht}{rvon}äö{up}{left}{left}yz{left}{left}";:gosub30010:x=x+1:forj=0to300:next:goto6024
6026 fori=0to2:print"{gry2}{rvof}{down}TU{up}{left}{left}RS{up}{left}{left}{wht}{rvon}äö{up}{left}{left}yz{left}{left}";:gosub30010:forj=0to300:nextj,i
6028 print"{left}{left}yz{down}{left}{left}äö{gry2}{rvof}TU{up}{left}{left}RS{left}{left}{left}{left}";:gosub30010:forj=0to300:next
6030 print"{gry2}{rvof}{down}TU{up}{left}{left}RS{up}{left}{left}{wht}{rvon}äö{up}{left}{left}yz";:gosub30010:forj=0to800:next
6032 print"{rvof}{cyn}J{down}{left}L{left}{left}{left}{up}";:gosub30052:forj=0to500:next
6034 print"{rvof}{gry2}RS{down}{left}{left}TU{down}{left}{left}{rvon}{wht}yz{left}{left}{down}äö{left}{left}{up}";:gosub30010:forj=0to300:next
6036 fori=0to1:print"{rvof}{gry2}RS{down}{left}{left}TU{wht}{rvon}äö{up}{left}{left}yz{left}{left}";:gosub30010:forj=0to300:nextj,i
6038 print"{gry2}{rvof}{down}TU{up}{left}{left}RS{up}{left}{left}{wht}{rvon}äö{up}{left}{left}yz{left}{left}{left}";:gosub30010:forj=0to800:next
6040 print"{rvof}{cyn}K{down}{left}M{up}";:gosub30052:forj=0to500:next
6042 print"{rvof}{gry2}RS{down}{left}{left}TU{down}{left}{left}{rvon}{wht}yz{left}{left}{down}äö{left}{left}{up}";:gosub30010:forj=0to600:next
6044 print"{left}{left}{up}{up}{cyn}{rvof}{$dc}{$dd}{down}{left}{left}{$dc}{$dd}{down}{left}{left}<={down}{left}{left}>I":gosub30010:fori=0to500:next
6050 sys5681:sys5681:print"{lgrn}die prinzessin{home}":sys5681:print"fällt dir freu-{home}
6051 sys5681:print"destrahlend um{home}":sys5681:print"den hals und{home}
6052 sys5681:print"sagt: %ich danke{home}":sys5681:print"dir! du hast{home}
6053 sys5681:print"mich errettet.{home}":gosub900:print"wie kommt es{home}
6054 sys5681:print"nur, dass es dir{home}":sys5681:print"gelungen ist,{home}
6055 sys5681:print"den schreckli-{home}":sys5681:print"chen drachen zu{home}
6056 sys5681:print"töten? die{home}":sys5681:print"besten soldaten{home}
6057 sys5681:print"meines vaters{home}":sys5681:print"haben versagt.%{home}
6058 gosub900:print"du erzählst ihr{home}":sys5681:print"deine geschichte{home}
6059 sys5681:print"und das, was du{home}":sys5681:print"bisher weisst{home}
6060 sys5681:print"und was du vor-{home}":sys5681:print"hast. sie blickt{home}
6061 sys5681:print"dich staunend an{home}":sys5681:print"und sagt dann:{home}
6062 gosub900:print"%vielleicht kann{home}":sys5681:print"ich dir helfen.{home}
6063 sys5681:print"der lindwurm{home}":sys5681:print"sprach oft durch{home}
6064 sys5681:print"seine gedanken{home}":sys5681:print"zu mir, teils um{home}
6065 sys5681:print"sich an meiner{home}":sys5681:print"angst zu weiden,{home}
6066 sys5681:print"teils aus reiner{home}":sys5681:print"langeweile.{home}
6067 gosub900:print"einmal erzählte{home}":sys5681:print"er mir, dass er{home}
6068 sys5681:print"einen wunderbar{home}":sys5681:print"funkelnden kris-{home}
6069 sys5681:print"tallsplitter ge-{home}":sys5681:print"funden habe, der{home}
6070 sys5681:print"im gras lag.{home}":gosub900:print"da drachen alles{home}
6071 sys5681:print"sammeln, was{home}":sys5681:print"glänzt und fun-{home}
6072 sys5681:print"kelt, hat er{home}":sys5681:print"ihn mitgenommen.{home}
6073 gosub900:print"er hat ihn in{home}":sys5681:print"seine schatz-{home}
6074 sys5681:print"höhle gebracht.{home}":sys5681:print"er bewahrt sei-{home}
6075 sys5681:print"ne schätze näm-{home}":sys5681:print"lich nicht hier{home}
6076 sys5681:print"auf, sondern er{home}":sys5681:print"versteckt sie in{home}
6077 sys5681:print"einer höhle.{home}":gosub900:print"die höhle liegt{home}
6078 sys5681:print"in einer tiefen{home}":sys5681:print"schlucht am süd-{home}
6079 sys5681:print"zipfel des kon-{home}":sys5681:print"tinentes. es{home}
6080 sys5681:print"soll ein tiefes{home}":sys5681:print"labyrinth sein,{home}
6081 sys5681:print"das von monstern{home}":sys5681:print"bevölkert ist.{home}
6082 gosub900:print"an seiner tief-{home}":sys5681:print"sten stelle ist{home}
6083 sys5681:print"eine geheimtür{home}":sys5681:print"versteckt. diese{home}
6084 sys5681:print"tür hat magische{home}":sys5681:print"eigenschaften.{home}
6085 gosub900:print"nur der drache{home}":sys5681:print"konnte sie öff-{home}
6086 sys5681:print"nen. kam er in{home}":sys5681:print"ihre nähe, er-{home}
6087 sys5681:print"schien ein{home}":sys5681:print"schlüsselloch.{home}
6088 gosub900:print"vielleicht re-{home}":sys5681:print"agiert sie ja{home}
6089 sys5681:print"auch auf deine{home}":sys5681:print"magische rüstung{home}
6090 sys5681:print"aus drachen-{home}":sys5681:print"schuppen.{home}
6091 gosub900:print"jedenfalls öff-{home}":sys5681:print"nete sich die{home}
6092 sys5681:print"tür sobald das{home}":sys5681:print"untier eine sei-{home}
6093 sys5681:print"ner krallen in{home}":sys5681:print"das schlüssel-{home}
6094 sys5681:print"loch schob.{home}":gosub900:print"warte mal einen{home}
6095 sys5681:print"moment, mir{home}":sys5681:print"kommt da eine{home}
6096 sys5681:print"idee...%{home}":gosub900:fori=0to800:next
6100 printleft$(d$,14)spc(13)"{cyn}<={down}{left}{left}>I{gry2}TU{up}{left}{left}RS";:gosub30010:fori=0to300:next
6101 print"{down}{left}{left}{left}{left}TU{up}{left}{left}{cyn}>I{up}{left}{left}<=";:gosub30010:fori=0to300:next
6102 print"{left}{left}{left}<={down}{left}{left}>I{gry2}U{up}{left}S":gosub30010:fori=0to500:next
6103 sys5681:print"{lgrn}die prinzessin{home}":sys5681:print"macht sich an{home}
6104 sys5681:print"der pranke des{home}":sys5681:print"drachen zu{home}
6105 sys5681:print"schaffen und{home}":sys5681:print"trennt eine{home}
6106 sys5681:print"seiner krallen{home}":sys5681:print"ab...":gosub900:fori=1to500:next
6107 printleft$(d$,13)spc(12)"{gry2}U{down}{left}S{cyn}>I{up}{left}{left}<=";:gosub30010:fori=0to300:next
6108 print"{left}{left}{gry2}TU{down}{left}{left}{cyn}<={down}{left}{left}>I";:gosub30010:fori=0to300:next
6109 print"{left}{left}{gry2}TU{up}{left}{left}RS{cyn}<={down}{left}{left}>I";:gosub30010:fori=0to300:next
6110 sys5681:print"{lgrn}die prinzessin{home}":sys5681:print"reicht dir die{home}
6111 sys5681:print"drachenkralle{home}":sys5681:print"und sagt:{home}
6112 sys5681:print"%hier, benutze{home}":sys5681:print"das als schlüs-{home}
6113 sys5681:print"sel für die{home}":sys5681:print"magische tür.{home}
6114 gosub900:print"ich kehre nun{home}":sys5681:print"zurück ins{home}
6115 sys5681:print"schloss. ich{home}":sys5681:print"leihe mir dazu{home}
6116 sys5681:print"die feuerechse{home}":sys5681:print"aus. keine{home}
6117 sys5681:print"angst, ich{home}":sys5681:print"schicke sie wie-{home}
6118 sys5681:print"der hierher{home}":sys5681:print"zurück.{home}
6119 gosub900:print"komm doch auch{home}":sys5681:print"mal zum schloss.{home}
6120 sys5681:print"mein vater, der{home}":sys5681:print"könig, wird dich{home}
6121 sys5681:print"für meine ret-{home}":sys5681:print"tung sicher{home}
6122 sys5681:print"reich belohnen.{home}":gosub900:print"und dann gehe{home}
6123 sys5681:print"den splitter{home}":sys5681:print"holen und rette{home}
6124 sys5681:print"unsere welt.{home}":sys5681:print"viel glück!%{home}
6126 gosub900:printleft$(d$,14)spc(15);:fori=0to500:next
6130 fori=1to3:print"{gry2}RS{down}{left}{left}TU{down}{left}{left}{cyn}<={down}{left}{left}>I{left}{left}{up}";:gosub30010:forj=0to300:nextj,i
6132 print"{left}{left}<={down}{left}{left}>I{gry2}TU{up}{left}{left}RS";:gosub30010:forj=0to300:next
6133 print"{left}{left}{left}{left}RS{down}{left}{left}TU{down}{left}{left}{cyn}<={down}{left}{left}>I";:gosub30010:forj=0to300:next
6134 print"{gry2}{left}{left}TU{up}{left}{left}RS":gosub30010:forj=0to300:next:sys5681:print"{lgrn}die prinzessin{home}
6135 sys5681:print"ist fort. das{home}":sys5681:print"flügelschlagen{home}
6136 sys5681:print"der feuerechse{home}":sys5681:print"entfernt sich...{home}
6137 gosub900:print"minuten später{home}":sys5681:print"ist das tier{home}
6138 sys5681:print"wieder zurück{home}":sys5681:print"und wartet auf{home}":sys5681:print"dich...{home}
6140 gosub900:printleft$(d$,14)spc(15)"{wht}{rvon}yz{down}{left}{left}äö{gry2}{rvof}TU{up}{left}{left}RS{left}{left}{left}{left}";:gosub30010:forj=0to300:next
6141 fori=1to3:print"{rvof}{gry2}RS{down}{left}{left}TU{down}{left}{left}{wht}{rvon}yz{down}{left}{left}äö{left}{left}{up}";:gosub30010:forj=0to300:nextj,i
6142 print"{left}{left}yz{down}{left}{left}äö{gry2}{rvof}TU{up}{left}{left}RS";:gosub30010:forj=0to300:next
6143 print"{left}{left}{left}{left}RS{down}{left}{left}TU{down}{left}{left}{rvon}{wht}yz{down}{left}{left}äö";:gosub30010:forj=0to300:next
6144 print"{rvof}{gry2}{left}{left}TU{up}{left}{left}RS":gosub30010:forj=0to300:next:poke49358,1:poke2,0
6200 fori=1to3e3:next:print"{clr}{blk}lO"chr$(34)"ddd.konj"chr$(34)",8
6210 print"{down}{down}{down}{down}rU":poke631,19:poke632,13:poke633,13:poke198,3:new
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
11000 poke53281,0:poke53280,0:poke53272,18:sys5454:s=54272:poke650,255:v=53248
11001 poke51211,8:j=peek(49246):ifjthenifpeek(49247+j)=0thenpoke49246,0
11002 dimw$(27):fori=0to27:readw$(i):next
11003 j=peek(49247):ifjthenifpeek(49266+j)=0thenpoke49247,0
11004 deffnr(x)=int(x*rnd(ti)+1):fori=0to2:poke55723+i,4:next
11005 j=peek(49167):ifjthenifpeek(49272+j)=0thenpoke49167,0
11006 d$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}
11110 print"{home}{down}{down}"spc(24)"{lgrn}vital.:   (   )":printspc(24)"{up}{cyn}astral:   (   )
11111 printspc(24)"{lred}ang.:   {grn}ver.:":printspc(24)"{up}{pur}str.:   {yel}ges.:
11112 printspc(24)"{gry3}klg.:   {lblu}cha.:":printspc(24)"{up}{lgrn}erf.:      (  )
11113 printspc(24)"{yel}goldstck.:":printspc(24)"{up}{orng}nahr.vorrat:
11120 fori=0to2:pokev+1+i+i,203:pokev+i+i,60+32*i:pokev+39+i,7:poke2040+i,11
11121 next:pokev+23,.:pokev+28,.:pokev+27,.:pokev+29,.:pokev+21,.:goto10000
12900 sys5681:print"{wht}****************{home}":return
12910 sys5681:print"{wht}*              *";:return
12920 printpeek(49208)+256*peek(49209)+65536*peek(49210);:return
13000 sys5681:gosub12900:gosub12910:gosub12910:print"{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}du bist tot!{home}
13010 gosub12910:gosub12900:sys5681:sys5681:print"{yel}du hast";:gosub12920
13020 sys5681:print"züge gespielt.{home}":sys5681:sys5681:print"{wht}todesursache:{home}
13022 sys5681:print"{lred}drachenfeuer{home}
13030 poke56295,1:poke2023,71:poke198,0:wait198,1:poke2,17:goto6200
13100 sys5681:sys5681:print"du erhälst{home}
13110 sys5681:print"300 punkte.{home}
13140 ef=ef+300:ifef>999999thenef=999999
13150 k=ef:l=int(k/65536):poke49240,l:k=k-65536*l:l=int(k/256):poke49239,l
13160 poke49238,k-256*l:goto10000
30010 sys6041:pokes+5,16:pokes+1,12:pokes+4,129:return
30050 sys6041:pokes+5,86:pokes+1,99:pokes+4,129:return
30052 sys6041:pokes+5,8:pokes+1,40+fnr(50):pokes+4,21:return
30054 sys6041:pokes+5,41:pokes+1,20+fnr(20):pokes+4,129:return
60100 datahände,messer,dolch,kurzschwert,handbeil,schwert,morgenstern,kampfstab
60101 databastardschw.,streitaxt,zweihänder,schleuder,kurzbogen,blasrohr
60102 datalangbogen,armbrust,magische axt,elbenbogen,zauberschwin.,kleidung
60103 datawaffenrock,lederrüstung,kettenhemd,schuppenpanz.,ritterrüstung
60104 datamag. rüstung,kleiner schild,grosser schild
