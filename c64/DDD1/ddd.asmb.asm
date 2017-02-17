l01 equ $1		; Access: 1087 10D8
l02 equ $2		; Access: 1754 16C0 13AA 13BB 13B5 1698 16E6 17A4
l22 equ $22		; Access: 16F5 170C 1094 10A5 10BD 10C7 10CC 10E2 10F2 10F6 10FF 146A 1472 147B 1480 148C 14B0 14B6 14BC 14A3 14A9 132F 1338 1343 1348 13A3 13C8 1422 13C1 161F 1628 1113 1134 113F 114C 1157 115B 1160 116E 1173 1655 165C 166A 166F 17A9 17C5 17DA 17DF 1579 1583 1587 1591 1596 158F
l23 equ $23		; Access: 16FA 172C 1099 10E6 10D0 10C1 146E 1333 1119 1179 1166 163F 1662 1675 17AD 17E3 157D 159A
l24 equ $24		; Access: 1702 170A 1710 108B 10AB 10AD 10B2 10B4 10B9 10BB 10DC 10F4 10F8 13D2 14D1 14DF 14F1 1442 152F 118D 118F 11B0 11B4 1195 119B 11A1 1401 1115 112F 113A 1147 1152 1162 1175 1639 1657 165E 1778 177E 17BB 17C7 17CF 17D4
l25 equ $25		; Access: 1722 172A 1730 108F 10E8 13D7 14E5 14EB 14FC 1455 1521 1188 140C 111D 117B 1168 1643 1664 1784 178A 17BF
l57 equ $57		; Access: 1706 173A 1712 109D 10D2 1444 1449 1452 144F 1470 15F8 1514 1531 110B 1129 1159 1635 1651 1671
l58 equ $58		; Access: 1726 173F 1732 10A1 10C3 1457 145C 1465 1462 1479 15FF 1523 1519 110F 1647 1666 1677
l59 equ $59		; Access: 163B 1653 1660
l5A equ $5A		; Access: 15E2 15E6 15ED 1605 164B 1668
l5F equ $5F		; Access: 14F3 142D 1432 143B 14FE 1403 13DE 13E3 13EC 140E 1125 116A
l60 equ $60		; Top of BASIC numeric work area; Access: 16EE 16F0 1744 1717 10EC 1104 1362 136B 1370 1372 137F 139B 1393 138A 1121 117D 1320 12EC 1306 12F9 12FF 1328 1318 1310
l00A2 equ $A2		; Top of Software Jiffy clock. 0xA2 is increased every jiffy (1/60s) Access: 138C
lB6 equ $B6		; Access: 142B 1438 14F8 1503 1489 1492 15DD 1603 1510 152B 1539 16C6 13B0 13DC 13E9 1408 1413 12DC 12E5 12E3 17AF
l0334 equ $334		; Access: 1748
l033F equ $33F		; Cassette Buffer; Access: 169A
l0340 equ $340		; Cassette Buffer; Access: 16E8
l0371 equ $371		; Cassette Buffer; Access: 130D
l037B equ $37B		; Cassette Buffer; Access: 131D
l037C equ $37C		; Cassette Buffer; Access: 1751 162D
l037D equ $37D		; Cassette Buffer; Access: 1325
l0387 equ $387		; Cassette Buffer; Access: 1315
l0400 equ $400		; Start of default screen area; Access: 1561
l0417 equ $417		; Access: 156C 15AE
l0427 equ $427		; Access: 15D6
l043F equ $43F		; Access: 15C0
l044E equ $44E		; Access: 15D1
l05CF equ $5CF		; Access: 156F 15B3
l05DF equ $5DF		; Access: 15A9
l0798 equ $798		; Access: 1564 15A1
l07AF equ $7AF		; Near bottom of default screen area (23,23) from top left; Access: 15A6
l2285 equ $2285		; Access: 1632
l9FFC equ $9FFC		; Near top of basic Area; Access: 12D3
lBFB0 equ $BFB0		; Point in BASIC RAM; Access: 12CE
lC000 equ $C000		; lsb for pointer to map memory for current player position; Start of Upper RAM; Access: 1278 127E 125C 125F 1091 11D3 11D9 11F3 11F9 12B5 12BB 129E 120D 1213 1236 123C
lC001 equ $C001		; msb for pointer to map memory for current player position; Point in Upper RAM; Access: 1283 1266 1096 11FC 1201 11DE 12C0 12A3 122D 1233 1241 1218
lC002 equ $C002		; player x coordinate; Point in Upper RAM; Access: 1269 126C 1275 16FC 12A6 12A9 12B2
lC003 equ $C003		; player y coordinate; Point in Upper RAM; Access: 171C 11E1 11E4 11F0 121B 121E 122A
lC004 equ $C004		; 0,1,2 subtile position in x direction  Point in Upper RAM; Access: 124D 1250 1259 10DF 128F 1292 129B
lC005 equ $C005		; Point in Upper RAM; Access: 16F2 11B9 12DE 12F2
lC009 equ $C009		; Point in Upper RAM; Access: 16F7
lC00E equ $C00E		; Point in Upper RAM; Access: 15CB
lC00F equ $C00F		; Point in Upper RAM; Access: 16D9 14C5 14D9 15F0 1354 13B2 13F5 1625 1770 1792
lC019 equ $C019		; Point in Upper RAM; Access: 1495 149C 13B7
lC023 equ $C023		; Point in Upper RAM; Access: 1288 16CD 13CF 15F5 1516 1377 1335 1395 12C5
lC02D equ $C02D		; Point in Upper RAM; Access: 16D2 13D4 15FC 151B 137A 139D 133F 1206 1246
lC038 equ $C038		; Point in Upper RAM; Access: 1540
lC039 equ $C039		; Point in Upper RAM; Access: 1545
lC03A equ $C03A		; Point in Upper RAM; Access: 154A 15BD
lC059 equ $C059		; Point in Upper RAM; Access: 16B8
lC5A4 equ $C5A4		; Point in Upper RAM; Access: 16B2
lC6FA equ $C6FA		; Point in Upper RAM; Access: 16BD
lC720 equ $C720		; Point in Upper RAM; Access: 11AD
lC790 equ $C790		; Point in Upper RAM; Access: 118A
lC800 equ $C800		; Point in Upper RAM;Access: 112C 1137 1144 114F
lC900 equ $C900		; Point in Upper RAM;Access: 1131
lCA00 equ $CA00		; Point in Upper RAM; Access: 113C
lCB00 equ $CB00		; Point in Upper RAM; Access: 1149
lCC00 equ $CC00		; Point in Upper RAM; Access: 1154
lCD00 equ $CD00		; Point in Upper RAM; Access: 10A8
lCE00 equ $CE00		; Point in Upper RAM; Access: 10AF
lCF00 equ $CF00		; Point in Upper RAM; Access: 10B6
lD012 equ $D012		; Current raster line; Access: 16A8 135D 16E0
lD3FF equ $D3FF		; Top of VIC-II register images (one below SID audio); Access: 179D
lD83F equ $D83F		; Color RAM 0x3F (63) (1,23) from top left; Access: 15BA
lD84E equ $D84E		; Color RAM 0x4E (78) (1,1) from top right; Access: 15C8
lDC04 equ $DC04		; TIMERALO; Access: 16A1
lDC05 equ $DC05		; TIMERAHI; Access: 1381
    opt h-
    dta a($1000)	; PRG Header
    opt h-
    org $1000
