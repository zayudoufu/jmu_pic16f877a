opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

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
# 2 "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy5\Untitled.c"
	psect config,class=CONFIG,delta=2 ;#
# 2 "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy5\Untitled.c"
	dw 0xFF29 ;#
	FNCALL	_main,_lcd
	FNCALL	_main,_ENABLE
	FNCALL	_main,_ENABLE1
	FNCALL	_lcd,_DELAY
	FNCALL	_lcd,_ENABLE
	FNCALL	_ENABLE1,_DELAY
	FNCALL	_ENABLE,_DELAY
	FNROOT	_main
	FNCALL	intlevel1,_ccp1
	global	intlevel1
	FNROOT	intlevel1
	global	_table
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy5\Untitled.c"
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
	global	_TEMP1
	global	_TEMP2
	global	_Z
	global	_x
	global	_y
	global	_z
	global	_a
	global	_CCP1CON
_CCP1CON	set	23
	global	_CCPR1H
_CCPR1H	set	22
	global	_CCPR1L
_CCPR1L	set	21
	global	_PORTD
_PORTD	set	8
	global	_T1CON
_T1CON	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_CARRY
_CARRY	set	24
	global	_CCP1IF
_CCP1IF	set	98
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
	global	_ADCON1
_ADCON1	set	159
	global	_TRISA
_TRISA	set	133
	global	_TRISD
_TRISD	set	136
	global	_CCP1IE
_CCP1IE	set	1122
	global	_TMR1IE
_TMR1IE	set	1120
	global	_TRISC2
_TRISC2	set	1082
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
	file	"sy5.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_a:
       ds      1

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_Z:
       ds      1

_x:
       ds      1

_y:
       ds      1

_z:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_TEMP1:
       ds      2

_TEMP2:
       ds      2

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy5\Untitled.c"
_table:
       ds      16

; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
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
	global	?_ccp1
?_ccp1:	; 0 bytes @ 0x0
	global	??_ccp1
??_ccp1:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	ds	6
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_DELAY
??_DELAY:	; 0 bytes @ 0x0
	global	DELAY@i
DELAY@i:	; 2 bytes @ 0x0
	ds	2
	global	??_ENABLE
??_ENABLE:	; 0 bytes @ 0x2
	global	??_ENABLE1
??_ENABLE1:	; 0 bytes @ 0x2
	global	??_lcd
??_lcd:	; 0 bytes @ 0x2
	global	??_main
??_main:	; 0 bytes @ 0x2
	ds	1
;;Data sizes: Strings 0, constant 0, data 16, bss 8, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      11
;; BANK0           80      3      23
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _ccp1 in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _lcd->_DELAY
;;   _ENABLE1->_DELAY
;;   _ENABLE->_DELAY
;;
;; Critical Paths under _ccp1 in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ccp1 in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _ccp1 in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _ccp1 in BANK2
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
;; (0) _main                                                 1     1      0     184
;;                                              2 BANK0      1     1      0
;;                                _lcd
;;                             _ENABLE
;;                            _ENABLE1
;; ---------------------------------------------------------------------------------
;; (1) _lcd                                                  0     0      0      92
;;                              _DELAY
;;                             _ENABLE
;; ---------------------------------------------------------------------------------
;; (1) _ENABLE1                                              0     0      0      46
;;                              _DELAY
;; ---------------------------------------------------------------------------------
;; (1) _ENABLE                                               0     0      0      46
;;                              _DELAY
;; ---------------------------------------------------------------------------------
;; (2) _DELAY                                                2     2      0      46
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _ccp1                                                 6     6      0       0
;;                                              0 COMMON     6     6      0
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
;; _ccp1 (ROOT)
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
;;DATA                 0      0      25      12        0.0%
;;ABS                  0      0      22       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50      3      17       5       28.8%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      6       B       1       78.6%
;;BITCOMMON            E      0       1       0        7.1%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 43 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy5\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  722[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       0       0       0
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
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy5\Untitled.c"
	line	43
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	
l2867:	
	fcall	_lcd
	line	44
	
l2869:	
;Untitled.c: 44: TRISC2=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1082/8)^080h,(1082)&7
	line	45
	
l2871:	
;Untitled.c: 45: a=0;ADCON1=7;
	bcf	(_a/8),(_a)&7
	
