opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 7 "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy2\Untitled.c"
	psect config,class=CONFIG,delta=2 ;#
# 7 "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy2\Untitled.c"
	dw 0xFF29 ;#
	FNCALL	_main,_DELAY
	FNCALL	_main,_ENABLE
	FNCALL	_main,_ENABLE1
	FNCALL	_ENABLE1,_DELAY
	FNCALL	_ENABLE,_DELAY
	FNROOT	_main
	global	_TABLE
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy2\Untitled.c"
	line	8

;initializer for _TABLE
	retlw	030h
	retlw	031h
	retlw	032h
	retlw	033h
	retlw	034h
	retlw	035h
	retlw	036h
	retlw	037h
	retlw	038h
	retlw	039h
	retlw	041h
	retlw	042h
	retlw	043h
	retlw	044h
	retlw	045h
	retlw	046h
	global	_a
	global	_adh
	global	_adl
	global	_b
	global	_preres
	global	_result
	global	_PORTB
_PORTB	set	6
	global	_PORTD
_PORTD	set	8
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RA1
_RA1	set	41
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
	global	_RE2
_RE2	set	74
	global	_ADCON1
_ADCON1	set	159
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_nRBPU
_nRBPU	set	1039
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"sy2.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_a:
       ds      1

_adh:
       ds      1

_adl:
       ds      1

_b:
       ds      1

_preres:
       ds      1

_result:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy2\Untitled.c"
_TABLE:
       ds      16

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
	clrf	((__pbssCOMMON)+5)&07Fh
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+16)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_DELAY
?_DELAY:	; 0 bytes @ 0x0
	global	??_DELAY
??_DELAY:	; 0 bytes @ 0x0
	global	?_ENABLE
?_ENABLE:	; 0 bytes @ 0x0
	global	?_ENABLE1
?_ENABLE1:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	DELAY@i
DELAY@i:	; 2 bytes @ 0x0
	ds	2
	global	??_ENABLE
??_ENABLE:	; 0 bytes @ 0x2
	global	??_ENABLE1
??_ENABLE1:	; 0 bytes @ 0x2
	global	??_main
??_main:	; 0 bytes @ 0x2
	ds	1
;;Data sizes: Strings 0, constant 0, data 16, bss 6, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      3       9
;; BANK0           80      0      16
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_DELAY
;;   _ENABLE1->_DELAY
;;   _ENABLE->_DELAY
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0      90
;;                                              2 COMMON     1     1      0
;;                              _DELAY
;;                             _ENABLE
;;                            _ENABLE1
;; ---------------------------------------------------------------------------------
;; (1) _ENABLE1                                              0     0      0      30
;;                              _DELAY
;; ---------------------------------------------------------------------------------
;; (1) _ENABLE                                               0     0      0      30
;;                              _DELAY
;; ---------------------------------------------------------------------------------
;; (2) _DELAY                                                2     2      0      30
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DELAY
;;   _ENABLE
;;     _DELAY
;;   _ENABLE1
;;     _DELAY
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      1B      12        0.0%
;;ABS                  0      0      19       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       2       2        0.0%
;;BANK0               50      0      10       5       20.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      3       9       1       64.3%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 22 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy2\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DELAY
;;		_ENABLE
;;		_ENABLE1
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy2\Untitled.c"
	line	22
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	23
	
l2667:	
;Untitled.c: 23: TRISB=0X0F; nRBPU=0;result=0x00;preres=0x00;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(134)^080h	;volatile
	
l2669:	
	bcf	(1039/8)^080h,(1039)&7
	
l2671:	
	clrf	(_result)
	
l2673:	
	clrf	(_preres)
	line	24
	
l2675:	
;Untitled.c: 24: TRISD=0;RE2=1;ADCON1=7;TRISA=0;RA1=0;
	clrf	(136)^080h	;volatile
	
l2677:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(74/8),(74)&7
	
l2679:	
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	clrf	(133)^080h	;volatile
	
l2681:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(41/8),(41)&7
	line	25
;Untitled.c: 25: PORTD=0;RA3=1;
	clrf	(8)	;volatile
	
l2683:	
	bsf	(43/8),(43)&7
	line	26
	
