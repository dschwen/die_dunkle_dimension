0 gosub471:k=.:j=int((su-1)/3.3):ifjthenfori=1toj:k=k+2^(8-i):next
1 poke5797,kand240:ifsu>17thenpoke5797,224:ifsu=21thenpoke5797,192
2 ifsu=1thenpoke5797,128
3 fori=0to6:poke49279+i,1:next:gosub275
4 sys5966:sys5440:wh=peek(49157):kp=.:ifpeek(49245)theniffnr(3)=1thengosub259
5 gosub268:ifpeek(49244)=.thengosub262
6 ifpeek(2)=10goto284
7 if(peek(49208)and31)=.thenifpeek(49244)thengosub581
8 ifpeek(2)=6thengosub264
9 z=0:sys5681:print"{wht}@G{left}";:ifpeek(892)>31goto57
10 ifpeek(2)=6thenifrnd(ti)<.1goto493
11 ifpeek(2)=11thenifrnd(ti)<.2goto490
12 ifpeek(2)=5thenifrnd(ti)<.05goto492
13 z=z+1:ifz>600goto34
14 getu$:ifu$=""goto13
15 ifu$="{up}"thenprint"norden{home}":sys4877:ifpeek(182)=0thensys4563:goto582
16 ifu$="{down}"thenprint"süden{home}":sys4885:ifpeek(182)=0thensys4621:goto582
17 ifu$="{left}"thenprint"westen{home}":sys4893:ifpeek(182)=0thensys4685:goto582
18 ifu$="{rght}"thenprint"osten{home}":sys4901:ifpeek(182)=0thensys4751:goto582
19 ifu$="{up}"oru$="{down}"oru$="{left}"oru$="{rght}"goto35
20 ifu$=" "goto34
21 ifu$="h"goto40
22 ifu$="l"goto43
23 ifu$="w"thengosub232:goto4
24 ifu$="r"thengosub247:goto4
25 ifu$="z"thenh=0:gosub291:goto4
26 ifu$="i"thengosub540:goto4
27 ifu$="b"goto389
28 ifu$="p"goto424
29 ifu$="s"goto426
30 ifu$="k"goto440
31 ifu$="_"thengosub457:goto4
32 ifu$="q"goto460
33 print"wie bitte..?{home}":goto4
34 print"warten...{home}":goto4
35 ifu$="{up}"thenifpeek(881)>27andpeek(881)<32thensys4563:goto582
36 ifu$="{down}"thenifpeek(903)>27andpeek(903)<32thensys4621:goto582
37 ifu$="{left}"thenifpeek(891)>27andpeek(891)<32thensys4685:goto582
38 ifu$="{rght}"thenifpeek(893)>27andpeek(893)<32thensys4751:goto582
39 sys5681:print"{lred}blockiert!{home}":sys5681:goto4
40 ifpeek(49157)<2orpeek(49157)>3goto33
41 poke49346,1-peek(49346):ifpeek(49346)thenprint"%hühaa!%{home}":goto4
42 print"%hooh!%{home}":goto4
43 ifpeek(49157)<5goto33
44 j=.:print"%in die lüfte!%{home}":sys5681:gosub589:print"@G{left}";
45 getu$:ifu$="l"goto55
46 ifu$="{up}"thenj=.:print"norden{home}":sys5681:print"@G{left}";
47 ifu$="{down}"thenj=1:print"süden{home}":sys5681:print"@G{left}";
48 ifu$="{left}"thenj=2:print"westen{home}":sys5681:print"@G{left}";
49 ifu$="{rght}"thenj=3:print"osten{home}":sys5681:print"@G{left}";
50 onj+1gosub51,52,53,54:sys5440:sys4229:z=peek(892):sys4537:sys5868:sys5998:sys5107:sys4361:goto45
51 sys4563:goto588
52 sys4621:goto588
53 sys4685:goto588
54 sys4751:goto588
55 print"%lande!%{home}":ifz>2andz<8andz<>5goto4
56 sys5681:print"{lred}nicht hier!{home}":sys5681:sys5681:print"{wht}@G{left}";:goto45
57 print"{left}  {home}{lgrn}":sys5681:k=peek(892)-32:printm$(k)"{home}":sys5681:print"greift an!{home}":sys5681
58 sys6041:pokes+6,250:pokes+13,250:pokes+4,33:pokes+11,33:fori=5to80:pokes+1,i:pokes+8,90-i:next:pokes+4,32:pokes+11,32:q=3:sys4229:l=peek(892):poke198,0:ifl=4goto476
59 ifl=5goto478
60 ifl=6goto479
61 ifl=7goto480
62 ifl=8goto481
63 poke2,3:sys5782:poke2,4:sys5856:sys5856:poke2,24:fori=1to3:sys5856:next:q=3
64 x=5:y=9:poke936,3:ifl=11goto483
65 ifpeek(49157)=4goto494
66 ifk<5goto482
67 ifk=2theny=2:gosub503:y=9:gosub524:goto69
68 gosub515
69 p=832+11*y+x:q=peek(p):pokep,27:sys4361:sys6041:print"{home}":ld=2:sys5681:print"{wht}--- konflikt ---{home}":sys5681:sys5681:print"{yel}du benutzt{home}":sys5681:wa=peek(49246):printw$(wa)",{home}":sys5681:rs=peek(49247):sh=peek(49167):printw$(rs+19);:ifshthenprint",{home}":sys5681:printmid$("kleinergrosser",sh*7-6,7)" schild";
70 print".{home}":sys5681:g=0:ifpeek(50900+m(0))theng=1+fnr(20+peek(49241)*(1+mz/16))
71 kp=1:gosub275:sys5681:ifq=6thengosub271
72 ifpeek(49279)thenprint"{pur}du bist betäubt.{home}":goto153
73 print"{wht}@G{left}";:z=0:pokep,27:sys4361
74 z=z+1:ifz>600thenprint"warten...{home}":goto153
75 getu$:ifu$=""goto74
76 ifu$="{up}"goto87
77 ifu$="{down}"goto92
78 ifu$="{left}"goto95
79 ifu$="{rght}"goto98
80 ifu$=" "thenz=666:goto74
81 ifu$="a"goto101
82 ifu$="w"thengosub232:goto153
83 ifu$="z"thenh=1:zz=0:gosub291:goto351
84 ifu$="i"thengosub540:goto153
85 ifu$="_"thengosub457:goto153
86 print"wie bitte..?{home}":goto153
87 print"norden{home}":ify=.goto150
88 j=peek(p-11):ifj<3orj>11goto91
89 pokep,q:p=p-11:y=y-1
90 q=j:pokep,27:sys4361:gosub584:goto153
91 sys5681:print"{lred}blockiert!{home}":sys5681:goto153
92 print"süden{home}":ify>9goto150
93 j=peek(p+11):ifj<3orj>11goto91
94 pokep,q:p=p+11:y=y+1:goto90
95 print"westen{home}":ifx=.goto150
96 j=peek(p-1):ifj<3orj>11goto91
97 pokep,q:p=p-1:x=x-1:goto90
98 print"osten{home}":ifx>9goto150
99 j=peek(p+1):ifj<3orj>11goto91
100 pokep,q:p=p+1:x=x+1:goto90
101 if(wa>10andwa<16)orwa=17thenifld<2goto152
102 print"attacke{home}":sys5681:print"{yel}-richtung? {wht}G{left}";:z=0:zz=0
103 z=z+1:ifz>600thenprint"keine{home}":goto153
104 getu$:ifu$=""goto103
105 ifu$="{up}"thenr=.:print"nord{home}":goto110
106 ifu$="{down}"thenr=1:print"süd{home}":goto110
107 ifu$="{left}"thenr=2:print"west{home}":goto110
108 ifu$="{rght}"thenr=3:print"ost{home}":goto110
109 z=666:goto103
110 ld=0:z=0:h=p:hx=x:hy=y:hq=27:ifwa>10andwa<18thenz=1
111 hh=21:poke51221,7:ifwa>15thenpoke51221,1
112 ifwa=13thenpoke51221,13
113 ifwa=11thenpoke51221,15
114 ifzzthenz=1:ld=2:hh=22:poke51222,14:ifzz=2thenpoke51222,13
115 ifzz>2thenpoke51222,10:ifzz=5thenz=0:hh=23:poke51223,1
116 pokeh,hq:h=h-1+(r=0)*10-(r=1)*12-(r=3)*2:hq=peek(h):hx=hx+(r=2)-(r=3):hy=hy+(r=0)-(r=1):ifhx<.orhy<.orhx=11orhy=11goto121
117 pokeh,hh:sys4361:if(hq=5orhq=24orhq=25orhq>69)thenifwa<>17orzz>.goto120
118 ifhq>31andhq<70goto122
119 ifzgoto116
120 pokeh,hq:ifzz=4goto116
121 gosub590:sys5681:print"{lred}daneben!{home}":sys4361:goto281
122 fori=0tomz:ifm(i)<99thenifx(i)=hxandy(i)=hygoto124
123 next:goto120
124 sys5681:print"{lred}"m$(m(i))" ";:j=fnr(20):ifzzthenj=3
125 ifj<=atgoto127
126 sys5681:print"verfehlt!{home}";:gosub590:pokeh,hq:sys4361:goto281
127 ifj<3thenprint"ist{home}":sys5681:print"durch einen{home}":sys5681
128 ifj=2thenprint"guten treffer{home}":goto133
129 ifj=1thenprint"glückstreffer{home}":goto133
130 ifpeek(50824+m(i))<fnr(20)orzz>.goto132
131 gosub591:sys5681:print"hat pariert.{home}":pokeh,hq:sys4361:goto281
132 print"ist{home}
133 poke51223,10:pokeh,23:sys4361:gosub592:k=peek(50512+wa):l=int(k/3+.8):k=l+fnr(k-l):ifsr>11thenk=k+int((sr-10)/2)
134 ifzzthenk=13:ifzz>1thenk=.:ifzz>2thenk=21:ifzz>3thenk=13:ifzz=5thenk=36
135 l=peek(50748+m(i)):ifj=1thenl=.
136 k=k-l:ifk<1thenk=1
137 l(i)=l(i)-k:pokeh,hq:sys4361:ifl(i)<.thenl(i)=.:pokeh,q(i):goto147
138 sys5681:l=l(i)/peek(50672+m(i)):ifl>.8thenprint"kaum angekratzt.{home}":goto143
139 ifl>.6thenprint"leicht verletzt.{home}":goto143
140 ifl>.4thenprint"verwundet.{home}":goto143
141 ifl>.2thenprint"schwer verletzt.{home}":goto143
142 print"auf der flucht.{home}
143 ifzz=4goto116
144 if(zz>.andzz<>2)or(zz=.andwa<>13)goto281
145 g(i)=g(i)+1-(zz=2):ifg(i)>9theng(i)=9
146 sys5681:print"{lgrn}"m$(m(i))" ist{home}":sys5681:print"mit faktor"g(i);:sys5681:print"vergiftet.{home}":goto153
147 z2=1:gosub535:ifzz=4goto116
148 ifj=99goto4
149 goto281
150 pokep,q:sys4361:sys6041:pokes+5,10:pokes+4,33:fori=5to50:pokes+1,i:next:sys5681:sys5681:print"-- du fliehst --{home}":sys5681:sys5681:m$(34)="räuber":l=0:fori=0tomz:ifm(i)<99thenl=l-peek(50634+m(i)):m(i)=99
151 next:i=0:print"{yel}für deine{home}":sys5681:print"feigheit werden{home}":sys5681:print"dir "mid$(str$(l),2)" punkte{home}":sys5681:print"abgezogen!{home}":gosub502:sys5681:j=99:gosub537:goto3
152 ld=1:printw$(wa);:sys5681:print"laden...{home}
153 ld=ld+1:poke198,0:ifpeek(49283)goto71
154 j=peek(49282):ifjthenifj/2>int(j/2)goto71
155 iffnr(7)=7andas<amthengosub269
156 fori=0tomz:ifm(i)<99goto158
157 next:i=0:sys5681:print"{wht}----- sieg -----{home}":m$(34)="räuber":sys5681:gosub502:goto255
158 fori=0tomz:ifm(i)=99goto217
159 ifg(i)=.goto162
160 l(i)=l(i)-fnr(g(i)):h=832+x(i)+11*y(i):hq=peek(h):poke51222,13:pokeh,22:sys4361:gosub592:pokeh,hq:sys4361:ifl(i)>.goto162
161 pokeh,q(i):sys5681:print"{lred}"m$(m(i));:sys5681:print"wurde durch gift{home}":z2=2:gosub535:goto217
162 z1=1:ifl(i)/peek(50672+m(i))>.2thenz1=.
163 z2=peek(50862+m(i)):ifz2=6orz2=7orz2=8orz2=13goto218
164 dx=x-x(i):dy=y-y(i):ifabs(dx)<2andabs(dy)<2goto168
165 ifz2<2orz2=7goto202
166 ifdx=.ordy=0orabs(dx)=abs(dy)thenifrnd(ti)<.5goto168
167 goto202
168 ifz1thenifrnd(ti)<.5goto202
169 z=21:poke51221,7:ifz2=1orz2=9thenpoke51221,13
170 ifz2>1andz2<>3andz2<>7thenz=22:poke51222,14
171 ifz2=9thenpoke51222,4
172 ifz2=4thenpoke51222,10
173 ifz2=5thenpoke51222,13
174 ifz2=10thenz=24
175 ifz2=11thenz=25
176 ifz2=12thenj=fnr(3):poke51222,3*j-(j=3)*3+1-(j=2)*3
177 ifz2=14thenj=fnr(2):poke51222,4*j-(j=2)*5
178 dx=sgn(dx):dy=sgn(dy):hx=x(i):hy=y(i):hq=m(i)+32:h=832+hx+11*hy
179 pokeh,hq:h=h+dx+11*dy:hx=hx+dx:hy=hy+dy:ifhx<.orhy<.orhx=11orhy=11goto182
180 hq=peek(h):pokeh,z:sys4361:ifhq=27orhq=26goto183
181 ifhq<>24andhq<>25andhq<70goto179
182 pokeh,hq:gosub590:sys4361:goto217
183 iffnr(20)<=peek(50786+m(i))goto185
184 gosub590:pokeh,hq:sys4361:goto217
185 iffnr(20)>paorpeek(49279)>.goto187
186 gosub591:pokeh,hq:sys4361:sys5681:print"{pur}du parierst.{home}":goto217
187 poke51223,10:pokeh,23:sys4361:gosub592:pokeh,hq:k=peek(50710+m(i))/2+2:zz=rs:ifpeek(49284)thenzz=zz+zz
188 l=int(k/3+.8):k=l+fnr(k-l)-zz+sh*(peek(49279)=0):ifk<1thenk=1
189 sys5681:print"{lgrn}"m$(m(i))" hat{home}":sys5681:print"dich ";:ifk=1ork>12thenprint"sehr{home}":sys5681
190 ifk<4thenprint"schwach ";:sys5681:goto194
191 ifk<7thenprint"leicht ";:sys5681:goto194
192 ifk<10goto194
193 print"schwer ";:sys5681
194 print"getroffen!{left}";:sys4361:hp=hp-k:ifhp<1thenhp=0:pokeh,26:sys4361:k=3:goto530
195 poke49231,hp/256:poke49230,hp-256*peek(49231):if(z2<>1andz2<>5andz2<>8andz2<>9andz2<>14)orfnr(20)<=gegoto201
196 j=peek(51200+z):ifj<>13andj<>4goto217
197 print" {home}":sys5681:print"und ";:ifj=13goto199
198 print"betäubt!{home}":pokep,26:sys4361:poke49279,fnr(6)+1:sys5681:poke55723,4:poke1451,2:goto217
199 print"vergiftet!{home}":j=peek(49245)+1:ifj>9thenj=9
200 poke49245,j:poke1449,j+48:poke55720,13
201 print"{home}{down}{down}"spc(31)"{lgrn}"right$("00"+mid$(str$(hp),2),3):goto217
202 dx=x-x(i):dy=y-y(i):ifz1thendx=-dx:dy=-dy
203 ifabs(dx)>abs(dy)goto209
204 dy=sgn(dy):z=832+x(i)+11*(y(i)+dy):gosub223:ifkthendx=.:goto214
205 dx=sgn(dx):z=832+x(i)+dx+11*y(i):gosub223:ifkthendy=.:goto214
206 dx=-dx:z=832+x(i)+dx+11*y(i):gosub223:ifkthendy=.:goto214
207 ifz1=2goto217
208 z1=2:dx=sgn(int(fnr(3)-2)):dy=sgn(int(fnr(3)-2)):goto204
209 dx=sgn(dx):z=832+x(i)+dx+11*y(i):gosub223:ifkthendy=.:goto214
210 dy=sgn(dy):z=832+x(i)+11*(y(i)+dy):gosub223:ifkthendx=.:goto214
211 dy=-dy:z=832+x(i)+11*(y(i)+dy):gosub223:ifkthendx=.:goto214
212 ifz1=2goto217
213 z1=2:dx=sgn(int(fnr(3)-2)):dy=sgn(int(fnr(3)-2)):goto209
214 poke832+x(i)+11*y(i),q(i):x(i)=x(i)+dx:y(i)=y(i)+dy:ifk=2goto216
215 q(i)=peek(z):pokez,m(i)+32:sys4361:gosub584:goto217
216 sys4361:gosub591:sys5681:print"{lgrn}"m$(m(i))" ist{home}":m(i)=99:sys5681:print"geflohen.{home}
217 next:goto71
218 ifrnd(ti)>.15goto164
219 poke53281,1:sys5681:gosub591:iffnr(20)<=kgthenpoke53281,0:goto217
220 ifpeek(49285)thenpoke53281,10:poke53280,10:gosub591:poke53281,0:poke53280,0
221 ifpeek(49285)thensys5681:print"{lblu}zauberbann{home}":sys5681:print"abgewehrt!{home}":goto217
222 print"{pur}die magie des{home}":sys5681:printm$(m(i))"s{home}":sys5681:print"hat dich{home}":sys5681:poke53281,0:gosub592:goto198
223 k=0:ifm(i)<10andm(i)>4goto230
224 ifm(i)>4goto227
225 ifpeek(z)<3thenk=1
226 goto228
227 ifpeek(z)>2thenifpeek(z)<12thenk=1
228 ifx(i)+dx<.orx(i)+dx>10ory(i)+dy<.ory(i)+dy>10thenk=0:ifz1=1thenk=2
229 return
230 ifpeek(z)<27orpeek(z)=70orpeek(z)=85thenk=1:goto228
231 return
232 print"waffe benutzen{home}":sys5681:print"{yel}-welche? (a-s) {wht}G{left}";:z=0
233 z=z+1:getu$:ifz<600andu$=""goto233
234 ifu$<"a"oru$>"s"thenu$=chr$(peek(49246)+65)
235 printu$;:sys5681:j=asc(u$)-65:print"{lred}"w$(j);:sys5681:ifjthenifpeek(49247+j)=.thenprint"hast du nicht!{home}":sys5681:return
236 ifge<peek(50540+j)thenprint"du bist nicht{home}":sys5681:print"geschickt genug,{home}
237 ifge<peek(50540+j)thensys5681:print"eine solche{home}":sys5681:print"waffe zu führen.{home}":return
238 wa=j:poke49246,j:print"bereit.{home}":sys5681:sh=0:poke49167,0:ifj>6andj<18thenreturn
239 i=49274:ifj<18thensys5681:goto244
240 print"{yel}-schild? (j/n) {wht}G{left}";
241 getu$:ifu$="n"thenprint"n{home}":return
242 ifu$="j"thenprint"j{home}":sys5681:goto244
243 goto241
244 ifpeek(i)thensh=2:poke49167,2:print"{lred}du benutzt den{home}":sys5681:print"grossen schild.{home}":return
245 ifpeek(49273)thensh=1:poke49167,1:print"{lred}du benutzt den{home}":sys5681:print"kleinen schild.{home}
246 return
247 print"rüstung anlegen{home}":sys5681:print"{yel}-welche? (a-g) {wht}G{left}";:z=0
248 z=z+1:getu$:ifz<600andu$=""goto248
249 ifu$<"a"oru$>"g"thenu$=chr$(peek(49247)+65)
250 printu$;:sys5681:j=asc(u$)-65:print"{lred}"w$(j+19);:sys5681:ifjthenifpeek(49266+j)=.thenprint"hast du nicht!{home}":sys5681:return
251 ifu$="g"andsr>9goto254
252 ifsr<peek(50559+j)thenprint"du bist zu{home}":sys5681:print"schwach, um eine{home}":sys5681
253 ifsr<peek(50559+j)thenprint"so schwere rüs-{home}":sys5681:print"tung zu tragen.{home}":return
254 rs=j:poke49247,j:print"angelegt.{home}":sys5681:return
255 ifg=.goto3
256 sys5681:print"{yel}du erbeutest{home}":sys5681:printmid$(str$(g),2)" goldstücke!{home}
257 sys5681:gp=gp+g:ifgp>5e4thengp=5e4
258 poke49243,gp/256:poke49242,gp-256*peek(49243):gosub466:goto3
259 h=peek(892):poke51223,13:poke892,23:sys4361:gosub592:sys5681:print"{lgrn}das gift wirkt!":hp=hp-fnr(peek(49245)):poke892,h:sys4361:k=1
260 ifhp<1thenhp=0:poke892,26:sys4361:goto530
261 poke49231,hp/256:poke49230,hp-256*peek(49231):goto466
262 iffnr(3)>1thenreturn
263 h=peek(892):poke51223,3:poke892,23:sys4361:gosub592:sys5681:print"{cyn}du hungerst!":hp=hp-1:poke892,h:sys4361:k=2:goto260
264 iffnr(3)>1thenreturn
265 sys5681:print"{lgrn}sumpfgas!{home}":ifge=>fnr(20)thenreturn
266 h=peek(892):poke51223,13:poke892,23:sys4361:gosub591:sys5681:print"{lgrn}vergiftet!{home}":poke892,h:sys4361:j=peek(49245)+1:ifj>9thenj=9
267 poke49245,j:poke1449,j+48:poke55720,13:return
268 iffnr(3)>1oras=>amthenreturn
269 as=as+1:poke49235,as/256:poke49234,as-256*peek(49235)
270 print"{home}{down}{down}{down}{cyn}"spc(31)right$("00"+mid$(str$(as),2),3):return
271 iffnr(3)>1thenreturn
272 sys5681:print"{lgrn}sumpfgas!{home}":sys5681:ifge=>fnr(20)thenreturn
273 h=peek(p):pokep,23:poke51223,13:sys4361:gosub591:print"{lgrn}vergiftet!{home}":sys5681:pokep,h:sys4361:j=peek(49245)+1:ifj>9thenj=9
274 goto267
275 j=peek(49282):ifjthenpoke49282,j-1:ifj=1thenpoke1456,32
276 j=peek(49283):ifjthenpoke49283,j-1:ifj=1thenpoke1458,32
277 j=peek(49284):ifjthenpoke49284,j-1:ifj=1thenpoke1454,32
278 j=peek(49285):ifjthenpoke49285,j-1:ifj=1thenpoke1454,32
279 j=peek(49279):ifjthenpoke49279,j-1:ifj=1thenpoke1451,32
280 return
281 ifwa<>16orzz>.goto153
282 h=h-11*(r=0)+11*(r=1)-(r=2)+(r=3):hq=peek(h):pokeh,21:sys4361:pokeh,hq:forj=0to20:next:ifh=pthensys4361:goto153
283 goto282
284 ifpeek(49348)goto7
285 poke51223,10:poke892,23:sys4361:gosub592:sys5681:print"{lred}lava verbrennt{home}":sys5681:print"dich!{home}":hp=hp-30:poke49231,hp/256:poke49230,hp-256*peek(49231):ifhp<1thenk=4:goto530
286 ifu$="{up}"thensys4621
287 ifu$="{down}"thensys4563
288 ifu$="{left}"thensys4751
289 ifu$="{rght}"thensys4685
290 gosub466:goto4
291 print"zauberspruch{home}":sys5681:print"{yel}-welcher? {wht}G{left}";:z=0
292 z=z+1:getu$:ifz<600andu$=""goto292
293 ifu$=>"a"andu$<="p"goto295
294 print"{yel}keiner{home}":return
295 printu$;:sys5681:j=asc(u$)-64:printz$(j-1);:sys5681:ifj=1orj=5goto302
296 ifpeek(49303+j)=0thenprint"{lred}kannst du nicht!{home}":return
297 z=peek(50495+j):fori=0to7:if(2^iandz)=.goto299
298 ifpeek(49336+i)=.thenprint"{lred}zu wenig{home}":sys5681:print"ingredenzien!{home}":return
299 next:print"{orng}du konzentrierst{home}":sys5681:print"dich...{home}":sys5681:fori=0to7:if(2^iandz)thenpoke49336+i,peek(49336+i)-1
300 next:ifj<9thenonjgoto302,307,321,312,302,337,342,326
301 onj-8goto346,353,357,366,361,370,374,378
302 sys5681:print"{lred}wozu jetzt?{home}":return
303 sys5681:print"{lred}nicht genug{home}":sys5681:print"astralenergie!{home}":return
304 sys5681:sys6041:print"{lred}gelingt nicht!{home}":pokes+5,10:pokes+4,33:fori=0to45:pokes+1,46-i:next:goto270
305 as=as-z:poke49235,as/256:poke49234,as-256*peek(49235):goto466
306 sys5681:print"{cyn}es gelingt!{home}":return
307 z=5:ifas<zgoto303
308 gosub305:iffnr(20)>chgoto304
309 gosub306:gosub270:sys6041:pokes+5,10:poke53281,13:poke53280,13:pokes+4,17:fori=1to66:pokes+1,i:next:poke53281,0:poke53280,0
310 ifpeek(49245)=0oras<2thenreturn
311 poke49245,peek(49245)-1:as=as-3:gosub269:gosub467:goto310
312 ifas<10goto303
313 z=10:gosub305:iffnr(20)>chgoto304
314 gosub306:sys5681:print"{yel}-wieviel? ";
315 print"{blu}000{left}{left}{left}";:j=0:fori=0to2
316 getu$:ifu$=chr$(20)thenprintleft$("{left}{left}",i);:goto315
317 ifu$<"0"oru$>"9"goto316
318 print"{wht}"u$;:j=j+(asc(u$)-48)*10^(2-i):next:ifj>asthenj=as
319 gosub270:sys6041:pokes+5,10:poke53281,5:poke53280,5:pokes+4,17:fori=1to55:pokes+1,i:next:fori=1to55:pokes+1,56-i:next:poke53281,0:poke53280,0:ifj>hm-hpthenj=hm-hp
320 as=as-j-1:hp=hp+j:gosub269:poke49231,hp/256:poke49230,hp-256*peek(49231):goto466
321 z=10:ifas<zgoto303
322 ifkp=.goto302
323 ifpeek(49285)goto304
324 gosub305:iffnr(20)>chgoto304
325 gosub306:gosub270:sys6041:pokes+5,10:poke53281,2:poke53280,2:pokes+4,33:fori=0to150step3:pokes+1,153-i:next:poke53281,0:poke53280,0:poke49284,13:poke55726,7:poke1454,19:return
326 z=20:ifas<zgoto303
327 ifkp=.goto302
328 gosub305:iffnr(20)>chgoto304
329 gosub306:gosub270:sys6041:pokes+5,143:poke53281,7:poke53280,7:pokes+4,129:fori=1to240step3:pokes+1,i:next:poke53281,1:poke53280,1:fori=0to333:next:poke53281,7:poke53280,7:fori=1to240step3:pokes+1,240-i:next:sys6041:poke53281,0:poke53280,0:fori=0tomz:j=m(i):ifj<99goto331
330 next:goto466
331 h=832+x(i)+11*y(i):ifj=22andfnr(3)=3goto333
332 ifj<28orj>33goto330
333 poke51223,7:m(i)=99:pokeh,23:sys6041:pokes+5,9:pokes+1,fnr(6):pokes+4,129:sys4361:pokeh,q(i):ifj=22thenpokeh,24
334 l=peek(50634+j):sys5681:print"{yel}"m$(j);:ifj=22thenprint"{left}{left}{left}{left}{left}steintroll{home}
335 sys5681:printmid$(str$(l),2)" punkte.{home}":sys4361:ef=ef+l:ifef>999999thenef=999999
336 poke49239,ef/256:poke49238,ef-256*peek(49239):goto330
337 z=15:ifas<zgoto303
338 ifkp=.goto302
339 ifpeek(49284)goto304
340 gosub305:iffnr(20)>chgoto304
341 gosub306:gosub270:sys6041:pokes+5,10:poke53281,10:poke53280,10:pokes+4,33:fori=3to193step2:pokes+1,i:next:poke53281,0:poke53280,0:poke49285,13:poke55726,7:poke1454,12:return
342 z=20:ifas<zgoto303
343 ifkp=.goto302
344 gosub305:iffnr(20)>chgoto304
345 gosub306:gosub270:sys6041:pokes+5,11:pokes+4,17:fori=3to150step3:pokes+1,i:poke53281,3:poke53280,3:pokes+1,153-i:poke53281,0:poke53280,0:next:poke49282,23:poke55728,3:poke1456,7:return
346 z=5:ifas<zgoto303
347 ifkp=.goto302
348 gosub305:iffnr(20)>chgoto304
349 gosub306:gosub270:sys6041:pokes+5,10:pokes+4,33:poke53281,14:poke53280,14:fori=153to3step-3:pokes+1,i:next:poke53281,0:poke53280,0:zz=1
350 sys5681:print"{yel}-richtung? {wht}G{left}";:z=0:return
351 ifzz=.goto153
352 goto103
353 z=7:ifas<zgoto303
354 ifkp=.goto302
355 gosub305:iffnr(20)>chgoto304
356 gosub306:gosub270:sys6041:pokes+5,10:pokes+4,129:poke53281,13:poke53280,13:fori=123to3step-3:pokes+1,i:next:poke53281,0:poke53280,0:zz=2:goto350
357 z=10:ifas<zgoto303
358 ifkp=.goto302
359 gosub305:iffnr(20)>chgoto304
360 gosub306:gosub270:sys6041:pokes+5,10:pokes+4,129:poke53281,10:poke53280,10:fori=3to123step3:pokes+1,i:next:poke53281,0:poke53280,0:zz=3:goto350
361 z=15:ifas<zgoto303
362 ifkp=.goto302
363 gosub305:iffnr(20)>chgoto304
364 gosub306:gosub270:sys6041:pokes+5,11:pokes+4,33:poke53281,4:poke53280,4:fori=3to123step3:pokes+1,i:pokes+1,126-i:next:poke53281,0:poke53280,0:fori=0tomz:ifm(i)=0orm(i)=10orm(i)=11orm(i)=12orm(i)=18thenl(i)=1
365 next:return
366 z=20:ifas<zgoto303
367 ifkp=.goto302
368 gosub305:iffnr(20)>chgoto304
369 gosub306:gosub270:sys6041:pokes+5,10:pokes+4,129:poke53281,7:poke53280,7:fori=1to5:forj=3to99step3:pokes+1,j:nextj,i:poke53281,0:poke53280,0:zz=4:goto350
370 z=25:ifas<zgoto303
371 ifkp=.goto302
372 gosub305:iffnr(20)>chgoto304
373 gosub306:gosub270:sys6041:pokes+5,11:pokes+4,17:poke53281,15:poke53280,15:fori=1to7:forj=3to99step3:pokes+1,j:nextj,i:poke53281,0:poke53280,0:poke49283,13:poke55730,15:poke1458,26:return
374 z=20:ifas<zgoto303
375 ifkp=.goto302
376 gosub305:iffnr(20)>chgoto304
377 gosub306:gosub270:sys6041:pokes+5,11:pokes+4,129:poke53281,6:poke53280,6:fori=10to80step10:forj=itoi+30:pokes+1,j:nextj,i:poke53281,0:poke53280,0:zz=5:goto350
378 z=25:ifas<zgoto303
379 ifkp=.orhp<21goto302
380 gosub305:iffnr(20)>chgoto304
381 gosub306:gosub270:fori=1to3:z=1:gosub387:z=7:gosub387:z=10:gosub387:z=.:gosub388:gosub388:next:fori=0tomz:ifm(i)=99goto386
382 h=832+x(i)+11*y(i):hq=peek(h):poke51223,7:pokeh,23:sys4361:sys6041:pokes+5,9:pokes+1,fnr(6):pokes+4,129:l(i)=l(i)-20:ifl(i)>.thenpokeh,hq:sys4361:goto386
385 gosub619:poke49239,ef/256:poke49238,ef-256*peek(49239):sys4361:m(i)=99
386 next:poke51223,7:pokep,23:sys4361:sys6041:pokes+5,11:pokes+1,3:pokes+4,129:hp=hp-20:poke49231,hp/256:poke49230,hp-256*peek(49231):gosub466:pokep,27:sys4361:return
387 sys6041:pokes+5,11:pokes+1,3:pokes+4,129
388 poke53281,z:poke53280,z:forj=0to99:next:return
389 j=peek(49157):ifj>1goto417
390 forj=5to2step-1:ifpeek(49156+j)=peek(49154)andpeek(49160+j)=peek(49155)goto419
391 next:print"betrete ";:ifpeek(2)=14goto401
392 ifpeek(2)=13goto403
393 ifpeek(2)=12goto410
394 ifpeek(2)=16goto404
395 ifpeek(2)=15goto405
396 ifpeek(2)=19andpeek(49154)=34goto406
397 ifpeek(2)=18goto407
398 ifpeek(2)=19goto408
399 ifpeek(2)=17goto409
400 print"{left}{left}{left}{left}{left}{left}{left}{left}";:goto33
401 print"hütte{home}":poke2,1
402 fori=0to2e3:next:print"{blk}{clr}{down}{down}{down}lO"chr$(34)"ddd.konj"chr$(34)",8:":fori=0to9:print"rU:":next:print"{home}":poke631,13:poke632,13:poke198,2:end
403 print"schloss{home}":poke2,2:goto402
404 print"tempel{home}":poke2,10:goto402
405 print"turm{home}":poke2,11:goto402
406 print"höhle{home}":poke2,12:goto402
407 print"burg{home}":poke2,14-(peek(49155)=116):goto402
408 sys5681:print"drachenhort{home}":poke2,13:goto402
409 sys5681:print"schädelfeste{home}":poke2,16:goto402
410 print"stadt{yel}{home}":sys5681:ifpeek(49154)=82andpeek(49155)=49thenprint"*** trisdic ***{home}":poke2,3:goto402
411 ifpeek(49154)=48andpeek(49155)=36thenprint"*** worthal ***{home}":poke2,4:goto402
412 ifpeek(49154)=25andpeek(49155)=46thenprint"****  gaht  ****{home}":poke2,5:goto402
413 ifpeek(49154)=31andpeek(49155)=113thenprint"***  ackbah  ***{home}":poke2,6:goto402
414 ifpeek(49154)=12andpeek(49155)=61thenprint"***  mubrak  ***{home}":poke2,9:goto402
415 ifpeek(49154)=104andpeek(49155)=58thenprint"** damraskan **{home}":poke2,7:goto402
416 ifpeek(49154)=108andpeek(49155)=25thenprint"***  muspel  ***{home}":poke2,8:goto402
417 print"von bord";:ifj<>4thenprint"{left}{left}{left}{left}{left}{left}{left}{left}absteigen{home}
418 poke49156+j,peek(49154):poke49160+j,peek(49155):poke49157,1:goto4
419 ifj=4thenprint"an bord{home}":goto423
420 poke49346,.:print"besteige{home}":sys5681:ifj=2thenprint"pferd{home}
421 ifj=3thenprintm$(12)
422 ifj=5thenprintm$(7)
423 poke49157,j:poke49156+j,255:poke49160+j,255:goto4
424 ifpeek(49347)=.goto33
425 print"position{home}":sys5681:print"bestimmen{home}":sys5681:print"{cyn} länge: ";:j=peek(49154)+12:k=int(j/16):printchr$(65+k)"& ";:printchr$(65+j-16*k)"'{home}":sys5681:print"{cyn}breite: ";:j=peek(49155)+12:k=int(j/16):printchr$(65+k)"& "chr$(65+j-16*k)"'{home}":goto4
426 print"suchen";:fori=1to5:print".";:wait2568,48:wait2568,12:next:sys5681:print"{yel}du findest{home}":sys5681:x=peek(49154):y=peek(49155):h=0:ifx=48andy=138andpeek(49353)=.thenh=1
427 ifx=48andy=106andpeek(49265)=.thenh=2
428 ifx=17andy=63andpeek(49263)=.thenh=3
429 ifx=76andy=121thenh=4
430 ifh=1thenprint"den schatz von{home}":sys5681:print"uyrp. es sind{home}
431 ifh=1thensys5681:print"1000 goldstücke!{home}":poke49353,1:g=1e3:goto257
432 ifh=2thenprint"die magische{home}":sys5681:printw$(18)"{left}ge{home}
433 ifh=2thensys5681:print"sicaria draconem{home}":poke49265,1
434 ifh=3thenprint"die berühmte{home}":sys5681:printw$(16)".{home}":poke49263,1
435 ifh=4thenprint"die seltene{home}":sys5681:j=peek(49343)+fnr(12):ifj>99thenj=99
436 ifh=4thenpoke49343,j:print"alraune-wurzel.{home}
437 ifh=4thensys5681:print"du hast jetzt"j;:sys5681:print"stück.{home}
438 ifh=.thenprint"nichts.{home}
439 goto4
440 ifpeek(49157)<>4goto33
441 print"katapult{home}":sys5681:print"{yel}-richtung? {wht}G{left}";:z=0
442 z=z+1:ifz>600thenprint"keine{home}":goto4
443 getu$:ifu$=""goto442
444 ifu$="{up}"thenr=.:print"nord{home}":goto449
445 ifu$="{down}"thenr=1:print"süd{home}":goto449
446 ifu$="{left}"thenr=2:print"west{home}":goto449
447 ifu$="{rght}"thenr=3:print"ost{home}":goto449
448 z=666:goto442
449 h=892:x=0:y=0:hq=30:poke51221,15:gosub590
450 pokeh,hq:h=h+11*(r=.)-11*(r=1)+(r=2)-(r=3):hq=peek(h):pokeh,21:sys4361:x=x+(r=2)-(r=3):y=y+(r=.)-(r=1):ifhq>31andfnr(20)<=gegoto453
451 ifabs(x)=3orabs(y)=3orhq=5orhq=9thenpokeh,hq:sys4361:sys5681:print"{lred}daneben!{home}":goto4
452 goto450
453 poke51223,10:pokeh,23:sys4361:gosub592:fori=0to9:ifpeek(49188+i)=((256+x)and255)andpeek(49198+i)=((256+y)and255)goto455
454 next:goto451
455 j=peek(49168+i):ifj=.goto454
456 poke49168+i,0:sys5681:print"{lred}"m$(j-32):sys5681:print"vertrieben!{home}":goto4
457 print"{left}  {home}":gosub591:fori=1to6:sys5681:next:print"{blk}    p a u s e{home}":fori=1to5:sys5681:next
458 fori=0to4:poke56044+i+i,fnr(15):next:getu$:ifu$=""goto458
459 fori=1to7:sys5681:next:return
460 print"abspeichern{home}":sys5681:print"{lgrn}bisher";:gosub529:sys5681:gosub610
463 poke198,0:sys5681:print"%return%. {wht}G{left}";
464 getu$:ifu$<>chr$(13)goto464
465 print" {home}":goto4
466 hp=peek(49230)+256*peek(49231):u$="00"+mid$(str$(hp),2):print"{home}{down}{down}"spc(31)"{lgrn}"right$(u$,3);:hm=peek(49232)+256*peek(49233):u$="00"+mid$(str$(hm),2):print"{rght}"right$(u$,3):as=peek(49234)+256*peek(49235):u$="00"+mid$(str$(as),2):printspc(31)"{up}{cyn}"right$(u$,3);:am=peek(49236)+256*peek(49237):u$="00"+mid$(str$(am),2):print"{rght}"right$(u$,3)
467 at=peek(49228):u$="0"+mid$(str$(at),2):print"{lred}"spc(29)right$(u$,2);:pa=peek(49229):u$="0"+mid$(str$(pa),2):print"{grn}"spc(6)right$(u$,2):sr=peek(49224):u$="0"+mid$(str$(sr),2):print"{pur}{up}"spc(29)right$(u$,2);:ge=peek(49225):u$="0"+mid$(str$(ge),2):print"{yel}"spc(6)right$(u$,2):kg=peek(49226):u$="0"+mid$(str$(kg),2):print"{gry3}"spc(29)right$(u$,2);
468 ch=peek(49227):u$="0"+mid$(str$(ch),2):print"{lblu}"spc(6)right$(u$,2):ef=peek(49238)+256*peek(49239)+65536*peek(49240):u$="00000"+mid$(str$(ef),2):print"{up}{lgrn}"spc(29)right$(u$,6);:su=peek(49241):u$="0"+mid$(str$(su),2):print"{rght}"right$(u$,2):gp=peek(49242)+256*peek(49243):u$="0000"+mid$(str$(gp),2):print"{yel}"spc(34)right$(u$,5)
469 na=peek(49244):u$="00"+mid$(str$(na),2):print"{up}{orng}"spc(36)right$(u$,3):printspc(24)"{lgrn}g ";:po=peek(49245):poke1449,32-16*(po>0)+po:ifpo=.thenprint"{left}{left}{wht}g
470 wf=peek(49246):rs=peek(49247):sh=peek(49248):return
471 poke53281,0:poke53280,0:poke53272,18:sys5454:sys4812:s=54272:poke650,255:poke51211,8:j=peek(49246):ifjthenifpeek(49247+j)=0thenpoke49246,0
472 dimm$(37),w$(27):fori=0to37:readm$(i):next:fori=0to27:readw$(i):next:j=peek(49247):ifjthenifpeek(49266+j)=0thenpoke49247,0
473 deffnr(x)=int(x*rnd(ti)+1):fori=0to2:poke55723+i,4:next:j=peek(49167):ifjthenifpeek(49272+j)=0thenpoke49167,0
474 dimz$(15),g$(7):fori=0to15:readz$(i):next:fori=0to7:readg$(i):next:gosub623
475 print"{home}{down}{down}"spc(24)"{lgrn}vital.:   (   )":printspc(24)"{up}{cyn}astral:   (   )":printspc(24)"{lred}ang.:   {grn}ver.:":printspc(24)"{up}{pur}str.:   {yel}ges.:":printspc(24)"{gry3}klg.:   {lblu}cha.:":printspc(24)"{up}{lgrn}erf.:      (  )":printspc(24)"{yel}goldstck.:":printspc(24)"{up}{orng}nahr.vorrat:":sys64931:pokes+24,15:goto466
476 poke2,3:sys5782:poke2,4:fori=1to90:sys5856:next:poke2,70:sys5856
477 poke2,24:fori=1to3:sys5856:next:poke2,25:sys5856:sys5856:goto64
478 poke2,4:sys5782:poke2,70:fori=1to20:sys5856:next:poke2,3:fori=1to8:sys5856:next:goto477
479 poke2,3:sys5782:poke2,6:fori=1to88:sys5856:next:poke2,70:sys5856:poke2,2:fori=1to20:sys5856:next:poke2,4:fori=1to4:sys5856:next:poke2,24:sys5856:sys5856:goto64
480 q=7:poke2,7:sys5782:poke2,3:fori=1to3:sys5856:next:poke2,24:fori=1to3:sys5856:next:poke2,25:sys5856:sys5856:goto64
481 poke2,3:sys5782:poke2,4:fori=1to6:sys5856:next:poke2,70:sys5856:sys5856:poke2,24:fori=1to12:sys5856:next:poke2,25:fori=1to6:sys5856:next:poke2,7:fori=1to4:sys5856:next:goto64
482 fori=0to54:poke832+i,1:next:fori=1to6:poke887+11*rnd(ti),2:next:fori=1to8:poke876+11*rnd(1),2:next:poke887+11*rnd(ti),24:goto67
483 goto600
484 ifk<5thenx=5:y=5:gosub520:goto69
485 gosub504:fori=0tomz
486 x(i)=int(3*rnd(ti)+8):y(i)=int(9*rnd(ti)+1):z=832+x(i)+11*y(i):z1=peek(50938+m(i)):ifpeek(z)>11goto486
487 ifz1=0andpeek(z)<3goto486
488 ifz1=1andpeek(z)>2goto486
489 l(i)=peek(50672+m(i)):q(i)=peek(z):pokez,m(i)+32:next:goto69
490 k=22:poke892,54:sys4361:print"{left}{lred}brückentrolle{home}
491 sys5681:poke198,0:print"überfallen dich!{home}":sys5681:goto58
492 k=26:poke892,58:sys4361:print"{left}{lred}waldschrate{home}":goto491
493 k=28:poke892,60:sys4361:print"{left}{lred}moorleichen{home}":goto491
494 x=6:ifk<10goto496
495 fori=66to120:poke832+i,1:next:fori=1to6:poke887+11*rnd(ti),2:next:fori=1to10:poke876+22*rnd(ti),7:next:fori=1to8:poke898+11*rnd(ti),2:next:poke887+11*rnd(ti),24:y=8:gosub499:l=5:gosub515:l=1:goto69:poke2,k:sys5782
496 poke2,l:sys5782:ifk=2goto498
497 y=5:gosub499:gosub520:goto69
498 y=3:gosub499:y=7:gosub499:gosub524:goto69
499 gosub501:fori=0to2:forj=2+(i=1)to9:poke821+11*(i+y)+j,11:nextj,i:j=837+11*y:pokej-1,85:pokej+3,85:ify>5thenfori=2to3:pokej-1-11*i,11:pokej+2-11*i,11:next
500 return
501 fori=0to3:poke51467+256*i,98:next:return
502 poke51467,94:poke51723,95:poke51979,96:poke52235,97:return
503 gosub499:pokej+21,11:pokej+25,11:pokej+32,11:pokej+36,11:return
504 mz=int(sqr(su)*1.74*rnd(ti)):fori=0to10:g(i)=0:next:ifl=11andk=22thenfori=0tomz:m(i)=22:next:return
505 ifk<>2goto508
506 m$(34)="pirat":fori=0tomz:m(i)=34:ifsu>8andrnd(ti)<.25thenm(i)=36
507 next:return
508 j=int(mz/(1+rnd(ti))):fori=0toj:m(i)=k:next:ifmz-j=.thenreturn
509 fori=j+1tomz
510 z=int(38*rnd(ti)):ifpeek(50596+z)>suorpeek(50900+z)<>peek(50900+k)goto510
511 ifz=2goto510
512 z1=peek(50938+m(0)):ifz1=2thenz1=1:ifpeek(832)>2thenz1=0
513 ifpeek(50938+z)<2andz1<>peek(50938+z)goto510
514 m(i)=z:next:return
515 gosub504:fori=0tomz
516 x(i)=int(9*rnd(ti)+1):y(i)=int(3*rnd(ti)):z=832+x(i)+11*y(i):z1=peek(50938+m(i)):ifpeek(z)>11goto516
517 ifz1=0andpeek(z)<3goto516
518 ifz1=1andpeek(z)>2goto516
519 l(i)=peek(50672+m(i)):q(i)=peek(z):pokez,m(i)+32:next:return
520 gosub504:fori=0tomz
521 x(i)=int(9*rnd(ti)+1):y(i)=int(3*rnd(ti)):ifrnd(ti)<.5theny(i)=10-y(i)
522 z=832+x(i)+11*y(i):ifpeek(z)>2goto521
523 l(i)=peek(50672+m(i)):q(i)=peek(z):pokez,m(i)+32:next:return
524 gosub504:fori=0tomz
525 x(i)=int(8*rnd(ti)+2):y(i)=int(2*rnd(ti)+2):z=832+x(i)+11*y(i):ifpeek(z)<>11goto525
526 l(i)=peek(50672+m(i)):q(i)=11:pokez,m(i)+32:next:return
527 sys5681:print"{wht}****************{home}":return
528 sys5681:print"{wht}*              *";:return
529 printpeek(49208)+256*peek(49209)+65536*peek(49210);:return
530 poke51226,15:sys4361:poke49230,0:gosub466:sys5681:gosub527:gosub528:gosub528:print"{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}du bist tot!{home}":gosub528:gosub527:sys5681:sys5681:print"{yel}du hast";:gosub529:sys5681:print"züge gespielt.{home}":sys5681:sys5681:print"{wht}todesursache:{home}":sys5681:ifk=1thenprint"{lgrn}gift{home}
531 ifk=2thenprint"{cyn}verhungert{home}
532 ifk=3thenprint"{lred}"m$(m(i))" hat{home}":sys5681:print"dich getötet.{home}
533 ifk=4thenprint"{cyn}verbrannt{home}
534 poke56295,1:poke2023,71:poke198,0:wait198,1:poke2,17:goto402
535 hq=q(i):sys4361:sys5681:print"getötet!{home}":sys5681:sys5681:print"du erhälst{home}":l=int((peek(50634+m(i))+.5)/z2):sys5681:printmid$(str$(l),2)" punkte.";:ifl=1thenprint"{left}{left}. ";
536 ifpeek(50900+m(i))=.thengosub607
537 sys5681:ef=ef+l:m(i)=99:ifef<.thenef=.
538 ifef>999999thenef=999999
539 k=ef:l=int(k/65536):poke49240,l:k=k-65536*l:l=int(k/256):poke49239,l:poke49238,k-256*l:goto466
540 print"inventur{home}":gosub569:i=2:gosub568:print"{wht}einhandwaffen:":i=3:forj=0to6:ifpeek(49247+j)orj=0theni=i+1:gosub568:printchr$(j+65)" "w$(j)
541 next:poke198,0:wait198,1:gosub567:i=2:gosub568:print"{wht}zweihandwaffen:":i=3:forj=7to10:ifpeek(49247+j)theni=i+1:gosub568:printchr$(j+65)" "w$(j)
542 next:poke198,0:wait198,1:gosub567:i=2:gosub568:print"{wht}fernwaffen:":i=3:forj=11to15:ifpeek(49247+j)theni=i+1:gosub568:printchr$(j+65)" "w$(j)
543 next:poke198,0:wait198,1:gosub567:i=2:gosub568:print"{wht}magische waffen":i=3:forj=16to18:ifpeek(49247+j)theni=i+1:gosub568:printchr$(j+65)" "w$(j)
544 next:poke198,0:wait198,1:gosub567:i=2:gosub568:print"{wht}rüstungen:":i=3:forj=19to25:ifpeek(49247+j)orj=19theni=i+1:gosub568:printchr$(j+46)" "w$(j)
545 next:poke198,0:wait198,1:gosub567:i=2:gosub568:print"{wht}schilde:":i=3:forj=26to27:ifpeek(49247+j)theni=i+1:gosub568:printw$(j)
546 next:poke198,0:wait198,1:gosub567:i=2:gosub568:print"{wht}weisse magie:":i=3:forj=0to7:ifpeek(49304+j)theni=i+1:gosub568:printchr$(j+65)" "z$(j)
547 next:poke198,0:wait198,1:gosub567:i=2:gosub568:print"{wht}schwarze magie:":i=3:forj=8to15:ifpeek(49304+j)theni=i+1:gosub568:printchr$(j+65)" "z$(j)
548 next:poke198,0:wait198,1:gosub567:i=2:gosub568:print"{wht}ingredienzen:":i=3:forj=0to7:i=i+1:gosub568:printright$("0"+mid$(str$(peek(49336+j)),2),2);:print" "g$(j):next:poke198,0:wait198,1:gosub567:i=2:gosub568:print"{wht}sonstiges:":i=3:ifpeek(49351)=.goto550
549 i=i+1:gosub568:print"splitter":goto552
550 ifpeek(49358)=.goto552
551 i=i+1:gosub568:print"drachenkralle
552 ifpeek(49350)=.goto554
553 i=i+1:gosub568:print"glasflöte
554 ifpeek(49348)=.goto556
555 i=i+1:gosub568:print"feuerring
556 ifpeek(49349)=.goto558
557 i=i+1:gosub568:print"eichendolch
558 ifpeek(49354)=.goto560
559 i=i+1:gosub568:print"kompass
560 ifpeek(49347)=.goto562
561 i=i+1:gosub568:print"sextant
562 ifpeek(49355)=.goto564
563 i=i+1:gosub568:print"lampe
564 ifpeek(49356)=.goto566
565 i=i+1:gosub568:printmid$(str$(peek(49356)),2)" fackeln
566 poke198,0:wait198,1:poke198,0:gosub567:sys5558:goto475
567 fori=2to11:gosub568:print"               ":next:return
568 printleft$("{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}",i)spc(24);:return
569 gosub567:i=2:gosub568:print"du trägst deine":printspc(24)"kleidung";:j=peek(49247):ifj=0goto574
570 print" und":printspc(24)"{up}darüber ein";:ifj=4orj=1thenprint"en
571 ifj=2orj>4thenprint"e
572 ifj=3thenprint
573 printspc(24)w$(19+j);
574 print".":printspc(24)"{up}als waffe hast":printspc(24)"du jetzt dein";:j=peek(49246):ifj=1orj=3orj=4orj=5orj=8orj=13thenprint:goto577
575 print"e";:ifj=2orj=6orj=7orj=10orj=12orj=14orj=17thenprint"n":goto577
576 print
577 printspc(24)"{up}"w$(j):printspc(24)"bereit.":j=peek(49167):printspc(24)"{up}du benutzt ";:ifj=0thenprint"aber":printspc(24)"kein";
578 ifj=1thenprint"den":printspc(24)"klein";
579 ifj=2thenprint"den":printspc(24)"gross";
580 print"en schild.":poke198,0:wait198,1:goto567
581 poke49244,peek(49244)-1:print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}":goto469
582 onpeek(49157)gosub584,585,585,586,584:wh=wh-1:ifwh=.orwh>2orpeek(2)=5orpeek(49346)=.goto4
583 sys4229:sys4537:sys5868:sys5998:sys4482:sys5107:sys4361:sys5681:goto15
584 sys6041:pokes+5,16:pokes+1,12:pokes+4,129:return
585 sys6041:pokes+5,2:pokes+1,12:pokes+4,129:return
586 if(peek(49208)and7)=.thensys6041:pokes+5,170:pokes+1,8:pokes+4,129
587 return
588 ifpeek(49208)and7thenreturn
589 sys6041:pokes+5,160:pokes+1,5:pokes+4,129:return
590 sys6041:pokes+5,86:pokes+1,99:pokes+4,129:return
591 sys6041:pokes+5,8:pokes+1,40+fnr(50):pokes+4,21:return
592 sys6041:pokes+5,41:pokes+1,20+fnr(20):pokes+4,129:return:dataseepferdchen,wassermann,piratenschiff,seeschlange,riesenkrake,jungdrache:datadämon,feuerechse,balrog,drache,wildpferd,auerochse,einhorn,sandviper
593 datariesenpython,speikobra,waldspinne,höhlenspinne,riesenaffe,goblin,ork:dataoger,troll,zweihaupt,zyklop,riese,waldschrat,höhlenschrat,zombie:dataskelett,vampir,ghoul,mumie,werwolf,räuber,hydra,zauberer,nesselbaum
594 datahände,messer,dolch,kurzschwert,handbeil,schwert,morgenstern,kampfstab:databastardschw.,streitaxt,zweihänder,schleuder,kurzbogen,blasrohr:datalangbogen,armbrust,magische axt,elbenbogen,zauberschwin.,kleidung
595 datawaffenrock,lederrüstung,kettenhemd,schuppenpanz.,ritterrüstung:datamag. rüstung,kleiner schild,grosser schild:datamag. licht,gift neutral.,schutzschild,wunderheilung,bannbrecher:datalichtschild,gewandtheit,totenbann,donnerkeil,gift u. galle,feuerball
596 dataflammenspur,furchtfluch,zeit gefrier.,todesblitz,mag. bombe:dataschwefel,knoblauch,ginseng,blutflechte,zirbelkraut,totenblume:datag. d. nacht,alraune
600 poke631,82:poke632,213:poke633,58:poke634,13:poke198,4:fori=0to1
601 forj=0to2:forz=3to7:poke832+i*88+11*j+z,2
602 next
603 next
604 next:poke198,0:gosub501
605 fori=3to7:forj=2to8:poke832+i*11+j,11:nextj,i:x=1:y=5:poke888,3:ifk=2thenl=3:goto63
606 goto484
607 print"{left} {home}":sys5681:l=0:print"{up}keine punkte, da"spc(24)"es ein tier war.{home}":return
610 print"züge gespielt.{home}":sys5681:sys5681:print"{wht}{rvon}yz{yel}{rvof}leg bitte eine{home}":sys5681
611 print"{wht}{rvon}äö{rvof}{yel}speicherdis-{home}":sys5681:print"kette ein und{home}":sys5681
612 print"wähle eine nr.{rvon}{wht}yz{home}":sys5681:print"{yel}von 0 bis 9   {wht}{rvon}äö{home}
613 getu$:ifu$<"0"oru$>"9"goto613
614 sys5681:sys5681:print"   speichere{home}":sys5681:print"  spiel nr. "u$"{home}
615 u$="ddd.sav"+u$:open1,8,15,"s:"+u$:close1:open1,8,1,u$+",p,w"
616 print#1,chr$(0)chr$(192);:fori=0to208:print#1,chr$(peek(49152+i));:next
617 close1:sys5681:sys5681:print"{yel}bitte lege jetzt{home}":sys5681:print"wieder die{home}
618 sys5681:print"spiel-diskette{home}":sys5681:print"ein und drücke{home}":return
619 poke51223,10:sys4361:pokeh,q(i):l=peek(50634+m(i)):sys5681:print"{yel}"m$(m(i));
620 sys5681:ifpeek(50900+m(i))=.thenl=.
621 sys5681:printmid$(str$(l),2)" punkte.";:ef=ef+l:ifef>999999thenef=999999
622 return
623 pokes+24,143:pokes+15,31:pokes+18,17:return
