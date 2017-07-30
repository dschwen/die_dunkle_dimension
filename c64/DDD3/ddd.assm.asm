l02 equ $2		; Access: C1F4 C10C C124 C185 C4A4 C4B7 C44E C3F2 C405 C396 C3A9 C36B C37E C32D C340 C353 C2EF C302 C315 C2C4 C2D7
l22 equ $22		; Access: C1FC C10E C100 C105 C12C C137 C145 C14B C154 C15E C164 C16A C179 C192 C1C8 C49C C4AF C4C2 C4CE C4D2 C4D7 C4E0 C4E4 C4E9 C446 C459 C469 C46E C474 C479 C47B C47D C486 C48B C3EA C3FD C410 C41C C420 C425 C42E C432 C437 C38E C3A1 C3B4 C3C0 C3C4 C3C9 C3D2 C3D6 C3DB C363 C376 C325 C338 C34B C2E7 C2FA C30D C2BC C2CF C73B C766 C76B C753
l23 equ $23		; Access: C200 C109 C130 C13B C17D C18E C1C4 C4A0 C4B3 C4C6 C44A C45D C48F C481 C3EE C401 C414 C392 C3A5 C3B8 C367 C37A C329 C33C C34F C2EB C2FE C311 C2C0 C2D3 C741 C771
l24 equ $24		; Access: C114 C116 C13F C147 C14F C15C C166 C16E C181 C187 C189 C19F C1B5 C1BB C1BD C1BF C1D5 C1EB C461 C491 C73D C76D C758
l25 equ $25		; Access: C745 C773
l57 equ $57		; Access: C197 C1A3 C1A5 C1A7 C1CD C1D9 C1DB C1DD C725 C72B C730 C74B C75F C764 C751
l58 equ $58		; Access: C190 C1C6 C1E3 C1D1 C1AD C19B C729 C734
l033E equ $33E		; Access: C720
l033F equ $33F		; Access: C755
l0342 equ $342		; Access: C43F
l0343 equ $343		; Access: C35C
l0344 equ $344		; Access: C2B5
l0345 equ $345		; Access: C242
l0346 equ $346		; Access: C495
l0347 equ $347		; Access: C387
l0348 equ $348		; Access: C2E0
l0349 equ $349		; Access: C263
l034A equ $34A		; Access: C208
l034C equ $34C		; Access: C3E3
l034D equ $34D		; Access: C31E
l034E equ $34E		; Access: C28C
l034F equ $34F		; Access: C225
l0571 equ $571		; Access: C26A
l0576 equ $576		; Access: C293
l0599 equ $599		; Access: C272
l059A equ $59A		; Access: C20F
l059D equ $59D		; Access: C22C
l059E equ $59E		; Access: C29B
l05C1 equ $5C1		; Access: C275
l05C2 equ $5C2		; Access: C217
l05C3 equ $5C3		; Access: C249
l05C4 equ $5C4		; Access: C24C
l05C5 equ $5C5		; Access: C234
l05C6 equ $5C6		; Access: C29E
l05E9 equ $5E9		; Access: C278
l05EA equ $5EA		; Access: C21A
l05EB equ $5EB		; Access: C24F
l05EC equ $5EC		; Access: C252
l05ED equ $5ED		; Access: C237
l05EE equ $5EE		; Access: C2A1
l0611 equ $611		; Access: C27B
l0612 equ $612		; Access: C212
l0615 equ $615		; Access: C22F
l0616 equ $616		; Access: C2A4
l0639 equ $639		; Access: C26D
l063E equ $63E		; Access: C296
lD999 equ $D999		; Access: C280
lD99E equ $D99E		; Access: C2A9
lD9C1 equ $D9C1		; Access: C283
lD9C2 equ $D9C2		; Access: C21F
lD9C3 equ $D9C3		; Access: C257
lD9C4 equ $D9C4		; Access: C25A
lD9C5 equ $D9C5		; Access: C23C
lD9C6 equ $D9C6		; Access: C2AC
lD9E9 equ $D9E9		; Access: C286
lD9EA equ $D9EA		; Access: C222
lD9EB equ $D9EB		; Access: C25D
lD9EC equ $D9EC		; Access: C260
lD9ED equ $D9ED		; Access: C23F
lD9EE equ $D9EE		; Access: C2AF
lDA11 equ $DA11		; Access: C289
lDA16 equ $DA16		; Access: C2B2
    opt h-
    dta a($C100)	; PRG Header
    opt h-
    org $C100
lC100			; Callers: C11B C151 C170 C1B2 C1E8 C4D9 C4EB C427 C439 C3CB C3DD
    lda l22		; C100: A5 22
    clc    		; C102: 18
    adc #$28		; C103: 69 28
    sta l22		; C105: 85 22
    bcc lC10B		; C107: 90 02
    inc l23		; C109: E6 23
lC10B			; Callers: C107
    rts    		; C10B: 60
lC10C			; Callers: C118 C18B C1C1
    lda l02		; C10C: A5 02
lC10E			; Callers: C111
    sta (l22),y		; C10E: 91 22
    dey    		; C110: 88
    bne lC10E		; C111: D0 FB
    rts    		; C113: 60
lC114			; Callers: C202 C132 C4AA C4BD C454 C3F8 C40B C39C C3AF C371 C384 C333 C346 C359 C2F5 C308 C31B C2CA C2DD
    sty l24		; C114: 84 24
lC116			; Callers: C11F
    ldy l24		; C116: A4 24
    jsr lC10C		; C118: 20 0C C1
    jsr lC100		; C11B: 20 00 C1
    dex    		; C11E: CA
    bne lC116		; C11F: D0 F5
    rts    		; C121: 60
lC122			; Callers: C205
    lda #$0B		; C122: A9 0B
    sta l02		; C124: 85 02
    ldx #$16		; C126: A2 16
    ldy #$16		; C128: A0 16
    lda #$28		; C12A: A9 28
    sta l22		; C12C: 85 22
    lda #$D8		; C12E: A9 D8
    sta l23		; C130: 85 23
    jsr lC114		; C132: 20 14 C1
    lda #$29		; C135: A9 29
    sta l22		; C137: 85 22
    lda #$04		; C139: A9 04
    sta l23		; C13B: 85 23
    lda #$15		; C13D: A9 15
    sta l24		; C13F: 85 24
lC141			; Callers: C158
    ldy #$00		; C141: A0 00
    lda #$4A		; C143: A9 4A
    sta (l22),y		; C145: 91 22
    ldy l24		; C147: A4 24
    lda #$4B		; C149: A9 4B
    sta (l22),y		; C14B: 91 22
    dey    		; C14D: 88
    dey    		; C14E: 88
    sty l24		; C14F: 84 24
    jsr lC100		; C151: 20 00 C1
    inc l22		; C154: E6 22
    cpy #$FF		; C156: C0 FF
    bne lC141		; C158: D0 E7
    lda #$01		; C15A: A9 01
    sta l24		; C15C: 85 24
lC15E			; Callers: C175
    dec l22		; C15E: C6 22
    ldy #$00		; C160: A0 00
    lda #$4C		; C162: A9 4C
    sta (l22),y		; C164: 91 22
    ldy l24		; C166: A4 24
    lda #$4D		; C168: A9 4D
    sta (l22),y		; C16A: 91 22
    iny    		; C16C: C8
    iny    		; C16D: C8
    sty l24		; C16E: 84 24
    jsr lC100		; C170: 20 00 C1
    cpy #$17		; C173: C0 17
    bne lC15E		; C175: D0 E7
    lda #$50		; C177: A9 50
    sta l22		; C179: 85 22
    lda #$04		; C17B: A9 04
    sta l23		; C17D: 85 23
    lda #$00		; C17F: A9 00
    sta l24		; C181: 85 24
    lda #$49		; C183: A9 49
    sta l02		; C185: 85 02
lC187			; Callers: C1B9
    inc l24		; C187: E6 24
    ldy l24		; C189: A4 24
    jsr lC10C		; C18B: 20 0C C1
    lda l23		; C18E: A5 23
    sta l58		; C190: 85 58
    lda l22		; C192: A5 22
    clc    		; C194: 18
    adc #$16		; C195: 69 16
    sta l57		; C197: 85 57
    bcc lC19D		; C199: 90 02
    inc l58		; C19B: E6 58
lC19D			; Callers: C199
    ldy #$00		; C19D: A0 00
    ldx l24		; C19F: A6 24
lC1A1			; Callers: C1B0
    lda #$49		; C1A1: A9 49
    sta (l57),y		; C1A3: 91 57
    dec l57		; C1A5: C6 57
    lda l57		; C1A7: A5 57
    cmp #$FF		; C1A9: C9 FF
    bne lC1AF		; C1AB: D0 02
    dec l58		; C1AD: C6 58
lC1AF			; Callers: C1AB
    dex    		; C1AF: CA
    bne lC1A1		; C1B0: D0 EF
    jsr lC100		; C1B2: 20 00 C1
    lda l24		; C1B5: A5 24
    cmp #$0A		; C1B7: C9 0A
    bne lC187		; C1B9: D0 CC
    inc l24		; C1BB: E6 24
lC1BD			; Callers: C1EF
    dec l24		; C1BD: C6 24
    ldy l24		; C1BF: A4 24
    jsr lC10C		; C1C1: 20 0C C1
    lda l23		; C1C4: A5 23
    sta l58		; C1C6: 85 58
    lda l22		; C1C8: A5 22
    clc    		; C1CA: 18
    adc #$16		; C1CB: 69 16
    sta l57		; C1CD: 85 57
    bcc lC1D3		; C1CF: 90 02
    inc l58		; C1D1: E6 58
lC1D3			; Callers: C1CF
    ldy #$00		; C1D3: A0 00
    ldx l24		; C1D5: A6 24
lC1D7			; Callers: C1E6
    lda #$49		; C1D7: A9 49
    sta (l57),y		; C1D9: 91 57
    dec l57		; C1DB: C6 57
    lda l57		; C1DD: A5 57
    cmp #$FF		; C1DF: C9 FF
    bne lC1E5		; C1E1: D0 02
    dec l58		; C1E3: C6 58
lC1E5			; Callers: C1E1
    dex    		; C1E5: CA
    bne lC1D7		; C1E6: D0 EF
    jsr lC100		; C1E8: 20 00 C1
    lda l24		; C1EB: A5 24
    cmp #$01		; C1ED: C9 01
    bne lC1BD		; C1EF: D0 CC
    rts    		; C1F1: 60
uC1F2			; Callers: -c C1F2                # draw dungeon data from 832 + 1..5 (ahead), 837 + 1..5 (), 842 + 1..5
    lda #$20		; C1F2: A9 20
    sta l02		; C1F4: 85 02
    ldx #$16		; C1F6: A2 16
    ldy #$16		; C1F8: A0 16
    lda #$28		; C1FA: A9 28
    sta l22		; C1FC: 85 22
    lda #$04		; C1FE: A9 04
    sta l23		; C200: 85 23
    jsr lC114		; C202: 20 14 C1
    jsr lC122		; C205: 20 22 C1
    lda l034A		; C208: AD 4A 03
    bne lC225		; C20B: D0 18
    lda #$20		; C20D: A9 20
    sta l059A		; C20F: 8D 9A 05
    sta l0612		; C212: 8D 12 06
    lda #$4E		; C215: A9 4E
    sta l05C2		; C217: 8D C2 05
    sta l05EA		; C21A: 8D EA 05
    lda #$0C		; C21D: A9 0C
    sta lD9C2		; C21F: 8D C2 D9
    sta lD9EA		; C222: 8D EA D9
lC225			; Callers: C20B
    lda l034F		; C225: AD 4F 03
    bne lC242		; C228: D0 18
    lda #$20		; C22A: A9 20
    sta l059D		; C22C: 8D 9D 05
    sta l0615		; C22F: 8D 15 06
    lda #$4E		; C232: A9 4E
    sta l05C5		; C234: 8D C5 05
    sta l05ED		; C237: 8D ED 05
    lda #$0C		; C23A: A9 0C
    sta lD9C5		; C23C: 8D C5 D9
    sta lD9ED		; C23F: 8D ED D9
lC242			; Callers: C228
    lda l0345		; C242: AD 45 03
    beq lC263		; C245: F0 1C
    lda #$4E		; C247: A9 4E
    sta l05C3		; C249: 8D C3 05
    sta l05C4		; C24C: 8D C4 05
    sta l05EB		; C24F: 8D EB 05
    sta l05EC		; C252: 8D EC 05
    lda #$0C		; C255: A9 0C
    sta lD9C3		; C257: 8D C3 D9
    sta lD9C4		; C25A: 8D C4 D9
    sta lD9EB		; C25D: 8D EB D9
    sta lD9EC		; C260: 8D EC D9
lC263			; Callers: C245
    lda l0349		; C263: AD 49 03
    bne lC28C		; C266: D0 24
    lda #$20		; C268: A9 20
    sta l0571		; C26A: 8D 71 05
    sta l0639		; C26D: 8D 39 06
    lda #$4F		; C270: A9 4F
    sta l0599		; C272: 8D 99 05
    sta l05C1		; C275: 8D C1 05
    sta l05E9		; C278: 8D E9 05
    sta l0611		; C27B: 8D 11 06
    lda #$0C		; C27E: A9 0C
    sta lD999		; C280: 8D 99 D9
    sta lD9C1		; C283: 8D C1 D9
    sta lD9E9		; C286: 8D E9 D9
    sta lDA11		; C289: 8D 11 DA
