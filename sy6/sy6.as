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
# 2 "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy6\Untitled.c"
	psect config,class=CONFIG,delta=2 ;#
# 2 "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy6\Untitled.c"
	dw 0xFF29 ;#
	FNCALL	_main,_lcd
	FNCALL	_main,_ENABLE
	FNCALL	_main,_ENABLE1
	FNCALL	_lcd,_DELAY
	FNCALL	_lcd,_ENABLE
	FNCALL	_ENABLE1,_DELAY
	FNCALL	_ENABLE,_DELAY
	FNROOT	_main
	FNCALL	intlevel1,_tmr2_serve
	global	intlevel1
	FNROOT	intlevel1
	global	_table
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy6\Untitled.c"
	line	5

;initializer for _table
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
	global	_adh
	global	_adl
	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTD
_PORTD	set	8
	global	_T2CON
_T2CON	set	18
	global	_ADIF
_ADIF	set	102
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_GO_nDONE
_GO_nDONE	set	250
	global	_PEIE
_PEIE	set	94
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
	global	_TMR2IF
_TMR2IF	set	97
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_PR2
_PR2	set	146
	global	_TRISA
_TRISA	set	133
	global	_TRISD
_TRISD	set	136
	global	_TMR2IE
_TMR2IE	set	1121
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
	file	"sy6.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_adh:
       ds      1

_adl:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy6\Untitled.c"
_table:
       ds      16

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
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
	global	?_ENABLE
?_ENABLE:	; 0 bytes @ 0x0
	global	?_ENABLE1
?_ENABLE1:	; 0 bytes @ 0x0
	global	?_lcd
?_lcd:	; 0 bytes @ 0x0
	global	?_tmr2_serve
?_tmr2_serve:	; 0 bytes @ 0x0
	global	??_tmr2_serve
??_tmr2_serve:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	5
	global	??_DELAY
??_DELAY:	; 0 bytes @ 0x5
	global	DELAY@i
DELAY@i:	; 2 bytes @ 0x5
	ds	2
	global	??_ENABLE
??_ENABLE:	; 0 bytes @ 0x7
	global	??_ENABLE1
??_ENABLE1:	; 0 bytes @ 0x7
	global	??_lcd
??_lcd:	; 0 bytes @ 0x7
	global	??_main
??_main:	; 0 bytes @ 0x7
	ds	1
;;Data sizes: Strings 0, constant 0, data 16, bss 2, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8      10
;; BANK0           80      0      16
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _lcd->_DELAY
;;   _ENABLE1->_DELAY
;;   _ENABLE->_DELAY
;;
;; Critical Paths under _tmr2_serve in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _tmr2_serve in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _tmr2_serve in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _tmr2_serve in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _tmr2_serve in BANK2
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
;; (0) _main                                                 1     1      0     120
;;                                              7 COMMON     1     1      0
;;                                _lcd
;;                             _ENABLE
;;                            _ENABLE1
;; ---------------------------------------------------------------------------------
;; (1) _lcd                                                  0     0      0      60
;;                              _DELAY
;;                             _ENABLE
;; ---------------------------------------------------------------------------------
;; (1) _ENABLE1                                              0     0      0      30
;;                              _DELAY
;; ---------------------------------------------------------------------------------
;; (1) _ENABLE                                               0     0      0      30
;;                              _DELAY
;; ---------------------------------------------------------------------------------
;; (2) _DELAY                                                2     2      0      30
;;                                              5 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _tmr2_serve                                           5     5      0       0
;;                                              0 COMMON     5     5      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd
;;     _DELAY
;;     _ENABLE
;;       _DELAY
;;   _ENABLE
;;     _DELAY
;;   _ENABLE1
;;     _DELAY
;;
;; _tmr2_serve (ROOT)
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
;;DATA                 0      0      1D      12        0.0%
;;ABS                  0      0      1A       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50      0      10       5       20.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      8       A       1       71.4%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 53 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy6\Untitled.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_lcd
;;		_ENABLE
;;		_ENABLE1
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy6\Untitled.c"
	line	53
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	54
	
l2667:	
;Untitled.c: 54: TRISA = 0x0C;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	55
	
l2669:	
;Untitled.c: 55: lcd();
	fcall	_lcd
	line	56
	
l2671:	
;Untitled.c: 56: GIE = 1;
	bsf	(95/8),(95)&7
	line	57
	
l2673:	
;Untitled.c: 57: PEIE = 1;
	bsf	(94/8),(94)&7
	line	58
	
l2675:	
;Untitled.c: 58: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	59
	
l2677:	
;Untitled.c: 59: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(97/8),(97)&7
	line	60
	
l2679:	
;Untitled.c: 60: ADIF = 0;
	bcf	(102/8),(102)&7
	line	63
	
l2681:	
;Untitled.c: 63: ADCON0 = 0b01000001;
	movlw	(041h)
	movwf	(31)	;volatile
	line	64
	
