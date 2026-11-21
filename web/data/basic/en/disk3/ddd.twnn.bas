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
136 ifu$="r"thengosub3000:goto2000
140 ifu$="c"thengosub4000:goto2000
199 print"what..?{home}":goto2000
200 print"waiting...{home}":goto2000
210 print"north{home}":ify=9goto220
211 y=9:printleft$(d$,20)spc(1+x+x)"{wht}{rvon}yz{down}{left}{left}äö{down}{left}{left}";:goto218
212 print"south{home}":ify>9orx=2orx=7goto222
213 y=10:printleft$(d$,22)spc(1+x+x)"{wht}{rvon}yz{down}{left}{left}äö{up}{up}{up}{left}{left}";:goto218
214 print"west{home}":ifx<y-6goto220
215 x=x-1:printleft$(d$,2+y+y)spc(1+x+x)"{wht}{rvon}yz{down}{left}{left}äö{up}";:goto218
216 print"east{home}":ifx>15-ygoto220
217 x=x+1:printleft$(d$,2+y+y)spc(1+x+x)"{wht}{rvon}yz{down}{left}{left}äö{up}{left}{left}{left}{left}";
218 print"{rvof}{gry2}RS{down}{left}{left}TU{home}":gosub30010:goto2000
220 sys5681:print"{lred}blocked!{home}":sys5681:goto100
222 ify>9goto1800
223 goto220
300 print"attack{home}":sys5681:ifwa=18goto310
301 print"{lred}with this weapon{home}":sys5681:print"you cannot{home}
302 sys5681:print"wound the{home}":sys5681:print"giant wyrm!{home}":goto100
310 h=985+y*80+x+x:z=peek(h+s):i=peek(h):j=peek(h+1):k=peek(h+40):l=peek(h+41)
312 printleft$(d$,y+y)spc(1+x+x)"{wht}{rvon}ij{down}{left}{left}kl{up}{left}{left}{rvof}";
314 gosub30050:zz=fnr(20):ifzz<=atgoto320
315 sys5681:print"{up}{yel}missed!{home}":goto318
316 sys5681:print"{up}{yel}off target!{home}
318 pokeh+s,z:pokeh+s+1,z:pokeh+s+40,z:pokeh+s+41,z:pokeh,i:pokeh+1,j
319 pokeh+40,k:pokeh+41,l:goto2000
320 ify>9or(x<>2andx<>4andx<>6)goto316
322 k=x/2-1:ifm(k)=.thensys5681:print"{up}{yel}missed"d$spc(x+x+1)"{up}{up}{up}{up}{up}{up}{gry2}U{red}Y{up}{left}{left}VW":goto2000
324 ifzz<3orfnr(20)>10goto330
326 print"{pur}{$b0}{$ae}{down}{left}{left}{$ad}{$bd}{up}{left}{left}";:sys5681:print"{up}dragon parries{home}":gosub30052
328 printleft$(d$,18)spc(1+x+x)"{grn}{rvon}ef{down}{left}{left}gh":goto2000
330 print"{lred}{rvon}uv{down}{left}{left}wx":gosub30054:sys5681:ifzz>2thenprint"{lgrn}{up}a hit!
331 ifzz=2thenprint"{cyn}{up}good hit!
332 ifzz=1thenprint"{cyn}{up}lucky hit!
334 z=fnr(7)+9:ifzz>1thenz=z-7
336 m(k)=m(k)-z:sys5681:print"{lgrn}the dragon head{home}
337 printleft$(d$,18)spc(1+x+x);:ifm(k)<1goto350
340 print"{grn}{rvon}ef{down}{left}{left}gh{lgrn}":sys5681:ifm(k)>80thenprint"is scratched.{home}":goto2000
341 ifm(k)>60thenprint"lightly wounded.{home}":goto2000
342 ifm(k)>40thenprint"wounded.{home}":goto2000
343 ifm(k)>20thenprint"badly wounded.{home}":goto2000
344 print"is barely alive.{home}":goto2000
350 m(k)=.:print"{red}{rvon}uv{down}{left}{left}wx{up}{left}{left}":sys5681:print"{lred}is cut off!{red}{home}":gosub30054
352 forj=0to200:next:printleft$(d$,18)spc(x+x+1)"{rvof}VW{down}{left}Y{left}{left}{gry2}U":goto2000
899 end
900 sys5681
901 poke56295,1:poke2023,71
902 poke198,0:wait198,1:poke198,0:poke2023,32:sys5681:return
1800 printd$spc(x+x+1)"{up}{up}{gry2}TU{up}{left}{left}RS{home}
1801 sys6041:pokes+5,10:pokes+4,33:fori=5to50:pokes+1,i:next
1802 sys5681:sys5681:print"-- you flee! --{home}":sys5681:sys5681
1820 i=0:print"{yel}for your{home}":sys5681:print"cowardice you{home}
1822 sys5681:print"lose 200 points{home}":sys5681:print"of experience!{home}
1830 sys5681:ef=ef-200:ifef<1thenef=0
1840 gosub13150:gosub901:poke2,0:goto6200
2000 poke198,.:sys5681:sys5681:ifm(0)+m(1)+m(2)=.goto6000
2005 iffnr(20)<16goto2020
2010 sys6041:pokes+5,197:print"{cyn}the dragon takes{home}":sys5681:print"a deep breath...{home}
2012 pokes+4,129:fori=100to200:pokes+1,i/10:next:goto100
2020 z=0:fori=0to2:ifm(i)>.thenz=z+2^i
2022 next:ifz=.goto6000
2024 poke829,0:sys6041:pokes+5,144+12:pokes+12,128+11:sys6336
2026 print"{lred}the dragon{home}":sys5681:print"breathes fire!{home}":pokes+1,7:pokes+8,4
2028 pokes+4,129:pokes+11,129:pokev+21,z:gosub2300:pokev+23,7:pokev+33,2:pokev+32,2
2030 gosub2300:pokev+33,10:pokev+32,10::gosub2300:pokev+33,2:pokev+32,2:gosub2300
2032 pokev+33,0:pokev+32,.:pokev+23,.:gosub2300:pokev+21,0:forj=0to60:next
2040 zz=1:ifz=3orz=6orz=5thenzz=2
2042 ifz=7thenzz=3
2044 k=0:fori=1tozz:k=k+fnr(5)+3:next:sys5681:sys5681:print"{lgrn}you suffer"k;
2046 poke829,1:sys5681:print"damage points!{home}":hp=hp-k:ifhp<1thenhp=0
2050 poke49231,hp/256:poke49230,hp-256*peek(49231)
2052 ifhp=.thenprintleft$(d$,2+y+y)spc(1+x+x)"{gry3}{rvon}ü^{down}{left}{left}_ ":gosub10000:goto13000
2054 gosub10000:goto100
2300 forj=0to60:next:sys6348:forj=0to60:next:sys6336
2310 forj=0to60:next:sys6360:forj=0to60:next:sys6336:return
3000 print"ready weapon{home}":sys5681
3040 ifpeek(49265)=.goto3050
3042 print"{yel}spellwing{home}":sys5681:print"ready!{home}":poke49246,18:wa=18
3044 sh=0:poke49167,0:return
3050 print"{lred}the only{home}":sys5681:print"weapon that{home}":sys5681:print"could help you{home}
3052 sys5681:print"now, you don't{home}":sys5681:print"have yet!{home}":return
4000 print"spell{home}":sys5681:print"{lred}the magic of{home}
4010 sys5681:print"the giant wyrm{home}":sys5681:print"absorbs every{home}
4020 sys5681:print"spell!{home}":return
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
5100 poke2,0:sys5681:print"{yel}you leave the{home}":sys5681:print"dragon's cave.{home}
5102 fori=0to2e3:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:
5104 fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:new
5200 x=5:sys5681:print"{lgrn}there is nothing{home}":sys5681:print"more for you to{home}
5210 sys5681:print"do here. also,{home}":sys5681:print"the carcass of{home}
5220 sys5681:print"the giant wyrm{home}":sys5681:print"stinks{home}
5221 sys5681:print"horribly.{home}":sys5681:print"you hurry{home}
5222 sys5681:print"back outside.{home}
5224 gosub900:printd$spc(1+x+x)"{up}{up}{gry2}TU{up}{left}{left}RS":gosub30010:poke2,0:goto6200
5240 pokes+5,11:pokes+6,6:pokes+12,9
5242 pokes+4,33:pokes+11,33:forj=0toi:next:return
5300 sys5681:print"{lgrn}you enter the{home}":sys5681:print"lair of the{home}
5302 wa=peek(49246):sys5681:print"terrible{home}":sys5681:print"giant wyrm.{home}
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
5320 sys5681:print"the dreadful{home}":sys5681:print"monster guards{home}
5321 sys5681:print"the princess,{home}":sys5681:print"who is chained{home}
5322 sys5681:print"between two{home}":sys5681:print"posts.{home}
5323 sys5681:print"{home}":gosub900:sys5681:print"she looks at you{home}
5324 sys5681:print"rattles her{home}":sys5681:print"chains and{home}
5325 sys5681:print"cries out{home}":sys5681:print"pleading:{home}
5326 sys5681:print"%please help me.{home}":sys5681:print"slay the dragon{home}
5327 sys5681:print"and save me!%{home}":gosub900:sys5681:print"the giant wyrm{home}
5328 sys5681:print"raises its{home}":sys5681:print"three heads and{home}
5329 sys5681:print"hisses at you{home}":sys5681:print"angrily...{home}
5330 gosub900:ifrs=6goto5340
5331 sys5681:print"the dragon's{home}":sys5681:print"fiery breath{home}
5332 sys5681:print"hits you with{home}":sys5681:print"tremendous heat{home}
5333 sys5681:print"that scorches{home}":sys5681:print"your clothes,{home}
5334 sys5681:print"your skin and{home}":sys5681:print"your hair.{home}
5335 sys5681:print"{home}":gosub900:sys5681:print"the armour you{home}
5336 sys5681:print"are wearing{home}":sys5681:print"cannot protect{home}
5337 sys5681:print"you from it. you{home}":sys5681:print"are driven{home}
5338 sys5681:print"back.{home}":x=5:goto5224
5340 sys5681:print"the dragon uses{home}":sys5681:print"only its flames{home}
5341 sys5681:print"in combat. your{home}":sys5681:print"magic armour{home}
5342 sys5681:print"protects you{home}":sys5681:print"only{home}
5347 sys5681:print"tolerably.";:ifwa<18thengosub900:goto100
5348 print" you{home}":sys5681:print"grip the hilt of{home}
5349 sys5681:print"your spellwing{home}":sys5681:print"tightly with{home}
5350 sys5681:print"both hands...{home}":gosub900:goto100
6000 print"{wht}--- victory! ---{home}":sys5681:sys5681:print"{yel}the dragon is{home}
6001 sys5681:print"slain!{home}
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
6020 gosub13100:fori=0to2e3:next:sys5681:sys5681:print"{lgrn}you can now
6021 sys5681:print"free the{home}":sys5681:print"princess!{home}
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
6050 sys5681:sys5681:print"{lgrn}the princess{home}":sys5681:print"throws her arms{home}
6051 sys5681:print"round your neck,{home}":sys5681:print"beaming, and{home}
6052 sys5681:print"says: %thank{home}":sys5681:print"you! you have{home}
6053 sys5681:print"saved me.{home}":gosub900:print"how did you{home}
6054 sys5681:print"ever manage{home}":sys5681:print"to slay{home}
6055 sys5681:print"the terrible{home}":sys5681:print"dragon? my{home}
6056 sys5681:print"father's best{home}":sys5681:print"soldiers{home}
6057 sys5681:print"all{home}":sys5681:print"failed.%{home}
6058 gosub900:print"you tell her{home}":sys5681:print"your story{home}
6059 sys5681:print"and what you{home}":sys5681:print"know so far{home}
6060 sys5681:print"and what you{home}":sys5681:print"plan. she looks{home}
6061 sys5681:print"at you in wonder{home}":sys5681:print"and then says:{home}
6062 gosub900:print"%perhaps i can{home}":sys5681:print"help you.{home}
6063 sys5681:print"the wyrm often{home}":sys5681:print"spoke to me{home}
6064 sys5681:print"through its{home}":sys5681:print"thoughts, partly{home}
6065 sys5681:print"to feast on{home}":sys5681:print"my fear,{home}
6066 sys5681:print"partly out of{home}":sys5681:print"sheer boredom.{home}
6067 gosub900:print"once it told me{home}":sys5681:print"that it had{home}
6068 sys5681:print"found a{home}":sys5681:print"wonderfully{home}
6069 sys5681:print"sparkling{home}":sys5681:print"crystal shard{home}
6070 sys5681:print"lying in the{home}":gosub900:print"grass. dragons{home}
6071 sys5681:print"collect anything{home}":sys5681:print"that glitters{home}
6072 sys5681:print"and sparkles, so{home}":sys5681:print"it took it along{home}
6073 gosub900:print"it brought it{home}":sys5681:print"to its treasure{home}
6074 sys5681:print"cave.{home}":sys5681:print"you see, it does{home}
6075 sys5681:print"not keep its{home}":sys5681:print"treasures here,{home}
6076 sys5681:print"but hides{home}":sys5681:print"them in{home}
6077 sys5681:print"a cave.{home}":gosub900:print"the cave lies{home}
6078 sys5681:print"in a deep{home}":sys5681:print"gorge at the{home}
6079 sys5681:print"southern tip of{home}":sys5681:print"the continent.{home}
6080 sys5681:print"it is said to{home}":sys5681:print"be a deep maze{home}
6081 sys5681:print"teeming with{home}":sys5681:print"monsters.{home}
6082 gosub900:print"at its deepest{home}":sys5681:print"point a secret{home}
6083 sys5681:print"door is hidden.{home}":sys5681:print"this door{home}
6084 sys5681:print"has magical{home}":sys5681:print"properties.{home}
6085 gosub900:print"only the dragon{home}":sys5681:print"could open it.{home}
6086 sys5681:print"when it came{home}":sys5681:print"near the door,{home}
6087 sys5681:print"a keyhole{home}":sys5681:print"appeared.{home}
6088 gosub900:print"perhaps it will{home}":sys5681:print"also react to{home}
6089 sys5681:print"your magic{home}":sys5681:print"armour of{home}
6090 sys5681:print"dragon{home}":sys5681:print"scales.{home}
6091 gosub900:print"anyway, the door{home}":sys5681:print"would open as{home}
6092 sys5681:print"soon as the{home}":sys5681:print"beast pushed one{home}
6093 sys5681:print"of its claws{home}":sys5681:print"into the{home}
6094 sys5681:print"keyhole.{home}":gosub900:print"wait a{home}
6095 sys5681:print"moment, i have{home}":sys5681:print"an{home}
6096 sys5681:print"idea...%{home}":gosub900:fori=0to800:next
6100 printleft$(d$,14)spc(13)"{cyn}<={down}{left}{left}>I{gry2}TU{up}{left}{left}RS";:gosub30010:fori=0to300:next
6101 print"{down}{left}{left}{left}{left}TU{up}{left}{left}{cyn}>I{up}{left}{left}<=";:gosub30010:fori=0to300:next
6102 print"{left}{left}{left}<={down}{left}{left}>I{gry2}U{up}{left}S":gosub30010:fori=0to500:next
6103 sys5681:print"{lgrn}the princess{home}":sys5681:print"sets to work on{home}
6104 sys5681:print"the dragon's{home}":sys5681:print"paw and{home}
6105 sys5681:print"cuts off one{home}":sys5681:print"of its{home}
6106 sys5681:print"claws{home}":sys5681:print"...":gosub900:fori=1to500:next
6107 printleft$(d$,13)spc(12)"{gry2}U{down}{left}S{cyn}>I{up}{left}{left}<=";:gosub30010:fori=0to300:next
6108 print"{left}{left}{gry2}TU{down}{left}{left}{cyn}<={down}{left}{left}>I";:gosub30010:fori=0to300:next
6109 print"{left}{left}{gry2}TU{up}{left}{left}RS{cyn}<={down}{left}{left}>I";:gosub30010:fori=0to300:next
6110 sys5681:print"{lgrn}the princess{home}":sys5681:print"hands you the{home}
6111 sys5681:print"dragon claw{home}":sys5681:print"and says:{home}
6112 sys5681:print"%here, use{home}":sys5681:print"this as the key{home}
6113 sys5681:print"for the{home}":sys5681:print"magic door.{home}
6114 gosub900:print"i will now{home}":sys5681:print"return to the{home}
6115 sys5681:print"castle. for that{home}":sys5681:print"i'll borrow{home}
6116 sys5681:print"the fire lizard.{home}":sys5681:print"don't{home}
6117 sys5681:print"worry, i'll{home}":sys5681:print"send it back{home}
6118 sys5681:print"here to{home}":sys5681:print"you.{home}
6119 gosub900:print"do come to the{home}":sys5681:print"castle sometime.{home}
6120 sys5681:print"my father, the{home}":sys5681:print"king, will{home}
6121 sys5681:print"surely reward{home}":sys5681:print"you richly for{home}
6122 sys5681:print"saving me.{home}":gosub900:print"and then go{home}
6123 sys5681:print"and fetch the{home}":sys5681:print"shard and save{home}
6124 sys5681:print"our world.{home}":sys5681:print"good luck!%{home}
6126 gosub900:printleft$(d$,14)spc(15);:fori=0to500:next
6130 fori=1to3:print"{gry2}RS{down}{left}{left}TU{down}{left}{left}{cyn}<={down}{left}{left}>I{left}{left}{up}";:gosub30010:forj=0to300:nextj,i
6132 print"{left}{left}<={down}{left}{left}>I{gry2}TU{up}{left}{left}RS";:gosub30010:forj=0to300:next
6133 print"{left}{left}{left}{left}RS{down}{left}{left}TU{down}{left}{left}{cyn}<={down}{left}{left}>I";:gosub30010:forj=0to300:next
6134 print"{gry2}{left}{left}TU{up}{left}{left}RS":gosub30010:forj=0to300:next:sys5681:print"{lgrn}the princess{home}
6135 sys5681:print"is gone. the{home}":sys5681:print"wingbeats of the{home}
6136 sys5681:print"fire lizard{home}":sys5681:print"fade away...{home}
6137 gosub900:print"minutes later{home}":sys5681:print"the beast is{home}
6138 sys5681:print"back again{home}":sys5681:print"and waits for{home}":sys5681:print"you...{home}
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
11110 print"{home}{down}{down}"spc(24)"{lgrn}health:   (   )":printspc(24)"{up}{cyn}astral:   (   )
11111 printspc(24)"{lred}att.:   {grn}def.:":printspc(24)"{up}{pur}str.:   {yel}dex.:
11112 printspc(24)"{gry3}int.:   {lblu}cha.:":printspc(24)"{up}{lgrn}exp.:      (  )
11113 printspc(24)"{yel}gold pcs.:":printspc(24)"{up}{orng}food supply:
11120 fori=0to2:pokev+1+i+i,203:pokev+i+i,60+32*i:pokev+39+i,7:poke2040+i,11
11121 next:pokev+23,.:pokev+28,.:pokev+27,.:pokev+29,.:pokev+21,.:goto10000
12900 sys5681:print"{wht}****************{home}":return
12910 sys5681:print"{wht}*              *";:return
12920 printpeek(49208)+256*peek(49209)+65536*peek(49210);:return
13000 sys5681:gosub12900:gosub12910:gosub12910:print"you are dead{home}
13010 gosub12910:gosub12900:sys5681:sys5681:print"{yel}you made";:gosub12920
13020 sys5681:print"moves.{home}":sys5681:sys5681:print"{wht}cause of death:{home}
13022 sys5681:print"{lred}dragon fire{home}
13030 poke56295,1:poke2023,71:poke198,0:wait198,1:poke2,17:goto6200
13100 sys5681:sys5681:print"you receive{home}
13110 sys5681:print"300 points.{home}
13140 ef=ef+300:ifef>999999thenef=999999
13150 k=ef:l=int(k/65536):poke49240,l:k=k-65536*l:l=int(k/256):poke49239,l
13160 poke49238,k-256*l:goto10000
30010 sys6041:pokes+5,16:pokes+1,12:pokes+4,129:return
30050 sys6041:pokes+5,86:pokes+1,99:pokes+4,129:return
30052 sys6041:pokes+5,8:pokes+1,40+fnr(50):pokes+4,21:return
30054 sys6041:pokes+5,41:pokes+1,20+fnr(20):pokes+4,129:return
60100 datahands,knife,dagger,short sword,hand axe,sword,morning star,quarterstaff
60101 databastard sword,battle axe,greatsword,sling,short bow,blowpipe
60102 datalong bow,crossbow,magic axe,elven bow,spellwing,clothes
60103 datagambeson,leather armour,chain mail,scale mail,plate armour
60104 datamagic armour,small shield,large shield