l2685:	
;Untitled.c: 26: DELAY();
	fcall	_DELAY
	line	27
	
l2687:	
;Untitled.c: 27: PORTD =1;ENABLE();
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l2689:	
	fcall	_ENABLE
	line	28
	
l2691:	
;Untitled.c: 28: PORTD=0x38;ENABLE();
	movlw	(038h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l2693:	
	fcall	_ENABLE
	line	29
	
l2695:	
;Untitled.c: 29: PORTD=0x0C;ENABLE();
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l2697:	
	fcall	_ENABLE
	line	30
	
l2699:	
;Untitled.c: 30: PORTD=0x06;ENABLE();
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l2701:	
	fcall	_ENABLE
	goto	l2703
	line	31
;Untitled.c: 31: loop: PORTD=0x80;ENABLE();
	
l710:	
	
l2703:	
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l2705:	
	fcall	_ENABLE
	line	33
	
l2707:	
;Untitled.c: 33: PORTB = 0X7f;
	movlw	(07Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	34
	
l2709:	
# 34 "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy2\Untitled.c"
nop ;#
psect	maintext
	line	35
	
l2711:	
;Untitled.c: 35: result = PORTB;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(6),w	;volatile
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_result)
	line	36
;Untitled.c: 36: result = result & 0x0f;
	movf	(_result),w
	andlw	0Fh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_result)
	line	37
	
l2713:	
;Untitled.c: 37: if (result != 0x0f)
	movf	(_result),w
	xorlw	0Fh
	skipnz
	goto	u2241
	goto	u2240
u2241:
	goto	l2717
u2240:
	line	39
	
l2715:	
;Untitled.c: 38: {
;Untitled.c: 39: result = result | 0x70;
	movf	(_result),w
	iorlw	070h
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_result)
	line	40
;Untitled.c: 40: }
	goto	l712
	line	41
	
l711:	
	line	43
	
l2717:	
;Untitled.c: 41: else
;Untitled.c: 42: {
;Untitled.c: 43: PORTB = 0Xbf;
	movlw	(0BFh)
	movwf	(6)	;volatile
	line	44
	
l2719:	
# 44 "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy2\Untitled.c"
nop ;#
psect	maintext
	line	45
;Untitled.c: 45: result = PORTB;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(6),w	;volatile
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_result)
	line	46
	
l2721:	
;Untitled.c: 46: result = result & 0x0f;
	movf	(_result),w
	andlw	0Fh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_result)
	line	47
	
l2723:	
;Untitled.c: 47: if (result != 0xf)
	movf	(_result),w
	xorlw	0Fh
	skipnz
	goto	u2251
	goto	u2250
u2251:
	goto	l2727
u2250:
	line	49
	
l2725:	
;Untitled.c: 48: {
;Untitled.c: 49: result = result | 0xb0;
	movf	(_result),w
	iorlw	0B0h
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_result)
	line	50
;Untitled.c: 50: }
	goto	l712
	line	51
	
l713:	
	line	54
	
l2727:	
;Untitled.c: 51: else
;Untitled.c: 52: {
;Untitled.c: 54: PORTB = 0Xdf;
	movlw	(0DFh)
	movwf	(6)	;volatile
	line	56
	
l2729:	
# 56 "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy2\Untitled.c"
nop ;#
psect	maintext
	line	58
;Untitled.c: 58: result = PORTB;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(6),w	;volatile
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_result)
	line	60
	
l2731:	
;Untitled.c: 60: result = result & 0x0f;
	movf	(_result),w
	andlw	0Fh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_result)
	line	62
	
l2733:	
;Untitled.c: 62: if (result != 0x0f)
	movf	(_result),w
	xorlw	0Fh
	skipnz
	goto	u2261
	goto	u2260
u2261:
	goto	l2737
u2260:
	line	66
	
l2735:	
;Untitled.c: 64: {
;Untitled.c: 66: result = result | 0xd0;
	movf	(_result),w
	iorlw	0D0h
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_result)
	line	68
;Untitled.c: 68: }
	goto	l712
	line	70
	
l715:	
	line	74
	