lC28C			; Callers: C266
    lda l034E		; C28C: AD 4E 03
    bne lC2B5		; C28F: D0 24
    lda #$20		; C291: A9 20
    sta l0576		; C293: 8D 76 05
    sta l063E		; C296: 8D 3E 06
    lda #$4F		; C299: A9 4F
    sta l059E		; C29B: 8D 9E 05
    sta l05C6		; C29E: 8D C6 05
    sta l05EE		; C2A1: 8D EE 05
    sta l0616		; C2A4: 8D 16 06
    lda #$0C		; C2A7: A9 0C
    sta lD99E		; C2A9: 8D 9E D9
    sta lD9C6		; C2AC: 8D C6 D9
    sta lD9EE		; C2AF: 8D EE D9
    sta lDA16		; C2B2: 8D 16 DA
lC2B5			; Callers: C28F
    lda l0344		; C2B5: AD 44 03
    beq lC2E0		; C2B8: F0 26
    lda #$99		; C2BA: A9 99
    sta l22		; C2BC: 85 22
    lda #$05		; C2BE: A9 05
    sta l23		; C2C0: 85 23
    lda #$4F		; C2C2: A9 4F
    sta l02		; C2C4: 85 02
    ldx #$04		; C2C6: A2 04
    ldy #$04		; C2C8: A0 04
    jsr lC114		; C2CA: 20 14 C1
    lda #$99		; C2CD: A9 99
    sta l22		; C2CF: 85 22
    lda #$D9		; C2D1: A9 D9
    sta l23		; C2D3: 85 23
    lda #$0C		; C2D5: A9 0C
    sta l02		; C2D7: 85 02
    ldx #$04		; C2D9: A2 04
    ldy #$04		; C2DB: A0 04
    jsr lC114		; C2DD: 20 14 C1
lC2E0			; Callers: C2B8
    lda l0348		; C2E0: AD 48 03
    bne lC31E		; C2E3: D0 39
    lda #$1E		; C2E5: A9 1E
    sta l22		; C2E7: 85 22
    lda #$05		; C2E9: A9 05
    sta l23		; C2EB: 85 23
    lda #$20		; C2ED: A9 20
    sta l02		; C2EF: 85 02
    ldy #$02		; C2F1: A0 02
    ldx #$0A		; C2F3: A2 0A
    jsr lC114		; C2F5: 20 14 C1
    lda #$6E		; C2F8: A9 6E
    sta l22		; C2FA: 85 22
    lda #$05		; C2FC: A9 05
    sta l23		; C2FE: 85 23
    lda #$50		; C300: A9 50
    sta l02		; C302: 85 02
    ldx #$06		; C304: A2 06
    ldy #$02		; C306: A0 02
    jsr lC114		; C308: 20 14 C1
    lda #$6E		; C30B: A9 6E
    sta l22		; C30D: 85 22
    lda #$D9		; C30F: A9 D9
    sta l23		; C311: 85 23
    lda #$0C		; C313: A9 0C
    sta l02		; C315: 85 02
    ldx #$06		; C317: A2 06
    ldy #$02		; C319: A0 02
    jsr lC114		; C31B: 20 14 C1
lC31E			; Callers: C2E3
    lda l034D		; C31E: AD 4D 03
    bne lC35C		; C321: D0 39
    lda #$26		; C323: A9 26
    sta l22		; C325: 85 22
    lda #$05		; C327: A9 05
    sta l23		; C329: 85 23
    lda #$20		; C32B: A9 20
    sta l02		; C32D: 85 02
    ldy #$02		; C32F: A0 02
    ldx #$0A		; C331: A2 0A
    jsr lC114		; C333: 20 14 C1
    lda #$76		; C336: A9 76
    sta l22		; C338: 85 22
    lda #$05		; C33A: A9 05
    sta l23		; C33C: 85 23
    lda #$50		; C33E: A9 50
    sta l02		; C340: 85 02
    ldx #$06		; C342: A2 06
    ldy #$02		; C344: A0 02
    jsr lC114		; C346: 20 14 C1
    lda #$76		; C349: A9 76
    sta l22		; C34B: 85 22
    lda #$D9		; C34D: A9 D9
    sta l23		; C34F: 85 23
    lda #$0C		; C351: A9 0C
    sta l02		; C353: 85 02
    ldx #$06		; C355: A2 06
    ldy #$02		; C357: A0 02
    jsr lC114		; C359: 20 14 C1
lC35C			; Callers: C321
    lda l0343		; C35C: AD 43 03
    beq lC387		; C35F: F0 26
    lda #$70		; C361: A9 70
    sta l22		; C363: 85 22
    lda #$05		; C365: A9 05
    sta l23		; C367: 85 23
    lda #$50		; C369: A9 50
    sta l02		; C36B: 85 02
    ldx #$06		; C36D: A2 06
    ldy #$06		; C36F: A0 06
    jsr lC114		; C371: 20 14 C1
    lda #$70		; C374: A9 70
    sta l22		; C376: 85 22
    lda #$D9		; C378: A9 D9
    sta l23		; C37A: 85 23
    lda #$0C		; C37C: A9 0C
    sta l02		; C37E: 85 02
    ldx #$06		; C380: A2 06
    ldy #$06		; C382: A0 06
    jsr lC114		; C384: 20 14 C1
lC387			; Callers: C35F
    lda l0347		; C387: AD 47 03
    bne lC3E3		; C38A: D0 57
    lda #$A3		; C38C: A9 A3
    sta l22		; C38E: 85 22
    lda #$04		; C390: A9 04
    sta l23		; C392: 85 23
    lda #$20		; C394: A9 20
    sta l02		; C396: 85 02
    ldy #$03		; C398: A0 03
    ldx #$10		; C39A: A2 10
    jsr lC114		; C39C: 20 14 C1
    lda #$1B		; C39F: A9 1B
    sta l22		; C3A1: 85 22
    lda #$D9		; C3A3: A9 D9
    sta l23		; C3A5: 85 23
    lda #$0C		; C3A7: A9 0C
    sta l02		; C3A9: 85 02
    ldy #$03		; C3AB: A0 03
    ldx #$0A		; C3AD: A2 0A
    jsr lC114		; C3AF: 20 14 C1
    lda #$1C		; C3B2: A9 1C
    sta l22		; C3B4: 85 22
    lda #$05		; C3B6: A9 05
    sta l23		; C3B8: 85 23
    ldx #$05		; C3BA: A2 05
lC3BC			; Callers: C3E1
    ldy #$00		; C3BC: A0 00
    lda #$52		; C3BE: A9 52
    sta (l22),y		; C3C0: 91 22
    ldy #$02		; C3C2: A0 02
    sta (l22),y		; C3C4: 91 22
    lda #$51		; C3C6: A9 51
    dey    		; C3C8: 88
    sta (l22),y		; C3C9: 91 22
    jsr lC100		; C3CB: 20 00 C1
    ldy #$00		; C3CE: A0 00
    lda #$54		; C3D0: A9 54
    sta (l22),y		; C3D2: 91 22
    ldy #$02		; C3D4: A0 02
    sta (l22),y		; C3D6: 91 22
    lda #$53		; C3D8: A9 53
    dey    		; C3DA: 88
    sta (l22),y		; C3DB: 91 22
    jsr lC100		; C3DD: 20 00 C1
    dex    		; C3E0: CA
    bne lC3BC		; C3E1: D0 D9
lC3E3			; Callers: C38A
    lda l034C		; C3E3: AD 4C 03
    bne lC43F		; C3E6: D0 57
    lda #$B0		; C3E8: A9 B0
    sta l22		; C3EA: 85 22
    lda #$04		; C3EC: A9 04
    sta l23		; C3EE: 85 23
    lda #$20		; C3F0: A9 20
    sta l02		; C3F2: 85 02
    ldy #$03		; C3F4: A0 03
    ldx #$10		; C3F6: A2 10
    jsr lC114		; C3F8: 20 14 C1
    lda #$28		; C3FB: A9 28
    sta l22		; C3FD: 85 22
    lda #$D9		; C3FF: A9 D9
    sta l23		; C401: 85 23
    lda #$0C		; C403: A9 0C
    sta l02		; C405: 85 02
    ldy #$03		; C407: A0 03
    ldx #$0A		; C409: A2 0A
    jsr lC114		; C40B: 20 14 C1
    lda #$29		; C40E: A9 29
    sta l22		; C410: 85 22
    lda #$05		; C412: A9 05
    sta l23		; C414: 85 23
    ldx #$05		; C416: A2 05
lC418			; Callers: C43D
    ldy #$00		; C418: A0 00
    lda #$51		; C41A: A9 51
    sta (l22),y		; C41C: 91 22
    ldy #$02		; C41E: A0 02
    sta (l22),y		; C420: 91 22
    lda #$52		; C422: A9 52
    dey    		; C424: 88
    sta (l22),y		; C425: 91 22
    jsr lC100		; C427: 20 00 C1
    ldy #$00		; C42A: A0 00
    lda #$53		; C42C: A9 53
    sta (l22),y		; C42E: 91 22
    ldy #$02		; C430: A0 02
    sta (l22),y		; C432: 91 22
    lda #$54		; C434: A9 54
    dey    		; C436: 88
    sta (l22),y		; C437: 91 22
    jsr lC100		; C439: 20 00 C1
    dex    		; C43C: CA
    bne lC418		; C43D: D0 D9
lC43F			; Callers: C3E6
    lda l0342		; C43F: AD 42 03
    beq lC495		; C442: F0 51
    lda #$1E		; C444: A9 1E
    sta l22		; C446: 85 22
    lda #$D9		; C448: A9 D9
    sta l23		; C44A: 85 23
    lda #$0C		; C44C: A9 0C
    sta l02		; C44E: 85 02
    ldx #$0A		; C450: A2 0A
    ldy #$0A		; C452: A0 0A
    jsr lC114		; C454: 20 14 C1
    lda #$1F		; C457: A9 1F
    sta l22		; C459: 85 22
    lda #$05		; C45B: A9 05
    sta l23		; C45D: 85 23
    lda #$05		; C45F: A9 05
    sta l24		; C461: 85 24
lC463			; Callers: C493
    ldx #$05		; C463: A2 05
lC465			; Callers: C484
    ldy #$00		; C465: A0 00
    lda #$51		; C467: A9 51
    sta (l22),y		; C469: 91 22
    iny    		; C46B: C8
    lda #$52		; C46C: A9 52
    sta (l22),y		; C46E: 91 22
    ldy #$28		; C470: A0 28
    lda #$53		; C472: A9 53
    sta (l22),y		; C474: 91 22
    iny    		; C476: C8
    lda #$54		; C477: A9 54
    sta (l22),y		; C479: 91 22
    inc l22		; C47B: E6 22
    inc l22		; C47D: E6 22
    bne lC483		; C47F: D0 02
    inc l23		; C481: E6 23
lC483			; Callers: C47F
    dex    		; C483: CA
    bne lC465		; C484: D0 DF
    lda l22		; C486: A5 22
    clc    		; C488: 18
    adc #$46		; C489: 69 46
    sta l22		; C48B: 85 22
    bcc lC491		; C48D: 90 02
    inc l23		; C48F: E6 23
lC491			; Callers: C48D
    dec l24		; C491: C6 24
    bne lC463		; C493: D0 CE
lC495			; Callers: C442
    lda l0346		; C495: AD 46 03
    bne lC4F1		; C498: D0 57
    lda #$28		; C49A: A9 28
    sta l22		; C49C: 85 22
    lda #$04		; C49E: A9 04
    sta l23		; C4A0: 85 23
    lda #$20		; C4A2: A9 20
    sta l02		; C4A4: 85 02
    ldy #$03		; C4A6: A0 03
    ldx #$16		; C4A8: A2 16
    jsr lC114		; C4AA: 20 14 C1
    lda #$A0		; C4AD: A9 A0
    sta l22		; C4AF: 85 22
    lda #$D8		; C4B1: A9 D8
    sta l23		; C4B3: 85 23
    lda #$0C		; C4B5: A9 0C
    sta l02		; C4B7: 85 02
    ldy #$03		; C4B9: A0 03
    ldx #$10		; C4BB: A2 10
    jsr lC114		; C4BD: 20 14 C1
    lda #$A1		; C4C0: A9 A1
    sta l22		; C4C2: 85 22
    lda #$04		; C4C4: A9 04
    sta l23		; C4C6: 85 23
    ldx #$08		; C4C8: A2 08
lC4CA			; Callers: C4EF
    ldy #$00		; C4CA: A0 00
    lda #$56		; C4CC: A9 56
    sta (l22),y		; C4CE: 91 22
    ldy #$02		; C4D0: A0 02
    sta (l22),y		; C4D2: 91 22
    lda #$55		; C4D4: A9 55
    dey    		; C4D6: 88
    sta (l22),y		; C4D7: 91 22
    jsr lC100		; C4D9: 20 00 C1
    ldy #$00		; C4DC: A0 00
    lda #$58		; C4DE: A9 58
    sta (l22),y		; C4E0: 91 22
    ldy #$02		; C4E2: A0 02
    sta (l22),y		; C4E4: 91 22
    lda #$57		; C4E6: A9 57
    dey    		; C4E8: 88
    sta (l22),y		; C4E9: 91 22
    jsr lC100		; C4EB: 20 00 C1
    dex    		; C4EE: CA
    bne lC4CA		; C4EF: D0 D9