u1000			; Callers: -c 1000
    lda #$01		; 1000: A9 01
    sta l033C		; 1002: 8D 3C 03
    sta l033D		; 1005: 8D 3D 03
    lda #$13		; 1008: A9 13
    sta l0314		; 100A: 8D 14 03
    lda #$10		; 100D: A9 10
    sta l0315		; 100F: 8D 15 03
    rts    		; 1012: 60
u1013			; Callers: -c 1013
    lda l033D		; 1013: AD 3D 03
    bne l101B		; 1016: D0 03
l1018			; Callers: 101E
    jmp $EA31		; 1018: 4C 31 EA
l101B			; Callers: 1016
    dec l033C		; 101B: CE 3C 03
    bne l1018		; 101E: D0 F8
    lda #$0C		; 1020: A9 0C
    sta l033C		; 1022: 8D 3C 03
    ldx #$08		; 1025: A2 08
    lda #$0F		; 1027: A9 0F
    sta lA7		; 1029: 85 A7
    lda #$0A		; 102B: A9 0A
    sta lA8		; 102D: 85 A8
    ldy #$00		; 102F: A0 00
l1031			; Callers: 103E
    lda (lA7),y		; 1031: B1 A7
    sta l02BF,x		; 1033: 9D BF 02
    lda lA7		; 1036: A5 A7
    clc    		; 1038: 18
    adc #$08		; 1039: 69 08
    sta lA7		; 103B: 85 A7
    dex    		; 103D: CA
    bne l1031		; 103E: D0 F1
    lda #$46		; 1040: A9 46
    sta lA7		; 1042: 85 A7
    ldx #$3F		; 1044: A2 3F
l1046			; Callers: 1050
    ldy #$00		; 1046: A0 00
    lda (lA7),y		; 1048: B1 A7
    iny    		; 104A: C8
    sta (lA7),y		; 104B: 91 A7
    dec lA7		; 104D: C6 A7
    dex    		; 104F: CA
    bne l1046		; 1050: D0 F4
    lda l02C5		; 1052: AD C5 02
    sta l0A08		; 1055: 8D 08 0A
    lda l02C4		; 1058: AD C4 02
    sta l0A10		; 105B: 8D 10 0A
    lda l02C7		; 105E: AD C7 02
    sta l0A18		; 1061: 8D 18 0A
    lda l02C6		; 1064: AD C6 02
    sta l0A20		; 1067: 8D 20 0A
    lda l02C3		; 106A: AD C3 02
    sta l0A28		; 106D: 8D 28 0A
    lda l02C2		; 1070: AD C2 02
    sta l0A30		; 1073: 8D 30 0A
    lda l02C1		; 1076: AD C1 02
    sta l0A38		; 1079: 8D 38 0A
    lda l02C0		; 107C: AD C0 02
    sta l0A40		; 107F: 8D 40 0A
    jmp $EA31		; 1082: 4C 31 EA
u1085			; Callers: u174E -c 1085         # candidate for map drawing routine!!!!
    lda #$36		; 0b110110 (clear bit 1)
    sta l01		; Set BASIC ROM->RAM
    lda #$40		; 1089: A9 40              #
    sta l24		; 108B: 85 24                # *(0x24) = 64
    lda #$03		; 108D: A9 03
    sta l25		; 108F: 85 25                # *(0x25) = 3
    lda lC000		; 1091: AD 00 C0
    sta l22		; 1094: 85 22                # *(0x22) = *(0xC000)  lsb map position pointer
    lda lC001		; 1096: AD 01 C0
    sta l23		; 1099: 85 23                # *(0x22) = *(0xC000)  msb map position pointer
    lda #$0B		; 109B: A9 0B
    sta l57		; 109D: 85 57                # *(0x57) = 11
l109F			; Callers: 10D4
    lda #$05		; 109F: A9 05
    sta l58		; 10A1: 85 58                # *(0x58) = 5
    ldy #$00		; 10A3: A0 00
l10A5			; Callers: 10C5
    lda (l22),y		; 10A5: B1 22
    tax    		; 10A7: AA                   # X = A
    lda lCD00,x		; 10A8: BD 00 CD
    sta (l24),y		; 10AB: 91 24
    inc l24		; 10AD: E6 24
    lda lCE00,x		; 10AF: BD 00 CE
    sta (l24),y		; 10B2: 91 24
    inc l24		; 10B4: E6 24
    lda lCF00,x		; 10B6: BD 00 CF
    sta (l24),y		; 10B9: 91 24
    inc l24		; 10BB: E6 24
    inc l22		; 10BD: E6 22
    bne l10C3		; 10BF: D0 02
    inc l23		; 10C1: E6 23
l10C3			; Callers: 10BF
    dec l58		; 10C3: C6 58
    bne l10A5		; 10C5: D0 DE
    lda l22		; 10C7: A5 22
    clc    		; 10C9: 18
    adc #$2F		; 10CA: 69 2F              # add 47 (52 - 5)
    sta l22		; 10CC: 85 22                # store in lsb temp map pointer
    bcc l10D2		; 10CE: 90 02
    inc l23		; 10D0: E6 23                # if overflow increment msb in temp map pointer
l10D2			; Callers: 10CE
    dec l57		; 10D2: C6 57                # *(0x57)--
    bne l109F		; 10D4: D0 C9              # if not zero yet jump
    lda #$37		; 10D6: A9 37              # 0b110111 (set bit 1)
    sta l01		; 10D8: 85 01                # Set BASIC RAM->ROM
    lda #$40		; 10DA: A9 40
    sta l24		; 10DC: 85 24                # *(0x24) = 64
    clc    		; 10DE: 18
    adc lC004		; 10DF: 6D 04 C0           # A = A + *(0xC004); add subtile position onto accumulator
    sta l22		; 10E2: 85 22
    lda #$03		; 10E4: A9 03
    sta l23		; 10E6: 85 23                # $22/$23 points to 0x0340 + *(0xC004) now
    sta l25		; 10E8: 85 25                # $24/$25 points to 0x0340 now
    lda #$0B		; 10EA: A9 0B
    sta l60		; 10EC: 85 60
l10EE			; Callers: 1106
    ldx #$0B		; 10EE: A2 0B
    ldy #$00		; 10F0: A0 00
l10F2			; Callers: 10FB
    lda (l22),y		; 10F2: B1 22            # fetch data from 0,1,or 2 bytes ahead
    sta (l24),y		; 10F4: 91 24            # put it into (l24); for (i=0; i<11; ++i) mem[0x340 + i] = mem[0x340 + i + *(0xC004)];
    inc l22		; 10F6: E6 22
    inc l24		; 10F8: E6 24
    dex    		; 10FA: CA
    bne l10F2		; 10FB: D0 F5              # Loop 11 times
    ldx #$04		; 10FD: A2 04
l10FF			; Callers: 1102
    inc l22		; 10FF: E6 22
    dex    		; 1101: CA
    bne l10FF		; 1102: D0 FB
    dec l60		; 1104: C6 60
    bne l10EE		; 1106: D0 E6
    rts    		; 1108: 60
u1109			; Callers: 176B -c 1109   # Hitpoint changes?
    lda #$40		;
    sta l57		;
    lda #$03		; $0340 into
    sta l58		; Arithmetic Register #3 (0x57-0x5B)
    lda #$29		; 1111: A9 29
    sta l22		; 1113: 85 22
    sta l24		; 1115: 85 24
    lda #$04		; 1117: A9 04
    sta l23		; 1119: 85 23
    lda #$D8		; 111B: A9 D8
    sta l25		; 111D: 85 25
    lda #$0B		; 111F: A9 0B
    sta l60		; 1121: 85 60
l1123			; Callers: 117F
    lda #$0B		; 1123: A9 0B
    sta l5F		; 1125: 85 5F