l2737:	
;Untitled.c: 70: else
;Untitled.c: 72: {
;Untitled.c: 74: PORTB = 0Xef;
	movlw	(0EFh)
	movwf	(6)	;volatile
	line	76
	
l2739:	
# 76 "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy2\Untitled.c"
nop ;#
psect	maintext
	line	78
;Untitled.c: 78: result = PORTB;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(6),w	;volatile
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_result)
	line	80
	
l2741:	
;Untitled.c: 80: result = result & 0x0f;
	movf	(_result),w
	andlw	0Fh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_result)
	line	82
	
l2743:	
;Untitled.c: 82: if (result != 0x0f)
	movf	(_result),w
	xorlw	0Fh
	skipnz
	goto	u2271
	goto	u2270
u2271:
	goto	l2747
u2270:
	line	86
	
l2745:	
;Untitled.c: 84: {
;Untitled.c: 86: result = result | 0xe0;
	movf	(_result),w
	iorlw	0E0h
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_result)
	line	88
;Untitled.c: 88: }
	goto	l712
	line	90
	
l717:	
	line	94
	
l2747:	
;Untitled.c: 90: else
;Untitled.c: 92: {
;Untitled.c: 94: result = 0xff;
	movlw	(0FFh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_result)
	goto	l712
	line	96
	
l718:	
	goto	l712
	line	98
	
l716:	
	goto	l712
	line	100
	
l714:	
	line	102
	
l712:	
	line	104
;Untitled.c: 96: }
;Untitled.c: 98: }
;Untitled.c: 100: }
;Untitled.c: 102: }
;Untitled.c: 104: if(result==0xff)
	movf	(_result),w
	xorlw	0FFh
	skipz
	goto	u2281
	goto	u2280
u2281:
	goto	l2751
u2280:
	line	106
	
l2749:	
;Untitled.c: 106: result=preres;
	movf	(_preres),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_result)
	goto	l2787
	line	108
	
l719:	
	line	110
	
l2751:	
;Untitled.c: 108: else
;Untitled.c: 110: preres=result;
	movf	(_result),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_preres)
	goto	l2787
	
l720:	
	line	114
;Untitled.c: 114: switch (result)
	goto	l2787
	line	118