l2873:	
	movlw	(07h)
	movwf	(159)^080h	;volatile
	line	46
	
l2875:	
;Untitled.c: 46: GIE=1;PEIE=1;CCP1IE=1;CCP1IF=0;
	bsf	(95/8),(95)&7
	
l2877:	
	bsf	(94/8),(94)&7
	
l2879:	
	bsf	(1122/8)^080h,(1122)&7
	
l2881:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(98/8),(98)&7
	line	47
	
l2883:	
;Untitled.c: 47: TMR1IE=1;TMR1IF=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1120/8)^080h,(1120)&7
	
l2885:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(96/8),(96)&7
	line	48
	
l2887:	
;Untitled.c: 48: T1CON=0B00000001;
	movlw	(01h)
	movwf	(16)	;volatile
	line	49
	
l2889:	
;Untitled.c: 49: CCP1CON=5;
	movlw	(05h)
	movwf	(23)	;volatile
	goto	l2891
	line	50
;Untitled.c: 50: while(1)
	
l723:	
	line	52
	
l2891:	
;Untitled.c: 51: {
;Untitled.c: 52: PORTD=0x80;ENABLE();
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	fcall	_ENABLE
	line	53
	
l2893:	
;Untitled.c: 53: PORTD=table[Z>>4];ENABLE1();
	movf	(_Z),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movlw	04h
u2385:
	clrc
	rrf	(??_main+0)+0,f
	addlw	-1
	skipz
	goto	u2385
	movf	0+(??_main+0)+0,w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	
l2895:	
	fcall	_ENABLE1
	line	54
;Untitled.c: 54: PORTD=table[Z&0x0f];ENABLE1();
	movf	(_Z),w
	andlw	0Fh
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l2897:	
	fcall	_ENABLE1
	line	55
	
l2899:	
;Untitled.c: 55: PORTD=table[x>>4];ENABLE1();
	movf	(_x),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movlw	04h
u2395:
	clrc
	rrf	(??_main+0)+0,f
	addlw	-1
	skipz
	goto	u2395
	movf	0+(??_main+0)+0,w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	fcall	_ENABLE1
	line	56
	
l2901:	
;Untitled.c: 56: PORTD=table[x&0x0f];ENABLE1();
	movf	(_x),w
	andlw	0Fh
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l2903:	
	fcall	_ENABLE1
	line	57
;Untitled.c: 57: PORTD=table[y>>4];ENABLE1();
	movf	(_y),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movlw	04h
u2405:
	clrc
	rrf	(??_main+0)+0,f
	addlw	-1
	skipz
	goto	u2405
	movf	0+(??_main+0)+0,w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	
l2905:	
	fcall	_ENABLE1
	line	58
	
l2907:	
;Untitled.c: 58: PORTD=table[y&0x0f];ENABLE1();
	movf	(_y),w
	andlw	0Fh
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	fcall	_ENABLE1
	line	59
	
l2909:	
;Untitled.c: 59: PORTD='H';ENABLE1();
	movlw	(048h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l2911:	
	fcall	_ENABLE1
	goto	l2891
	line	60
	
l724:	
	line	50
	goto	l2891
	
l725:	
	line	61
	
l726:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_lcd
psect	text231,local,class=CODE,delta=2
global __ptext231
__ptext231:

;; *************** function _lcd *****************
;; Defined at:
;;		line 13 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy5\Untitled.c"
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
psect	text231
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy5\Untitled.c"
	line	13
	global	__size_of_lcd
	__size_of_lcd	equ	__end_of_lcd-_lcd
	
_lcd:	
	opt	stack 4
; Regs used in _lcd: [wreg+status,2+status,0+pclath+cstack]
	
l2847:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	clrf	(133)^080h	;volatile
	line	14
;Untitled.c: 14: PORTD=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	15
	
l2849:	
;Untitled.c: 15: DELAY();
	fcall	_DELAY
	line	16
	
l2851:	
;Untitled.c: 16: PORTD=1;ENABLE();
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l2853:	
	fcall	_ENABLE
	line	17
	
l2855:	
;Untitled.c: 17: PORTD=0x38;ENABLE();
	movlw	(038h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l2857:	
	fcall	_ENABLE
	line	18
	
l2859:	
;Untitled.c: 18: PORTD=0x0c;ENABLE();
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l2861:	
	fcall	_ENABLE
	line	19
	
l2863:	
;Untitled.c: 19: PORTD=0x06;ENABLE();
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l2865:	
	fcall	_ENABLE
	line	20
	
l712:	
	return
	opt stack 0
GLOBAL	__end_of_lcd
	__end_of_lcd:
;; =============== function _lcd ends ============

	signat	_lcd,88
	global	_ENABLE1
psect	text232,local,class=CODE,delta=2
global __ptext232
__ptext232:

;; *************** function _ENABLE1 *****************
;; Defined at:
;;		line 11 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy5\Untitled.c"
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
psect	text232
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy5\Untitled.c"
	line	11
	global	__size_of_ENABLE1
	__size_of_ENABLE1	equ	__end_of_ENABLE1-_ENABLE1
	
_ENABLE1:	
	opt	stack 5
; Regs used in _ENABLE1: [wreg+status,2+status,0+pclath+cstack]
	
l2841:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	bcf	(44/8),(44)&7
	bcf	(43/8),(43)&7
	
l2843:	
	fcall	_DELAY
	
l2845:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	
l709:	
	return
	opt stack 0
GLOBAL	__end_of_ENABLE1
	__end_of_ENABLE1:
;; =============== function _ENABLE1 ends ============

	signat	_ENABLE1,88
	global	_ENABLE
psect	text233,local,class=CODE,delta=2
global __ptext233
__ptext233:

;; *************** function _ENABLE *****************
;; Defined at:
;;		line 9 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy5\Untitled.c"
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
psect	text233
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy5\Untitled.c"
	line	9
	global	__size_of_ENABLE
	__size_of_ENABLE	equ	__end_of_ENABLE-_ENABLE
	
_ENABLE:	
	opt	stack 5
; Regs used in _ENABLE: [wreg+status,2+status,0+pclath+cstack]
	
l2835:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
	bcf	(44/8),(44)&7
	bcf	(43/8),(43)&7
	
l2837:	
	fcall	_DELAY
	
l2839:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_ENABLE
	__end_of_ENABLE:
;; =============== function _ENABLE ends ============

	signat	_ENABLE,88
	global	_DELAY
psect	text234,local,class=CODE,delta=2
global __ptext234
__ptext234:

;; *************** function _DELAY *****************
;; Defined at:
;;		line 7 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy5\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    0[BANK0 ] unsigned int 
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
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
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
psect	text234
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy5\Untitled.c"
	line	7
	global	__size_of_DELAY
	__size_of_DELAY	equ	__end_of_DELAY-_DELAY
	
_DELAY:	
	opt	stack 5
; Regs used in _DELAY: [wreg+status,2+status,0]
	
l2825:	
	movlw	low(03E7h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(DELAY@i)
	movlw	high(03E7h)
	movwf	((DELAY@i))+1
	
l2827:	
	movf	((DELAY@i+1)),w
	iorwf	((DELAY@i)),w
	skipz
	goto	u2361
	goto	u2360
u2361:
	goto	l2831
u2360:
	goto	l703
	
l2829:	
	goto	l703
	
l701:	
	
l2831:	
	movlw	low(01h)
	subwf	(DELAY@i),f
	movlw	high(01h)
	skipc
	decf	(DELAY@i+1),f
	subwf	(DELAY@i+1),f
	
l2833:	
	movf	((DELAY@i+1)),w
	iorwf	((DELAY@i)),w
	skipz
	goto	u2371
	goto	u2370
u2371:
	goto	l2831
u2370:
	goto	l703
	
l702:	
	
l703:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY
	__end_of_DELAY:
;; =============== function _DELAY ends ============

	signat	_DELAY,88
	global	_ccp1
psect	text235,local,class=CODE,delta=2
global __ptext235
__ptext235:

;; *************** function _ccp1 *****************
;; Defined at:
;;		line 24 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy5\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0       0
;;      Temps:          6       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text235
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy5\Untitled.c"
	line	24
	global	__size_of_ccp1
	__size_of_ccp1	equ	__end_of_ccp1-_ccp1
	
_ccp1:	
	opt	stack 4
; Regs used in _ccp1: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ccp1+2)
	movf	fsr0,w
	movwf	(??_ccp1+3)
	movf	pclath,w
	movwf	(??_ccp1+4)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_ccp1+5)
	ljmp	_ccp1
psect	text235
	line	25
	
i1l2749:	
;Untitled.c: 25: if(CCP1IF==1)
	btfss	(98/8),(98)&7
	goto	u230_21
	goto	u230_20
u230_21:
	goto	i1l715
u230_20:
	line	26
	
i1l2751:	
;Untitled.c: 26: {a=!a;
	movlw	1<<((_a)&7)
	xorwf	((_a)/8),f
	line	28
	
i1l2753:	
;Untitled.c: 28: if(a==1){ TMR1H=0;TMR1L=0;TMR1L=0;TMR1ON=1;z=0;
	btfss	(_a/8),(_a)&7
	goto	u231_21
	goto	u231_20
u231_21:
	goto	i1l2767
u231_20:
	
i1l2755:	
	clrf	(15)	;volatile
	clrf	(14)	;volatile
	clrf	(14)	;volatile
	
i1l2757:	
	bsf	(128/8),(128)&7
	
i1l2759:	
	clrf	(_z)
	line	29
	
i1l2761:	
;Untitled.c: 29: TEMP1=CCPR1H ; TEMP2=CCPR1L ;CCP1IF=0; }
	movf	(22),w	;volatile
	movwf	(??_ccp1+0)+0
	clrf	(??_ccp1+0)+0+1
	movf	0+(??_ccp1+0)+0,w
	movwf	(_TEMP1)
	movf	1+(??_ccp1+0)+0,w
	movwf	(_TEMP1+1)
	
i1l2763:	
	movf	(21),w	;volatile
	movwf	(??_ccp1+0)+0
	clrf	(??_ccp1+0)+0+1
	movf	0+(??_ccp1+0)+0,w
	movwf	(_TEMP2)
	movf	1+(??_ccp1+0)+0,w
	movwf	(_TEMP2+1)
	
i1l2765:	
	bcf	(98/8),(98)&7
	goto	i1l2777
	line	30
	
i1l716:	
	line	33
	
i1l2767:	
;Untitled.c: 30: else
;Untitled.c: 31: {
;Untitled.c: 33: y=CCPR1L+1;x=CCPR1H+CARRY;Z=z;TMR1ON=0;CCP1IF=0;
	movf	(21),w	;volatile
	addlw	01h
	movwf	(??_ccp1+0)+0
	movf	(??_ccp1+0)+0,w
	movwf	(_y)
	movlw	0
	btfsc	(24/8),(24)&7
	movlw	1
	addwf	(22),w	;volatile
	movwf	(??_ccp1+0)+0
	movf	(??_ccp1+0)+0,w
	movwf	(_x)
	
i1l2769:	
	movf	(_z),w
	movwf	(??_ccp1+0)+0
	movf	(??_ccp1+0)+0,w
	movwf	(_Z)
	
i1l2771:	
	bcf	(128/8),(128)&7
	
i1l2773:	
	bcf	(98/8),(98)&7
	goto	i1l2777
	line	35
	
i1l717:	
	line	36
;Untitled.c: 35: };
;Untitled.c: 36: }
	goto	i1l2777
	line	37
	
i1l715:	
	line	38
;Untitled.c: 37: else
;Untitled.c: 38: if(TMR1IF=1)
	bsf	(96/8),(96)&7
	btfss	(96/8),(96)&7
	goto	u232_21
	goto	u232_20
u232_21:
	goto	i1l2777
u232_20:
	line	39
	
i1l2775:	
;Untitled.c: 39: z++;
	movlw	(01h)
	movwf	(??_ccp1+0)+0
	movf	(??_ccp1+0)+0,w
	addwf	(_z),f
	goto	i1l2777
	
i1l719:	
	goto	i1l2777
	line	40
	
i1l718:	
	
i1l2777:	
;Untitled.c: 40: TMR1IF=0;
	bcf	(96/8),(96)&7
	line	41
	
i1l720:	
	movf	(??_ccp1+5),w
	movwf	btemp+1
	movf	(??_ccp1+4),w
	movwf	pclath
	movf	(??_ccp1+3),w
	movwf	fsr0
	swapf	(??_ccp1+2)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ccp1
	__end_of_ccp1:
;; =============== function _ccp1 ends ============

	signat	_ccp1,88
psect	text236,local,class=CODE,delta=2
global __ptext236
__ptext236:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