l1127			; Callers: 116C
    ldy #$00		; 1127: A0 00
    lda (l57),y		; 1129: B1 57
    tax    		; 112B: AA
    lda lC800,x		; 112C: BD 00 C8
    sta (l24),y		; 112F: 91 24
    lda lC900,x		; 1131: BD 00 C9
    sta (l22),y		; 1134: 91 22
    iny    		; 1136: C8
    lda lC800,x		; 1137: BD 00 C8
    sta (l24),y		; 113A: 91 24
    lda lCA00,x		; 113C: BD 00 CA
    sta (l22),y		; 113F: 91 22
    lda #$28		; 1141: A9 28
    tay    		; 1143: A8                   # Y = A
    lda lC800,x		; 1144: BD 00 C8
    sta (l24),y		; 1147: 91 24
    lda lCB00,x		; 1149: BD 00 CB
    sta (l22),y		; 114C: 91 22
    iny    		; 114E: C8
    lda lC800,x		; 114F: BD 00 C8
    sta (l24),y		; 1152: 91 24
    lda lCC00,x		; 1154: BD 00 CC
    sta (l22),y		; 1157: 91 22
    inc l57		; 1159: E6 57
    lda l22		; 115B: A5 22
    clc    		; 115D: 18
    adc #$02		; 115E: 69 02
    sta l22		; 1160: 85 22
    sta l24		; 1162: 85 24
    bcc l116A		; 1164: 90 04
    inc l23		; 1166: E6 23
    inc l25		; 1168: E6 25
l116A			; Callers: 1164
    dec l5F		; 116A: C6 5F
    bne l1127		; 116C: D0 B9
    lda l22		; 116E: A5 22
    clc    		; 1170: 18
    adc #$3A		; 1171: 69 3A
    sta l22		; 1173: 85 22
    sta l24		; 1175: 85 24
    bcc l117D		; 1177: 90 04
    inc l23		; 1179: E6 23
    inc l25		; 117B: E6 25
l117D			; Callers: 1177
    dec l60		; 117D: C6 60
    bne l1123		; 117F: D0 A2
    rts    		; 1181: 60
u1182			; Callers: 1765 -c 1182
    ldy #$00		; 1182: A0 00
    ldx #$00		; 1184: A2 00
    lda #$03		; 1186: A9 03
    sta l25		; 1188: 85 25
l118A			; Callers: 11AA
    lda lC790,x		; 118A: BD 90 C7
    sta l24		; 118D: 85 24
    lda (l24),y		; 118F: B1 24
    cmp #$14		; 1191: C9 14
    beq l11AD		; 1193: F0 18
    lda (l24),y		; 1195: B1 24
    cmp #$05		; 1197: C9 05
    beq l11AD		; 1199: F0 12
    lda (l24),y		; 119B: B1 24
    cmp #$09		; 119D: C9 09
    beq l11AD		; 119F: F0 0C
    lda (l24),y		; 11A1: B1 24
    cmp #$14		; 11A3: C9 14
    beq l11AD		; 11A5: F0 06
l11A7			; Callers: 11B6
    inx    		; 11A7: E8
    cpx #$70		; 11A8: E0 70
    bne l118A		; 11AA: D0 DE
    rts    		; 11AC: 60
l11AD			; Callers: 1193 1199 119F 11A5
    lda lC720,x		; 11AD: BD 20 C7
    sta l24		; 11B0: 85 24
    lda #$14		; 11B2: A9 14
    sta (l24),y		; 11B4: 91 24
    jmp l11A7		; 11B6: 4C A7 11
u11B9			; Callers: 1759 -c 11B9
    lda lC005		; 11B9: AD 05 C0
    clc    		; 11BC: 18
    adc #$1A		; 11BD: 69 1A
    jmp l162D		; 11BF: 4C 2D 16
    dta $A9		; 11C2: A9
    dta $8F		; 11C3: 8F
    dta $8D		; 11C4: 8D
    dta $18		; 11C5: 18
    dta $D4		; 11C6: D4
    dta $A9		; 11C7: A9
    dta $81		; 11C8: 81
    dta $8D		; 11C9: 8D
    dta $E		; 11CA: 0E
    dta $D4		; 11CB: D4
    dta $8D		; 11CC: 8D
    dta $10		; 11CD: 10
    dta $D4		; 11CE: D4
    dta $8D		; 11CF: 8D
    dta $12		; 11D0: 12
    dta $D4		; 11D1: D4
    dta $60		; 11D2: 60
u11D3			; Callers: -c 11D3       # Player moves NORTH on world map ******************************************************
    lda lC000		; 11D3: AD 00 C0
    clc    		; 11D6: 18
    adc #$CC		; 11D7: 69 CC      # = -0x34 ?
    sta lC000		; 11D9: 8D 00 C0
    bcs l11E1		; 11DC: B0 03      # branch if the add overflowed (which means subtracting 0x34 would NOT have underflowed)
    dec lC001		; 11DE: CE 01 C0   # subtracting 0x34 would have underflowed, so decrement the high byte
l11E1			; Callers: 11DC
    dec lC003		; 11E1: CE 03 C0   # *(0xc003)-- decrement ACTUAL y position
    lda lC003		; 11E4: AD 03 C0
    cmp #$04		; 11E7: C9 04      # the North/South wraparound happens with a padding of five tiles each to avoid displaying tiles from outside of the map memory!
    beq l11EE		; 11E9: F0 03      # jump if *(0xc003) == 4 (sailing to the edge of the map!)
    jmp l1204		; 11EB: 4C 04 12
l11EE			; Callers: 11E9
    lda #$96		; 11EE: A9 96
    sta lC003		; 11F0: 8D 03 C0   # set y coordinate to 150
    lda lC000		; 11F3: AD 00 C0
    clc    		; 11F6: 18
    adc #$A8		; 11F7: 69 A8      # add 168 to..
    sta lC000		; 11F9: 8D 00 C0   # low byte (an overflow cannot occur, as the player is currently in row 5 where the lsb can be 5...57!)
    lda lC001		; 11FC: AD 01 C0
    adc #$1D		; 11FF: 69 1D      # add 29 to..
    sta lC001		; 1201: 8D 01 C0   # high byte (adds 7592 =  146 * 52 to the mappointer)
l1204			; Callers: 11EB
    ldx #$0A		; 1204: A2 0A      # loop to increment content of addresses 0xC02e-0xC037
l1206			; Callers: 120A
    inc lC02D,x		; 1206: FE 2D C0
    dex    		; 1209: CA
    bne l1206		; 120A: D0 FA
    rts    		; 120C: 60
u120D			; Callers: -c 120D       # Player moves SOUTH on world map ******************************************************
    lda lC000		; 120D: AD 00 C0
    clc    		; 1210: 18
    adc #$34		; 1211: 69 34      # add 0x34 = 52 (map size?)
    sta lC000		; 1213: 8D 00 C0
    bcc l121B		; 1216: 90 03      # branch if carry clear (i.e. no overflow in the add)
    inc lC001		; 1218: EE 01 C0   # increment the high byte of the map address pointer)
l121B			; Callers: 1216
    inc lC003		; 121B: EE 03 C0   # *(0xc003)++ increment ACTUAL y position
    lda lC003		; 121E: AD 03 C0
    cmp #$97		; 1221: C9 97      # jump if *(0xc003) == 151 (sailing to the edge of the map!)
    beq l1228		; 1223: F0 03
    jmp l1244		; 1225: 4C 44 12