lC4F1			; Callers: C498
    jmp $1800		; C4F1: 4C 00 18
    dta $8		; C4F4: 08
    dta $1		; C4F5: 01
    dta $12		; C4F6: 12
    dta $C		; C4F7: 0C
    dta $9		; C4F8: 09
    dta $2		; C4F9: 02
    dta $13		; C4FA: 13
    dta $16		; C4FB: 16
    dta $B		; C4FC: 0B
    dta $7		; C4FD: 07
    dta $14		; C4FE: 14
    dta $17		; C4FF: 17
    dta $9		; C500: 09
    dta $3		; C501: 03
    dta $12		; C502: 12
    dta $1A		; C503: 1A
    dta $A		; C504: 0A
    dta $4		; C505: 04
    dta $12		; C506: 12
    dta $F		; C507: 0F
    dta $9		; C508: 09
    dta $5		; C509: 05
    dta $12		; C50A: 12
    dta $18		; C50B: 18
    dta $6		; C50C: 06
    dta $15		; C50D: 15
    dta $E		; C50E: 0E
    dta $D		; C50F: 0D
    dta $11		; C510: 11
    dta $19		; C511: 19
    dta $1A		; C512: 1A
    dta $10		; C513: 10
    dta $F		; C514: 0F
    dta $1		; C515: 01
    dta $F		; C516: 0F
    dta $D		; C517: 0D
    dta $7		; C518: 07
    dta $1		; C519: 01
    dta $1		; C51A: 01
    dta $F		; C51B: 0F
    dta $8		; C51C: 08
    dta $1		; C51D: 01
    dta $1		; C51E: 01
    dta $1		; C51F: 01
    dta $5		; C520: 05
    dta $1		; C521: 01
    dta $5		; C522: 05
    dta $8		; C523: 08
    dta $1		; C524: 01
    dta $1		; C525: 01
    dta $C		; C526: 0C
    dta $5		; C527: 05
    dta $F		; C528: 0F
    dta $1		; C529: 01
    dta $8		; C52A: 08
    dta $2		; C52B: 02
    dta $1		; C52C: 01
    dta $1		; C52D: 01
    dta $5		; C52E: 05
    dta $3		; C52F: 03
    dta $1		; C530: 01
    dta $C		; C531: 0C
    dta $1		; C532: 01
    dta $1		; C533: 01
    dta $2		; C534: 02
    dta $3		; C535: 03
    dta $3		; C536: 03
    dta $4		; C537: 04
    dta $2		; C538: 02
    dta $4		; C539: 04
    dta $4		; C53A: 04
    dta $A		; C53B: 0A
    dta $5		; C53C: 05
    dta $7		; C53D: 07
    dta $5		; C53E: 05
    dta $10		; C53F: 10
    dta $9		; C540: 09
    dta $C		; C541: 0C
    dta $14		; C542: 14
    dta $E		; C543: 0E
    dta $B0		; C544: B0
    dta $19		; C545: 19
    dta $32		; C546: 32
    dta $A2		; C547: A2
    dta $5		; C548: 05
    dta $49		; C549: 49
    dta $11		; C54A: 11
    dta $13		; C54B: 13
    dta $34		; C54C: 34
    dta $38		; C54D: 38
    dta $A1		; C54E: A1
    dta $C1		; C54F: C1
    dta $4		; C550: 04
    dta $5		; C551: 05
    dta $6		; C552: 06
    dta $7		; C553: 07
    dta $8		; C554: 08
    dta $9		; C555: 09
    dta $A		; C556: 0A
    dta $7		; C557: 07
    dta $A		; C558: 0A
    dta $B		; C559: 0B
    dta $C		; C55A: 0C
    dta $5		; C55B: 05
    dta $7		; C55C: 07
    dta $0		; C55D: 00
    dta $9		; C55E: 09
    dta $A		; C55F: 0A
    dta $8		; C560: 08
    dta $A		; C561: 0A
    dta $10		; C562: 10
    dta $0		; C563: 00
    dta $1		; C564: 01
    dta $2		; C565: 02
    dta $3		; C566: 03
    dta $4		; C567: 04
    dta $5		; C568: 05
    dta $7		; C569: 07
    dta $1		; C56A: 01
    dta $2		; C56B: 02
    dta $2		; C56C: 02
    dta $4		; C56D: 04
    dta $6		; C56E: 06
    dta $7		; C56F: 07
    dta $8		; C570: 08
    dta $9		; C571: 09
    dta $A		; C572: 0A
    dta $8		; C573: 08
    dta $A		; C574: 0A
    dta $C		; C575: 0C
    dta $D		; C576: 0D
    dta $8		; C577: 08
    dta $9		; C578: 09
    dta $C		; C579: 0C
    dta $B		; C57A: 0B
    dta $C		; C57B: 0C
    dta $A		; C57C: 0A
    dta $B		; C57D: 0B
    dta $D		; C57E: 0D
    dta $2		; C57F: 02
    dta $7		; C580: 07
    dta $8		; C581: 08
    dta $A		; C582: 0A
    dta $C		; C583: 0C
    dta $E		; C584: 0E
    dta $10		; C585: 10
    dta $9		; C586: 09
    dta $C		; C587: 0C
    dta $0		; C588: 00
    dta $1		; C589: 01
    dta $2		; C58A: 02
    dta $3		; C58B: 03
    dta $5		; C58C: 05
    dta $D		; C58D: 0D
    dta $13		; C58E: 13
    dta $2		; C58F: 02
    dta $10		; C590: 10
    dta $17		; C591: 17
    dta $20		; C592: 20
    dta $3		; C593: 03
    dta $A		; C594: 0A
    dta $4		; C595: 04
    dta $19		; C596: 19
    dta $32		; C597: 32
    dta $64		; C598: 64
    dta $96		; C599: 96
    dta $FA		; C59A: FA
    dta $0		; C59B: 00
    dta $5		; C59C: 05
    dta $D		; C59D: 0D
    dta $19		; C59E: 19
    dta $3F		; C59F: 3F
    dta $7D		; C5A0: 7D
    dta $FA		; C5A1: FA
    dta $3		; C5A2: 03
    dta $D		; C5A3: 0D
    dta $2		; C5A4: 02
    dta $3		; C5A5: 03
    dta $3		; C5A6: 03
    dta $4		; C5A7: 04
    dta $2		; C5A8: 02
    dta $4		; C5A9: 04
    dta $4		; C5AA: 04
    dta $A		; C5AB: 0A
    dta $5		; C5AC: 05
    dta $7		; C5AD: 07
    dta $5		; C5AE: 05
    dta $10		; C5AF: 10
    dta $6		; C5B0: 06
    dta $A		; C5B1: 0A
    dta $6		; C5B2: 06
    dta $8		; C5B3: 08
    dta $D		; C5B4: 0D
    dta $C		; C5B5: 0C
    dta $8		; C5B6: 08
    dta $4		; C5B7: 04
    dta $8		; C5B8: 08
    dta $E		; C5B9: 0E
    dta $9		; C5BA: 09
    dta $10		; C5BB: 10
    dta $10		; C5BC: 10
    dta $A		; C5BD: 0A
    dta $C		; C5BE: 0C
    dta $8		; C5BF: 08
    dta $F		; C5C0: 0F
    dta $12		; C5C1: 12
    dta $C		; C5C2: 0C
    dta $8		; C5C3: 08
    dta $5		; C5C4: 05
    dta $6		; C5C5: 06
    dta $8		; C5C6: 08
    dta $14		; C5C7: 14
    dta $5		; C5C8: 05
    dta $A		; C5C9: 0A
    dta $8		; C5CA: 08
    dta $12		; C5CB: 12
    dta $8		; C5CC: 08
    dta $E		; C5CD: 0E
    dta $C		; C5CE: 0C
    dta $10		; C5CF: 10
    dta $C		; C5D0: 0C
    dta $10		; C5D1: 10
    dta $D		; C5D2: 0D
    dta $10		; C5D3: 10
    dta $19		; C5D4: 19
    dta $14		; C5D5: 14
    dta $F		; C5D6: 0F
    dta $8		; C5D7: 08
    dta $A		; C5D8: 0A
    dta $19		; C5D9: 19
    dta $10		; C5DA: 10
    dta $12		; C5DB: 12
    dta $1E		; C5DC: 1E
    dta $10		; C5DD: 10
    dta $1E		; C5DE: 1E
    dta $19		; C5DF: 19
    dta $19		; C5E0: 19
    dta $18		; C5E1: 18
    dta $12		; C5E2: 12
    dta $10		; C5E3: 10
    dta $5		; C5E4: 05
    dta $7		; C5E5: 07
    dta $6		; C5E6: 06
    dta $5		; C5E7: 05
    dta $5		; C5E8: 05
    dta $9		; C5E9: 09
    dta $8		; C5EA: 08
    dta $D		; C5EB: 0D
    dta $8		; C5EC: 08
    dta $A		; C5ED: 0A
    dta $8		; C5EE: 08
    dta $F		; C5EF: 0F
    dta $9		; C5F0: 09
    dta $C		; C5F1: 0C
    dta $9		; C5F2: 09
    dta $A		; C5F3: 0A
    dta $A		; C5F4: 0A
    dta $C		; C5F5: 0C
    dta $A		; C5F6: 0A
    dta $5		; C5F7: 05
    dta $A		; C5F8: 0A
    dta $10		; C5F9: 10
    dta $B		; C5FA: 0B
    dta $F		; C5FB: 0F
    dta $16		; C5FC: 16
    dta $D		; C5FD: 0D
    dta $5		; C5FE: 05
    dta $8		; C5FF: 08
    dta $12		; C600: 12
    dta $19		; C601: 19
    dta $A		; C602: 0A
    dta $8		; C603: 08
    dta $0		; C604: 00
    dta $2		; C605: 02
    dta $0		; C606: 00
    dta $0		; C607: 00
    dta $0		; C608: 00
    dta $2		; C609: 02
    dta $2		; C60A: 02
    dta $3		; C60B: 03
    dta $2		; C60C: 02
    dta $2		; C60D: 02
    dta $3		; C60E: 03
    dta $0		; C60F: 00
    dta $1		; C610: 01
    dta $3		; C611: 03
    dta $1		; C612: 01
    dta $3		; C613: 03
    dta $5		; C614: 05
    dta $3		; C615: 03
    dta $1		; C616: 01
    dta $1		; C617: 01
    dta $1		; C618: 01
    dta $2		; C619: 02
    dta $2		; C61A: 02
    dta $1		; C61B: 01
    dta $2		; C61C: 02
    dta $2		; C61D: 02
    dta $4		; C61E: 04
    dta $0		; C61F: 00
    dta $3		; C620: 03
    dta $2		; C621: 02
    dta $6		; C622: 06
    dta $2		; C623: 02
    dta $C		; C624: 0C
    dta $7		; C625: 07
    dta $8		; C626: 08
    dta $7		; C627: 07
    dta $C		; C628: 0C
    dta $9		; C629: 09
    dta $C		; C62A: 0C
    dta $B		; C62B: 0B
    dta $E		; C62C: 0E
    dta $6		; C62D: 06
    dta $7		; C62E: 07
    dta $A		; C62F: 0A
    dta $A		; C630: 0A
    dta $6		; C631: 06
    dta $A		; C632: 0A
    dta $B		; C633: 0B
    dta $8		; C634: 08
    dta $8		; C635: 08
    dta $F		; C636: 0F
    dta $F		; C637: 0F
    dta $A		; C638: 0A
    dta $7		; C639: 07
    dta $9		; C63A: 09
    dta $E		; C63B: 0E
    dta $7		; C63C: 07
    dta $7		; C63D: 07
    dta $8		; C63E: 08
    dta $9		; C63F: 09
    dta $D		; C640: 0D
    dta $E		; C641: 0E
    dta $8		; C642: 08
    dta $C		; C643: 0C
    dta $4		; C644: 04
    dta $6		; C645: 06
    dta $0		; C646: 00
    dta $0		; C647: 00
    dta $0		; C648: 00
    dta $7		; C649: 07
    dta $8		; C64A: 08
    dta $8		; C64B: 08
    dta $6		; C64C: 06
    dta $6		; C64D: 06
    dta $7		; C64E: 07
    dta $5		; C64F: 05
    dta $0		; C650: 00
    dta $5		; C651: 05
    dta $6		; C652: 06
    dta $8		; C653: 08
    dta $7		; C654: 07
    dta $8		; C655: 08
    dta $6		; C656: 06
    dta $A		; C657: 0A
    dta $0		; C658: 00
    dta $4		; C659: 04
    dta $8		; C65A: 08
    dta $8		; C65B: 08
    dta $4		; C65C: 04
    dta $7		; C65D: 07
    dta $0		; C65E: 00
    dta $0		; C65F: 00
    dta $8		; C660: 08
    dta $A		; C661: 0A
    dta $8		; C662: 08
    dta $C		; C663: 0C
    dta $0		; C664: 00
    dta $0		; C665: 00
    dta $0		; C666: 00
    dta $1		; C667: 01
    dta $1		; C668: 01
    dta $0		; C669: 00
    dta $0		; C66A: 00
    dta $0		; C66B: 00
    dta $0		; C66C: 00
    dta $0		; C66D: 00
    dta $0		; C66E: 00
    dta $0		; C66F: 00
    dta $1		; C670: 01
    dta $0		; C671: 00
    dta $1		; C672: 01
    dta $0		; C673: 00
    dta $2		; C674: 02
    dta $0		; C675: 00
    dta $1		; C676: 01
    dta $0		; C677: 00
    dta $1		; C678: 01
    dta $0		; C679: 00
    dta $1		; C67A: 01
    dta $0		; C67B: 00
    dta $0		; C67C: 00
    dta $0		; C67D: 00
    dta $2		; C67E: 02
    dta $2		; C67F: 02
    dta $0		; C680: 00
    dta $0		; C681: 00
    dta $0		; C682: 00
    dta $0		; C683: 00
    dta $0		; C684: 00
    dta $1		; C685: 01
    dta $1		; C686: 01
    dta $1		; C687: 01
    dta $0		; C688: 00
    dta $1		; C689: 01
    dta $1		; C68A: 01
    dta $1		; C68B: 01
    dta $0		; C68C: 00
    dta $1		; C68D: 01
    dta $1		; C68E: 01
    dta $1		; C68F: 01
    dta $0		; C690: 00
    dta $1		; C691: 01
    dta $1		; C692: 01
    dta $1		; C693: 01
    dta $0		; C694: 00
    dta $1		; C695: 01
    dta $1		; C696: 01
    dta $1		; C697: 01
    dta $1		; C698: 01
    dta $1		; C699: 01
    dta $1		; C69A: 01
    dta $1		; C69B: 01
    dta $1		; C69C: 01
    dta $1		; C69D: 01
    dta $1		; C69E: 01
    dta $1		; C69F: 01
    dta $1		; C6A0: 01
    dta $1		; C6A1: 01
    dta $1		; C6A2: 01
    dta $1		; C6A3: 01
    dta $0		; C6A4: 00
    dta $7		; C6A5: 07
    dta $6		; C6A6: 06
    dta $6		; C6A7: 06
    dta $7		; C6A8: 07
    dta $8		; C6A9: 08
    dta $8		; C6AA: 08
    dta $6		; C6AB: 06
    dta $5		; C6AC: 05
    dta $0		; C6AD: 00
    dta $2		; C6AE: 02
    dta $3		; C6AF: 03
    dta $0		; C6B0: 00
    dta $4		; C6B1: 04
    dta $5		; C6B2: 05
    dta $4		; C6B3: 04
    dta $6		; C6B4: 06
    dta $4		; C6B5: 04
    dta $7		; C6B6: 07
    dta $4		; C6B7: 04
    dta $0		; C6B8: 00
    dta $0		; C6B9: 00
    dta $8		; C6BA: 08
    dta $1		; C6BB: 01
    dta $1		; C6BC: 01
    dta $5		; C6BD: 05
    dta $5		; C6BE: 05
    dta $9		; C6BF: 09
    dta $A		; C6C0: 0A
    dta $0		; C6C1: 00
    dta $0		; C6C2: 00
    dta $0		; C6C3: 00
    dta $3		; C6C4: 03
    dta $A		; C6C5: 0A
    dta $B		; C6C6: 0B
    dta $B		; C6C7: 0B
    dta $0		; C6C8: 00
    dta $3		; C6C9: 03
    dta $0		; C6CA: 00
    dta $0		; C6CB: 00
    dta $1		; C6CC: 01
    dta $1		; C6CD: 01
    dta $0		; C6CE: 00
    dta $1		; C6CF: 01
    dta $0		; C6D0: 00
    dta $C		; C6D1: 0C
    dta $D		; C6D2: 0D
    dta $E		; C6D3: 0E
    dta $0		; C6D4: 00
    dta $1		; C6D5: 01
    dta $1		; C6D6: 01
    dta $1		; C6D7: 01
    dta $0		; C6D8: 00
    dta $1		; C6D9: 01
    dta $1		; C6DA: 01
    dta $1		; C6DB: 01
    dta $1		; C6DC: 01
    dta $1		; C6DD: 01
    dta $0		; C6DE: 00
    dta $0		; C6DF: 00
    dta $0		; C6E0: 00
    dta $0		; C6E1: 00
    dta $0		; C6E2: 00
    dta $0		; C6E3: 00
    dta $0		; C6E4: 00
    dta $0		; C6E5: 00
    dta $0		; C6E6: 00
    dta $1		; C6E7: 01
    dta $1		; C6E8: 01
    dta $1		; C6E9: 01
    dta $1		; C6EA: 01
    dta $1		; C6EB: 01
    dta $1		; C6EC: 01
    dta $1		; C6ED: 01
    dta $1		; C6EE: 01
    dta $1		; C6EF: 01
    dta $1		; C6F0: 01
    dta $1		; C6F1: 01
    dta $1		; C6F2: 01
    dta $1		; C6F3: 01
    dta $1		; C6F4: 01
    dta $1		; C6F5: 01
    dta $1		; C6F6: 01
    dta $1		; C6F7: 01
    dta $1		; C6F8: 01
    dta $1		; C6F9: 01
    dta $1		; C6FA: 01
    dta $1		; C6FB: 01
    dta $1		; C6FC: 01
    dta $1		; C6FD: 01
    dta $1		; C6FE: 01
    dta $2		; C6FF: 02
    dta $2		; C700: 02
    dta $2		; C701: 02
    dta $2		; C702: 02
    dta $2		; C703: 02
    dta $0		; C704: 00
    dta $0		; C705: 00
    dta $0		; C706: 00
    dta $0		; C707: 00
    dta $0		; C708: 00
    dta $0		; C709: 00
    dta $0		; C70A: 00
    dta $0		; C70B: 00
    dta $0		; C70C: 00
    dta $0		; C70D: 00
    dta $0		; C70E: 00
    dta $0		; C70F: 00
    dta $0		; C710: 00
    dta $0		; C711: 00
    dta $0		; C712: 00
    dta $0		; C713: 00
    dta $0		; C714: 00
    dta $0		; C715: 00
    dta $0		; C716: 00
    dta $0		; C717: 00
    dta $0		; C718: 00
    dta $0		; C719: 00
    dta $0		; C71A: 00
    dta $0		; C71B: 00
    dta $0		; C71C: 00
    dta $0		; C71D: 00
    dta $0		; C71E: 00
    dta $0		; C71F: 00