l2683:	
;Untitled.c: 64: ADCON1 = 0b10001110;
	movlw	(08Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	66
	
l2685:	
;Untitled.c: 66: T2CON = 0b01111111;
	movlw	(07Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(18)	;volatile
	line	67
	
l2687:	
;Untitled.c: 67: PR2 = 255;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	goto	l2689
	line	69
;Untitled.c: 69: while (1) {
	
l711:	
	line	70
	
l2689:	
;Untitled.c: 70: PORTD = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	71
;Untitled.c: 71: ENABLE();
	fcall	_ENABLE
	line	72
	
l2691:	
;Untitled.c: 72: PORTD = table[adh];
	movf	(_adh),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	73
	
l2693:	
;Untitled.c: 73: ENABLE1();
	fcall	_ENABLE1
	line	74
;Untitled.c: 74: PORTD = table[adl >> 4];
	movf	(_adl),w
	movwf	(??_main+0)+0
	movlw	04h
u2255:
	clrc
	rrf	(??_main+0)+0,f
	addlw	-1
	skipz
	goto	u2255
	movf	0+(??_main+0)+0,w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	75
	
l2695:	
;Untitled.c: 75: ENABLE1();
	fcall	_ENABLE1
	line	76
	
l2697:	
;Untitled.c: 76: PORTD = table[adl & 0x0F];
	movf	(_adl),w
	andlw	0Fh
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	77
;Untitled.c: 77: ENABLE1();
	fcall	_ENABLE1
	line	78
	
l2699:	
;Untitled.c: 78: PORTD = 'H';
	movlw	(048h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	79
	
l2701:	
;Untitled.c: 79: ENABLE1();
	fcall	_ENABLE1
	goto	l2689
	line	80
	
l712:	
	line	69
	goto	l2689
	
l713:	
	line	81
	
l714:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd
psect	text119,local,class=CODE,delta=2
global __ptext119
__ptext119:

;; *************** function _lcd *****************
;; Defined at:
;;		line 29 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy6\Untitled.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_DELAY
;;		_ENABLE
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text119
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy6\Untitled.c"
	line	29
	global	__size_of_lcd
	__size_of_lcd	equ	__end_of_lcd-_lcd
	
_lcd:	
	opt	stack 4
; Regs used in _lcd: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l2647:	
;Untitled.c: 30: TRISD = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	31
;Untitled.c: 31: TRISA = 0;
	clrf	(133)^080h	;volatile
	line	32
;Untitled.c: 32: PORTD = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	33
	
l2649:	
;Untitled.c: 33: DELAY();
	fcall	_DELAY
	line	34
	
l2651:	
;Untitled.c: 34: PORTD = 1;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	35
	
l2653:	
;Untitled.c: 35: ENABLE();
	fcall	_ENABLE
	line	36
	
l2655:	
;Untitled.c: 36: PORTD = 0x38;
	movlw	(038h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	37
	
l2657:	
;Untitled.c: 37: ENABLE();
	fcall	_ENABLE
	line	38
	
l2659:	
;Untitled.c: 38: PORTD = 0x0C;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	39
	
l2661:	
;Untitled.c: 39: ENABLE();
	fcall	_ENABLE
	line	40
	
l2663:	
;Untitled.c: 40: PORTD = 0x06;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	41
	
l2665:	
;Untitled.c: 41: ENABLE();
	fcall	_ENABLE
	line	42
	
l702:	
	return
	opt stack 0
GLOBAL	__end_of_lcd
	__end_of_lcd:
;; =============== function _lcd ends ============

	signat	_lcd,88
	global	_ENABLE1
psect	text120,local,class=CODE,delta=2
global __ptext120
__ptext120:

;; *************** function _ENABLE1 *****************
;; Defined at:
;;		line 21 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy6\Untitled.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DELAY
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text120
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy6\Untitled.c"
	line	21
	global	__size_of_ENABLE1
	__size_of_ENABLE1	equ	__end_of_ENABLE1-_ENABLE1
	
_ENABLE1:	
	opt	stack 5
; Regs used in _ENABLE1: [wreg+status,2+status,0+pclath+cstack]
	line	22
	
l2641:	
;Untitled.c: 22: RA5 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	line	23
;Untitled.c: 23: RA4 = 0;
	bcf	(44/8),(44)&7
	line	24
;Untitled.c: 24: RA3 = 0;
	bcf	(43/8),(43)&7
	line	25
	
l2643:	
;Untitled.c: 25: DELAY();
	fcall	_DELAY
	line	26
	
l2645:	
;Untitled.c: 26: RA3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	line	27
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_ENABLE1
	__end_of_ENABLE1:
;; =============== function _ENABLE1 ends ============

	signat	_ENABLE1,88
	global	_ENABLE
psect	text121,local,class=CODE,delta=2
global __ptext121
__ptext121:

;; *************** function _ENABLE *****************
;; Defined at:
;;		line 13 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy6\Untitled.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DELAY
;; This function is called by:
;;		_lcd
;;		_main
;; This function uses a non-reentrant model
;;
psect	text121
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy6\Untitled.c"
	line	13
	global	__size_of_ENABLE
	__size_of_ENABLE	equ	__end_of_ENABLE-_ENABLE
	
_ENABLE:	
	opt	stack 5
; Regs used in _ENABLE: [wreg+status,2+status,0+pclath+cstack]
	line	14
	
l2635:	
;Untitled.c: 14: RA5 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
	line	15
;Untitled.c: 15: RA4 = 0;
	bcf	(44/8),(44)&7
	line	16
;Untitled.c: 16: RA3 = 0;
	bcf	(43/8),(43)&7
	line	17
	
l2637:	
;Untitled.c: 17: DELAY();
	fcall	_DELAY
	line	18
	
l2639:	
;Untitled.c: 18: RA3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	line	19
	
l696:	
	return
	opt stack 0
GLOBAL	__end_of_ENABLE
	__end_of_ENABLE:
;; =============== function _ENABLE ends ============

	signat	_ENABLE,88
	global	_DELAY
psect	text122,local,class=CODE,delta=2
global __ptext122
__ptext122:

;; *************** function _DELAY *****************
;; Defined at:
;;		line 8 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy6\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    5[COMMON] unsigned int 
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ENABLE
;;		_ENABLE1
;;		_lcd
;; This function uses a non-reentrant model
;;
psect	text122
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy6\Untitled.c"
	line	8
	global	__size_of_DELAY
	__size_of_DELAY	equ	__end_of_DELAY-_DELAY
	
_DELAY:	
	opt	stack 5
; Regs used in _DELAY: [wreg+status,2+status,0]
	line	10
	
l1761:	
;Untitled.c: 9: unsigned int i;
;Untitled.c: 10: for (i = 999; i > 0; i--);
	movlw	low(03E7h)
	movwf	(DELAY@i)
	movlw	high(03E7h)
	movwf	((DELAY@i))+1
	
l1763:	
	movf	((DELAY@i+1)),w
	iorwf	((DELAY@i)),w
	skipz
	goto	u11
	goto	u10
u11:
	goto	l1767
u10:
	goto	l693
	
l1765:	
	goto	l693
	
l691:	
	
l1767:	
	movlw	low(01h)
	subwf	(DELAY@i),f
	movlw	high(01h)
	skipc
	decf	(DELAY@i+1),f
	subwf	(DELAY@i+1),f
	
l1769:	
	movf	((DELAY@i+1)),w
	iorwf	((DELAY@i)),w
	skipz
	goto	u21
	goto	u20
u21:
	goto	l1767
u20:
	goto	l693
	
l692:	
	line	11
	
l693:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY
	__end_of_DELAY:
;; =============== function _DELAY ends ============

	signat	_DELAY,88
	global	_tmr2_serve
psect	text123,local,class=CODE,delta=2
global __ptext123
__ptext123:

;; *************** function _tmr2_serve *****************
;; Defined at:
;;		line 44 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy6\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          5       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text123
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy6\Untitled.c"
	line	44
	global	__size_of_tmr2_serve
	__size_of_tmr2_serve	equ	__end_of_tmr2_serve-_tmr2_serve
	
_tmr2_serve:	
	opt	stack 4
; Regs used in _tmr2_serve: [wreg]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_tmr2_serve+1)
	movf	fsr0,w
	movwf	(??_tmr2_serve+2)
	movf	pclath,w
	movwf	(??_tmr2_serve+3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_tmr2_serve+4)
	ljmp	_tmr2_serve
psect	text123
	line	45
	
i1l1771:	
;Untitled.c: 45: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	46
;Untitled.c: 46: GO_nDONE = 1;
	bsf	(250/8),(250)&7
	line	47
;Untitled.c: 47: while (!ADIF);
	goto	i1l705
	
i1l706:	
	
i1l705:	
	btfss	(102/8),(102)&7
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l705
u3_20:
	goto	i1l1773
	
i1l707:	
	line	48
	
i1l1773:	
;Untitled.c: 48: adh = ADRESH;
	movf	(30),w	;volatile
	movwf	(??_tmr2_serve+0)+0
	movf	(??_tmr2_serve+0)+0,w
	movwf	(_adh)
	line	49
;Untitled.c: 49: adl = ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	movwf	(??_tmr2_serve+0)+0
	movf	(??_tmr2_serve+0)+0,w
	movwf	(_adl)
	line	50
	
i1l1775:	
;Untitled.c: 50: ADIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(102/8),(102)&7
	line	51
	
i1l708:	
	movf	(??_tmr2_serve+4),w
	movwf	btemp+1
	movf	(??_tmr2_serve+3),w
	movwf	pclath
	movf	(??_tmr2_serve+2),w
	movwf	fsr0
	swapf	(??_tmr2_serve+1)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_tmr2_serve
	__end_of_tmr2_serve:
;; =============== function _tmr2_serve ends ============

	signat	_tmr2_serve,88
psect	text124,local,class=CODE,delta=2
global __ptext124
__ptext124:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