l1228			; Callers: 1223
    lda #$05		; 1228: A9 05
    sta lC003		; 122A: 8D 03 C0
    lda lC001		; 122D: AD 01 C0
    clc    		; 1230: 18
    adc #$E3		; 1231: 69 E3
    sta lC001		; 1233: 8D 01 C0
    lda lC000		; 1236: AD 00 C0
    clc    		; 1239: 18
    adc #$58		; 123A: 69 58
    sta lC000		; 123C: 8D 00 C0
    bcs l1244		; 123F: B0 03
    dec lC001		; 1241: CE 01 C0
l1244			; Callers: 123F 1225
    ldx #$0A		; 1244: A2 0A      # loop to decrement content of addresses 0xC02e-0xC037
l1246			; Callers: 124A
    dec lC02D,x		; 1246: DE 2D C0
    dex    		; 1249: CA
    bne l1246		; 124A: D0 FA
    rts    		; 124C: 60
u124D			; Callers: -c 124D       # Player moves WEST on world map ******************************************************
    dec lC004		; 124D: CE 04 C0   # *(0xc004)-- decrement 0,1,2 subtile position (each byte represents a 3x1 set of tiles!)
    lda lC004		; 1250: AD 04 C0
    cmp #$FF		; 1253: C9 FF      # underflow 0 -> 2
    bne l1269		; 1255: D0 12
    lda #$02		; 1257: A9 02      # wrap around...
    sta lC004		; 1259: 8D 04 C0   # ...to subtile position 2
    dec lC000		; 125C: CE 00 C0   # only if we wrap we need to change the map position pointer!
    lda lC000		; 125F: AD 00 C0
    cmp #$FF		; 1262: C9 FF      # 0-1 -> 0xff underflow!
    bne l1269		; 1264: D0 03      # branch if no underflow occured
    dec lC001		; 1266: CE 01 C0   # otherwise: underflow, decrement high byte of map address pointer
l1269			; Callers: 1255 1264
    dec lC002		; 1269: CE 02 C0   # *(0xc003)++ decrement ACTUAL x position
    lda lC002		; 126C: AD 02 C0
    cmp #$FF		; 126F: C9 FF      # did we underflow (0-1 = ff)?
    bne l1286		; 1271: D0 13      # no: jump
    lda #$9B		; 1273: A9 9B      # yes: set x position...
    sta lC002		; 1275: 8D 02 C0   # .. to 155
    lda lC000		; 1278: AD 00 C0
    clc    		; 127B: 18
    adc #$34		; 127C: 69 34      # increment the map position pointer to teh end of the row
    sta lC000		; 127E: 8D 00 C0
    bcc l1286		; 1281: 90 03      # did the add overflow? no: jump, yes: continue
    inc lC001		; 1283: EE 01 C0   # increment high byte
l1286			; Callers: 1271 1281
    ldx #$0A		; 1286: A2 0A      # loop to increment content of addresses 0xC024-0xC02d
l1288			; Callers: 128C
    inc lC023,x		; 1288: FE 23 C0
    dex    		; 128B: CA
    bne l1288		; 128C: D0 FA
    rts    		; 128E: 60
u128F			; Callers: -c 128F       # Player moves EAST on world map ******************************************************
    inc lC004		; 128F: EE 04 C0   # *(0xc004)-- increment ACTUAL x position
    lda lC004		; 1292: AD 04 C0
    cmp #$03		; 1295: C9 03
    bne l12A6		; 1297: D0 0D
    lda #$00		; 1299: A9 00
    sta lC004		; 129B: 8D 04 C0
    inc lC000		; 129E: EE 00 C0   # increment
    bne l12A6		; 12A1: D0 03      # branch if no overflow...
    inc lC001		; 12A3: EE 01 C0   # ..otherwise increment high byte
l12A6			; Callers: 1297 12A1
    inc lC002		; 12A6: EE 02 C0
    lda lC002		; 12A9: AD 02 C0
    cmp #$9C		; 12AC: C9 9C
    bne l12C3		; 12AE: D0 13
    lda #$00		; 12B0: A9 00
    sta lC002		; 12B2: 8D 02 C0
    lda lC000		; 12B5: AD 00 C0
    clc    		; 12B8: 18
    adc #$CC		; 12B9: 69 CC
    sta lC000		; 12BB: 8D 00 C0
    bcs l12C3		; 12BE: B0 03
    dec lC001		; 12C0: CE 01 C0
l12C3			; Callers: 12AE 12BE
    ldx #$0A		; 12C3: A2 0A      # loop to increment content of addresses 0xC024-0xC02d
l12C5			; Callers: 12C9
    dec lC023,x		; 12C5: DE 23 C0
    dex    		; 12C8: CA
    bne l12C5		; 12C9: D0 FA
    rts    		; 12CB: 60
u12CC			; Callers: -c 12CC
    lda #$00		; 12CC: A9 00
    sta lBFB0		; 12CE: 8D B0 BF
    ldx #$03		; 12D1: A2 03
l12D3			; Callers: 12D7
    sta l9FFC,x		; 12D3: 9D FC 9F
    dex    		; 12D6: CA
    bne l12D3		; 12D7: D0 FA
    rts    		; 12D9: 60
l12DA			; Callers: 1322 132A 131A 1312
    lda #$00		; 12DA: A9 00
    sta lB6		; 12DC: 85 B6       # address 182
    lda lC005		; 12DE: AD 05 C0
    bne l12EC		; 12E1: D0 09
    inc lB6		; 12E3: E6 B6
l12E5			; Callers: 12F0 130A 12FD 1303
    inc lB6		; 12E5: E6 B6
    rts    		; 12E7: 60
    dta $C9		; 12E8: C9
    dta $5		; 12E9: 05
    dta $F0		; 12EA: F0
    dta $FB		; 12EB: FB
l12EC			; Callers: 12E1
    lda l60		; 12EC: A5 60
    cmp #$1C		; 12EE: C9 1C
    bpl l12E5		; 12F0: 10 F3
    lda lC005		; 12F2: AD 05 C0
    cmp #$04		; 12F5: C9 04
    beq l1306		; 12F7: F0 0D
    lda l60		; 12F9: A5 60
    cmp #$09		; 12FB: C9 09
    beq l12E5		; 12FD: F0 E6
    lda l60		; 12FF: A5 60
    cmp #$03		; 1301: C9 03
    bmi l12E5		; 1303: 30 E0
    rts    		; 1305: 60
l1306			; Callers: 12F7
    lda l60		; 1306: A5 60
    cmp #$02		; 1308: C9 02
    bpl l12E5		; 130A: 10 D9
    rts    		; 130C: 60
u130D			; Callers: -c 130D      # Player wants to go NORTH on world map
    lda l0371		; 130D: AD 71 03
    sta l60		; 1310: 85 60
    jmp l12DA		; 1312: 4C DA 12
u1315			; Callers: -c 1315      # Player wants to go SOUTH on world map
    lda l0387		; 1315: AD 87 03
    sta l60		; 1318: 85 60
    jmp l12DA		; 131A: 4C DA 12
u131D			; Callers: -c 131D      # Player wants to go WEST on world map
    lda l037B		; 131D: AD 7B 03
    sta l60		; 1320: 85 60
    jmp l12DA		; 1322: 4C DA 12
u1325			; Callers: -c 1325      # Player wants to go EAST on world map
    lda l037D		; 1325: AD 7D 03
    sta l60		; 1328: 85 60       # Store A in Address 96
    jmp l12DA		; 132A: 4C DA 12
l132D			; Callers: 13A0 1417
    lda #$34		; 132D: A9 34
    sta l22		; 132F: 85 22
    lda #$03		; 1331: A9 03
    sta l23		; 1333: 85 23
    ldy lC023,x		; 1335: BC 23 C0