uC720			; Callers: -c C720
    ldx l033E		; C720: AE 3E 03
    lda #$40		; C723: A9 40
    sta l57		; C725: 85 57
    lda #$C7		; C727: A9 C7
    sta l58		; C729: 85 58
lC72B			; Callers: C737
    lda l57		; C72B: A5 57
    clc    		; C72D: 18
    adc #$40		; C72E: 69 40
    sta l57		; C730: 85 57
    bcc lC736		; C732: 90 02
    inc l58		; C734: E6 58
lC736			; Callers: C732
    dex    		; C736: CA
    bne lC72B		; C737: D0 F2
    lda #$10		; C739: A9 10
    sta l22		; C73B: 85 22
    sta l24		; C73D: 85 24
    lda #$06		; C73F: A9 06
    sta l23		; C741: 85 23
    lda #$DA		; C743: A9 DA
    sta l25		; C745: 85 25
    ldx #$08		; C747: A2 08
lC749			; Callers: C776
    ldy #$00		; C749: A0 00
lC74B			; Callers: C75D
    lda (l57),y		; C74B: B1 57
    cmp #$20		; C74D: C9 20
    beq lC75A		; C74F: F0 09
    lda (l57),y		; C751: B1 57
    sta (l22),y		; C753: 91 22
    lda l033F		; C755: AD 3F 03
    sta (l24),y		; C758: 91 24
lC75A			; Callers: C74F
    iny    		; C75A: C8
    cpy #$08		; C75B: C0 08
    bne lC74B		; C75D: D0 EC
    lda l57		; C75F: A5 57
    clc    		; C761: 18
    adc #$08		; C762: 69 08
    sta l57		; C764: 85 57
    lda l22		; C766: A5 22
    clc    		; C768: 18
    adc #$28		; C769: 69 28
    sta l22		; C76B: 85 22
    sta l24		; C76D: 85 24
    bcc lC775		; C76F: 90 04
    inc l23		; C771: E6 23
    inc l25		; C773: E6 25
