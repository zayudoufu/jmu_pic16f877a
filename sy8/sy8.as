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
	FNCALL	_main,_delay
	FNROOT	_main
	FNCALL	_usart_seve,_delay1
	FNCALL	intlevel1,_usart_seve
	global	intlevel1
	FNROOT	intlevel1
	global	_table
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy8\Untitled.c"
	line	3

;initializer for _table
	retlw	06Dh
	retlw	079h
	retlw	020h
	retlw	06Eh
	retlw	061h
	retlw	06Dh
	retlw	065h
	retlw	020h
	retlw	069h
	retlw	073h
	retlw	020h
	retlw	070h
	retlw	069h
	retlw	063h
	retlw	031h
	retlw	036h
	retlw	066h
	retlw	038h
	retlw	037h
	retlw	037h
	retlw	020h
	global	_x
	global	_Y
	global	_addr
	global	_RCREG
_RCREG	set	26
	global	_RCSTA
_RCSTA	set	24
	global	_TXREG
_TXREG	set	25
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_SPBRG
_SPBRG	set	153
	global	_TRISC
_TRISC	set	135
	global	_TXSTA
_TXSTA	set	152
	global	_RCIE
_RCIE	set	1125
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
	file	"sy8.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_Y:
       ds      1

_addr:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_x:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy8\Untitled.c"
_table:
       ds      21

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
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
	movlw low(__pdataBANK0+21)
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
	global	?_delay1
?_delay1:	; 0 bytes @ 0x0
	global	?_usart_seve
?_usart_seve:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	delay1@Y
delay1@Y:	; 2 bytes @ 0x0
	ds	2
	global	??_delay1
??_delay1:	; 0 bytes @ 0x2
	global	delay1@i
delay1@i:	; 2 bytes @ 0x2
	ds	2
	global	??_usart_seve
??_usart_seve:	; 0 bytes @ 0x4
	ds	5
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	delay@Y
delay@Y:	; 2 bytes @ 0x0
	ds	2
	global	??_delay
??_delay:	; 0 bytes @ 0x2
	global	delay@i
delay@i:	; 2 bytes @ 0x2
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x4
	ds	1
;;Data sizes: Strings 0, constant 0, data 21, bss 3, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9      11
;; BANK0           80      5      27
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
;; Critical Paths under _usart_seve in COMMON
;;
;;   _usart_seve->_delay1
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_delay
;;
;; Critical Paths under _usart_seve in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _usart_seve in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _usart_seve in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _usart_seve in BANK2
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
;; (0) _main                                                 1     1      0      68
;;                                              4 BANK0      1     1      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                4     2      2      68
;;                                              0 BANK0      4     2      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _usart_seve                                           5     5      0      45
;;                                              4 COMMON     5     5      0
;;                             _delay1
;; ---------------------------------------------------------------------------------
;; (3) _delay1                                               4     2      2      45
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _delay
;;
;; _usart_seve (ROOT)
;;   _delay1
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
;;DATA                 0      0      2B      12        0.0%
;;ABS                  0      0      26       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       5       2        0.0%
;;BANK0               50      5      1B       5       33.8%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      9       B       1       78.6%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 15 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy8\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  712[COMMON] int 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy8\Untitled.c"
	line	15
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	
l2721:	
	clrf	(_addr)
	line	16
	
l2723:	
;Untitled.c: 16: TRISC=0xff;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	line	17
;Untitled.c: 17: SPBRG=12;
	movlw	(0Ch)
	movwf	(153)^080h	;volatile
	line	18
;Untitled.c: 18: TXSTA=0B00100100;
	movlw	(024h)
	movwf	(152)^080h	;volatile
	line	19
;Untitled.c: 19: RCSTA=0B10010000;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(24)	;volatile
	line	20
	
l2725:	
;Untitled.c: 20: GIE=1;PEIE=1;RCIE=1;
	bsf	(95/8),(95)&7
	
l2727:	
	bsf	(94/8),(94)&7
	
l2729:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1125/8)^080h,(1125)&7
	line	21
	
l2731:	
;Untitled.c: 21: for(x=0;x<21;x++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_x)
	movlw	(015h)
	subwf	(_x),w
	skipc
	goto	u2351
	goto	u2350
u2351:
	goto	l2735
u2350:
	goto	l714
	
l2733:	
	goto	l714
	line	22
	
l713:	
	line	23
	