;Untitled.c: 116: {
;Untitled.c: 118: case 0xe7:
	
l722:	
	line	120
	
l2753:	
;Untitled.c: 120: PORTD = TABLE[3];break;
	movf	0+(_TABLE)+03h,w	;volatile
	movwf	(8)	;volatile
	goto	l2789
	line	122
;Untitled.c: 122: case 0xeb:
	
l724:	
	line	124
	
l2755:	
;Untitled.c: 124: PORTD = TABLE[2];break;
	movf	0+(_TABLE)+02h,w	;volatile
	movwf	(8)	;volatile
	goto	l2789
	line	126
;Untitled.c: 126: case 0xed:
	
l725:	
	line	128
	
l2757:	
;Untitled.c: 128: PORTD = TABLE[1];break;
	movf	0+(_TABLE)+01h,w	;volatile
	movwf	(8)	;volatile
	goto	l2789
	line	130
;Untitled.c: 130: case 0xee:
	
l726:	
	line	132
	
l2759:	
;Untitled.c: 132: PORTD = TABLE[0];break;
	movf	(_TABLE),w	;volatile
	movwf	(8)	;volatile
	goto	l2789
	line	134
;Untitled.c: 134: case 0xd7:
	
l727:	
	line	136
	
l2761:	
;Untitled.c: 136: PORTD = TABLE[7];break;
	movf	0+(_TABLE)+07h,w	;volatile
	movwf	(8)	;volatile
	goto	l2789
	line	138
;Untitled.c: 138: case 0xdb:
	
l728:	
	line	140
	
l2763:	
;Untitled.c: 140: PORTD = TABLE[6];break;
	movf	0+(_TABLE)+06h,w	;volatile
	movwf	(8)	;volatile
	goto	l2789
	line	142
;Untitled.c: 142: case 0xdd:
	
l729:	
	line	144
	
l2765:	
;Untitled.c: 144: PORTD = TABLE[5];break;
	movf	0+(_TABLE)+05h,w	;volatile
	movwf	(8)	;volatile
	goto	l2789
	line	146
;Untitled.c: 146: case 0xde:
	
l730:	
	line	148
	
l2767:	
;Untitled.c: 148: PORTD = TABLE[4];break;
	movf	0+(_TABLE)+04h,w	;volatile
	movwf	(8)	;volatile
	goto	l2789
	line	150
;Untitled.c: 150: case 0xb7:
	
l731:	
	line	152
	
l2769:	
;Untitled.c: 152: PORTD = TABLE[11];break;
	movf	0+(_TABLE)+0Bh,w	;volatile
	movwf	(8)	;volatile
	goto	l2789
	line	154
;Untitled.c: 154: case 0xbb:
	
l732:	
	line	156
	
l2771:	
;Untitled.c: 156: PORTD = TABLE[10];break;
	movf	0+(_TABLE)+0Ah,w	;volatile
	movwf	(8)	;volatile
	goto	l2789
	line	158
;Untitled.c: 158: case 0xbd:
	
l733:	
	line	160
	
l2773:	
;Untitled.c: 160: PORTD = TABLE[9];break;
	movf	0+(_TABLE)+09h,w	;volatile
	movwf	(8)	;volatile
	goto	l2789
	line	162
;Untitled.c: 162: case 0xbe:
	
l734:	
	line	164
	
l2775:	
;Untitled.c: 164: PORTD = TABLE[8];break;
	movf	0+(_TABLE)+08h,w	;volatile
	movwf	(8)	;volatile
	goto	l2789
	line	166
;Untitled.c: 166: case 0x77:
	
l735:	
	line	168
	
l2777:	
;Untitled.c: 168: PORTD = TABLE[15];break;
	movf	0+(_TABLE)+0Fh,w	;volatile
	movwf	(8)	;volatile
	goto	l2789
	line	170
;Untitled.c: 170: case 0x7b:
	
l736:	
	line	172
	
l2779:	
;Untitled.c: 172: PORTD = TABLE[14];break;
	movf	0+(_TABLE)+0Eh,w	;volatile
	movwf	(8)	;volatile
	goto	l2789
	line	174
;Untitled.c: 174: case 0x7d:
	
l737:	
	line	176
	
l2781:	
;Untitled.c: 176: PORTD = TABLE[13];break;
	movf	0+(_TABLE)+0Dh,w	;volatile
	movwf	(8)	;volatile
	goto	l2789
	line	178
;Untitled.c: 178: case 0x7e:
	
l738:	
	line	180
	
l2783:	
;Untitled.c: 180: PORTD = TABLE[12];break;
	movf	0+(_TABLE)+0Ch,w	;volatile
	movwf	(8)	;volatile
	goto	l2789
	line	182
;Untitled.c: 182: case 0x00:
	
l739:	
	line	184
	
l2785:	
;Untitled.c: 184: PORTD ='X';
	movlw	(058h)
	movwf	(8)	;volatile
	line	186
;Untitled.c: 186: } ENABLE1();
	goto	l2789
	line	114
	
l721:	
	
l2787:	
	movf	(_result),w
	; Switch size 1, requested type "space"
; Number of cases is 17, Range of values is 0 to 238
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           52    27 (average)
; jumptable            260     6 (fixed)
; rangetable           243     6 (fixed)
; spacedrange          484     9 (fixed)
; locatedrange         239     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l2785
	xorlw	119^0	; case 119
	skipnz
	goto	l2777
	xorlw	123^119	; case 123
	skipnz
	goto	l2779
	xorlw	125^123	; case 125
	skipnz
	goto	l2781
	xorlw	126^125	; case 126
	skipnz
	goto	l2783
	xorlw	183^126	; case 183
	skipnz
	goto	l2769
	xorlw	187^183	; case 187
	skipnz
	goto	l2771
	xorlw	189^187	; case 189
	skipnz
	goto	l2773
	xorlw	190^189	; case 190
	skipnz
	goto	l2775
	xorlw	215^190	; case 215
	skipnz
	goto	l2761
	xorlw	219^215	; case 219
	skipnz
	goto	l2763
	xorlw	221^219	; case 221
	skipnz
	goto	l2765
	xorlw	222^221	; case 222
	skipnz
	goto	l2767
	xorlw	231^222	; case 231
	skipnz
	goto	l2753
	xorlw	235^231	; case 235
	skipnz
	goto	l2755
	xorlw	237^235	; case 237
	skipnz
	goto	l2757
	xorlw	238^237	; case 238
	skipnz
	goto	l2759
	goto	l2789
	opt asmopt_on

	line	186
	