l1338			; Callers: 133D
    inc l22		; 1338: E6 22
    dey    		; 133A: 88
    cpy #$FA		; 133B: C0 FA
    bne l1338		; 133D: D0 F9
    ldy lC02D,x		; 133F: BC 2D C0
    clc    		; 1342: 18
l1343			; Callers: 134D
    lda l22		; 1343: A5 22
    clc    		; 1345: 18
    adc #$0B		; 1346: 69 0B
    sta l22		; 1348: 85 22
    dey    		; 134A: 88
    cpy #$FA		; 134B: C0 FA
    bne l1343		; 134D: D0 F4
    ldy #$00		; 134F: A0 00
    rts    		; 1351: 60
l1352			; Callers: 16C8
    ldx #$0A		; 1352: A2 0A
l1354			; Callers: 135A
    lda lC00F,x		; 1354: BD 0F C0
    beq l135D		; 1357: F0 04
    dex    		; 1359: CA
    bne l1354		; 135A: D0 F8
    rts    		; 135C: 60
l135D			; Callers: 1357
    lda lD012		; 135D: AD 12 D0
    and #$0F		; 1360: 29 0F
    sta l60		; 1362: 85 60
    cmp #$0B		; 1364: C9 0B
    bpl l136B		; 1366: 10 03
    jmp l1372		; 1368: 4C 72 13
l136B			; Callers: 1366
    lda l60		; 136B: A5 60
    clc    		; 136D: 18
    adc #$F8		; 136E: 69 F8
    sta l60		; 1370: 85 60
l1372			; Callers: 1368
    lda l60		; 1372: A5 60
    clc    		; 1374: 18
    adc #$FB		; 1375: 69 FB
    sta lC023,x		; 1377: 9D 23 C0
    sta lC02D,x		; 137A: 9D 2D C0
    lda #$05		; 137D: A9 05
    sta l60		; 137F: 85 60
    lda lDC05		; 1381: AD 05 DC
    and #$01		; 1384: 29 01
    beq l138C		; 1386: F0 04
    lda #$FB		; 1388: A9 FB
    sta l60		; 138A: 85 60
l138C			; Callers: 1386
    lda a:l00A2		; 138C: AD A2 00
    and #$40		; 138F: 29 40
    beq l139B		; 1391: F0 08
    lda l60		; 1393: A5 60
    sta lC023,x		; 1395: 9D 23 C0
    jmp l13A0		; 1398: 4C A0 13
l139B			; Callers: 1391
    lda l60		; 139B: A5 60
    sta lC02D,x		; 139D: 9D 2D C0
l13A0			; Callers: 1398
    jsr l132D		; 13A0: 20 2D 13
    lda (l22),y		; 13A3: B1 22
    cmp #$14		; 13A5: C9 14
    bmi l13AA		; 13A7: 30 01
    rts    		; 13A9: 60
l13AA			; Callers: 13A7
    lda l02		; 13AA: A5 02
    cmp #$02		; 13AC: C9 02
    bne l13BB		; 13AE: D0 0B
l13B0			; Callers: 1426 13C5
    lda lB6		; Load player y coordinate
    sta lC00F,x		; 13B2: 9D 0F C0
    lda l02		; Load player x coordinate
    sta lC019,x		; 13B7: 9D 19 C0
    rts    		; 13BA: 60
l13BB			; Callers: 13AE
    lda l02		; Load player x coordinate
    cmp #$01		; is it 1?
    bne l13C8		; 13BF: D0 07
    lda (l22),y		; 13C1: B1 22
    cmp #$03		; 13C3: C9 03
    bmi l13B0		; 13C5: 30 E9
    rts    		; 13C7: 60
l13C8			; Callers: 13BF
    lda (l22),y		; Load 0x22 content
    cmp #$09		; is it 9
    bmi l1422		; 13CC: 30 54
    rts    		; 13CE: 60
l13CF			; Callers: l14CE l13FE 1775
    lda lC023,x		; Copy value from 0xC023...
    sta l24		; ...to 0x24
    lda lC02D,x		; Copy value from 0xC02D...
    sta l25		; ...to 0x25
    rts    		; 13D9: 60
l13DA			; Callers: 1405 1410
    lda #$00		; 13DA: A9 00
    sta lB6		; 13DC: 85 B6
    lda l5F		; 13DE: A5 5F
    clc    		; 13E0: 18
    adc #$05		; 13E1: 69 05
    sta l5F		; 13E3: 85 5F
    and #$80		; 13E5: 29 80
    beq l13EC		; 13E7: F0 03
l13E9			; Callers: 13F0
    inc lB6		; 13E9: E6 B6
    rts    		; 13EB: 60
l13EC			; Callers: 13E7
    lda l5F		; 13EC: A5 5F
    cmp #$0B		; 13EE: C9 0B
    bpl l13E9		; 13F0: 10 F7
    rts    		; 13F2: 60
u13F3			; Callers: 1768 -c 13F3
    ldx #$0A		; 13F3: A2 0A
l13F5			; Callers: 13FB
    lda lC00F,x		; 13F5: BD 0F C0
    bne l13FE		; 13F8: D0 04
l13FA			; Callers: 140A 1415 l162A
    dex    		; 13FA: CA
    bne l13F5		; 13FB: D0 F8
    rts    		; 13FD: 60
l13FE			; Callers: 13F8
    jsr l13CF		; 13FE: 20 CF 13
    lda l24		; 1401: A5 24
    sta l5F		; 1403: 85 5F
    jsr l13DA		; 1405: 20 DA 13
    lda lB6		; 1408: A5 B6
    bne l13FA		; 140A: D0 EE
    lda l25		; 140C: A5 25
    sta l5F		; 140E: 85 5F
    jsr l13DA		; 1410: 20 DA 13
    lda lB6		; 1413: A5 B6
    bne l13FA		; 1415: D0 E3
    jsr l132D		; 1417: 20 2D 13
    jmp l161F		; 141A: 4C 1F 16
    dta $0		; 141D: 00
    dta $0		; 141E: 00
    dta $0		; 141F: 00
    dta $0		; 1420: 00
    dta $0		; 1421: 00
l1422			; Callers: 13CC
    lda (l22),y		; 1422: B1 22
    cmp #$03		; 1424: C9 03
    bpl l13B0		; 1426: 10 88
    rts    		; 1428: 60
l1429			; Callers: 14F5 1500
    lda #$00		; 1429: A9 00
    sta lB6		; 142B: 85 B6
    lda l5F		; 142D: A5 5F
    clc    		; 142F: 18
    adc #$06		; 1430: 69 06
    sta l5F		; 1432: 85 5F
    and #$80		; 1434: 29 80
    beq l143B		; 1436: F0 03
l1438			; Callers: 143F
    inc lB6		; 1438: E6 B6
    rts    		; 143A: 60
l143B			; Callers: 1436
    lda l5F		; 143B: A5 5F
    cmp #$0D		; 143D: C9 0D
    bpl l1438		; 143F: 10 F7
    rts    		; 1441: 60
l1442			; Callers: 1507 1525
    lda l24		; 1442: A5 24
    sta l57		; 1444: 85 57
    bne l1449		; 1446: D0 01
    rts    		; 1448: 60
l1449			; Callers: 1446
    lda l57		; 1449: A5 57
    and #$80		; 144B: 29 80
    bne l1452		; 144D: D0 03
    dec l57		; 144F: C6 57
    rts    		; 1451: 60
l1452			; Callers: 144D
    inc l57		; 1452: E6 57
    rts    		; 1454: 60