l2735:	
;Untitled.c: 22: {
;Untitled.c: 23: TXREG=table[x];
	movf	(_x),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(25)	;volatile
	line	24
	
l2737:	
;Untitled.c: 24: delay(500);
	movlw	low(01F4h)
	movwf	(?_delay)
	movlw	high(01F4h)
	movwf	((?_delay))+1
	fcall	_delay
	line	21
	
l2739:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(_x),f
	
l2741:	
	movlw	(015h)
	subwf	(_x),w
	skipc
	goto	u2361
	goto	u2360
u2361:
	goto	l2735
u2360:
	
l714:	
	line	26
;Untitled.c: 25: }
;Untitled.c: 26: for(x=0;x<100;x++)
	clrf	(_x)
	
l2743:	
	movlw	(064h)
	subwf	(_x),w
	skipc
	goto	u2371
	goto	u2370
u2371:
	goto	l2747
u2370:
	goto	l716
	
l2745:	
	goto	l716
	line	27
	
l715:	
	line	28
	
l2747:	
;Untitled.c: 27: {
;Untitled.c: 28: TXREG=((EEADR=(x)),(EECON1&=0x3F),(RD=1),EEDATA);
	movf	(_x),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	
l2749:	
	movlw	(03Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(396)^0180h,f	;volatile
	
l2751:	
	bsf	(3168/8)^0180h,(3168)&7
	
l2753:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(268)^0100h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	line	29
	
l2755:	
;Untitled.c: 29: delay(500);
	movlw	low(01F4h)
	movwf	(?_delay)
	movlw	high(01F4h)
	movwf	((?_delay))+1
	fcall	_delay
	line	26
	
l2757:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(_x),f
	
l2759:	
	movlw	(064h)
	subwf	(_x),w
	skipc
	goto	u2381
	goto	u2380
u2381:
	goto	l2747
u2380:
	
l716:	
	line	31
;Untitled.c: 30: }
;Untitled.c: 31: addr=0;
	clrf	(_addr)
	goto	l718
	line	32
;Untitled.c: 32: while(1);
	
l717:	
	
l718:	
	goto	l718
	
l719:	
	line	33
	
l720:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_delay
psect	text128,local,class=CODE,delta=2
global __ptext128
__ptext128:

;; *************** function _delay *****************
;; Defined at:
;;		line 5 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy8\Untitled.c"
;; Parameters:    Size  Location     Type
;;  Y               2    0[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  i               2    2[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text128
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy8\Untitled.c"
	line	5
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 5
; Regs used in _delay: [wreg+status,2+status,0]
	
l2711:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(delay@Y+1),w
	clrf	(delay@i+1)
	addwf	(delay@i+1)
	movf	(delay@Y),w
	clrf	(delay@i)
	addwf	(delay@i)

	
l2713:	
	movf	((delay@i+1)),w
	iorwf	((delay@i)),w
	skipz
	goto	u2331
	goto	u2330
u2331:
	goto	l2717
u2330:
	goto	l695
	
l2715:	
	goto	l695
	
l693:	
	
l2717:	
	movlw	low(01h)
	subwf	(delay@i),f
	movlw	high(01h)
	skipc
	decf	(delay@i+1),f
	subwf	(delay@i+1),f
	
l2719:	
	movf	((delay@i+1)),w
	iorwf	((delay@i)),w
	skipz
	goto	u2341
	goto	u2340
u2341:
	goto	l2717
u2340:
	goto	l695
	
l694:	
	
l695:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,88
	global	_usart_seve
psect	text129,local,class=CODE,delta=2
global __ptext129
__ptext129:

;; *************** function _usart_seve *****************
;; Defined at:
;;		line 9 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy8\Untitled.c"
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
;;      Temps:          5       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay1
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text129
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy8\Untitled.c"
	line	9
	global	__size_of_usart_seve
	__size_of_usart_seve	equ	__end_of_usart_seve-_usart_seve
	
_usart_seve:	
	opt	stack 5
; Regs used in _usart_seve: [wreg+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_usart_seve+1)
	movf	fsr0,w
	movwf	(??_usart_seve+2)
	movf	pclath,w
	movwf	(??_usart_seve+3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_usart_seve+4)
	ljmp	_usart_seve
psect	text129
	line	10
	
i1l1787:	
;Untitled.c: 10: TXREG=RCREG;
	movf	(26),w	;volatile
	movwf	(25)	;volatile
	goto	i1l704
	line	11
;Untitled.c: 11: do{ while(WR)continue;EEADR=(addr);EEDATA=(RCREG); EECON1&=0x3F;CARRY=0;if(GIE)CARRY=1;GIE=0; WREN=1;EECON2=0x55;EECON2=0xAA;WR=1;WREN=0; if(CARRY)GIE=1; }while(0);delay1(1000);
	
i1l703:	
	goto	i1l704
	
i1l705:	
	
i1l704:	
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfsc	(3169/8)^0180h,(3169)&7
	goto	u5_21
	goto	u5_20
u5_21:
	goto	i1l704
u5_20:
	goto	i1l1789
	
i1l706:	
	
i1l1789:	
	movf	(_addr),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(26),w	;volatile
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(268)^0100h	;volatile
	
i1l1791:	
	movlw	(03Fh)
	movwf	(??_usart_seve+0)+0
	movf	(??_usart_seve+0)+0,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(396)^0180h,f	;volatile
	
i1l1793:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(24/8),(24)&7
	
i1l1795:	
	btfss	(95/8),(95)&7
	goto	u6_21
	goto	u6_20
u6_21:
	goto	i1l707
u6_20:
	
i1l1797:	
	bsf	(24/8),(24)&7
	
i1l707:	
	bcf	(95/8),(95)&7
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3170/8)^0180h,(3170)&7
	
i1l1799:	
	movlw	(055h)
	movwf	(397)^0180h	;volatile
	movlw	(0AAh)
	movwf	(397)^0180h	;volatile
	
i1l1801:	
	bsf	(3169/8)^0180h,(3169)&7
	
i1l1803:	
	bcf	(3170/8)^0180h,(3170)&7
	
i1l1805:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(24/8),(24)&7
	goto	u7_21
	goto	u7_20
u7_21:
	goto	i1l1809
u7_20:
	
i1l1807:	
	bsf	(95/8),(95)&7
	goto	i1l1809
	
i1l708:	
	goto	i1l1809
	
i1l709:	
	
i1l1809:	
	movlw	low(03E8h)
	movwf	(?_delay1)
	movlw	high(03E8h)
	movwf	((?_delay1))+1
	fcall	_delay1
	line	12
	
i1l1811:	
;Untitled.c: 12: addr++;
	movlw	(01h)
	movwf	(??_usart_seve+0)+0
	movf	(??_usart_seve+0)+0,w
	addwf	(_addr),f
	line	13
	
i1l710:	
	movf	(??_usart_seve+4),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(??_usart_seve+3),w
	movwf	pclath
	movf	(??_usart_seve+2),w
	movwf	fsr0
	swapf	(??_usart_seve+1)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_usart_seve
	__end_of_usart_seve:
;; =============== function _usart_seve ends ============

	signat	_usart_seve,88
	global	_delay1
psect	text130,local,class=CODE,delta=2
global __ptext130
__ptext130:

;; *************** function _delay1 *****************
;; Defined at:
;;		line 7 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy8\Untitled.c"
;; Parameters:    Size  Location     Type
;;  Y               2    0[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  i               2    2[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_usart_seve
;; This function uses a non-reentrant model
;;
psect	text130
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy8\Untitled.c"
	line	7
	global	__size_of_delay1
	__size_of_delay1	equ	__end_of_delay1-_delay1
	
_delay1:	
	opt	stack 5
; Regs used in _delay1: [wreg+status,2+status,0]
	
i1l1777:	
	movf	(delay1@Y+1),w
	clrf	(delay1@i+1)
	addwf	(delay1@i+1)
	movf	(delay1@Y),w
	clrf	(delay1@i)
	addwf	(delay1@i)

	
i1l1779:	
	movf	((delay1@i+1)),w
	iorwf	((delay1@i)),w
	skipz
	goto	u3_21
	goto	u3_20
u3_21:
	goto	i1l1783
u3_20:
	goto	i1l700
	
i1l1781:	
	goto	i1l700
	
i1l698:	
	
i1l1783:	
	movlw	low(01h)
	subwf	(delay1@i),f
	movlw	high(01h)
	skipc
	decf	(delay1@i+1),f
	subwf	(delay1@i+1),f
	
i1l1785:	
	movf	((delay1@i+1)),w
	iorwf	((delay1@i)),w
	skipz
	goto	u4_21
	goto	u4_20
u4_21:
	goto	i1l1783
u4_20:
	goto	i1l700
	
i1l699:	
	
i1l700:	
	return
	opt stack 0
GLOBAL	__end_of_delay1
	__end_of_delay1:
;; =============== function _delay1 ends ============

	signat	_delay1,88
psect	text131,local,class=CODE,delta=2
global __ptext131
__ptext131:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