l723:	
	
l2789:	
	fcall	_ENABLE1
	line	188
;Untitled.c: 188: goto loop;
	goto	l2703
	line	190
	
l740:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_ENABLE1
psect	text95,local,class=CODE,delta=2
global __ptext95
__ptext95:

;; *************** function _ENABLE1 *****************
;; Defined at:
;;		line 19 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy2\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DELAY
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text95
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy2\Untitled.c"
	line	19
	global	__size_of_ENABLE1
	__size_of_ENABLE1	equ	__end_of_ENABLE1-_ENABLE1
	
_ENABLE1:	
	opt	stack 6
; Regs used in _ENABLE1: [wreg+status,2+status,0+pclath+cstack]
	
l2661:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	bcf	(44/8),(44)&7
	bcf	(43/8),(43)&7
	
l2663:	
	fcall	_DELAY
	
l2665:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	
l707:	
	return
	opt stack 0
GLOBAL	__end_of_ENABLE1
	__end_of_ENABLE1:
;; =============== function _ENABLE1 ends ============

	signat	_ENABLE1,88
	global	_ENABLE
psect	text96,local,class=CODE,delta=2
global __ptext96
__ptext96:

;; *************** function _ENABLE *****************
;; Defined at:
;;		line 16 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy2\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DELAY
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text96
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy2\Untitled.c"
	line	16
	global	__size_of_ENABLE
	__size_of_ENABLE	equ	__end_of_ENABLE-_ENABLE
	
_ENABLE:	
	opt	stack 6
; Regs used in _ENABLE: [wreg+status,2+status,0+pclath+cstack]
	
l2655:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
	bcf	(44/8),(44)&7
	bcf	(43/8),(43)&7
	
l2657:	
	fcall	_DELAY
	
l2659:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	
l704:	
	return
	opt stack 0
GLOBAL	__end_of_ENABLE
	__end_of_ENABLE:
;; =============== function _ENABLE ends ============

	signat	_ENABLE,88
	global	_DELAY
psect	text97,local,class=CODE,delta=2
global __ptext97
__ptext97:

;; *************** function _DELAY *****************
;; Defined at:
;;		line 13 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy2\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    0[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ENABLE
;;		_ENABLE1
;;		_main
;; This function uses a non-reentrant model
;;
psect	text97
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy2\Untitled.c"
	line	13
	global	__size_of_DELAY
	__size_of_DELAY	equ	__end_of_DELAY-_DELAY
	
_DELAY:	
	opt	stack 6
; Regs used in _DELAY: [wreg+status,2+status,0]
	
l1787:	
	movlw	low(03E7h)
	movwf	(DELAY@i)
	movlw	high(03E7h)
	movwf	((DELAY@i))+1
	
l1789:	
	movf	((DELAY@i+1)),w
	iorwf	((DELAY@i)),w
	skipz
	goto	u11
	goto	u10
u11:
	goto	l1793
u10:
	goto	l701
	
l1791:	
	goto	l701
	
l699:	
	
l1793:	
	movlw	low(01h)
	subwf	(DELAY@i),f
	movlw	high(01h)
	skipc
	decf	(DELAY@i+1),f
	subwf	(DELAY@i+1),f
	
l1795:	
	movf	((DELAY@i+1)),w
	iorwf	((DELAY@i)),w
	skipz
	goto	u21
	goto	u20
u21:
	goto	l1793
u20:
	goto	l701
	
l700:	
	
l701:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY
	__end_of_DELAY:
;; =============== function _DELAY ends ============

	signat	_DELAY,88
psect	text98,local,class=CODE,delta=2
global __ptext98
__ptext98:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