l1455			; Callers: 150A 1533
    lda l25		; 1455: A5 25
    sta l58		; 1457: 85 58
    bne l145C		; 1459: D0 01
    rts    		; 145B: 60
l145C			; Callers: 1459
    lda l58		; 145C: A5 58
    and #$80		; 145E: 29 80
    bne l1465		; 1460: D0 03
    dec l58		; 1462: C6 58
    rts    		; 1464: 60
l1465			; Callers: 1460
    inc l58		; 1465: E6 58
    rts    		; 1467: 60
l1468			; Callers: l15DA
    lda #$34		; 1468: A9 34
    sta l22		; 146A: 85 22
    lda #$03		; 146C: A9 03
    sta l23		; 146E: 85 23
    ldy l57		; 1470: A4 57
l1472			; Callers: 1477
    inc l22		; 1472: E6 22
    dey    		; 1474: 88
    cpy #$FA		; 1475: C0 FA
    bne l1472		; 1477: D0 F9
    ldy l58		; 1479: A4 58
l147B			; Callers: 1485
    lda l22		; 147B: A5 22
    clc    		; 147D: 18
    adc #$0B		; 147E: 69 0B
    sta l22		; 1480: 85 22
    dey    		; 1482: 88
    cpy #$FA		; 1483: C0 FA
    bne l147B		; 1485: D0 F4
    lda #$00		; 1487: A9 00
    sta lB6		; 1489: 85 B6
    tay    		; 148B: A8
    lda (l22),y		; 148C: B1 22
    cmp #$20		; 148E: C9 20
    bmi l1495		; 1490: 30 03
l1492			; Callers: 14B4 14BA 14C0 14AD
    inc lB6		; 1492: E6 B6
l1494			; Callers: 149A 14A7
    rts    		; 1494: 60
l1495			; Callers: 1490
    lda lC019,x		; 1495: BD 19 C0
    cmp #$02		; 1498: C9 02
    beq l1494		; 149A: F0 F8
    lda lC019,x		; 149C: BD 19 C0
    cmp #$01		; 149F: C9 01
    bne l14B0		; 14A1: D0 0D
    lda (l22),y		; 14A3: B1 22
    cmp #$03		; 14A5: C9 03
    bmi l1494		; 14A7: 30 EB
    lda (l22),y		; 14A9: B1 22
    cmp #$1B		; 14AB: C9 1B
    bmi l1492		; 14AD: 30 E3
    rts    		; 14AF: 60
l14B0			; Callers: 14A1
    lda (l22),y		; 14B0: B1 22
    cmp #$03		; 14B2: C9 03
    bmi l1492		; 14B4: 30 DC
    lda (l22),y		; 14B6: B1 22
    cmp #$09		; 14B8: C9 09
    beq l1492		; 14BA: F0 D6
    lda (l22),y		; 14BC: B1 22
    cmp #$0A		; 14BE: C9 0A
    beq l1492		; 14C0: F0 D0
    rts    		; 14C2: 60
l14C3			; Callers: 175F
    ldx #$0A		; 14C3: A2 0A
l14C5			; Callers: 14CB
    lda lC00F,x		; 14C5: BD 0F C0
    bne l14CE		; 14C8: D0 04
l14CA			; Callers: 14DC 14FA 1505 151E 153D
    dex    		; 14CA: CA
    bne l14C5		; 14CB: D0 F8
    rts    		; 14CD: 60
l14CE			; Callers: 14C8
    jsr l13CF		; 14CE: 20 CF 13
    lda l24		; 14D1: A5 24
    cmp #$10		; 14D3: C9 10
    bne l14DF		; 14D5: D0 08
l14D7			; Callers: 14E3 14E9 14EF
    lda #$00		; 14D7: A9 00
    sta lC00F,x		; 14D9: 9D 0F C0
    jmp l14CA		; 14DC: 4C CA 14
l14DF			; Callers: 14D5
    lda l24		; 14DF: A5 24
    cmp #$F0		; 14E1: C9 F0
    beq l14D7		; 14E3: F0 F2
    lda l25		; 14E5: A5 25
    cmp #$10		; 14E7: C9 10
    beq l14D7		; 14E9: F0 EC
    lda l25		; 14EB: A5 25
    cmp #$F0		; 14ED: C9 F0
    beq l14D7		; 14EF: F0 E6
    lda l24		; 14F1: A5 24
    sta l5F		; 14F3: 85 5F
    jsr l1429		; 14F5: 20 29 14
    lda lB6		; 14F8: A5 B6
    bne l14CA		; 14FA: D0 CE
    lda l25		; 14FC: A5 25
    sta l5F		; 14FE: 85 5F
    jsr l1429		; 1500: 20 29 14
    lda lB6		; 1503: A5 B6
    bne l14CA		; 1505: D0 C3
    jsr l1442		; 1507: 20 42 14
    jsr l1455		; 150A: 20 55 14
    jsr l15DA		; 150D: 20 DA 15
    lda lB6		; 1510: A5 B6
    bne l1521		; 1512: D0 0D
l1514			; Callers: 152D 153B
    lda l57		; 1514: A5 57
    sta lC023,x		; 1516: 9D 23 C0
    lda l58		; 1519: A5 58
    sta lC02D,x		; 151B: 9D 2D C0
    jmp l14CA		; 151E: 4C CA 14
l1521			; Callers: 1512
    lda l25		; 1521: A5 25
    sta l58		; 1523: 85 58
    jsr l1442		; 1525: 20 42 14
    jsr l15DA		; 1528: 20 DA 15
    lda lB6		; 152B: A5 B6
    beq l1514		; 152D: F0 E5
    lda l24		; 152F: A5 24
    sta l57		; 1531: 85 57
    jsr l1455		; 1533: 20 55 14
    jsr l15DA		; 1536: 20 DA 15
    lda lB6		; 1539: A5 B6
    beq l1514		; 153B: F0 D7
    jmp l14CA		; 153D: 4C CA 14
u1540			; Callers: -c 1540
    inc lC038		; 1540: EE 38 C0
    bne l154D		; 1543: D0 08
    inc lC039		; 1545: EE 39 C0
    bne l154D		; 1548: D0 03
    inc lC03A		; 154A: EE 3A C0
l154D			; Callers: 1543 1548
    rts    		; 154D: 60
u154E			; Callers: -c 154E
    lda #$9A		; {light blue}
    jsr $F1CA		; CHROUT
    lda #$93		; {home}
    jsr $F1CA		; CHROUT
    lda #$B0		; B0 is part of the player head char
    jsr l1608		; (first command after jump is CHROUT)
    ldx #$16		; 155D: A2 16
    lda #$40		; 155F: A9 40
l1561			; Callers: 1568
    sta l0400,x		; 1561: 9D 00 04
    sta l0798,x		; 1564: 9D 98 07
    dex    		; 1567: CA
    bne l1561		; 1568: D0 F7
    ldx #$0F		; 156A: A2 0F
l156C			; Callers: 1573
    sta l0417,x		; 156C: 9D 17 04
    sta l05CF,x		; 156F: 9D CF 05
    dex    		; 1572: CA
    bne l156C		; 1573: D0 F7
    ldx #$16		; 1575: A2 16
    lda #$28		; 1577: A9 28
    sta l22		; 1579: 85 22
    lda #$04		; 157B: A9 04
    sta l23		; 157D: 85 23
l157F			; Callers: 159D
    ldy #$00		; 157F: A0 00
    lda #$23		; 1581: A9 23
    sta (l22),y		; 1583: 91 22
    ldy #$17		; 1585: A0 17
    sta (l22),y		; 1587: 91 22
    cpx #$0D		; 1589: E0 0D
    bmi l1591		; 158B: 30 04
    ldy #$27		; 158D: A0 27
    sta (l22),y		; 158F: 91 22