lC775			; Callers: C76F
    dex    		; C775: CA
    bne lC749		; C776: D0 D1
    rts    		; C778: 60
    dta $0		; C779: 00
    dta $0		; C77A: 00
    dta $0		; C77B: 00
    dta $0		; C77C: 00
    dta $0		; C77D: 00
    dta $0		; C77E: 00
    dta $0		; C77F: 00
    dta $20		; C780: 20
    dta $20		; C781: 20
    dta $20		; C782: 20
    dta $20		; C783: 20
    dta $20		; C784: 20
    dta $20		; C785: 20
    dta $20		; C786: 20
    dta $20		; C787: 20
    dta $20		; C788: 20
    dta $20		; C789: 20
    dta $20		; C78A: 20
    dta $A0		; C78B: A0
    dta $9F		; C78C: 9F
    dta $20		; C78D: 20
    dta $20		; C78E: 20
    dta $20		; C78F: 20
    dta $20		; C790: 20
    dta $20		; C791: 20
    dta $20		; C792: 20
    dta $9E		; C793: 9E
    dta $9D		; C794: 9D
    dta $20		; C795: 20
    dta $20		; C796: 20
    dta $20		; C797: 20
    dta $20		; C798: 20
    dta $8E		; C799: 8E
    dta $A0		; C79A: A0
    dta $98		; C79B: 98
    dta $98		; C79C: 98
    dta $9F		; C79D: 9F
    dta $8F		; C79E: 8F
    dta $20		; C79F: 20
    dta $20		; C7A0: 20
    dta $A0		; C7A1: A0
    dta $91		; C7A2: 91
    dta $98		; C7A3: 98
    dta $98		; C7A4: 98
    dta $90		; C7A5: 90
    dta $9F		; C7A6: 9F
    dta $20		; C7A7: 20
    dta $20		; C7A8: 20
    dta $93		; C7A9: 93
    dta $95		; C7AA: 95
    dta $98		; C7AB: 98
    dta $98		; C7AC: 98
    dta $94		; C7AD: 94
    dta $93		; C7AE: 93
    dta $20		; C7AF: 20
    dta $20		; C7B0: 20
    dta $20		; C7B1: 20
    dta $95		; C7B2: 95
    dta $94		; C7B3: 94
    dta $95		; C7B4: 95
    dta $94		; C7B5: 94
    dta $20		; C7B6: 20
    dta $20		; C7B7: 20
    dta $20		; C7B8: 20
    dta $20		; C7B9: 20
    dta $A0		; C7BA: A0
    dta $94		; C7BB: 94
    dta $95		; C7BC: 95
    dta $9F		; C7BD: 9F
    dta $20		; C7BE: 20
    dta $20		; C7BF: 20
    dta $20		; C7C0: 20
    dta $20		; C7C1: 20
    dta $8E		; C7C2: 8E
    dta $20		; C7C3: 20
    dta $20		; C7C4: 20
    dta $8F		; C7C5: 8F
    dta $20		; C7C6: 20
    dta $20		; C7C7: 20
    dta $20		; C7C8: 20
    dta $20		; C7C9: 20
    dta $90		; C7CA: 90
    dta $98		; C7CB: 98
    dta $98		; C7CC: 98
    dta $91		; C7CD: 91
    dta $20		; C7CE: 20
    dta $20		; C7CF: 20
    dta $20		; C7D0: 20
    dta $20		; C7D1: 20
    dta $20		; C7D2: 20
    dta $9E		; C7D3: 9E
    dta $9D		; C7D4: 9D
    dta $20		; C7D5: 20
    dta $20		; C7D6: 20
    dta $20		; C7D7: 20
    dta $20		; C7D8: 20
    dta $8E		; C7D9: 8E
    dta $A0		; C7DA: A0
    dta $98		; C7DB: 98
    dta $98		; C7DC: 98
    dta $9F		; C7DD: 9F
    dta $8F		; C7DE: 8F
    dta $20		; C7DF: 20
    dta $20		; C7E0: 20
    dta $A0		; C7E1: A0
    dta $91		; C7E2: 91
    dta $98		; C7E3: 98
    dta $98		; C7E4: 98
    dta $90		; C7E5: 90
    dta $9F		; C7E6: 9F
    dta $20		; C7E7: 20
    dta $20		; C7E8: 20
    dta $93		; C7E9: 93
    dta $95		; C7EA: 95
    dta $98		; C7EB: 98
    dta $98		; C7EC: 98
    dta $94		; C7ED: 94
    dta $93		; C7EE: 93
    dta $20		; C7EF: 20
    dta $20		; C7F0: 20
    dta $20		; C7F1: 20
    dta $95		; C7F2: 95
    dta $94		; C7F3: 94
    dta $95		; C7F4: 95
    dta $94		; C7F5: 94
    dta $20		; C7F6: 20
    dta $20		; C7F7: 20
    dta $20		; C7F8: 20
    dta $20		; C7F9: 20
    dta $A0		; C7FA: A0
    dta $94		; C7FB: 94
    dta $95		; C7FC: 95
    dta $9F		; C7FD: 9F
    dta $20		; C7FE: 20
    dta $20		; C7FF: 20
    dta $8E		; C800: 8E
    dta $9F		; C801: 9F
    dta $20		; C802: 20
    dta $8E		; C803: 8E
    dta $8F		; C804: 8F
    dta $20		; C805: 20
    dta $20		; C806: 20
    dta $20		; C807: 20
    dta $90		; C808: 90
    dta $9D		; C809: 9D
    dta $20		; C80A: 20
    dta $98		; C80B: 98
    dta $98		; C80C: 98
    dta $20		; C80D: 20
    dta $20		; C80E: 20
    dta $20		; C80F: 20
    dta $8E		; C810: 8E
    dta $9F		; C811: 9F
    dta $92		; C812: 92
    dta $A0		; C813: A0
    dta $9F		; C814: 9F
    dta $92		; C815: 92
    dta $20		; C816: 20
    dta $20		; C817: 20
    dta $90		; C818: 90
    dta $9D		; C819: 9D
    dta $93		; C81A: 93
    dta $98		; C81B: 98
    dta $98		; C81C: 98
    dta $9E		; C81D: 9E
    dta $9F		; C81E: 9F
    dta $20		; C81F: 20
    dta $20		; C820: 20
    dta $91		; C821: 91
    dta $20		; C822: 20
    dta $98		; C823: 98
    dta $98		; C824: 98
    dta $20		; C825: 20
    dta $98		; C826: 98
    dta $20		; C827: 20
    dta $20		; C828: 20
    dta $20		; C829: 20
    dta $95		; C82A: 95
    dta $98		; C82B: 98
    dta $98		; C82C: 98
    dta $94		; C82D: 94
    dta $20		; C82E: 20
    dta $20		; C82F: 20
    dta $20		; C830: 20
    dta $20		; C831: 20
    dta $95		; C832: 95
    dta $94		; C833: 94
    dta $95		; C834: 95
    dta $94		; C835: 94
    dta $20		; C836: 20
    dta $20		; C837: 20
    dta $20		; C838: 20
    dta $20		; C839: 20
    dta $A0		; C83A: A0
    dta $94		; C83B: 94
    dta $95		; C83C: 95
    dta $9F		; C83D: 9F
    dta $20		; C83E: 20
    dta $20		; C83F: 20
    dta $9F		; C840: 9F
    dta $92		; C841: 92
    dta $95		; C842: 95
    dta $92		; C843: 92
    dta $92		; C844: 92
    dta $94		; C845: 94
    dta $20		; C846: 20
    dta $20		; C847: 20
    dta $9D		; C848: 9D
    dta $9D		; C849: 9D
    dta $20		; C84A: 20
    dta $98		; C84B: 98
    dta $98		; C84C: 98
    dta $20		; C84D: 20
    dta $20		; C84E: 20
    dta $20		; C84F: 20
    dta $8E		; C850: 8E
    dta $9F		; C851: 9F
    dta $92		; C852: 92
    dta $A0		; C853: A0
    dta $9F		; C854: 9F
    dta $92		; C855: 92
    dta $20		; C856: 20
    dta $20		; C857: 20
    dta $90		; C858: 90
    dta $9D		; C859: 9D
    dta $93		; C85A: 93
    dta $98		; C85B: 98
    dta $98		; C85C: 98
    dta $9E		; C85D: 9E
    dta $9F		; C85E: 9F
    dta $20		; C85F: 20
    dta $20		; C860: 20
    dta $94		; C861: 94
    dta $20		; C862: 20
    dta $98		; C863: 98
    dta $98		; C864: 98
    dta $20		; C865: 20
    dta $98		; C866: 98
    dta $20		; C867: 20
    dta $20		; C868: 20
    dta $20		; C869: 20
    dta $95		; C86A: 95
    dta $98		; C86B: 98
    dta $98		; C86C: 98
    dta $94		; C86D: 94
    dta $20		; C86E: 20
    dta $20		; C86F: 20
    dta $20		; C870: 20
    dta $20		; C871: 20
    dta $95		; C872: 95
    dta $94		; C873: 94
    dta $95		; C874: 95
    dta $94		; C875: 94
    dta $20		; C876: 20
    dta $20		; C877: 20
    dta $20		; C878: 20
    dta $20		; C879: 20
    dta $A0		; C87A: A0
    dta $94		; C87B: 94
    dta $95		; C87C: 95
    dta $9F		; C87D: 9F
    dta $20		; C87E: 20
    dta $20		; C87F: 20
    dta $20		; C880: 20
    dta $20		; C881: 20
    dta $A0		; C882: A0
    dta $9F		; C883: 9F
    dta $8E		; C884: 8E
    dta $98		; C885: 98
    dta $8F		; C886: 8F
    dta $20		; C887: 20
    dta $20		; C888: 20
    dta $20		; C889: 20
    dta $9E		; C88A: 9E
    dta $98		; C88B: 98
    dta $95		; C88C: 95
    dta $98		; C88D: 98
    dta $91		; C88E: 91
    dta $20		; C88F: 20
    dta $20		; C890: 20
    dta $20		; C891: 20
    dta $92		; C892: 92
    dta $98		; C893: 98
    dta $A0		; C894: A0
    dta $9F		; C895: 9F
    dta $8F		; C896: 8F
    dta $20		; C897: 20
    dta $20		; C898: 20
    dta $A0		; C899: A0
    dta $9D		; C89A: 9D
    dta $98		; C89B: 98
    dta $98		; C89C: 98
    dta $9D		; C89D: 9D
    dta $98		; C89E: 98
    dta $8F		; C89F: 8F
    dta $20		; C8A0: 20
    dta $98		; C8A1: 98
    dta $20		; C8A2: 20
    dta $98		; C8A3: 98
    dta $98		; C8A4: 98
    dta $94		; C8A5: 94
    dta $95		; C8A6: 95
    dta $94		; C8A7: 94
    dta $20		; C8A8: 20
    dta $20		; C8A9: 20
    dta $95		; C8AA: 95
    dta $98		; C8AB: 98
    dta $9E		; C8AC: 9E
    dta $98		; C8AD: 98
    dta $20		; C8AE: 20
    dta $20		; C8AF: 20
    dta $20		; C8B0: 20
    dta $20		; C8B1: 20
    dta $95		; C8B2: 95
    dta $94		; C8B3: 94
    dta $20		; C8B4: 20
    dta $98		; C8B5: 98
    dta $20		; C8B6: 20
    dta $20		; C8B7: 20
    dta $20		; C8B8: 20
    dta $20		; C8B9: 20
    dta $A0		; C8BA: A0
    dta $94		; C8BB: 94
    dta $20		; C8BC: 20
    dta $98		; C8BD: 98
    dta $8F		; C8BE: 8F
    dta $20		; C8BF: 20
    dta $98		; C8C0: 98
    dta $94		; C8C1: 94
    dta $20		; C8C2: 20
    dta $A0		; C8C3: A0
    dta $9E		; C8C4: 9E
    dta $8F		; C8C5: 8F
    dta $20		; C8C6: 20
    dta $20		; C8C7: 20
    dta $9E		; C8C8: 9E
    dta $91		; C8C9: 91
    dta $20		; C8CA: 20
    dta $98		; C8CB: 98
    dta $98		; C8CC: 98
    dta $94		; C8CD: 94
    dta $20		; C8CE: 20
    dta $20		; C8CF: 20
    dta $95		; C8D0: 95
    dta $98		; C8D1: 98
    dta $92		; C8D2: 92
    dta $A0		; C8D3: A0
    dta $98		; C8D4: 98
    dta $92		; C8D5: 92
    dta $8F		; C8D6: 8F
    dta $20		; C8D7: 20
    dta $95		; C8D8: 95
    dta $20		; C8D9: 20
    dta $93		; C8DA: 93
    dta $98		; C8DB: 98
    dta $98		; C8DC: 98
    dta $9D		; C8DD: 9D
    dta $98		; C8DE: 98
    dta $8F		; C8DF: 8F
    dta $95		; C8E0: 95
    dta $20		; C8E1: 20
    dta $20		; C8E2: 20
    dta $98		; C8E3: 98
    dta $98		; C8E4: 98
    dta $94		; C8E5: 94
    dta $95		; C8E6: 95
    dta $94		; C8E7: 94
    dta $20		; C8E8: 20
    dta $20		; C8E9: 20
    dta $95		; C8EA: 95
    dta $98		; C8EB: 98
    dta $9E		; C8EC: 9E
    dta $98		; C8ED: 98
    dta $20		; C8EE: 20
    dta $20		; C8EF: 20
    dta $20		; C8F0: 20
    dta $20		; C8F1: 20
    dta $95		; C8F2: 95
    dta $94		; C8F3: 94
    dta $20		; C8F4: 20
    dta $98		; C8F5: 98
    dta $20		; C8F6: 20
    dta $20		; C8F7: 20
    dta $20		; C8F8: 20
    dta $20		; C8F9: 20
    dta $A0		; C8FA: A0
    dta $94		; C8FB: 94
    dta $20		; C8FC: 20
    dta $98		; C8FD: 98
    dta $8F		; C8FE: 8F
    dta $20		; C8FF: 20
    dta $20		; C900: 20
    dta $20		; C901: 20
    dta $20		; C902: 20
    dta $20		; C903: 20
    dta $20		; C904: 20
    dta $20		; C905: 20
    dta $20		; C906: 20
    dta $20		; C907: 20
    dta $20		; C908: 20
    dta $20		; C909: 20
    dta $20		; C90A: 20
    dta $8E		; C90B: 8E
    dta $8F		; C90C: 8F
    dta $20		; C90D: 20
    dta $20		; C90E: 20
    dta $20		; C90F: 20
    dta $8E		; C910: 8E
    dta $98		; C911: 98
    dta $98		; C912: 98
    dta $98		; C913: 98
    dta $98		; C914: 98
    dta $98		; C915: 98
    dta $98		; C916: 98
    dta $8F		; C917: 8F
    dta $98		; C918: 98
    dta $91		; C919: 91
    dta $20		; C91A: 20
    dta $98		; C91B: 98
    dta $98		; C91C: 98
    dta $20		; C91D: 20
    dta $90		; C91E: 90
    dta $98		; C91F: 98
    dta $20		; C920: 20
    dta $20		; C921: 20
    dta $8E		; C922: 8E
    dta $98		; C923: 98
    dta $98		; C924: 98
    dta $8F		; C925: 8F
    dta $20		; C926: 20
    dta $20		; C927: 20
    dta $20		; C928: 20
    dta $20		; C929: 20
    dta $95		; C92A: 95
    dta $9D		; C92B: 9D
    dta $9E		; C92C: 9E
    dta $94		; C92D: 94
    dta $20		; C92E: 20
    dta $20		; C92F: 20
    dta $20		; C930: 20
    dta $20		; C931: 20
    dta $95		; C932: 95
    dta $94		; C933: 94
    dta $95		; C934: 95
    dta $94		; C935: 94
    dta $20		; C936: 20
    dta $20		; C937: 20
    dta $20		; C938: 20
    dta $20		; C939: 20
    dta $A0		; C93A: A0
    dta $94		; C93B: 94
    dta $95		; C93C: 95
    dta $9F		; C93D: 9F
    dta $20		; C93E: 20
    dta $20		; C93F: 20
    dta $20		; C940: 20
    dta $20		; C941: 20
    dta $20		; C942: 20
    dta $20		; C943: 20
    dta $20		; C944: 20
    dta $20		; C945: 20
    dta $20		; C946: 20
    dta $20		; C947: 20
    dta $20		; C948: 20
    dta $20		; C949: 20
    dta $20		; C94A: 20
    dta $20		; C94B: 20
    dta $20		; C94C: 20
    dta $20		; C94D: 20
    dta $20		; C94E: 20
    dta $20		; C94F: 20
    dta $8E		; C950: 8E
    dta $98		; C951: 98
    dta $8F		; C952: 8F
    dta $9F		; C953: 9F
    dta $A0		; C954: A0
    dta $8E		; C955: 8E
    dta $98		; C956: 98
    dta $8F		; C957: 8F
    dta $98		; C958: 98
    dta $98		; C959: 98
    dta $98		; C95A: 98
    dta $98		; C95B: 98
    dta $98		; C95C: 98
    dta $98		; C95D: 98
    dta $98		; C95E: 98
    dta $98		; C95F: 98
    dta $98		; C960: 98
    dta $93		; C961: 93
    dta $20		; C962: 20
    dta $90		; C963: 90
    dta $91		; C964: 91
    dta $20		; C965: 20
    dta $93		; C966: 93
    dta $98		; C967: 98
    dta $94		; C968: 94
    dta $20		; C969: 20
    dta $20		; C96A: 20
    dta $20		; C96B: 20
    dta $20		; C96C: 20
    dta $20		; C96D: 20
    dta $20		; C96E: 20
    dta $95		; C96F: 95
    dta $20		; C970: 20
    dta $20		; C971: 20
    dta $20		; C972: 20
    dta $20		; C973: 20
    dta $20		; C974: 20
    dta $20		; C975: 20
    dta $20		; C976: 20
    dta $20		; C977: 20
    dta $20		; C978: 20
    dta $20		; C979: 20
    dta $20		; C97A: 20
    dta $20		; C97B: 20
    dta $20		; C97C: 20
    dta $20		; C97D: 20
    dta $20		; C97E: 20
    dta $20		; C97F: 20
    dta $20		; C980: 20
    dta $20		; C981: 20
    dta $97		; C982: 97
    dta $96		; C983: 96
    dta $97		; C984: 97
    dta $96		; C985: 96
    dta $20		; C986: 20
    dta $20		; C987: 20
    dta $20		; C988: 20
    dta $95		; C989: 95
    dta $93		; C98A: 93
    dta $9D		; C98B: 9D
    dta $9E		; C98C: 9E
    dta $93		; C98D: 93
    dta $94		; C98E: 94
    dta $20		; C98F: 20
    dta $20		; C990: 20
    dta $20		; C991: 20
    dta $96		; C992: 96
    dta $91		; C993: 91
    dta $90		; C994: 90
    dta $97		; C995: 97
    dta $A0		; C996: A0
    dta $8F		; C997: 8F
    dta $20		; C998: 20
    dta $20		; C999: 20
    dta $20		; C99A: 20
    dta $93		; C99B: 93
    dta $93		; C99C: 93
    dta $A0		; C99D: A0
    dta $98		; C99E: 98
    dta $9F		; C99F: 9F
    dta $20		; C9A0: 20
    dta $92		; C9A1: 92
    dta $98		; C9A2: 98
    dta $98		; C9A3: 98
    dta $9F		; C9A4: 9F
    dta $90		; C9A5: 90
    dta $98		; C9A6: 98
    dta $98		; C9A7: 98
    dta $A0		; C9A8: A0
    dta $98		; C9A9: 98
    dta $91		; C9AA: 91
    dta $20		; C9AB: 20
    dta $97		; C9AC: 97
    dta $8E		; C9AD: 8E
    dta $98		; C9AE: 98
    dta $9D		; C9AF: 9D
    dta $9E		; C9B0: 9E
    dta $98		; C9B1: 98
    dta $98		; C9B2: 98
    dta $92		; C9B3: 92
    dta $A0		; C9B4: A0
    dta $98		; C9B5: 98
    dta $98		; C9B6: 98
    dta $91		; C9B7: 91
    dta $20		; C9B8: 20
    dta $93		; C9B9: 93
    dta $98		; C9BA: 98
    dta $98		; C9BB: 98
    dta $98		; C9BC: 98
    dta $9D		; C9BD: 9D
    dta $91		; C9BE: 91
    dta $20		; C9BF: 20
    dta $20		; C9C0: 20
    dta $20		; C9C1: 20
    dta $20		; C9C2: 20
    dta $20		; C9C3: 20
    dta $20		; C9C4: 20
    dta $20		; C9C5: 20
    dta $20		; C9C6: 20
    dta $20		; C9C7: 20
    dta $20		; C9C8: 20
    dta $20		; C9C9: 20
    dta $20		; C9CA: 20
    dta $20		; C9CB: 20
    dta $20		; C9CC: 20
    dta $20		; C9CD: 20
    dta $20		; C9CE: 20
    dta $20		; C9CF: 20
    dta $20		; C9D0: 20
    dta $20		; C9D1: 20
    dta $20		; C9D2: 20
    dta $20		; C9D3: 20
    dta $20		; C9D4: 20
    dta $20		; C9D5: 20
    dta $20		; C9D6: 20
    dta $20		; C9D7: 20
    dta $95		; C9D8: 95
    dta $8F		; C9D9: 8F
    dta $A0		; C9DA: A0
    dta $98		; C9DB: 98
    dta $98		; C9DC: 98
    dta $9F		; C9DD: 9F
    dta $8E		; C9DE: 8E
    dta $94		; C9DF: 94
    dta $9F		; C9E0: 9F
    dta $90		; C9E1: 90
    dta $98		; C9E2: 98
    dta $93		; C9E3: 93
    dta $93		; C9E4: 93
    dta $98		; C9E5: 98
    dta $91		; C9E6: 91
    dta $A0		; C9E7: A0
    dta $94		; C9E8: 94
    dta $9E		; C9E9: 9E
    dta $96		; C9EA: 96
    dta $9E		; C9EB: 9E
    dta $9D		; C9EC: 9D
    dta $97		; C9ED: 97
    dta $9D		; C9EE: 9D
    dta $95		; C9EF: 95
    dta $94		; C9F0: 94
    dta $95		; C9F1: 95
    dta $90		; C9F2: 90
    dta $9D		; C9F3: 9D
    dta $9E		; C9F4: 9E
    dta $91		; C9F5: 91
    dta $94		; C9F6: 94
    dta $95		; C9F7: 95
    dta $20		; C9F8: 20
    dta $95		; C9F9: 95
    dta $20		; C9FA: 20
    dta $91		; C9FB: 91
    dta $90		; C9FC: 90
    dta $20		; C9FD: 20
    dta $94		; C9FE: 94
    dta $20		; C9FF: 20
    dta $20		; CA00: 20
    dta $20		; CA01: 20
    dta $20		; CA02: 20
    dta $20		; CA03: 20
    dta $20		; CA04: 20
    dta $20		; CA05: 20
    dta $20		; CA06: 20
    dta $20		; CA07: 20
    dta $20		; CA08: 20
    dta $20		; CA09: 20
    dta $20		; CA0A: 20
    dta $20		; CA0B: 20
    dta $20		; CA0C: 20
    dta $20		; CA0D: 20
    dta $20		; CA0E: 20
    dta $20		; CA0F: 20
    dta $8F		; CA10: 8F
    dta $8E		; CA11: 8E
    dta $20		; CA12: 20
    dta $20		; CA13: 20
    dta $20		; CA14: 20
    dta $20		; CA15: 20
    dta $20		; CA16: 20
    dta $20		; CA17: 20
    dta $9F		; CA18: 9F
    dta $A0		; CA19: A0
    dta $8E		; CA1A: 8E
    dta $A0		; CA1B: A0
    dta $98		; CA1C: 98
    dta $98		; CA1D: 98
    dta $8F		; CA1E: 8F
    dta $20		; CA1F: 20
    dta $98		; CA20: 98
    dta $98		; CA21: 98
    dta $98		; CA22: 98
    dta $98		; CA23: 98
    dta $98		; CA24: 98
    dta $9E		; CA25: 9E
    dta $98		; CA26: 98
    dta $8F		; CA27: 8F
    dta $9E		; CA28: 9E
    dta $9D		; CA29: 9D
    dta $90		; CA2A: 90
    dta $98		; CA2B: 98
    dta $9F		; CA2C: 9F
    dta $9E		; CA2D: 9E
    dta $9D		; CA2E: 9D
    dta $95		; CA2F: 95
    dta $90		; CA30: 90
    dta $91		; CA31: 91
    dta $92		; CA32: 92
    dta $91		; CA33: 91
    dta $8E		; CA34: 8E
    dta $92		; CA35: 92
    dta $9D		; CA36: 9D
    dta $95		; CA37: 95
    dta $20		; CA38: 20
    dta $20		; CA39: 20
    dta $20		; CA3A: 20
    dta $20		; CA3B: 20
    dta $20		; CA3C: 20
    dta $8E		; CA3D: 8E
    dta $92		; CA3E: 92
    dta $91		; CA3F: 91
    dta $20		; CA40: 20
    dta $20		; CA41: 20
    dta $20		; CA42: 20
    dta $20		; CA43: 20
    dta $20		; CA44: 20
    dta $20		; CA45: 20
    dta $20		; CA46: 20
    dta $20		; CA47: 20
    dta $20		; CA48: 20
    dta $20		; CA49: 20
    dta $20		; CA4A: 20
    dta $20		; CA4B: 20
    dta $20		; CA4C: 20
    dta $20		; CA4D: 20
    dta $20		; CA4E: 20
    dta $20		; CA4F: 20
    dta $8E		; CA50: 8E
    dta $8F		; CA51: 8F
    dta $A0		; CA52: A0
    dta $94		; CA53: 94
    dta $92		; CA54: 92
    dta $20		; CA55: 20
    dta $8E		; CA56: 8E
    dta $8F		; CA57: 8F
    dta $98		; CA58: 98
    dta $98		; CA59: 98
    dta $98		; CA5A: 98
    dta $A0		; CA5B: A0
    dta $98		; CA5C: 98
    dta $9F		; CA5D: 9F
    dta $98		; CA5E: 98
    dta $98		; CA5F: 98
    dta $90		; CA60: 90
    dta $98		; CA61: 98
    dta $98		; CA62: 98
    dta $98		; CA63: 98
    dta $98		; CA64: 98
    dta $98		; CA65: 98
    dta $98		; CA66: 98
    dta $91		; CA67: 91
    dta $8E		; CA68: 8E
    dta $98		; CA69: 98
    dta $98		; CA6A: 98
    dta $9E		; CA6B: 9E
    dta $98		; CA6C: 98
    dta $9E		; CA6D: 9E
    dta $98		; CA6E: 98
    dta $9F		; CA6F: 9F
    dta $95		; CA70: 95
    dta $98		; CA71: 98
    dta $98		; CA72: 98
    dta $8F		; CA73: 8F
    dta $20		; CA74: 20
    dta $8E		; CA75: 8E
    dta $98		; CA76: 98
    dta $98		; CA77: 98
    dta $20		; CA78: 20
    dta $93		; CA79: 93
    dta $98		; CA7A: 98
    dta $91		; CA7B: 91
    dta $20		; CA7C: 20
    dta $90		; CA7D: 90
    dta $98		; CA7E: 98
    dta $91		; CA7F: 91
    dta $20		; CA80: 20
    dta $20		; CA81: 20
    dta $20		; CA82: 20
    dta $20		; CA83: 20
    dta $20		; CA84: 20
    dta $20		; CA85: 20
    dta $20		; CA86: 20
    dta $20		; CA87: 20
    dta $20		; CA88: 20
    dta $20		; CA89: 20
    dta $8E		; CA8A: 8E
    dta $92		; CA8B: 92
    dta $92		; CA8C: 92
    dta $8F		; CA8D: 8F
    dta $20		; CA8E: 20
    dta $20		; CA8F: 20
    dta $20		; CA90: 20
    dta $97		; CA91: 97
    dta $96		; CA92: 96
    dta $98		; CA93: 98
    dta $98		; CA94: 98
    dta $97		; CA95: 97
    dta $96		; CA96: 96
    dta $20		; CA97: 20
    dta $95		; CA98: 95
    dta $20		; CA99: 20
    dta $98		; CA9A: 98
    dta $94		; CA9B: 94
    dta $95		; CA9C: 95
    dta $98		; CA9D: 98
    dta $20		; CA9E: 20
    dta $94		; CA9F: 94
    dta $94		; CAA0: 94
    dta $8F		; CAA1: 8F
    dta $9E		; CAA2: 9E
    dta $98		; CAA3: 98
    dta $98		; CAA4: 98
    dta $9D		; CAA5: 9D
    dta $8E		; CAA6: 8E
    dta $95		; CAA7: 95
    dta $94		; CAA8: 94
    dta $8E		; CAA9: 8E
    dta $8F		; CAAA: 8F
    dta $93		; CAAB: 93
    dta $93		; CAAC: 93
    dta $20		; CAAD: 20
    dta $92		; CAAE: 92
    dta $95		; CAAF: 95
    dta $A0		; CAB0: A0
    dta $98		; CAB1: 98
    dta $98		; CAB2: 98
    dta $8E		; CAB3: 8E
    dta $98		; CAB4: 98
    dta $A0		; CAB5: A0
    dta $98		; CAB6: 98
    dta $9F		; CAB7: 9F
    dta $9E		; CAB8: 9E
    dta $98		; CAB9: 98
    dta $93		; CABA: 93
    dta $98		; CABB: 98
    dta $9D		; CABC: 9D
    dta $91		; CABD: 91
    dta $9E		; CABE: 9E
    dta $9D		; CABF: 9D
    dta $20		; CAC0: 20
    dta $20		; CAC1: 20
    dta $20		; CAC2: 20
    dta $20		; CAC3: 20
    dta $20		; CAC4: 20
    dta $20		; CAC5: 20
    dta $20		; CAC6: 20
    dta $20		; CAC7: 20
    dta $20		; CAC8: 20
    dta $8E		; CAC9: 8E
    dta $8F		; CACA: 8F
    dta $20		; CACB: 20
    dta $8E		; CACC: 8E
    dta $93		; CACD: 93
    dta $8F		; CACE: 8F
    dta $20		; CACF: 20
    dta $8E		; CAD0: 8E
    dta $91		; CAD1: 91
    dta $95		; CAD2: 95
    dta $20		; CAD3: 20
    dta $94		; CAD4: 94
    dta $20		; CAD5: 20
    dta $20		; CAD6: 20
    dta $20		; CAD7: 20
    dta $90		; CAD8: 90
    dta $8F		; CAD9: 8F
    dta $20		; CADA: 20
    dta $95		; CADB: 95
    dta $8E		; CADC: 8E
    dta $93		; CADD: 93
    dta $8F		; CADE: 8F
    dta $96		; CADF: 96
    dta $20		; CAE0: 20
    dta $90		; CAE1: 90
    dta $96		; CAE2: 96
    dta $90		; CAE3: 90
    dta $8F		; CAE4: 8F
    dta $8E		; CAE5: 8E
    dta $91		; CAE6: 91
    dta $95		; CAE7: 95
    dta $8E		; CAE8: 8E
    dta $93		; CAE9: 93
    dta $8F		; CAEA: 8F
    dta $94		; CAEB: 94
    dta $94		; CAEC: 94
    dta $94		; CAED: 94
    dta $92		; CAEE: 92
    dta $91		; CAEF: 91
    dta $94		; CAF0: 94
    dta $20		; CAF1: 20
    dta $90		; CAF2: 90
    dta $A0		; CAF3: A0
    dta $98		; CAF4: 98
    dta $97		; CAF5: 97
    dta $20		; CAF6: 20
    dta $20		; CAF7: 20
    dta $90		; CAF8: 90
    dta $91		; CAF9: 91
    dta $8E		; CAFA: 8E
    dta $98		; CAFB: 98
    dta $98		; CAFC: 98
    dta $9F		; CAFD: 9F
    dta $20		; CAFE: 20
    dta $20		; CAFF: 20
    dta $20		; CB00: 20
    dta $20		; CB01: 20
    dta $20		; CB02: 20
    dta $20		; CB03: 20
    dta $8E		; CB04: 8E
    dta $8F		; CB05: 8F
    dta $20		; CB06: 20
    dta $20		; CB07: 20
    dta $20		; CB08: 20
    dta $20		; CB09: 20
    dta $20		; CB0A: 20
    dta $8E		; CB0B: 8E
    dta $98		; CB0C: 98
    dta $20		; CB0D: 20
    dta $20		; CB0E: 20
    dta $20		; CB0F: 20
    dta $20		; CB10: 20
    dta $20		; CB11: 20
    dta $8E		; CB12: 8E
    dta $98		; CB13: 98
    dta $98		; CB14: 98
    dta $94		; CB15: 94
    dta $20		; CB16: 20
    dta $20		; CB17: 20
    dta $20		; CB18: 20
    dta $8F		; CB19: 8F
    dta $A0		; CB1A: A0
    dta $A0		; CB1B: A0
    dta $9F		; CB1C: 9F
    dta $9F		; CB1D: 9F
    dta $8E		; CB1E: 8E
    dta $20		; CB1F: 20
    dta $97		; CB20: 97
    dta $90		; CB21: 90
    dta $98		; CB22: 98
    dta $97		; CB23: 97
    dta $96		; CB24: 96
    dta $98		; CB25: 98
    dta $91		; CB26: 91
    dta $96		; CB27: 96
    dta $91		; CB28: 91
    dta $20		; CB29: 20
    dta $97		; CB2A: 97
    dta $98		; CB2B: 98
    dta $98		; CB2C: 98
    dta $96		; CB2D: 96
    dta $20		; CB2E: 20
    dta $90		; CB2F: 90
    dta $20		; CB30: 20
    dta $90		; CB31: 90
    dta $8F		; CB32: 8F
    dta $20		; CB33: 20
    dta $20		; CB34: 20
    dta $8E		; CB35: 8E
    dta $91		; CB36: 91
    dta $20		; CB37: 20
    dta $20		; CB38: 20
    dta $20		; CB39: 20
    dta $A0		; CB3A: A0
    dta $20		; CB3B: 20
    dta $20		; CB3C: 20
    dta $9F		; CB3D: 9F
    dta $20		; CB3E: 20
    dta $20		; CB3F: 20
    dta $20		; CB40: 20
    dta $20		; CB41: 20
    dta $20		; CB42: 20
    dta $20		; CB43: 20
    dta $20		; CB44: 20
    dta $20		; CB45: 20
    dta $20		; CB46: 20
    dta $20		; CB47: 20
    dta $96		; CB48: 96
    dta $20		; CB49: 20
    dta $20		; CB4A: 20
    dta $20		; CB4B: 20
    dta $20		; CB4C: 20
    dta $20		; CB4D: 20
    dta $92		; CB4E: 92
    dta $20		; CB4F: 20
    dta $20		; CB50: 20
    dta $96		; CB51: 96
    dta $20		; CB52: 20
    dta $20		; CB53: 20
    dta $20		; CB54: 20
    dta $95		; CB55: 95
    dta $98		; CB56: 98
    dta $94		; CB57: 94
    dta $20		; CB58: 20
    dta $20		; CB59: 20
    dta $96		; CB5A: 96
    dta $91		; CB5B: 91
    dta $20		; CB5C: 20
    dta $98		; CB5D: 98
    dta $9D		; CB5E: 9D
    dta $98		; CB5F: 98
    dta $20		; CB60: 20
    dta $20		; CB61: 20
    dta $91		; CB62: 91
    dta $96		; CB63: 96
    dta $20		; CB64: 20
    dta $98		; CB65: 98
    dta $94		; CB66: 94
    dta $98		; CB67: 98
    dta $20		; CB68: 20
    dta $20		; CB69: 20
    dta $20		; CB6A: 20
    dta $20		; CB6B: 20
    dta $20		; CB6C: 20
    dta $9E		; CB6D: 9E
    dta $98		; CB6E: 98
    dta $9D		; CB6F: 9D
    dta $20		; CB70: 20
    dta $20		; CB71: 20
    dta $20		; CB72: 20
    dta $20		; CB73: 20
    dta $20		; CB74: 20
    dta $90		; CB75: 90
    dta $98		; CB76: 98
    dta $91		; CB77: 91
    dta $20		; CB78: 20
    dta $20		; CB79: 20
    dta $20		; CB7A: 20
    dta $20		; CB7B: 20
    dta $20		; CB7C: 20
    dta $20		; CB7D: 20
    dta $20		; CB7E: 20
    dta $20		; CB7F: 20
    dta $20		; CB80: 20
    dta $20		; CB81: 20
    dta $93		; CB82: 93
    dta $9F		; CB83: 9F
    dta $92		; CB84: 92
    dta $A0		; CB85: A0
    dta $93		; CB86: 93
    dta $20		; CB87: 20
    dta $94		; CB88: 94
    dta $94		; CB89: 94
    dta $94		; CB8A: 94
    dta $95		; CB8B: 95
    dta $98		; CB8C: 98
    dta $94		; CB8D: 94
    dta $20		; CB8E: 20
    dta $20		; CB8F: 20
    dta $90		; CB90: 90
    dta $9D		; CB91: 9D
    dta $20		; CB92: 20
    dta $92		; CB93: 92
    dta $98		; CB94: 98
    dta $92		; CB95: 92
    dta $20		; CB96: 20
    dta $20		; CB97: 20
    dta $20		; CB98: 20
    dta $94		; CB99: 94
    dta $97		; CB9A: 97
    dta $9E		; CB9B: 9E
    dta $98		; CB9C: 98
    dta $9D		; CB9D: 9D
    dta $96		; CB9E: 96
    dta $20		; CB9F: 20
    dta $20		; CBA0: 20
    dta $9D		; CBA1: 9D
    dta $20		; CBA2: 20
    dta $95		; CBA3: 95
    dta $98		; CBA4: 98
    dta $94		; CBA5: 94
    dta $8E		; CBA6: 8E
    dta $91		; CBA7: 91
    dta $20		; CBA8: 20
    dta $94		; CBA9: 94
    dta $20		; CBAA: 20
    dta $98		; CBAB: 98
    dta $93		; CBAC: 93
    dta $98		; CBAD: 98
    dta $8F		; CBAE: 8F
    dta $8E		; CBAF: 8E
    dta $20		; CBB0: 20
    dta $94		; CBB1: 94
    dta $20		; CBB2: 20
    dta $98		; CBB3: 98
    dta $20		; CBB4: 20
    dta $98		; CBB5: 98
    dta $90		; CBB6: 90
    dta $91		; CBB7: 91
    dta $20		; CBB8: 20
    dta $94		; CBB9: 94
    dta $95		; CBBA: 95
    dta $95		; CBBB: 95
    dta $20		; CBBC: 20
    dta $94		; CBBD: 94
    dta $94		; CBBE: 94
    dta $20		; CBBF: 20
    dta $20		; CBC0: 20
    dta $20		; CBC1: 20
    dta $20		; CBC2: 20
    dta $95		; CBC3: 95
    dta $98		; CBC4: 98
    dta $20		; CBC5: 20
    dta $20		; CBC6: 20
    dta $20		; CBC7: 20
    dta $20		; CBC8: 20
    dta $20		; CBC9: 20
    dta $20		; CBCA: 20
    dta $90		; CBCB: 90
    dta $9D		; CBCC: 9D
    dta $20		; CBCD: 20
    dta $20		; CBCE: 20
    dta $20		; CBCF: 20
    dta $20		; CBD0: 20
    dta $20		; CBD1: 20
    dta $97		; CBD2: 97
    dta $98		; CBD3: 98
    dta $98		; CBD4: 98
    dta $9D		; CBD5: 9D
    dta $8F		; CBD6: 8F
    dta $20		; CBD7: 20
    dta $20		; CBD8: 20
    dta $90		; CBD9: 90
    dta $8F		; CBDA: 8F
    dta $95		; CBDB: 95
    dta $98		; CBDC: 98
    dta $20		; CBDD: 20
    dta $97		; CBDE: 97
    dta $20		; CBDF: 20
    dta $20		; CBE0: 20
    dta $20		; CBE1: 20
    dta $90		; CBE2: 90
    dta $90		; CBE3: 90
    dta $9D		; CBE4: 9D
    dta $90		; CBE5: 90
    dta $20		; CBE6: 20
    dta $20		; CBE7: 20
    dta $20		; CBE8: 20
    dta $20		; CBE9: 20
    dta $20		; CBEA: 20
    dta $95		; CBEB: 95
    dta $9E		; CBEC: 9E
    dta $20		; CBED: 20
    dta $20		; CBEE: 20
    dta $20		; CBEF: 20
    dta $20		; CBF0: 20
    dta $20		; CBF1: 20
    dta $20		; CBF2: 20
    dta $9D		; CBF3: 9D
    dta $90		; CBF4: 90
    dta $94		; CBF5: 94
    dta $20		; CBF6: 20
    dta $20		; CBF7: 20
    dta $20		; CBF8: 20
    dta $20		; CBF9: 20
    dta $8E		; CBFA: 8E
    dta $94		; CBFB: 94
    dta $20		; CBFC: 20
    dta $9F		; CBFD: 9F
    dta $20		; CBFE: 20
    dta $20		; CBFF: 20
    dta $20		; CC00: 20
    dta $8F		; CC01: 8F
    dta $20		; CC02: 20
    dta $95		; CC03: 95
    dta $98		; CC04: 98
    dta $20		; CC05: 20
    dta $20		; CC06: 20
    dta $20		; CC07: 20
    dta $20		; CC08: 20
    dta $94		; CC09: 94
    dta $20		; CC0A: 20
    dta $90		; CC0B: 90
    dta $9D		; CC0C: 9D
    dta $20		; CC0D: 20
    dta $20		; CC0E: 20
    dta $20		; CC0F: 20
    dta $20		; CC10: 20
    dta $94		; CC11: 94
    dta $97		; CC12: 97
    dta $98		; CC13: 98
    dta $98		; CC14: 98
    dta $9D		; CC15: 9D
    dta $8F		; CC16: 8F
    dta $20		; CC17: 20
    dta $90		; CC18: 90
    dta $9D		; CC19: 9D
    dta $20		; CC1A: 20
    dta $95		; CC1B: 95
    dta $98		; CC1C: 98
    dta $20		; CC1D: 20
    dta $97		; CC1E: 97
    dta $20		; CC1F: 20
    dta $20		; CC20: 20
    dta $20		; CC21: 20
    dta $20		; CC22: 20
    dta $95		; CC23: 95
    dta $98		; CC24: 98
    dta $90		; CC25: 90
    dta $20		; CC26: 20
    dta $20		; CC27: 20
    dta $20		; CC28: 20
    dta $20		; CC29: 20
    dta $20		; CC2A: 20
    dta $9D		; CC2B: 9D
    dta $90		; CC2C: 90
    dta $94		; CC2D: 94
    dta $20		; CC2E: 20
    dta $20		; CC2F: 20
    dta $20		; CC30: 20
    dta $20		; CC31: 20
    dta $20		; CC32: 20
    dta $94		; CC33: 94
    dta $20		; CC34: 20
    dta $94		; CC35: 94
    dta $20		; CC36: 20
    dta $20		; CC37: 20
    dta $20		; CC38: 20
    dta $20		; CC39: 20
    dta $8E		; CC3A: 8E
    dta $94		; CC3B: 94
    dta $20		; CC3C: 20
    dta $9F		; CC3D: 9F
    dta $20		; CC3E: 20
    dta $20		; CC3F: 20
    dta $20		; CC40: 20
    dta $20		; CC41: 20
    dta $20		; CC42: 20
    dta $95		; CC43: 95
    dta $98		; CC44: 98
    dta $20		; CC45: 20
    dta $20		; CC46: 20
    dta $20		; CC47: 20
    dta $20		; CC48: 20
    dta $20		; CC49: 20
    dta $20		; CC4A: 20
    dta $90		; CC4B: 90
    dta $9D		; CC4C: 9D
    dta $20		; CC4D: 20
    dta $20		; CC4E: 20
    dta $20		; CC4F: 20
    dta $20		; CC50: 20
    dta $20		; CC51: 20
    dta $97		; CC52: 97
    dta $93		; CC53: 93
    dta $9D		; CC54: 9D
    dta $93		; CC55: 93
    dta $8F		; CC56: 8F
    dta $20		; CC57: 20
    dta $20		; CC58: 20
    dta $90		; CC59: 90
    dta $8F		; CC5A: 8F
    dta $93		; CC5B: 93
    dta $9D		; CC5C: 9D
    dta $91		; CC5D: 91
    dta $97		; CC5E: 97
    dta $20		; CC5F: 20
    dta $20		; CC60: 20
    dta $20		; CC61: 20
    dta $90		; CC62: 90
    dta $90		; CC63: 90
    dta $9D		; CC64: 9D
    dta $90		; CC65: 90
    dta $20		; CC66: 20
    dta $20		; CC67: 20
    dta $20		; CC68: 20
    dta $20		; CC69: 20
    dta $20		; CC6A: 20
    dta $95		; CC6B: 95
    dta $9E		; CC6C: 9E
    dta $20		; CC6D: 20
    dta $20		; CC6E: 20
    dta $20		; CC6F: 20
    dta $20		; CC70: 20
    dta $20		; CC71: 20
    dta $20		; CC72: 20
    dta $9D		; CC73: 9D
    dta $90		; CC74: 90
    dta $94		; CC75: 94
    dta $20		; CC76: 20
    dta $20		; CC77: 20
    dta $20		; CC78: 20
    dta $20		; CC79: 20
    dta $8E		; CC7A: 8E
    dta $94		; CC7B: 94
    dta $20		; CC7C: 20
    dta $9F		; CC7D: 9F
    dta $20		; CC7E: 20
    dta $20		; CC7F: 20
    dta $20		; CC80: 20
    dta $20		; CC81: 20
    dta $20		; CC82: 20
    dta $A0		; CC83: A0
    dta $9F		; CC84: 9F
    dta $20		; CC85: 20
    dta $20		; CC86: 20
    dta $20		; CC87: 20
    dta $20		; CC88: 20
    dta $20		; CC89: 20
    dta $20		; CC8A: 20
    dta $9E		; CC8B: 9E
    dta $9D		; CC8C: 9D
    dta $20		; CC8D: 20
    dta $20		; CC8E: 20
    dta $20		; CC8F: 20
    dta $8E		; CC90: 8E
    dta $A0		; CC91: A0
    dta $9E		; CC92: 9E
    dta $93		; CC93: 93
    dta $93		; CC94: 93
    dta $9D		; CC95: 9D
    dta $9F		; CC96: 9F
    dta $8F		; CC97: 8F
    dta $93		; CC98: 93
    dta $20		; CC99: 20
    dta $95		; CC9A: 95
    dta $93		; CC9B: 93
    dta $93		; CC9C: 93
    dta $94		; CC9D: 94
    dta $20		; CC9E: 20
    dta $93		; CC9F: 93
    dta $20		; CCA0: 20
    dta $20		; CCA1: 20
    dta $20		; CCA2: 20
    dta $9D		; CCA3: 9D
    dta $9E		; CCA4: 9E
    dta $20		; CCA5: 20
    dta $20		; CCA6: 20
    dta $20		; CCA7: 20
    dta $20		; CCA8: 20
    dta $20		; CCA9: 20
    dta $8E		; CCAA: 8E
    dta $98		; CCAB: 98
    dta $98		; CCAC: 98
    dta $8F		; CCAD: 8F
    dta $20		; CCAE: 20
    dta $20		; CCAF: 20
    dta $20		; CCB0: 20
    dta $20		; CCB1: 20
    dta $98		; CCB2: 98
    dta $91		; CCB3: 91
    dta $90		; CCB4: 90
    dta $98		; CCB5: 98
    dta $20		; CCB6: 20
    dta $20		; CCB7: 20
    dta $20		; CCB8: 20
    dta $8E		; CCB9: 8E
    dta $98		; CCBA: 98
    dta $20		; CCBB: 20
    dta $20		; CCBC: 20
    dta $98		; CCBD: 98
    dta $8F		; CCBE: 8F
    dta $20		; CCBF: 20
    dta $20		; CCC0: 20
    dta $20		; CCC1: 20
    dta $94		; CCC2: 94
    dta $8E		; CCC3: 8E
    dta $9F		; CCC4: 9F
    dta $20		; CCC5: 20
    dta $94		; CCC6: 94
    dta $20		; CCC7: 20
    dta $20		; CCC8: 20
    dta $20		; CCC9: 20
    dta $94		; CCCA: 94
    dta $95		; CCCB: 95
    dta $98		; CCCC: 98
    dta $20		; CCCD: 20
    dta $94		; CCCE: 94
    dta $20		; CCCF: 20
    dta $20		; CCD0: 20
    dta $20		; CCD1: 20
    dta $90		; CCD2: 90
    dta $92		; CCD3: 92
    dta $9F		; CCD4: 9F
    dta $97		; CCD5: 97
    dta $20		; CCD6: 20
    dta $20		; CCD7: 20
    dta $20		; CCD8: 20
    dta $20		; CCD9: 20
    dta $20		; CCDA: 20
    dta $95		; CCDB: 95
    dta $98		; CCDC: 98
    dta $20		; CCDD: 20
    dta $20		; CCDE: 20
    dta $20		; CCDF: 20
    dta $20		; CCE0: 20
    dta $20		; CCE1: 20
    dta $20		; CCE2: 20
    dta $A0		; CCE3: A0
    dta $98		; CCE4: 98
    dta $8F		; CCE5: 8F
    dta $20		; CCE6: 20
    dta $20		; CCE7: 20
    dta $20		; CCE8: 20
    dta $20		; CCE9: 20
    dta $20		; CCEA: 20
    dta $9D		; CCEB: 9D
    dta $90		; CCEC: 90
    dta $94		; CCED: 94
    dta $20		; CCEE: 20
    dta $20		; CCEF: 20
    dta $20		; CCF0: 20
    dta $20		; CCF1: 20
    dta $20		; CCF2: 20
    dta $94		; CCF3: 94
    dta $20		; CCF4: 20
    dta $94		; CCF5: 94
    dta $20		; CCF6: 20
    dta $20		; CCF7: 20
    dta $20		; CCF8: 20
    dta $20		; CCF9: 20
    dta $8E		; CCFA: 8E
    dta $94		; CCFB: 94
    dta $20		; CCFC: 20
    dta $9F		; CCFD: 9F
    dta $20		; CCFE: 20
    dta $20		; CCFF: 20
    dta $97		; CD00: 97
    dta $8F		; CD01: 8F
    dta $20		; CD02: 20
    dta $95		; CD03: 95
    dta $98		; CD04: 98
    dta $20		; CD05: 20
    dta $20		; CD06: 20
    dta $20		; CD07: 20
    dta $8E		; CD08: 8E
    dta $91		; CD09: 91
    dta $20		; CD0A: 20
    dta $90		; CD0B: 90
    dta $9D		; CD0C: 9D
    dta $20		; CD0D: 20
    dta $20		; CD0E: 20
    dta $20		; CD0F: 20
    dta $95		; CD10: 95
    dta $20		; CD11: 20
    dta $97		; CD12: 97
    dta $98		; CD13: 98
    dta $98		; CD14: 98
    dta $9D		; CD15: 9D
    dta $8F		; CD16: 8F
    dta $20		; CD17: 20
    dta $95		; CD18: 95
    dta $97		; CD19: 97
    dta $20		; CD1A: 20
    dta $95		; CD1B: 95
    dta $98		; CD1C: 98
    dta $20		; CD1D: 20
    dta $97		; CD1E: 97
    dta $20		; CD1F: 20
    dta $95		; CD20: 95
    dta $20		; CD21: 20
    dta $20		; CD22: 20
    dta $A0		; CD23: A0
    dta $98		; CD24: 98
    dta $97		; CD25: 97
    dta $20		; CD26: 20
    dta $20		; CD27: 20
    dta $95		; CD28: 95
    dta $20		; CD29: 20
    dta $20		; CD2A: 20
    dta $9D		; CD2B: 9D
    dta $90		; CD2C: 90
    dta $94		; CD2D: 94
    dta $20		; CD2E: 20
    dta $20		; CD2F: 20
    dta $95		; CD30: 95
    dta $20		; CD31: 20
    dta $20		; CD32: 20
    dta $94		; CD33: 94
    dta $20		; CD34: 20
    dta $94		; CD35: 94
    dta $20		; CD36: 20
    dta $20		; CD37: 20
    dta $95		; CD38: 95
    dta $20		; CD39: 20
    dta $8E		; CD3A: 8E
    dta $94		; CD3B: 94
    dta $20		; CD3C: 20
    dta $9F		; CD3D: 9F
    dta $20		; CD3E: 20
    dta $20		; CD3F: 20
    dta $20		; CD40: 20
    dta $20		; CD41: 20
    dta $9E		; CD42: 9E
    dta $92		; CD43: 92
    dta $92		; CD44: 92
    dta $9D		; CD45: 9D
    dta $20		; CD46: 20
    dta $20		; CD47: 20
    dta $A0		; CD48: A0
    dta $9F		; CD49: 9F
    dta $95		; CD4A: 95
    dta $A0		; CD4B: A0
    dta $9F		; CD4C: 9F
    dta $94		; CD4D: 94
    dta $A0		; CD4E: A0
    dta $9F		; CD4F: 9F
    dta $98		; CD50: 98
    dta $98		; CD51: 98
    dta $9F		; CD52: 9F
    dta $96		; CD53: 96
    dta $97		; CD54: 97
    dta $A0		; CD55: A0
    dta $98		; CD56: 98
    dta $98		; CD57: 98
    dta $98		; CD58: 98
    dta $98		; CD59: 98
    dta $9E		; CD5A: 9E
    dta $98		; CD5B: 98
    dta $98		; CD5C: 98
    dta $9D		; CD5D: 9D
    dta $98		; CD5E: 98
    dta $98		; CD5F: 98
    dta $98		; CD60: 98
    dta $98		; CD61: 98
    dta $90		; CD62: 90
    dta $98		; CD63: 98
    dta $98		; CD64: 98
    dta $91		; CD65: 91
    dta $98		; CD66: 98
    dta $98		; CD67: 98
    dta $98		; CD68: 98
    dta $94		; CD69: 94
    dta $20		; CD6A: 20
    dta $A0		; CD6B: A0
    dta $9F		; CD6C: 9F
    dta $20		; CD6D: 20
    dta $95		; CD6E: 95
    dta $98		; CD6F: 98
    dta $98		; CD70: 98
    dta $91		; CD71: 91
    dta $95		; CD72: 95
    dta $20		; CD73: 20
    dta $20		; CD74: 20
    dta $94		; CD75: 94
    dta $90		; CD76: 90
    dta $98		; CD77: 98
    dta $9D		; CD78: 9D
    dta $20		; CD79: 20
    dta $9D		; CD7A: 9D
    dta $94		; CD7B: 94
    dta $95		; CD7C: 95
    dta $9E		; CD7D: 9E
    dta $20		; CD7E: 20
    dta $9E		; CD7F: 9E
    dta $20		; CD80: 20
    dta $20		; CD81: 20
    dta $95		; CD82: 95
    dta $92		; CD83: 92
    dta $92		; CD84: 92
    dta $94		; CD85: 94
    dta $20		; CD86: 20
    dta $20		; CD87: 20
    dta $8E		; CD88: 8E
    dta $98		; CD89: 98
    dta $8F		; CD8A: 8F
    dta $98		; CD8B: 98
    dta $98		; CD8C: 98
    dta $8E		; CD8D: 8E
    dta $98		; CD8E: 98
    dta $8F		; CD8F: 8F
    dta $A0		; CD90: A0
    dta $98		; CD91: 98
    dta $98		; CD92: 98
    dta $A0		; CD93: A0
    dta $9F		; CD94: 9F
    dta $98		; CD95: 98
    dta $98		; CD96: 98
    dta $9F		; CD97: 9F
    dta $98		; CD98: 98
    dta $98		; CD99: 98
    dta $98		; CD9A: 98
    dta $98		; CD9B: 98
    dta $98		; CD9C: 98
    dta $98		; CD9D: 98
    dta $98		; CD9E: 98
    dta $98		; CD9F: 98
    dta $98		; CDA0: 98
    dta $9D		; CDA1: 9D
    dta $95		; CDA2: 95
    dta $98		; CDA3: 98
    dta $98		; CDA4: 98
    dta $94		; CDA5: 94
    dta $9E		; CDA6: 9E
    dta $98		; CDA7: 98
    dta $98		; CDA8: 98
    dta $91		; CDA9: 91
    dta $8E		; CDAA: 8E
    dta $98		; CDAB: 98
    dta $98		; CDAC: 98
    dta $8F		; CDAD: 8F
    dta $90		; CDAE: 90
    dta $98		; CDAF: 98
    dta $9D		; CDB0: 9D
    dta $20		; CDB1: 20
    dta $95		; CDB2: 95
    dta $94		; CDB3: 94
    dta $95		; CDB4: 95
    dta $94		; CDB5: 94
    dta $20		; CDB6: 20
    dta $9E		; CDB7: 9E
    dta $91		; CDB8: 91
    dta $20		; CDB9: 20
    dta $9D		; CDBA: 9D
    dta $94		; CDBB: 94
    dta $95		; CDBC: 95
    dta $9E		; CDBD: 9E
    dta $20		; CDBE: 20
    dta $90		; CDBF: 90
    dta $20		; CDC0: 20
    dta $20		; CDC1: 20
    dta $20		; CDC2: 20
    dta $20		; CDC3: 20
    dta $20		; CDC4: 20
    dta $20		; CDC5: 20
    dta $20		; CDC6: 20
    dta $20		; CDC7: 20
    dta $20		; CDC8: 20
    dta $8E		; CDC9: 8E
    dta $20		; CDCA: 20
    dta $95		; CDCB: 95
    dta $98		; CDCC: 98
    dta $20		; CDCD: 20
    dta $20		; CDCE: 20
    dta $20		; CDCF: 20
    dta $20		; CDD0: 20
    dta $95		; CDD1: 95
    dta $20		; CDD2: 20
    dta $90		; CDD3: 90
    dta $9D		; CDD4: 9D
    dta $20		; CDD5: 20
    dta $20		; CDD6: 20
    dta $20		; CDD7: 20
    dta $20		; CDD8: 20
    dta $95		; CDD9: 95
    dta $8E		; CDDA: 8E
    dta $98		; CDDB: 98
    dta $94		; CDDC: 94
    dta $98		; CDDD: 98
    dta $9E		; CDDE: 9E
    dta $94		; CDDF: 94
    dta $20		; CDE0: 20
    dta $9E		; CDE1: 9E
    dta $93		; CDE2: 93
    dta $90		; CDE3: 90
    dta $94		; CDE4: 94
    dta $9F		; CDE5: 9F
    dta $96		; CDE6: 96
    dta $94		; CDE7: 94
    dta $20		; CDE8: 20
    dta $20		; CDE9: 20
    dta $20		; CDEA: 20
    dta $95		; CDEB: 95
    dta $9F		; CDEC: 9F
    dta $9E		; CDED: 9E
    dta $98		; CDEE: 98
    dta $91		; CDEF: 91
    dta $20		; CDF0: 20
    dta $20		; CDF1: 20
    dta $20		; CDF2: 20
    dta $9D		; CDF3: 9D
    dta $90		; CDF4: 90
    dta $94		; CDF5: 94
    dta $91		; CDF6: 91
    dta $20		; CDF7: 20
    dta $20		; CDF8: 20
    dta $20		; CDF9: 20
    dta $8E		; CDFA: 8E
    dta $94		; CDFB: 94
    dta $20		; CDFC: 20
    dta $9F		; CDFD: 9F
    dta $20		; CDFE: 20
    dta $20		; CDFF: 20