l1591			; Callers: 158B
    lda l22		; 1591: A5 22
    clc    		; 1593: 18
    adc #$28		; 1594: 69 28
    sta l22		; 1596: 85 22
    bcc l159C		; 1598: 90 02
    inc l23		; 159A: E6 23
l159C			; Callers: 1598
    dex    		; 159C: CA
    bne l157F		; 159D: D0 E0
    lda #$6D		; 159F: A9 6D
    sta l0798		; 15A1: 8D 98 07
    lda #$7D		; 15A4: A9 7D
    sta l07AF		; 15A6: 8D AF 07
    sta l05DF		; 15A9: 8D DF 05
    lda #$72		; 15AC: A9 72
    sta l0417		; 15AE: 8D 17 04
    lda #$6B		; 15B1: A9 6B
    sta l05CF		; 15B3: 8D CF 05
u15B6			; Callers: -c 15B6
    ldx #$0D		; 15B6: A2 0D
l15B8			; Callers: 15C4
    lda #$01		; 15B8: A9 01
    sta lD83F,x		; 15BA: 9D 3F D8
    lda lC03A,x		; 15BD: BD 3A C0
    sta l043F,x		; 15C0: 9D 3F 04
    dex    		; 15C3: CA
    bne l15B8		; 15C4: D0 F2
    lda #$01		; 15C6: A9 01
    sta lD84E		; 15C8: 8D 4E D8
    lda lC00E		; 15CB: AD 0E C0
    clc    		; 15CE: 18
    adc #$1E		; 15CF: 69 1E
    sta l044E		; 15D1: 8D 4E 04
    lda #$6E		; 15D4: A9 6E
    sta l0427		; 15D6: 8D 27 04
    rts    		; 15D9: 60
l15DA			; Callers: 150D 1528 1536
    jsr l1468		; 15DA: 20 68 14
    lda lB6		; 15DD: A5 B6
    beq l15E2		; 15DF: F0 01
    rts    		; 15E1: 60
l15E2			; Callers: 15DF
    stx l5A		; 15E2: 86 5A
    ldx #$0A		; 15E4: A2 0A
l15E6			; Callers: 15EB
    cpx l5A		; 15E6: E4 5A
    bne l15F0		; 15E8: D0 06
l15EA			; Callers: 15F3 15FA 1601
    dex    		; 15EA: CA
    bne l15E6		; 15EB: D0 F9
    ldx l5A		; 15ED: A6 5A
    rts    		; 15EF: 60
l15F0			; Callers: 15E8
    lda lC00F,x		; 15F0: BD 0F C0
    beq l15EA		; 15F3: F0 F5
    lda lC023,x		; 15F5: BD 23 C0
    cmp l57		; 15F8: C5 57
    bne l15EA		; 15FA: D0 EE
    lda lC02D,x		; 15FC: BD 2D C0
    cmp l58		; 15FF: C5 58
    bne l15EA		; 1601: D0 E7
    inc lB6		; 1603: E6 B6
    ldx l5A		; 1605: A6 5A
    rts    		; 1607: 60
l1608			; Callers: 155A
    jsr $F1CA		; CHROUT
    lda #$20		; {space}
    ldx #$18		; x=24
l160F			; Callers: 1618
    ldy #$28		; y=40
l1611			; Callers: 1615
    jsr $F1CA		; CHROUT
    dey    		; y--
    bne l1611		; if y>0 jump 1611
    dex    		; x--
    bne l160F		; if x>0 jump 160f (outputs 24*40 spaces, clears screen)
    lda #$13		; {home}
    jmp $F1CA		; CHROUT
l161F			; Callers: 141A
    lda (l22),y		; Load value from address 0x22 (temporary area)
    cmp #$14		; == 0x14 (20) ?
    beq l162A		; if yes jump 13FA (via 162A)
    lda lC00F,x		; Load value from 0xC00F (upper RAM)...
    sta (l22),y		; ...and write into 0x22
l162A			; Callers: 1623
    jmp l13FA		; 162A: 4C FA 13
l162D			; Callers: 11BF
    sta l037C		; 162D: 8D 7C 03
    rts    		; 1630: 60
u1631			; Callers: -c 1631
    jam    		; 1631: 02
    slo l2285,x		; 1632: 1F 85 22
    sta l57		; 1635: 85 57
    lda #$F7		; 1637: A9 F7
    sta l24		; 1639: 85 24
    sta l59		; 163B: 85 59
    lda #$06		; 163D: A9 06
    sta l23		; 163F: 85 23
    lda #$05		; 1641: A9 05
    sta l25		; 1643: 85 25
    lda #$DA		; 1645: A9 DA
    sta l58		; 1647: 85 58
    lda #$D9		; 1649: A9 D9
    sta l5A		; 164B: 85 5A
    ldx #$0C		; 164D: A2 0C
l164F			; Callers: 167A
    ldy #$10		; 164F: A0 10
l1651			; Callers: 165A
    lda (l57),y		; 1651: B1 57
    sta (l59),y		; 1653: 91 59
    lda (l22),y		; 1655: B1 22
    sta (l24),y		; 1657: 91 24
    dey    		; 1659: 88
    bne l1651		; 165A: D0 F5
    lda l22		; 165C: A5 22
    sta l24		; 165E: 85 24
    sta l59		; 1660: 85 59
    lda l23		; 1662: A5 23
    sta l25		; 1664: 85 25
    lda l58		; 1666: A5 58
    sta l5A		; 1668: 85 5A
    lda l22		; 166A: A5 22
    clc    		; 166C: 18
    adc #$28		; 166D: 69 28
    sta l22		; 166F: 85 22
    sta l57		; 1671: 85 57
    bcc l1679		; 1673: 90 04
    inc l23		; 1675: E6 23
    inc l58		; 1677: E6 58
l1679			; Callers: 1673
    dex    		; 1679: CA
    bne l164F		; 167A: D0 D3
    lda #$13		; 167C: A9 13
    jsr $F1CA		; 167E: 20 CA F1
    ldx #$17		; 1681: A2 17
    lda #$11		; 1683: A9 11
l1685			; Callers: 1689
    jsr $F1CA		; 1685: 20 CA F1
    dex    		; 1688: CA
    bne l1685		; 1689: D0 FA
    ldx #$18		; 168B: A2 18
    lda #$1D		; 168D: A9 1D
l168F			; Callers: 1693
    jsr $F1CA		; 168F: 20 CA F1
    dex    		; 1692: CA
    bne l168F		; 1693: D0 FA
    rts    		; 1695: 60
u1696			; Callers: -c 1696
    ldx #$79		; 1696: A2 79
    lda l02		; 1698: A5 02
l169A			; Callers: 169E
    sta l033F,x		; 169A: 9D 3F 03
    dex    		; 169D: CA
    bne l169A		; 169E: D0 FA
l16A0			; Callers: 16A6 16B0 16BB
    rts    		; 16A0: 60
l16A1			; Callers: 1762
    lda lDC04		; 16A1: AD 04 DC
    and #$F0		; 16A4: 29 F0
    bne l16A0		; 16A6: D0 F8
    lda lD012		; 16A8: AD 12 D0
    and #$3F		; 16AB: 29 3F
    tax    		; 16AD: AA
    cmp #$26		; 16AE: C9 26
    bpl l16A0		; 16B0: 10 EE
    lda lC5A4,x		; 16B2: BD A4 C5
    clc    		; 16B5: 18
    adc #$FF		; 16B6: 69 FF
    cmp lC059		; 16B8: CD 59 C0
    bpl l16A0		; 16BB: 10 E3
    lda lC6FA,x		; 16BD: BD FA C6
    sta l02		; 16C0: 85 02
    txa    		; 16C2: 8A
    clc    		; 16C3: 18
    adc #$20		; 16C4: 69 20
    sta lB6		; 16C6: 85 B6
    jmp l1352		; 16C8: 4C 52 13
l16CB			; Callers: 175C
    ldx #$0A		; 16CB: A2 0A
l16CD			; Callers: 16DD
    lda lC023,x		; 16CD: BD 23 C0
    bne l16DC		; 16D0: D0 0A
    lda lC02D,x		; 16D2: BD 2D C0
    bne l16DC		; 16D5: D0 05
    lda #$00		; 16D7: A9 00
    sta lC00F,x		; 16D9: 9D 0F C0
l16DC			; Callers: 16D0 16D5
    dex    		; 16DC: CA
    bne l16CD		; 16DD: D0 EE
    rts    		; 16DF: 60
u16E0			; Callers: -c 16E0
    lda lD012		; 16E0: AD 12 D0
    and #$7F		; 16E3: 29 7F
    tax    		; 16E5: AA
    lda l02		; 16E6: A5 02
    sta l0340,x		; 16E8: 9D 40 03
    rts    		; 16EB: 60
u16EC			; Callers: -c 16EC 1756
    lda #$04		; 16EC: A9 04
    sta l60		; 16EE: 85 60
l16F0			; Callers: 1719
    ldx l60		; 16F0: A6 60
    lda lC005,x		; 16F2: BD 05 C0
    sta l22		; 16F5: 85 22
    lda lC009,x		; 16F7: BD 09 C0
    sta l23		; 16FA: 85 23
    lda lC002		; 16FC: AD 02 C0
    clc    		; 16FF: 18
    adc #$FB		; 1700: 69 FB
    sta l24		; 1702: 85 24
    lda #$01		; 1704: A9 01
    sta l57		; 1706: 85 57
    ldx #$0B		; 1708: A2 0B
l170A			; Callers: 1715
    lda l24		; 170A: A5 24
    cmp l22		; 170C: C5 22
    beq l171C		; 170E: F0 0C
    inc l24		; 1710: E6 24
    inc l57		; 1712: E6 57
    dex    		; 1714: CA
    bne l170A		; 1715: D0 F3
l1717			; Callers: 174B 1737
    dec l60		; 1717: C6 60
    bne l16F0		; 1719: D0 D5
    rts    		; 171B: 60
l171C			; Callers: 170E
    lda lC003		; 171C: AD 03 C0
    clc    		; 171F: 18
    adc #$FB		; 1720: 69 FB
    sta l25		; 1722: 85 25
    lda #$01		; 1724: A9 01
    sta l58		; 1726: 85 58
    ldx #$0B		; 1728: A2 0B
l172A			; Callers: 1735
    lda l25		; 172A: A5 25
    cmp l23		; 172C: C5 23
    beq l173A		; 172E: F0 0A
    inc l25		; 1730: E6 25
    inc l58		; 1732: E6 58
    dex    		; 1734: CA
    bne l172A		; 1735: D0 F3
    jmp l1717		; 1737: 4C 17 17
l173A			; Callers: 172E
    lda l57		; 173A: A5 57
    clc    		; 173C: 18
l173D			; Callers: 1741
    adc #$0B		; 173D: 69 0B
    dec l58		; 173F: C6 58
    bne l173D		; 1741: D0 FA
    tax    		; 1743: AA
    lda l60		; 1744: A5 60
    adc #$1B		; 1746: 69 1B
    sta l0334,x		; 1748: 9D 34 03
    jmp l1717		; 174B: 4C 17 17
u174E			; Callers: -c 174E
    jsr u1085		; 174E: 20 85 10
    lda l037C		; 1751: AD 7C 03
    sta l02		; 1754: 85 02
    jsr u16EC		; 1756: 20 EC 16
    jsr u11B9		; 1759: 20 B9 11
    jsr l16CB		; 175C: 20 CB 16
    jsr l14C3		; 175F: 20 C3 14
    jsr l16A1		; 1762: 20 A1 16
    jsr u1182		; 1765: 20 82 11
    jsr u13F3		; 1768: 20 F3 13
    jmp u1109		; 176B: 4C 09 11
u176E			; Callers: -c 176E
    ldx #$0A		; 176E: A2 0A
l1770			; Callers: 1796
    lda lC00F,x		; 1770: BD 0F C0
    beq l1795		; 1773: F0 20
    jsr l13CF		; 1775: 20 CF 13
    lda l24		; 1778: A5 24
    cmp #$10		; 177A: C9 10
    beq l1790		; 177C: F0 12
    lda l24		; 177E: A5 24
    cmp #$F0		; 1780: C9 F0
    beq l1790		; 1782: F0 0C
    lda l25		; 1784: A5 25
    cmp #$10		; 1786: C9 10
    beq l1790		; 1788: F0 06
    lda l25		; 178A: A5 25
    cmp #$F0		; 178C: C9 F0
    bne l1795		; 178E: D0 05
l1790			; Callers: 177C 1782 1788
    lda #$00		; 1790: A9 00
    sta lC00F,x		; 1792: 9D 0F C0
l1795			; Callers: 1773 178E
    dex    		; 1795: CA
    bne l1770		; 1796: D0 D8
    rts    		; 1798: 60
u1799			; Callers: -c 1799
    ldx #$0E		; 1799: A2 0E
    lda #$00		; 179B: A9 00
l179D			; Callers: 17A1
    sta lD3FF,x		; 179D: 9D FF D3
    dex    		; 17A0: CA
    bne l179D		; 17A1: D0 FA
    rts    		; 17A3: 60
u17A4			; Callers: -c 17A4
    lda l02		; 17A4: A5 02
    clc    		; 17A6: 18
    adc #$4B		; 17A7: 69 4B
    sta l22		; 17A9: 85 22
    lda #$17		; 17AB: A9 17
    sta l23		; 17AD: 85 23
    ldx lB6		; 17AF: A6 B6
    beq l17B9		; 17B1: F0 06
l17B3			; Callers: 17B7
    jsr l17DA		; 17B3: 20 DA 17
    dex    		; 17B6: CA
    bne l17B3		; 17B7: D0 FA
l17B9			; Callers: 17B1
    lda #$3F		; 17B9: A9 3F
    sta l24		; 17BB: 85 24
    lda #$03		; 17BD: A9 03
    sta l25		; 17BF: 85 25
    ldx #$0B		; 17C1: A2 0B
l17C3			; Callers: 17D7
    ldy #$0B		; 17C3: A0 0B
l17C5			; Callers: 17CA
    lda (l22),y		; 17C5: B1 22
    sta (l24),y		; 17C7: 91 24
    dey    		; 17C9: 88
    bne l17C5		; 17CA: D0 F9
    jsr l17DA		; 17CC: 20 DA 17
    lda l24		; 17CF: A5 24
    clc    		; 17D1: 18
    adc #$0B		; 17D2: 69 0B
    sta l24		; 17D4: 85 24
    dex    		; 17D6: CA
    bne l17C3		; 17D7: D0 EA
    rts    		; 17D9: 60
l17DA			; Callers: 17CC 17B3
    lda l22		; 17DA: A5 22
    clc    		; 17DC: 18
    adc #$23		; 17DD: 69 23
    sta l22		; 17DF: 85 22
    bcc l17E5		; 17E1: 90 02
    inc l23		; 17E3: E6 23
l17E5			; Callers: 17E1
    rts    		; 17E5: 60
