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
# 3 "G:\jy62\test.c"
	psect config,class=CONFIG,delta=2 ;#
# 3 "G:\jy62\test.c"
	dw 0xFF29 ;#
	FNCALL	_main,_DELAY
	FNCALL	_main,_ENABLE
	FNCALL	_main,___awtoft
	FNCALL	_main,_div
	FNCALL	_main,_ENABLE1
	FNCALL	_div,___ftge
	FNCALL	_div,___ftneg
	FNCALL	_div,___ftmul
	FNCALL	_div,___ftdiv
	FNCALL	_div,___fttol
	FNCALL	_div,___wmul
	FNCALL	_div,___awtoft
	FNCALL	_div,___ftadd
	FNCALL	_div,___awdiv
	FNCALL	___awtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNCALL	___ftadd,___ftpack
	FNCALL	_ENABLE1,_DELAY
	FNCALL	_ENABLE,_DELAY
	FNROOT	_main
	FNCALL	intlevel1,_usart_seve
	global	intlevel1
	FNROOT	intlevel1
	global	_table
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	file	"G:\jy62\test.c"
	line	12

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
	global	_buf
	global	_buff
	global	_a1
	global	_a2
	global	_a3
	global	_datax
	global	_datay
	global	_dataz
	global	_flag
	global	_x1
	global	_x2
	global	_x3
	global	_x4
	global	_x5
	global	_calaculate
	global	_a4
	global	_n
	global	_data
	global	_useful
	global	_K
	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
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
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
	global	_ADCON1
_ADCON1	set	159
	global	_SPBRG
_SPBRG	set	153
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_TXSTA
_TXSTA	set	152
	global	_RCIE
_RCIE	set	1125
	global	_TRMT
_TRMT	set	1217
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
	file	"jy62.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_a4:
       ds      2

_n:
       ds      2

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_buf:
       ds      3

_buff:
       ds      3

_a1:
       ds      2

_a2:
       ds      2

_a3:
       ds      2

_datax:
       ds      2

_datay:
       ds      2

_dataz:
       ds      2

_flag:
       ds      2

_x1:
       ds      2

_x2:
       ds      2

_x3:
       ds      2

_x4:
       ds      2

_x5:
       ds      2

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_data:
       ds      20

_useful:
       ds      20

_K:
       ds      2

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"G:\jy62\test.c"
_table:
       ds      16

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
_calaculate:
       ds      90

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+01Eh)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+02Ah)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+05Ah)
	fcall	clear_ram
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
; Initialize objects allocated to BANK1
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK1
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK1+16)
	movwf btemp-1,f
	movlw high(__pidataBANK1)
	movwf btemp,f
	movlw low(__pidataBANK1)
	movwf btemp+1,f
	movlw low(__pdataBANK1)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackBANK1,class=BANK1,space=1
global __pcstackBANK1
__pcstackBANK1:
	global	main@i
main@i:	; 2 bytes @ 0x0
	ds	2
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_DELAY
?_DELAY:	; 0 bytes @ 0x0
	global	?_ENABLE
?_ENABLE:	; 0 bytes @ 0x0
	global	?_ENABLE1
?_ENABLE1:	; 0 bytes @ 0x0
	global	?_div
?_div:	; 0 bytes @ 0x0
	global	?_usart_seve
?_usart_seve:	; 0 bytes @ 0x0
	global	??_usart_seve
??_usart_seve:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	ds	5
	global	??_DELAY
??_DELAY:	; 0 bytes @ 0x5
	global	??_ENABLE
??_ENABLE:	; 0 bytes @ 0x5
	global	??_ENABLE1
??_ENABLE1:	; 0 bytes @ 0x5
	global	??___wmul
??___wmul:	; 0 bytes @ 0x5
	global	??___ftneg
??___ftneg:	; 0 bytes @ 0x5
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?___ftge
?___ftge:	; 1 bit 
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	DELAY@i
DELAY@i:	; 2 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___ftge@ff1
___ftge@ff1:	; 3 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	ds	2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	ds	1
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	global	___ftge@ff2
___ftge@ff2:	; 3 bytes @ 0x3
	ds	1
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	1
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x5
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	ds	1
	global	??___ftge
??___ftge:	; 0 bytes @ 0x6
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	1
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0x8
	global	?___ftneg
?___ftneg:	; 3 bytes @ 0x8
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0x8
	global	___ftneg@f1
___ftneg@f1:	; 3 bytes @ 0x8
	ds	3
	global	?___fttol
?___fttol:	; 4 bytes @ 0xB
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0xB
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0xB
	ds	3
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0xE
	ds	1
	global	??___fttol
??___fttol:	; 0 bytes @ 0xF
	ds	3
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x12
	ds	1
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x13
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x13
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x14
	ds	2
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x16
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x17
	ds	1
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x18
	ds	1
	global	?___ftdiv
?___ftdiv:	; 3 bytes @ 0x19
	global	?___awtoft
?___awtoft:	; 3 bytes @ 0x19
	global	___awtoft@c
___awtoft@c:	; 2 bytes @ 0x19
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0x19
	ds	3
	global	??___awtoft
??___awtoft:	; 0 bytes @ 0x1C
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0x1C
	ds	2
	global	___awtoft@sign
___awtoft@sign:	; 1 bytes @ 0x1E
	ds	1
	global	??___ftdiv
??___ftdiv:	; 0 bytes @ 0x1F
	global	?___ftadd
?___ftadd:	; 3 bytes @ 0x1F
	global	___ftadd@f1
___ftadd@f1:	; 3 bytes @ 0x1F
	ds	3
	global	___ftadd@f2
___ftadd@f2:	; 3 bytes @ 0x22
	ds	1
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0x23
	ds	1
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0x24
	ds	1
	global	??___ftadd
??___ftadd:	; 0 bytes @ 0x25
	ds	2
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0x27
	ds	1
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0x28
	ds	1
	global	___ftadd@sign
___ftadd@sign:	; 1 bytes @ 0x29
	ds	1
	global	___ftadd@exp2
___ftadd@exp2:	; 1 bytes @ 0x2A
	ds	1
	global	___ftadd@exp1
___ftadd@exp1:	; 1 bytes @ 0x2B
	ds	1
	global	??_div
??_div:	; 0 bytes @ 0x2C
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x2E
	ds	4
;;Data sizes: Strings 0, constant 0, data 16, bss 166, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5       9
;; BANK0           80     50      80
;; BANK1           80      2      60
;; BANK3           96      0      90
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___ftpack	float  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?___ftadd	float  size(1) Largest target is 0
;;
;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?___awtoft	float  size(1) Largest target is 0
;;
;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?___ftdiv	float  size(1) Largest target is 0
;;
;; ?___ftneg	float  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _usart_seve in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_div
;;   _div->___ftadd
;;   ___awtoft->___fttol
;;   ___ftmul->___ftpack
;;   ___ftdiv->___fttol
;;   ___ftadd->___awtoft
;;   _ENABLE1->_DELAY
;;   _ENABLE->_DELAY
;;   ___ftneg->___ftpack
;;   ___fttol->___ftneg
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
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 6     6      0    5508
;;                                             46 BANK0      4     4      0
;;                                              0 BANK1      2     2      0
;;                              _DELAY
;;                             _ENABLE
;;                           ___awtoft
;;                                _div
;;                            _ENABLE1
;; ---------------------------------------------------------------------------------
;; (1) _div                                                  2     2      0    4729
;;                                             44 BANK0      2     2      0
;;                             ___ftge
;;                            ___ftneg
;;                            ___ftmul
;;                            ___ftdiv
;;                            ___fttol
;;                             ___wmul
;;                           ___awtoft
;;                            ___ftadd
;;                            ___awdiv
;; ---------------------------------------------------------------------------------
;; (2) ___awtoft                                             6     3      3     445
;;                                             25 BANK0      6     3      3
;;                           ___ftpack
;;                             ___wmul (ARG)
;;                            ___ftneg (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftmul                                             16    10      6     800
;;                                              8 BANK0     16    10      6
;;                           ___ftpack
;; ---------------------------------------------------------------------------------
;; (2) ___ftdiv                                             16    10      6     732
;;                                             25 BANK0     16    10      6
;;                           ___ftpack
;;                            ___ftmul (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftadd                                             13     7      6    1537
;;                                             31 BANK0     13     7      6
;;                           ___ftpack
;;                            ___ftneg (ARG)
;;                           ___awtoft (ARG)
;;                             ___wmul (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (1) _ENABLE1                                              0     0      0      68
;;                              _DELAY
;; ---------------------------------------------------------------------------------
;; (1) _ENABLE                                               0     0      0      68
;;                              _DELAY
;; ---------------------------------------------------------------------------------
;; (2) ___ftge                                              12     6      6     198
;;                                              0 BANK0     12     6      6
;; ---------------------------------------------------------------------------------
;; (2) ___ftneg                                              3     0      3      65
;;                                              8 BANK0      3     0      3
;;                           ___ftpack (ARG)
;;                             ___wmul (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     445
;;                                              0 BANK0      9     5      4
;; ---------------------------------------------------------------------------------
;; (2) ___fttol                                             14    10      4     371
;;                                             11 BANK0     14    10      4
;;                           ___ftpack (ARG)
;;                            ___ftneg (ARG)
;;                             ___wmul (ARG)
;; ---------------------------------------------------------------------------------
;; (3) ___ftpack                                             8     3      5     312
;;                                              0 BANK0      8     3      5
;; ---------------------------------------------------------------------------------
;; (2) ___wmul                                               6     2      4     136
;;                                              0 BANK0      6     2      4
;; ---------------------------------------------------------------------------------
;; (2) _DELAY                                                2     2      0      68
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _usart_seve                                           5     5      0       0
;;                                              0 COMMON     5     5      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DELAY
;;   _ENABLE
;;     _DELAY
;;   ___awtoft
;;     ___ftpack
;;     ___wmul (ARG)
;;     ___ftneg (ARG)
;;       ___ftpack (ARG)
;;       ___wmul (ARG)
;;     ___fttol (ARG)
;;       ___ftpack (ARG)
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;         ___wmul (ARG)
;;       ___wmul (ARG)
;;   _div
;;     ___ftge
;;     ___ftneg
;;       ___ftpack (ARG)
;;       ___wmul (ARG)
;;     ___ftmul
;;       ___ftpack
;;     ___ftdiv
;;       ___ftpack
;;       ___ftmul (ARG)
;;         ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___wmul (ARG)
;;         ___wmul (ARG)
;;     ___fttol
;;       ___ftpack (ARG)
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;         ___wmul (ARG)
;;       ___wmul (ARG)
;;     ___wmul
;;     ___awtoft
;;       ___ftpack
;;       ___wmul (ARG)
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;         ___wmul (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___wmul (ARG)
;;         ___wmul (ARG)
;;     ___ftadd
;;       ___ftpack
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;         ___wmul (ARG)
;;       ___awtoft (ARG)
;;         ___ftpack
;;         ___wmul (ARG)
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___wmul (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;             ___wmul (ARG)
;;           ___wmul (ARG)
;;       ___wmul (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___wmul (ARG)
;;         ___wmul (ARG)
;;     ___awdiv
;;   _ENABLE1
;;     _DELAY
;;
;; _usart_seve (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0      5A       9       93.8%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      2      3C       7       75.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      F2      12        0.0%
;;ABS                  0      0      EF       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               50     32      50       5      100.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      5       9       1       64.3%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 48 in file "G:\jy62\test.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    0[BANK1 ] int 
;; Return value:  Size  Location     Type
;;                  2  751[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       2       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       4       2       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_DELAY
;;		_ENABLE
;;		___awtoft
;;		_div
;;		_ENABLE1
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"G:\jy62\test.c"
	line	48
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	49
	
l4447:	
;test.c: 49: TRISD=0; TRISA=0;ADCON1=7;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	clrf	(133)^080h	;volatile
	
l4449:	
	movlw	(07h)
	movwf	(159)^080h	;volatile
	line	50
	
l4451:	
;test.c: 50: DELAY();
	fcall	_DELAY
	line	51
	
l4453:	
;test.c: 51: PORTD=1;ENABLE();
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4455:	
	fcall	_ENABLE
	line	52
	
l4457:	
;test.c: 52: PORTD=0x38;ENABLE();
	movlw	(038h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4459:	
	fcall	_ENABLE
	line	53
	
l4461:	
;test.c: 53: PORTD=0x0c;ENABLE();
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4463:	
	fcall	_ENABLE
	line	54
	
l4465:	
;test.c: 54: PORTD=0x06;ENABLE();
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4467:	
	fcall	_ENABLE
	line	55
	
l4469:	
;test.c: 55: TRISC=0xff;PORTC=0xff;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(135)^080h	;volatile
	
l4471:	
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(7)	;volatile
	line	56
	
l4473:	
;test.c: 56: SPBRG=25;
	movlw	(019h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	57
	
l4475:	
;test.c: 57: TXSTA=0B00100100;
	movlw	(024h)
	movwf	(152)^080h	;volatile
	line	58
	
l4477:	
;test.c: 58: RCSTA=0B10010000;
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(24)	;volatile
	line	59
	
l4479:	
;test.c: 59: GIE=1;PEIE=1;RCIE=1;
	bsf	(95/8),(95)&7
	
l4481:	
	bsf	(94/8),(94)&7
	
l4483:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1125/8)^080h,(1125)&7
	goto	l4485
	line	60
;test.c: 60: while(1)
	
l752:	
	line	62
	
l4485:	
;test.c: 61: {
;test.c: 62: if(data[1]==0x53 && data[0]==0x55)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_data)^080h+01h,w
	xorlw	053h
	skipz
	goto	u4441
	goto	u4440
u4441:
	goto	l4501
u4440:
	
l4487:	
	movf	(_data)^080h,w
	xorlw	055h
	skipz
	goto	u4451
	goto	u4450
u4451:
	goto	l4501
u4450:
	line	63
	
l4489:	
;test.c: 63: {for(int i=0;i<11;i++){useful[i]=data[i];}};
	clrf	(main@i)^080h
	clrf	(main@i+1)^080h
	
l4491:	
	movf	(main@i+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Bh))^80h
	subwf	btemp+1,w
	skipz
	goto	u4465
	movlw	low(0Bh)
	subwf	(main@i)^080h,w
u4465:

	skipc
	goto	u4461
	goto	u4460
u4461:
	goto	l4495
u4460:
	goto	l4501
	
l4493:	
	goto	l4501
	
l754:	
	
l4495:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@i)^080h,w
	addlw	_data&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@i)^080h,w
	addlw	_useful&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_main+0)+0,w
	movwf	indf
	
l4497:	
	movlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(main@i)^080h,f
	skipnc
	incf	(main@i+1)^080h,f
	movlw	high(01h)
	addwf	(main@i+1)^080h,f
	
l4499:	
	movf	(main@i+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Bh))^80h
	subwf	btemp+1,w
	skipz
	goto	u4475
	movlw	low(0Bh)
	subwf	(main@i)^080h,w
u4475:

	skipc
	goto	u4471
	goto	u4470
u4471:
	goto	l4495
u4470:
	goto	l4501
	
l755:	
	goto	l4501
	
l753:	
	line	64
	
l4501:	
;test.c: 64: datax=(short)((short)useful[3]<<8|useful[2]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_useful)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_useful)^080h+03h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+2)+0
	clrf	(??_main+2)+0+1
	movf	(??_main+2)+0,w
	movwf	(??_main+2)+1
	clrf	(??_main+2)+0
	movf	0+(??_main+0)+0,w
	iorwf	0+(??_main+2)+0,w
	movwf	(_datax)
	movf	1+(??_main+0)+0,w
	iorwf	1+(??_main+2)+0,w
	movwf	1+(_datax)
	line	65
	
l4503:	
;test.c: 65: buff=datax;div();
	movf	(_datax+1),w
	clrf	(?___awtoft+1)
	addwf	(?___awtoft+1)
	movf	(_datax),w
	clrf	(?___awtoft)
	addwf	(?___awtoft)

	fcall	___awtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awtoft)),w
	movwf	(_buff)
	movf	(1+(?___awtoft)),w
	movwf	(_buff+1)
	movf	(2+(?___awtoft)),w
	movwf	(_buff+2)
	
l4505:	
	fcall	_div
	line	66
	
l4507:	
;test.c: 66: PORTD=0x80; ENABLE();
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4509:	
	fcall	_ENABLE
	line	67
	
l4511:	
;test.c: 67: PORTD='R'; ENABLE1();
	movlw	(052h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4513:	
	fcall	_ENABLE1
	line	68
	
l4515:	
;test.c: 68: if(flag==1){PORTD='-'; ENABLE1();}
	movlw	01h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_flag),w
	iorwf	(_flag+1),w
	skipz
	goto	u4481
	goto	u4480
u4481:
	goto	l4521
u4480:
	
l4517:	
	movlw	(02Dh)
	movwf	(8)	;volatile
	
l4519:	
	fcall	_ENABLE1
	goto	l4525
	line	69
	
l756:	
	
l4521:	
;test.c: 69: else {PORTD=' '; ENABLE1();}
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4523:	
	fcall	_ENABLE1
	goto	l4525
	
l757:	
	line	70
	
l4525:	
;test.c: 70: PORTD=table[x1]; ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x1),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(8)	;volatile
	
l4527:	
	fcall	_ENABLE1
	line	71
	
l4529:	
;test.c: 71: PORTD=table[x2]; ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x2),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(8)	;volatile
	
l4531:	
	fcall	_ENABLE1
	line	72
	
l4533:	
;test.c: 72: PORTD=table[x3]; ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x3),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(8)	;volatile
	
l4535:	
	fcall	_ENABLE1
	line	73
	
l4537:	
;test.c: 73: PORTD='.'; ENABLE1();
	movlw	(02Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4539:	
	fcall	_ENABLE1
	line	74
	
l4541:	
;test.c: 74: PORTD=table[x4]; ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x4),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(8)	;volatile
	fcall	_ENABLE1
	line	75
	
l4543:	
;test.c: 75: PORTD=table[x5]; ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x5),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(8)	;volatile
	
l4545:	
	fcall	_ENABLE1
	line	76
	
l4547:	
;test.c: 76: PORTD=' '; ENABLE1();
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4549:	
	fcall	_ENABLE1
	line	77
	
l4551:	
;test.c: 77: datay=(useful[5]<<8|useful[4]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_useful)^080h+04h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_useful)^080h+05h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+2)+0
	clrf	(??_main+2)+0+1
	movf	(??_main+2)+0,w
	movwf	(??_main+2)+1
	clrf	(??_main+2)+0
	movf	0+(??_main+0)+0,w
	iorwf	0+(??_main+2)+0,w
	movwf	(_datay)
	movf	1+(??_main+0)+0,w
	iorwf	1+(??_main+2)+0,w
	movwf	1+(_datay)
	line	78
	
l4553:	
;test.c: 78: buff=datay;div();
	movf	(_datay+1),w
	clrf	(?___awtoft+1)
	addwf	(?___awtoft+1)
	movf	(_datay),w
	clrf	(?___awtoft)
	addwf	(?___awtoft)

	fcall	___awtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awtoft)),w
	movwf	(_buff)
	movf	(1+(?___awtoft)),w
	movwf	(_buff+1)
	movf	(2+(?___awtoft)),w
	movwf	(_buff+2)
	
l4555:	
	fcall	_div
	line	79
	
l4557:	
;test.c: 79: PORTD='P'; ENABLE1();
	movlw	(050h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4559:	
	fcall	_ENABLE1
	line	80
	
l4561:	
;test.c: 80: if(flag==1){PORTD='-'; ENABLE1();}
	movlw	01h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_flag),w
	iorwf	(_flag+1),w
	skipz
	goto	u4491
	goto	u4490
u4491:
	goto	l4567
u4490:
	
l4563:	
	movlw	(02Dh)
	movwf	(8)	;volatile
	
l4565:	
	fcall	_ENABLE1
	goto	l4571
	line	81
	
l758:	
	
l4567:	
;test.c: 81: else {PORTD=' '; ENABLE1();}
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4569:	
	fcall	_ENABLE1
	goto	l4571
	
l759:	
	line	82
	
l4571:	
;test.c: 82: PORTD=table[x1]; ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x1),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(8)	;volatile
	
l4573:	
	fcall	_ENABLE1
	line	83
	
l4575:	
;test.c: 83: PORTD=table[x2]; ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x2),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(8)	;volatile
	
l4577:	
	fcall	_ENABLE1
	line	84
	
l4579:	
;test.c: 84: PORTD=table[x3]; ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x3),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(8)	;volatile
	
l4581:	
	fcall	_ENABLE1
	line	85
	
l4583:	
;test.c: 85: PORTD='.'; ENABLE1();
	movlw	(02Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4585:	
	fcall	_ENABLE1
	line	86
	
l4587:	
;test.c: 86: PORTD=table[x4]; ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x4),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(8)	;volatile
	fcall	_ENABLE1
	line	87
	
l4589:	
;test.c: 87: K=x5;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x5+1),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_K+1)^080h
	addwf	(_K+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x5),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_K)^080h
	addwf	(_K)^080h

	line	89
	
l4591:	
;test.c: 89: PORTD=' '; ENABLE1();
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4593:	
	fcall	_ENABLE1
	line	90
	
l4595:	
;test.c: 90: dataz=(useful[7]<<8|useful[6]);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_useful)^080h+06h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_useful)^080h+07h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+2)+0
	clrf	(??_main+2)+0+1
	movf	(??_main+2)+0,w
	movwf	(??_main+2)+1
	clrf	(??_main+2)+0
	movf	0+(??_main+0)+0,w
	iorwf	0+(??_main+2)+0,w
	movwf	(_dataz)
	movf	1+(??_main+0)+0,w
	iorwf	1+(??_main+2)+0,w
	movwf	1+(_dataz)
	line	91
	
l4597:	
;test.c: 91: buff=dataz;div();
	movf	(_dataz+1),w
	clrf	(?___awtoft+1)
	addwf	(?___awtoft+1)
	movf	(_dataz),w
	clrf	(?___awtoft)
	addwf	(?___awtoft)

	fcall	___awtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awtoft)),w
	movwf	(_buff)
	movf	(1+(?___awtoft)),w
	movwf	(_buff+1)
	movf	(2+(?___awtoft)),w
	movwf	(_buff+2)
	
l4599:	
	fcall	_div
	line	92
	
l4601:	
;test.c: 92: PORTD=0xC0; ENABLE();
	movlw	(0C0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4603:	
	fcall	_ENABLE
	line	93
	
l4605:	
;test.c: 93: PORTD='Y'; ENABLE1();
	movlw	(059h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4607:	
	fcall	_ENABLE1
	line	94
	
l4609:	
;test.c: 94: if(flag==1){PORTD='-'; ENABLE1();}
	movlw	01h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_flag),w
	iorwf	(_flag+1),w
	skipz
	goto	u4501
	goto	u4500
u4501:
	goto	l4615
u4500:
	
l4611:	
	movlw	(02Dh)
	movwf	(8)	;volatile
	
l4613:	
	fcall	_ENABLE1
	goto	l4619
	line	95
	
l760:	
	
l4615:	
;test.c: 95: else {PORTD=' '; ENABLE1();}
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4617:	
	fcall	_ENABLE1
	goto	l4619
	
l761:	
	line	96
	
l4619:	
;test.c: 96: PORTD=table[x1]; ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x1),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(8)	;volatile
	
l4621:	
	fcall	_ENABLE1
	line	97
	
l4623:	
;test.c: 97: PORTD=table[x2]; ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x2),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(8)	;volatile
	
l4625:	
	fcall	_ENABLE1
	line	98
	
l4627:	
;test.c: 98: PORTD=table[x3]; ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x3),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(8)	;volatile
	
l4629:	
	fcall	_ENABLE1
	line	99
	
l4631:	
;test.c: 99: PORTD='.'; ENABLE1();
	movlw	(02Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4633:	
	fcall	_ENABLE1
	line	100
	
l4635:	
;test.c: 100: PORTD=table[x4]; ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x4),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(8)	;volatile
	fcall	_ENABLE1
	line	101
	
l4637:	
;test.c: 101: PORTD=table[x5]; ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_x5),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(8)	;volatile
	
l4639:	
	fcall	_ENABLE1
	line	102
	
l4641:	
;test.c: 102: PORTD=' '; ENABLE1();
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4643:	
	fcall	_ENABLE1
	line	103
	
l4645:	
;test.c: 103: PORTD=0xCF; ENABLE();
	movlw	(0CFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4647:	
	fcall	_ENABLE
	line	104
;test.c: 104: PORTD=table[K]; ENABLE1();
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_K)^080h,w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4649:	
	fcall	_ENABLE1
	goto	l4485
	line	105
	
l762:	
	line	60
	goto	l4485
	
l763:	
	line	106
	
l764:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_div
psect	text603,local,class=CODE,delta=2
global __ptext603
__ptext603:

;; *************** function _div *****************
;; Defined at:
;;		line 23 in file "G:\jy62\test.c"
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
;;      Temps:          0       2       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___ftge
;;		___ftneg
;;		___ftmul
;;		___ftdiv
;;		___fttol
;;		___wmul
;;		___awtoft
;;		___ftadd
;;		___awdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text603
	file	"G:\jy62\test.c"
	line	23
	global	__size_of_div
	__size_of_div	equ	__end_of_div-_div
	
_div:	
	opt	stack 4
; Regs used in _div: [wreg+status,2+status,0+pclath+cstack]
	line	24
	
l4419:	
;test.c: 24: if(buff<0){flag=1;buff=-buff;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_buff),w
	movwf	(?___ftge)
	movf	(_buff+1),w
	movwf	(?___ftge+1)
	movf	(_buff+2),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0x0
	movwf	1+(?___ftge)+03h
	movlw	0x0
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u4431
	goto	u4430
u4431:
	goto	l4425
u4430:
	
l4421:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_flag)
	movlw	high(01h)
	movwf	((_flag))+1
	
l4423:	
	movf	(_buff),w
	movwf	(?___ftneg)
	movf	(_buff+1),w
	movwf	(?___ftneg+1)
	movf	(_buff+2),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftneg)),w
	movwf	(_buff)
	movf	(1+(?___ftneg)),w
	movwf	(_buff+1)
	movf	(2+(?___ftneg)),w
	movwf	(_buff+2)
	goto	l4427
	line	25
	
l738:	
	
l4425:	
;test.c: 25: else flag=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_flag)
	clrf	(_flag+1)
	goto	l4427
	
l739:	
	line	26
	
l4427:	
;test.c: 26: buf=buff*18000/32768;
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x47
	movwf	(?___ftdiv+2)
	movlw	0xa0
	movwf	(?___ftmul)
	movlw	0x8c
	movwf	(?___ftmul+1)
	movlw	0x46
	movwf	(?___ftmul+2)
	movf	(_buff),w
	movwf	0+(?___ftmul)+03h
	movf	(_buff+1),w
	movwf	1+(?___ftmul)+03h
	movf	(_buff+2),w
	movwf	2+(?___ftmul)+03h
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	0+(?___ftdiv)+03h
	movf	(1+(?___ftmul)),w
	movwf	1+(?___ftdiv)+03h
	movf	(2+(?___ftmul)),w
	movwf	2+(?___ftdiv)+03h
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	(_buf)
	movf	(1+(?___ftdiv)),w
	movwf	(_buf+1)
	movf	(2+(?___ftdiv)),w
	movwf	(_buf+2)
	line	27
	
l4429:	
;test.c: 27: x1=buf/10000;a1=buf-x1*10000;
	movf	(_buf),w
	movwf	0+(?___ftdiv)+03h
	movf	(_buf+1),w
	movwf	1+(?___ftdiv)+03h
	movf	(_buf+2),w
	movwf	2+(?___ftdiv)+03h
	movlw	0x40
	movwf	(?___ftdiv)
	movlw	0x1c
	movwf	(?___ftdiv+1)
	movlw	0x46
	movwf	(?___ftdiv+2)
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	(?___fttol)
	movf	(1+(?___ftdiv)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftdiv)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(((0+(?___fttol)))),w
	clrf	(_x1+1)
	addwf	(_x1+1)
	movf	0+(((0+(?___fttol)))),w
	clrf	(_x1)
	addwf	(_x1)

	
l4431:	
	movlw	low(02710h)
	movwf	0+(?___wmul)+02h
	movlw	high(02710h)
	movwf	(0+(?___wmul)+02h)+1
	movf	(_x1+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(_x1),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___wmul)),w
	clrf	(?___awtoft+1)
	addwf	(?___awtoft+1)
	movf	(0+(?___wmul)),w
	clrf	(?___awtoft)
	addwf	(?___awtoft)

	fcall	___awtoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awtoft)),w
	movwf	(?___ftneg)
	movf	(1+(?___awtoft)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___awtoft)),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftneg)),w
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___ftneg)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___ftneg)),w
	movwf	2+(?___ftadd)+03h
	movf	(_buf),w
	movwf	(?___ftadd)
	movf	(_buf+1),w
	movwf	(?___ftadd+1)
	movf	(_buf+2),w
	movwf	(?___ftadd+2)
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	(?___fttol)
	movf	(1+(?___ftadd)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftadd)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(((0+(?___fttol)))),w
	clrf	(_a1+1)
	addwf	(_a1+1)
	movf	0+(((0+(?___fttol)))),w
	clrf	(_a1)
	addwf	(_a1)

	line	28
	
l4433:	
;test.c: 28: x2=a1/1000;a2=a1-x2*1000;
	movlw	low(03E8h)
	movwf	(?___awdiv)
	movlw	high(03E8h)
	movwf	((?___awdiv))+1
	movf	(_a1+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(_a1),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___awdiv)),w
	clrf	(_x2+1)
	addwf	(_x2+1)
	movf	(0+(?___awdiv)),w
	clrf	(_x2)
	addwf	(_x2)

	
l4435:	
	movf	(_x2+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(_x2),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(03E8h)
	movwf	0+(?___wmul)+02h
	movlw	high(03E8h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	comf	(0+(?___wmul)),w
	movwf	(??_div+0)+0
	comf	(1+(?___wmul)),w
	movwf	((??_div+0)+0+1)
	incf	(??_div+0)+0,f
	skipnz
	incf	((??_div+0)+0+1),f
	movf	(_a1),w
	addwf	0+(??_div+0)+0,w
	movwf	(_a2)
	movf	(_a1+1),w
	skipnc
	incf	(_a1+1),w
	addwf	1+(??_div+0)+0,w
	movwf	1+(_a2)
	line	29
	
l4437:	
;test.c: 29: x3=a2/100;a3=a2-x3*100;
	movlw	low(064h)
	movwf	(?___awdiv)
	movlw	high(064h)
	movwf	((?___awdiv))+1
	movf	(_a2+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(_a2),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___awdiv)),w
	clrf	(_x3+1)
	addwf	(_x3+1)
	movf	(0+(?___awdiv)),w
	clrf	(_x3)
	addwf	(_x3)

	
l4439:	
	movf	(_x3+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(_x3),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(064h)
	movwf	0+(?___wmul)+02h
	movlw	high(064h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	comf	(0+(?___wmul)),w
	movwf	(??_div+0)+0
	comf	(1+(?___wmul)),w
	movwf	((??_div+0)+0+1)
	incf	(??_div+0)+0,f
	skipnz
	incf	((??_div+0)+0+1),f
	movf	(_a2),w
	addwf	0+(??_div+0)+0,w
	movwf	(_a3)
	movf	(_a2+1),w
	skipnc
	incf	(_a2+1),w
	addwf	1+(??_div+0)+0,w
	movwf	1+(_a3)
	line	30
	
l4441:	
;test.c: 30: x4=a3/10;a4=a3-x4*10;
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(_a3+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(_a3),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___awdiv)),w
	clrf	(_x4+1)
	addwf	(_x4+1)
	movf	(0+(?___awdiv)),w
	clrf	(_x4)
	addwf	(_x4)

	
l4443:	
	movf	(_x4+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(_x4),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(0Ah)
	movwf	0+(?___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	comf	(0+(?___wmul)),w
	movwf	(??_div+0)+0
	comf	(1+(?___wmul)),w
	movwf	((??_div+0)+0+1)
	incf	(??_div+0)+0,f
	skipnz
	incf	((??_div+0)+0+1),f
	movf	(_a3),w
	addwf	0+(??_div+0)+0,w
	movwf	(_a4)
	movf	(_a3+1),w
	skipnc
	incf	(_a3+1),w
	addwf	1+(??_div+0)+0,w
	movwf	1+(_a4)
	line	31
	
l4445:	
;test.c: 31: x5=a4;
	movf	(_a4+1),w
	clrf	(_x5+1)
	addwf	(_x5+1)
	movf	(_a4),w
	clrf	(_x5)
	addwf	(_x5)

	line	32
	
l740:	
	return
	opt stack 0
GLOBAL	__end_of_div
	__end_of_div:
;; =============== function _div ends ============

	signat	_div,88
	global	___awtoft
psect	text604,local,class=CODE,delta=2
global __ptext604
__ptext604:

;; *************** function ___awtoft *****************
;; Defined at:
;;		line 33 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2   25[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1   30[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   25[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_div
;;		_main
;; This function uses a non-reentrant model
;;
psect	text604
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awtoft.c"
	line	33
	global	__size_of___awtoft
	__size_of___awtoft	equ	__end_of___awtoft-___awtoft
	
___awtoft:	
	opt	stack 4
; Regs used in ___awtoft: [wreg+status,2+status,0+pclath+cstack]
	line	36
	
l4411:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awtoft@sign)
	line	37
	btfss	(___awtoft@c+1),7
	goto	u4421
	goto	u4420
u4421:
	goto	l4415
u4420:
	line	38
	
l4413:	
	comf	(___awtoft@c),f
	comf	(___awtoft@c+1),f
	incf	(___awtoft@c),f
	skipnz
	incf	(___awtoft@c+1),f
	line	39
	clrf	(___awtoft@sign)
	bsf	status,0
	rlf	(___awtoft@sign),f
	goto	l4415
	line	40
	
l1583:	
	line	41
	
l4415:	
	movf	(___awtoft@c),w
	movwf	(?___ftpack)
	movf	(___awtoft@c+1),w
	movwf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	(??___awtoft+0)+0
	movf	(??___awtoft+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___awtoft@sign),w
	movwf	(??___awtoft+1)+0
	movf	(??___awtoft+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftpack)),w
	movwf	(?___awtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___awtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___awtoft+2)
	goto	l1584
	
l4417:	
	line	42
	
l1584:	
	return
	opt stack 0
GLOBAL	__end_of___awtoft
	__end_of___awtoft:
;; =============== function ___awtoft ends ============

	signat	___awtoft,4219
	global	___ftmul
psect	text605,local,class=CODE,delta=2
global __ptext605
__ptext605:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[BANK0 ] float 
;;  f2              3   11[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   19[BANK0 ] unsigned um
;;  sign            1   23[BANK0 ] unsigned char 
;;  cntr            1   22[BANK0 ] unsigned char 
;;  exp             1   18[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3    8[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_div
;; This function uses a non-reentrant model
;;
psect	text605
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 4
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l4361:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@exp)
	movf	((___ftmul@exp)),f
	skipz
	goto	u4281
	goto	u4280
u4281:
	goto	l4367
u4280:
	line	57
	
l4363:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l1546
	
l4365:	
	goto	l1546
	
l1545:	
	line	58
	
l4367:	
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	movf	((___ftmul@sign)),f
	skipz
	goto	u4291
	goto	u4290
u4291:
	goto	l4373
u4290:
	line	59
	
l4369:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l1546
	
l4371:	
	goto	l1546
	
l1547:	
	line	60
	
l4373:	
	movf	(___ftmul@sign),w
	addlw	07Bh
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	addwf	(___ftmul@exp),f
	line	61
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u4305:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u4300:
	addlw	-1
	skipz
	goto	u4305
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	line	62
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u4315:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u4310:
	addlw	-1
	skipz
	goto	u4315
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	xorwf	(___ftmul@sign),f
	line	63
	movlw	(080h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	andwf	(___ftmul@sign),f
	line	64
	
l4375:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l4377:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l4379:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l4381:	
	movlw	0
	movwf	(___ftmul@f3_as_product)
	movlw	0
	movwf	(___ftmul@f3_as_product+1)
	movlw	0
	movwf	(___ftmul@f3_as_product+2)
	line	69
	
l4383:	
	movlw	(07h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l4385
	line	70
	
l1548:	
	line	71
	
l4385:	
	btfss	(___ftmul@f1),(0)&7
	goto	u4321
	goto	u4320
u4321:
	goto	l4389
u4320:
	line	72
	
l4387:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u4331
	addwf	(___ftmul@f3_as_product+1),f
u4331:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u4332
	addwf	(___ftmul@f3_as_product+2),f
u4332:

	goto	l4389
	
l1549:	
	line	73
	
l4389:	
	movlw	01h
u4345:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u4345

	line	74
	
l4391:	
	movlw	01h
u4355:
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	addlw	-1
	skipz
	goto	u4355
	line	75
	
l4393:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u4361
	goto	u4360
u4361:
	goto	l4385
u4360:
	goto	l4395
	
l1550:	
	line	76
	
l4395:	
	movlw	(09h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l4397
	line	77
	
l1551:	
	line	78
	
l4397:	
	btfss	(___ftmul@f1),(0)&7
	goto	u4371
	goto	u4370
u4371:
	goto	l4401
u4370:
	line	79
	
l4399:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u4381
	addwf	(___ftmul@f3_as_product+1),f
u4381:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u4382
	addwf	(___ftmul@f3_as_product+2),f
u4382:

	goto	l4401
	
l1552:	
	line	80
	
l4401:	
	movlw	01h
u4395:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u4395

	line	81
	
l4403:	
	movlw	01h
u4405:
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	addlw	-1
	skipz
	goto	u4405

	line	82
	
l4405:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u4411
	goto	u4410
u4411:
	goto	l4397
u4410:
	goto	l4407
	
l1553:	
	line	83
	
l4407:	
	movf	(___ftmul@f3_as_product),w
	movwf	(?___ftpack)
	movf	(___ftmul@f3_as_product+1),w
	movwf	(?___ftpack+1)
	movf	(___ftmul@f3_as_product+2),w
	movwf	(?___ftpack+2)
	movf	(___ftmul@exp),w
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftmul@sign),w
	movwf	(??___ftmul+1)+0
	movf	(??___ftmul+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftpack)),w
	movwf	(?___ftmul)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftmul+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftmul+2)
	goto	l1546
	
l4409:	
	line	84
	
l1546:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	___ftdiv
psect	text606,local,class=CODE,delta=2
global __ptext606
__ptext606:

;; *************** function ___ftdiv *****************
;; Defined at:
;;		line 50 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftdiv.c"
;; Parameters:    Size  Location     Type
;;  f2              3   25[BANK0 ] float 
;;  f1              3   28[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3              3   36[BANK0 ] float 
;;  sign            1   40[BANK0 ] unsigned char 
;;  exp             1   39[BANK0 ] unsigned char 
;;  cntr            1   35[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   25[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_div
;; This function uses a non-reentrant model
;;
psect	text606
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftdiv.c"
	line	50
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:	
	opt	stack 4
; Regs used in ___ftdiv: [wreg+status,2+status,0+pclath+cstack]
	line	55
	
l4319:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@exp)
	movf	((___ftdiv@exp)),f
	skipz
	goto	u4201
	goto	u4200
u4201:
	goto	l4325
u4200:
	line	56
	
l4321:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	l1536
	
l4323:	
	goto	l1536
	
l1535:	
	line	57
	
l4325:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@sign)
	movf	((___ftdiv@sign)),f
	skipz
	goto	u4211
	goto	u4210
u4211:
	goto	l4331
u4210:
	line	58
	
l4327:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	l1536
	
l4329:	
	goto	l1536
	
l1537:	
	line	59
	
l4331:	
	movlw	0
	movwf	(___ftdiv@f3)
	movlw	0
	movwf	(___ftdiv@f3+1)
	movlw	0
	movwf	(___ftdiv@f3+2)
	line	60
	
l4333:	
	movlw	(089h)
	addwf	(___ftdiv@sign),w
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	subwf	(___ftdiv@exp),f
	line	61
	
l4335:	
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u4225:
	clrc
	rrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u4220:
	addlw	-1
	skipz
	goto	u4225
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@sign)
	line	62
	
l4337:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u4235:
	clrc
	rrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u4230:
	addlw	-1
	skipz
	goto	u4235
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	xorwf	(___ftdiv@sign),f
	line	63
	
l4339:	
	movlw	(080h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	andwf	(___ftdiv@sign),f
	line	64
	
l4341:	
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	65
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	66
	
l4343:	
	bsf	(___ftdiv@f2)+(15/8),(15)&7
	line	67
	movlw	0FFh
	andwf	(___ftdiv@f2),f
	movlw	0FFh
	andwf	(___ftdiv@f2+1),f
	movlw	0
	andwf	(___ftdiv@f2+2),f
	line	68
	movlw	(018h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movwf	(___ftdiv@cntr)
	goto	l4345
	line	69
	
l1538:	
	line	70
	
l4345:	
	movlw	01h
u4245:
	clrc
	rlf	(___ftdiv@f3),f
	rlf	(___ftdiv@f3+1),f
	rlf	(___ftdiv@f3+2),f
	addlw	-1
	skipz
	goto	u4245
	line	71
	
l4347:	
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u4255
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u4255
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u4255:
	skipc
	goto	u4251
	goto	u4250
u4251:
	goto	l4353
u4250:
	line	72
	
l4349:	
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),f
	movf	(___ftdiv@f2+1),w
	skipc
	incfsz	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),f
	movf	(___ftdiv@f2+2),w
	skipc
	incf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),f
	line	73
	
l4351:	
	bsf	(___ftdiv@f3)+(0/8),(0)&7
	goto	l4353
	line	74
	
l1539:	
	line	75
	
l4353:	
	movlw	01h
u4265:
	clrc
	rlf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	addlw	-1
	skipz
	goto	u4265
	line	76
	
l4355:	
	movlw	low(01h)
	subwf	(___ftdiv@cntr),f
	btfss	status,2
	goto	u4271
	goto	u4270
u4271:
	goto	l4345
u4270:
	goto	l4357
	
l1540:	
	line	77
	
l4357:	
	movf	(___ftdiv@f3),w
	movwf	(?___ftpack)
	movf	(___ftdiv@f3+1),w
	movwf	(?___ftpack+1)
	movf	(___ftdiv@f3+2),w
	movwf	(?___ftpack+2)
	movf	(___ftdiv@exp),w
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftdiv@sign),w
	movwf	(??___ftdiv+1)+0
	movf	(??___ftdiv+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftpack)),w
	movwf	(?___ftdiv)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftdiv+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftdiv+2)
	goto	l1536
	
l4359:	
	line	78
	
l1536:	
	return
	opt stack 0
GLOBAL	__end_of___ftdiv
	__end_of___ftdiv:
;; =============== function ___ftdiv ends ============

	signat	___ftdiv,8315
	global	___ftadd
psect	text607,local,class=CODE,delta=2
global __ptext607
__ptext607:

;; *************** function ___ftadd *****************
;; Defined at:
;;		line 87 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftadd.c"
;; Parameters:    Size  Location     Type
;;  f1              3   31[BANK0 ] float 
;;  f2              3   34[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  exp1            1   43[BANK0 ] unsigned char 
;;  exp2            1   42[BANK0 ] unsigned char 
;;  sign            1   41[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   31[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_div
;;		___ftsub
;; This function uses a non-reentrant model
;;
psect	text607
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftadd.c"
	line	87
	global	__size_of___ftadd
	__size_of___ftadd	equ	__end_of___ftadd-___ftadd
	
___ftadd:	
	opt	stack 4
; Regs used in ___ftadd: [wreg+status,2+status,0+pclath+cstack]
	line	90
	
l4249:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftadd@f1),w
	movwf	((??___ftadd+0)+0)
	movf	(___ftadd@f1+1),w
	movwf	((??___ftadd+0)+0+1)
	movf	(___ftadd@f1+2),w
	movwf	((??___ftadd+0)+0+2)
	clrc
	rlf	(??___ftadd+0)+1,w
	rlf	(??___ftadd+0)+2,w
	movwf	(??___ftadd+3)+0
	movf	(??___ftadd+3)+0,w
	movwf	(___ftadd@exp1)
	line	91
	movf	(___ftadd@f2),w
	movwf	((??___ftadd+0)+0)
	movf	(___ftadd@f2+1),w
	movwf	((??___ftadd+0)+0+1)
	movf	(___ftadd@f2+2),w
	movwf	((??___ftadd+0)+0+2)
	clrc
	rlf	(??___ftadd+0)+1,w
	rlf	(??___ftadd+0)+2,w
	movwf	(??___ftadd+3)+0
	movf	(??___ftadd+3)+0,w
	movwf	(___ftadd@exp2)
	line	92
	
l4251:	
	movf	(___ftadd@exp1),w
	skipz
	goto	u3960
	goto	l4257
u3960:
	
l4253:	
	movf	(___ftadd@exp2),w
	subwf	(___ftadd@exp1),w
	skipnc
	goto	u3971
	goto	u3970
u3971:
	goto	l4261
u3970:
	
l4255:	
	decf	(___ftadd@exp1),w
	xorlw	0ffh
	addwf	(___ftadd@exp2),w
	movwf	(??___ftadd+0)+0
	movlw	(019h)
	subwf	0+(??___ftadd+0)+0,w
	skipc
	goto	u3981
	goto	u3980
u3981:
	goto	l4261
u3980:
	goto	l4257
	
l1493:	
	line	93
	
l4257:	
	movf	(___ftadd@f2),w
	movwf	(?___ftadd)
	movf	(___ftadd@f2+1),w
	movwf	(?___ftadd+1)
	movf	(___ftadd@f2+2),w
	movwf	(?___ftadd+2)
	goto	l1494
	
l4259:	
	goto	l1494
	
l1491:	
	line	94
	
l4261:	
	movf	(___ftadd@exp2),w
	skipz
	goto	u3990
	goto	l1497
u3990:
	
l4263:	
	movf	(___ftadd@exp1),w
	subwf	(___ftadd@exp2),w
	skipnc
	goto	u4001
	goto	u4000
u4001:
	goto	l4267
u4000:
	
l4265:	
	decf	(___ftadd@exp2),w
	xorlw	0ffh
	addwf	(___ftadd@exp1),w
	movwf	(??___ftadd+0)+0
	movlw	(019h)
	subwf	0+(??___ftadd+0)+0,w
	skipc
	goto	u4011
	goto	u4010
u4011:
	goto	l4267
u4010:
	
l1497:	
	line	95
	goto	l1494
	
l1495:	
	line	96
	
l4267:	
	movlw	(06h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	movwf	(___ftadd@sign)
	line	97
	
l4269:	
	btfss	(___ftadd@f1+2),(23)&7
	goto	u4021
	goto	u4020
u4021:
	goto	l1498
u4020:
	line	98
	
l4271:	
	bsf	(___ftadd@sign)+(7/8),(7)&7
	
l1498:	
	line	99
	btfss	(___ftadd@f2+2),(23)&7
	goto	u4031
	goto	u4030
u4031:
	goto	l1499
u4030:
	line	100
	
l4273:	
	bsf	(___ftadd@sign)+(6/8),(6)&7
	
l1499:	
	line	101
	bsf	(___ftadd@f1)+(15/8),(15)&7
	line	102
	
l4275:	
	movlw	0FFh
	andwf	(___ftadd@f1),f
	movlw	0FFh
	andwf	(___ftadd@f1+1),f
	movlw	0
	andwf	(___ftadd@f1+2),f
	line	103
	
l4277:	
	bsf	(___ftadd@f2)+(15/8),(15)&7
	line	104
	movlw	0FFh
	andwf	(___ftadd@f2),f
	movlw	0FFh
	andwf	(___ftadd@f2+1),f
	movlw	0
	andwf	(___ftadd@f2+2),f
	line	106
	movf	(___ftadd@exp2),w
	subwf	(___ftadd@exp1),w
	skipnc
	goto	u4041
	goto	u4040
u4041:
	goto	l4289
u4040:
	goto	l4279
	line	109
	
l1501:	
	line	110
	
l4279:	
	movlw	01h
u4055:
	clrc
	rlf	(___ftadd@f2),f
	rlf	(___ftadd@f2+1),f
	rlf	(___ftadd@f2+2),f
	addlw	-1
	skipz
	goto	u4055
	line	111
	movlw	low(01h)
	subwf	(___ftadd@exp2),f
	line	112
	
l4281:	
	movf	(___ftadd@exp2),w
	xorwf	(___ftadd@exp1),w
	skipnz
	goto	u4061
	goto	u4060
u4061:
	goto	l4287
u4060:
	
l4283:	
	movlw	low(01h)
	subwf	(___ftadd@sign),f
	movf	((___ftadd@sign)),w
	andlw	07h
	btfss	status,2
	goto	u4071
	goto	u4070
u4071:
	goto	l4279
u4070:
	goto	l4287
	
l1503:	
	goto	l4287
	
l1504:	
	line	113
	goto	l4287
	
l1506:	
	line	114
	
l4285:	
	movlw	01h
u4085:
	clrc
	rrf	(___ftadd@f1+2),f
	rrf	(___ftadd@f1+1),f
	rrf	(___ftadd@f1),f
	addlw	-1
	skipz
	goto	u4085

	line	115
	movlw	(01h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	addwf	(___ftadd@exp1),f
	goto	l4287
	line	116
	
l1505:	
	line	113
	
l4287:	
	movf	(___ftadd@exp1),w
	xorwf	(___ftadd@exp2),w
	skipz
	goto	u4091
	goto	u4090
u4091:
	goto	l4285
u4090:
	goto	l1508
	
l1507:	
	line	117
	goto	l1508
	
l1500:	
	
l4289:	
	movf	(___ftadd@exp1),w
	subwf	(___ftadd@exp2),w
	skipnc
	goto	u4101
	goto	u4100
u4101:
	goto	l1508
u4100:
	goto	l4291
	line	120
	
l1510:	
	line	121
	
l4291:	
	movlw	01h
u4115:
	clrc
	rlf	(___ftadd@f1),f
	rlf	(___ftadd@f1+1),f
	rlf	(___ftadd@f1+2),f
	addlw	-1
	skipz
	goto	u4115
	line	122
	movlw	low(01h)
	subwf	(___ftadd@exp1),f
	line	123
	
l4293:	
	movf	(___ftadd@exp2),w
	xorwf	(___ftadd@exp1),w
	skipnz
	goto	u4121
	goto	u4120
u4121:
	goto	l4299
u4120:
	
l4295:	
	movlw	low(01h)
	subwf	(___ftadd@sign),f
	movf	((___ftadd@sign)),w
	andlw	07h
	btfss	status,2
	goto	u4131
	goto	u4130
u4131:
	goto	l4291
u4130:
	goto	l4299
	
l1512:	
	goto	l4299
	
l1513:	
	line	124
	goto	l4299
	
l1515:	
	line	125
	
l4297:	
	movlw	01h
u4145:
	clrc
	rrf	(___ftadd@f2+2),f
	rrf	(___ftadd@f2+1),f
	rrf	(___ftadd@f2),f
	addlw	-1
	skipz
	goto	u4145

	line	126
	movlw	(01h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	addwf	(___ftadd@exp2),f
	goto	l4299
	line	127
	
l1514:	
	line	124
	
l4299:	
	movf	(___ftadd@exp1),w
	xorwf	(___ftadd@exp2),w
	skipz
	goto	u4151
	goto	u4150
u4151:
	goto	l4297
u4150:
	goto	l1508
	
l1516:	
	goto	l1508
	line	128
	
l1509:	
	line	129
	
l1508:	
	btfss	(___ftadd@sign),(7)&7
	goto	u4161
	goto	u4160
u4161:
	goto	l4303
u4160:
	line	131
	
l4301:	
	movlw	0FFh
	xorwf	(___ftadd@f1),f
	movlw	0FFh
	xorwf	(___ftadd@f1+1),f
	movlw	0FFh
	xorwf	(___ftadd@f1+2),f
	line	132
	movlw	01h
	addwf	(___ftadd@f1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f1+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f1+2),f
	goto	l4303
	line	133
	
l1517:	
	line	134
	
l4303:	
	btfss	(___ftadd@sign),(6)&7
	goto	u4171
	goto	u4170
u4171:
	goto	l4307
u4170:
	line	136
	
l4305:	
	movlw	0FFh
	xorwf	(___ftadd@f2),f
	movlw	0FFh
	xorwf	(___ftadd@f2+1),f
	movlw	0FFh
	xorwf	(___ftadd@f2+2),f
	line	137
	movlw	01h
	addwf	(___ftadd@f2),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f2+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f2+2),f
	goto	l4307
	line	138
	
l1518:	
	line	139
	
l4307:	
	clrf	(___ftadd@sign)
	line	140
	movf	(___ftadd@f1),w
	addwf	(___ftadd@f2),f
	movf	(___ftadd@f1+1),w
	clrz
	skipnc
	incf	(___ftadd@f1+1),w
	skipnz
	goto	u4181
	addwf	(___ftadd@f2+1),f
u4181:
	movf	(___ftadd@f1+2),w
	clrz
	skipnc
	incf	(___ftadd@f1+2),w
	skipnz
	goto	u4182
	addwf	(___ftadd@f2+2),f
u4182:

	line	141
	
l4309:	
	btfss	(___ftadd@f2+2),(23)&7
	goto	u4191
	goto	u4190
u4191:
	goto	l4315
u4190:
	line	142
	
l4311:	
	movlw	0FFh
	xorwf	(___ftadd@f2),f
	movlw	0FFh
	xorwf	(___ftadd@f2+1),f
	movlw	0FFh
	xorwf	(___ftadd@f2+2),f
	line	143
	movlw	01h
	addwf	(___ftadd@f2),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f2+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f2+2),f
	line	144
	
l4313:	
	clrf	(___ftadd@sign)
	bsf	status,0
	rlf	(___ftadd@sign),f
	goto	l4315
	line	145
	
l1519:	
	line	146
	
l4315:	
	movf	(___ftadd@f2),w
	movwf	(?___ftpack)
	movf	(___ftadd@f2+1),w
	movwf	(?___ftpack+1)
	movf	(___ftadd@f2+2),w
	movwf	(?___ftpack+2)
	movf	(___ftadd@exp1),w
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftadd@sign),w
	movwf	(??___ftadd+1)+0
	movf	(??___ftadd+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftpack)),w
	movwf	(?___ftadd)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftadd+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftadd+2)
	goto	l1494
	
l4317:	
	line	148
	
l1494:	
	return
	opt stack 0
GLOBAL	__end_of___ftadd
	__end_of___ftadd:
;; =============== function ___ftadd ends ============

	signat	___ftadd,8315
	global	_ENABLE1
psect	text608,local,class=CODE,delta=2
global __ptext608
__ptext608:

;; *************** function _ENABLE1 *****************
;; Defined at:
;;		line 20 in file "G:\jy62\test.c"
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
psect	text608
	file	"G:\jy62\test.c"
	line	20
	global	__size_of_ENABLE1
	__size_of_ENABLE1	equ	__end_of_ENABLE1-_ENABLE1
	
_ENABLE1:	
	opt	stack 5
; Regs used in _ENABLE1: [wreg+status,2+status,0+pclath+cstack]
	
l4243:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	bcf	(44/8),(44)&7
	bcf	(43/8),(43)&7
	
l4245:	
	fcall	_DELAY
	
l4247:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	
l735:	
	return
	opt stack 0
GLOBAL	__end_of_ENABLE1
	__end_of_ENABLE1:
;; =============== function _ENABLE1 ends ============

	signat	_ENABLE1,88
	global	_ENABLE
psect	text609,local,class=CODE,delta=2
global __ptext609
__ptext609:

;; *************** function _ENABLE *****************
;; Defined at:
;;		line 18 in file "G:\jy62\test.c"
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
psect	text609
	file	"G:\jy62\test.c"
	line	18
	global	__size_of_ENABLE
	__size_of_ENABLE	equ	__end_of_ENABLE-_ENABLE
	
_ENABLE:	
	opt	stack 5
; Regs used in _ENABLE: [wreg+status,2+status,0+pclath+cstack]
	
l4237:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
	bcf	(44/8),(44)&7
	bcf	(43/8),(43)&7
	
l4239:	
	fcall	_DELAY
	
l4241:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	
l732:	
	return
	opt stack 0
GLOBAL	__end_of_ENABLE
	__end_of_ENABLE:
;; =============== function _ENABLE ends ============

	signat	_ENABLE,88
	global	___ftge
psect	text610,local,class=CODE,delta=2
global __ptext610
__ptext610:

;; *************** function ___ftge *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftge.c"
;; Parameters:    Size  Location     Type
;;  ff1             3    0[BANK0 ] float 
;;  ff2             3    3[BANK0 ] float 
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
;;      Params:         0       6       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       6       0       0       0
;;      Totals:         0      12       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_div
;; This function uses a non-reentrant model
;;
psect	text610
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftge.c"
	line	5
	global	__size_of___ftge
	__size_of___ftge	equ	__end_of___ftge-___ftge
	
___ftge:	
	opt	stack 5
; Regs used in ___ftge: [wreg+status,2+status,0]
	line	6
	
l4171:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(___ftge@ff1+2),(23)&7
	goto	u3851
	goto	u3850
u3851:
	goto	l4175
u3850:
	line	7
	
l4173:	
	movlw	0
	movwf	((??___ftge+0)+0)
	movlw	0
	movwf	((??___ftge+0)+0+1)
	movlw	080h
	movwf	((??___ftge+0)+0+2)
	comf	(___ftge@ff1),w
	movwf	(??___ftge+3)+0
	comf	(___ftge@ff1+1),w
	movwf	((??___ftge+3)+0+1)
	comf	(___ftge@ff1+2),w
	movwf	((??___ftge+3)+0+2)
	incf	(??___ftge+3)+0,f
	skipnz
	incf	((??___ftge+3)+0+1),f
	skipnz
	incf	((??___ftge+3)+0+2),f
	movf	0+(??___ftge+3)+0,w
	addwf	(??___ftge+0)+0,f
	movf	1+(??___ftge+3)+0,w
	skipnc
	incfsz	1+(??___ftge+3)+0,w
	goto	u3861
	goto	u3862
u3861:
	addwf	(??___ftge+0)+1,f
	
u3862:
	movf	2+(??___ftge+3)+0,w
	skipnc
	incfsz	2+(??___ftge+3)+0,w
	goto	u3863
	goto	u3864
u3863:
	addwf	(??___ftge+0)+2,f
	
u3864:
	movf	0+(??___ftge+0)+0,w
	movwf	(___ftge@ff1)
	movf	1+(??___ftge+0)+0,w
	movwf	(___ftge@ff1+1)
	movf	2+(??___ftge+0)+0,w
	movwf	(___ftge@ff1+2)
	goto	l4175
	
l1614:	
	line	8
	
l4175:	
	btfss	(___ftge@ff2+2),(23)&7
	goto	u3871
	goto	u3870
u3871:
	goto	l4179
u3870:
	line	9
	
l4177:	
	movlw	0
	movwf	((??___ftge+0)+0)
	movlw	0
	movwf	((??___ftge+0)+0+1)
	movlw	080h
	movwf	((??___ftge+0)+0+2)
	comf	(___ftge@ff2),w
	movwf	(??___ftge+3)+0
	comf	(___ftge@ff2+1),w
	movwf	((??___ftge+3)+0+1)
	comf	(___ftge@ff2+2),w
	movwf	((??___ftge+3)+0+2)
	incf	(??___ftge+3)+0,f
	skipnz
	incf	((??___ftge+3)+0+1),f
	skipnz
	incf	((??___ftge+3)+0+2),f
	movf	0+(??___ftge+3)+0,w
	addwf	(??___ftge+0)+0,f
	movf	1+(??___ftge+3)+0,w
	skipnc
	incfsz	1+(??___ftge+3)+0,w
	goto	u3881
	goto	u3882
u3881:
	addwf	(??___ftge+0)+1,f
	
u3882:
	movf	2+(??___ftge+3)+0,w
	skipnc
	incfsz	2+(??___ftge+3)+0,w
	goto	u3883
	goto	u3884
u3883:
	addwf	(??___ftge+0)+2,f
	
u3884:
	movf	0+(??___ftge+0)+0,w
	movwf	(___ftge@ff2)
	movf	1+(??___ftge+0)+0,w
	movwf	(___ftge@ff2+1)
	movf	2+(??___ftge+0)+0,w
	movwf	(___ftge@ff2+2)
	goto	l4179
	
l1615:	
	line	10
	
l4179:	
	movlw	080h
	xorwf	(___ftge@ff1+2),f
	line	11
	
l4181:	
	movlw	080h
	xorwf	(___ftge@ff2+2),f
	line	12
	
l4183:	
	movf	(___ftge@ff2+2),w
	subwf	(___ftge@ff1+2),w
	skipz
	goto	u3895
	movf	(___ftge@ff2+1),w
	subwf	(___ftge@ff1+1),w
	skipz
	goto	u3895
	movf	(___ftge@ff2),w
	subwf	(___ftge@ff1),w
u3895:
	skipnc
	goto	u3891
	goto	u3890
u3891:
	goto	l4187
u3890:
	
l4185:	
	clrc
	
	goto	l1616
	
l4005:	
	
l4187:	
	setc
	
	goto	l1616
	
l4007:	
	goto	l1616
	
l4189:	
	line	13
	
l1616:	
	return
	opt stack 0
GLOBAL	__end_of___ftge
	__end_of___ftge:
;; =============== function ___ftge ends ============

	signat	___ftge,8312
	global	___ftneg
psect	text611,local,class=CODE,delta=2
global __ptext611
__ptext611:

;; *************** function ___ftneg *****************
;; Defined at:
;;		line 16 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftneg.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    8[BANK0 ] float 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_div
;; This function uses a non-reentrant model
;;
psect	text611
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftneg.c"
	line	16
	global	__size_of___ftneg
	__size_of___ftneg	equ	__end_of___ftneg-___ftneg
	
___ftneg:	
	opt	stack 5
; Regs used in ___ftneg: [wreg]
	line	17
	
l4163:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftneg@f1+2),w
	iorwf	(___ftneg@f1+1),w
	iorwf	(___ftneg@f1),w
	skipnz
	goto	u3841
	goto	u3840
u3841:
	goto	l4167
u3840:
	line	18
	
l4165:	
	movlw	080h
	xorwf	(___ftneg@f1+2),f
	goto	l4167
	
l1610:	
	line	19
	
l4167:	
	goto	l1611
	
l4169:	
	line	20
	
l1611:	
	return
	opt stack 0
GLOBAL	__end_of___ftneg
	__end_of___ftneg:
;; =============== function ___ftneg ends ============

	signat	___ftneg,4219
	global	___awdiv
psect	text612,local,class=CODE,delta=2
global __ptext612
__ptext612:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] int 
;;  dividend        2    2[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    7[BANK0 ] int 
;;  sign            1    6[BANK0 ] unsigned char 
;;  counter         1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_div
;; This function uses a non-reentrant model
;;
psect	text612
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 5
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l4123:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u3741
	goto	u3740
u3741:
	goto	l4127
u3740:
	line	11
	
l4125:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l4127
	line	13
	
l1587:	
	line	14
	
l4127:	
	btfss	(___awdiv@dividend+1),7
	goto	u3751
	goto	u3750
u3751:
	goto	l4133
u3750:
	line	15
	
l4129:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l4131:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l4133
	line	17
	
l1588:	
	line	18
	
l4133:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l4135:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u3761
	goto	u3760
u3761:
	goto	l4155
u3760:
	line	20
	
l4137:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l4143
	
l1591:	
	line	22
	
l4139:	
	movlw	01h
	
u3775:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u3775
	line	23
	
l4141:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l4143
	line	24
	
l1590:	
	line	21
	
l4143:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u3781
	goto	u3780
u3781:
	goto	l4139
u3780:
	goto	l4145
	
l1592:	
	goto	l4145
	line	25
	
l1593:	
	line	26
	
l4145:	
	movlw	01h
	
u3795:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u3795
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u3805
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u3805:
	skipc
	goto	u3801
	goto	u3800
u3801:
	goto	l4151
u3800:
	line	28
	
l4147:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l4149:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l4151
	line	30
	
l1594:	
	line	31
	
l4151:	
	movlw	01h
	
u3815:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u3815
	line	32
	
l4153:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u3821
	goto	u3820
u3821:
	goto	l4145
u3820:
	goto	l4155
	
l1595:	
	goto	l4155
	line	33
	
l1589:	
	line	34
	
l4155:	
	movf	(___awdiv@sign),w
	skipz
	goto	u3830
	goto	l4159
u3830:
	line	35
	
l4157:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l4159
	
l1596:	
	line	36
	
l4159:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l1597
	
l4161:	
	line	37
	
l1597:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___fttol
psect	text613,local,class=CODE,delta=2
global __ptext613
__ptext613:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3   11[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  lval            4   20[BANK0 ] unsigned long 
;;  exp1            1   24[BANK0 ] unsigned char 
;;  sign1           1   19[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4   11[BANK0 ] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      14       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_div
;; This function uses a non-reentrant model
;;
psect	text613
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 5
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l4067:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	clrc
	rlf	(??___fttol+0)+1,w
	rlf	(??___fttol+0)+2,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@exp1)
	movf	((___fttol@exp1)),f
	skipz
	goto	u3631
	goto	u3630
u3631:
	goto	l4073
u3630:
	line	50
	
l4069:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l1557
	
l4071:	
	goto	l1557
	
l1556:	
	line	51
	
l4073:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u3645:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u3640:
	addlw	-1
	skipz
	goto	u3645
	movf	0+(??___fttol+0)+0,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l4075:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l4077:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l4079:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l4081:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l4083:	
	btfss	(___fttol@exp1),7
	goto	u3651
	goto	u3650
u3651:
	goto	l4093
u3650:
	line	57
	
l4085:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u3661
	goto	u3660
u3661:
	goto	l4091
u3660:
	line	58
	
l4087:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l1557
	
l4089:	
	goto	l1557
	
l1559:	
	goto	l4091
	line	59
	
l1560:	
	line	60
	
l4091:	
	movlw	01h
u3675:
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	addlw	-1
	skipz
	goto	u3675

	line	61
	movlw	(01h)
	movwf	(??___fttol+0)+0
	movf	(??___fttol+0)+0,w
	addwf	(___fttol@exp1),f
	btfss	status,2
	goto	u3681
	goto	u3680
u3681:
	goto	l4091
u3680:
	goto	l4103
	
l1561:	
	line	62
	goto	l4103
	
l1558:	
	line	63
	
l4093:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u3691
	goto	u3690
u3691:
	goto	l4101
u3690:
	line	64
	
l4095:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l1557
	
l4097:	
	goto	l1557
	
l1563:	
	line	65
	goto	l4101
	
l1565:	
	line	66
	
l4099:	
	movlw	01h
	movwf	(??___fttol+0)+0
u3705:
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	decfsz	(??___fttol+0)+0
	goto	u3705
	line	67
	movlw	low(01h)
	subwf	(___fttol@exp1),f
	goto	l4101
	line	68
	
l1564:	
	line	65
	
l4101:	
	movf	(___fttol@exp1),f
	skipz
	goto	u3711
	goto	u3710
u3711:
	goto	l4099
u3710:
	goto	l4103
	
l1566:	
	goto	l4103
	line	69
	
l1562:	
	line	70
	
l4103:	
	movf	(___fttol@sign1),w
	skipz
	goto	u3720
	goto	l4107
u3720:
	line	71
	
l4105:	
	comf	(___fttol@lval),f
	comf	(___fttol@lval+1),f
	comf	(___fttol@lval+2),f
	comf	(___fttol@lval+3),f
	incf	(___fttol@lval),f
	skipnz
	incf	(___fttol@lval+1),f
	skipnz
	incf	(___fttol@lval+2),f
	skipnz
	incf	(___fttol@lval+3),f
	goto	l4107
	
l1567:	
	line	72
	
l4107:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	goto	l1557
	
l4109:	
	line	73
	
l1557:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text614,local,class=CODE,delta=2
global __ptext614
__ptext614:

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 63 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3    0[BANK0 ] unsigned um
;;  exp             1    3[BANK0 ] unsigned char 
;;  sign            1    4[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       5       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftadd
;;		___ftdiv
;;		___ftmul
;;		___awtoft
;;		___lbtoft
;;		___abtoft
;;		___lwtoft
;;		___altoft
;;		___lltoft
;;		___attoft
;;		___lttoft
;; This function uses a non-reentrant model
;;
psect	text614
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 4
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l4031:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftpack@exp),w
	skipz
	goto	u3520
	goto	l4035
u3520:
	
l4033:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u3531
	goto	u3530
u3531:
	goto	l4041
u3530:
	goto	l4035
	
l1781:	
	line	65
	
l4035:	
	movlw	0x0
	movwf	(?___ftpack)
	movlw	0x0
	movwf	(?___ftpack+1)
	movlw	0x0
	movwf	(?___ftpack+2)
	goto	l1782
	
l4037:	
	goto	l1782
	
l1779:	
	line	66
	goto	l4041
	
l1784:	
	line	67
	
l4039:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	68
	movlw	01h
u3545:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u3545

	goto	l4041
	line	69
	
l1783:	
	line	66
	
l4041:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u3551
	goto	u3550
u3551:
	goto	l4039
u3550:
	goto	l1786
	
l1785:	
	line	70
	goto	l1786
	
l1787:	
	line	71
	
l4043:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	72
	
l4045:	
	movlw	01h
	addwf	(___ftpack@arg),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+2),f
	line	73
	
l4047:	
	movlw	01h
u3565:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u3565

	line	74
	
l1786:	
	line	70
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u3571
	goto	u3570
u3571:
	goto	l4043
u3570:
	goto	l4051
	
l1788:	
	line	75
	goto	l4051
	
l1790:	
	line	76
	
l4049:	
	movlw	low(01h)
	subwf	(___ftpack@exp),f
	line	77
	movlw	01h
u3585:
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	addlw	-1
	skipz
	goto	u3585
	goto	l4051
	line	78
	
l1789:	
	line	75
	
l4051:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u3591
	goto	u3590
u3591:
	goto	l4049
u3590:
	
l1791:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u3601
	goto	u3600
u3601:
	goto	l1792
u3600:
	line	80
	
l4053:	
	movlw	0FFh
	andwf	(___ftpack@arg),f
	movlw	07Fh
	andwf	(___ftpack@arg+1),f
	movlw	0FFh
	andwf	(___ftpack@arg+2),f
	
l1792:	
	line	81
	clrc
	rrf	(___ftpack@exp),f

	line	82
	
l4055:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+2)
	movlw	010h
u3615:
	clrc
	rlf	(??___ftpack+0)+0,f
	rlf	(??___ftpack+0)+1,f
	rlf	(??___ftpack+0)+2,f
u3610:
	addlw	-1
	skipz
	goto	u3615
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l4057:	
	movf	(___ftpack@sign),w
	skipz
	goto	u3620
	goto	l1793
u3620:
	line	84
	
l4059:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l1793:	
	line	85
	line	86
	
l1782:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	___wmul
psect	text615,local,class=CODE,delta=2
global __ptext615
__ptext615:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[BANK0 ] unsigned int 
;;  multiplicand    2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_div
;; This function uses a non-reentrant model
;;
psect	text615
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 5
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l4019:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l4021
	line	6
	
l1447:	
	line	7
	
l4021:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u3481
	goto	u3480
u3481:
	goto	l1448
u3480:
	line	8
	
l4023:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l1448:	
	line	9
	movlw	01h
	
u3495:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u3495
	line	10
	
l4025:	
	movlw	01h
	
u3505:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u3505
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u3511
	goto	u3510
u3511:
	goto	l4021
u3510:
	goto	l4027
	
l1449:	
	line	12
	
l4027:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l1450
	
l4029:	
	line	13
	
l1450:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_DELAY
psect	text616,local,class=CODE,delta=2
global __ptext616
__ptext616:

;; *************** function _DELAY *****************
;; Defined at:
;;		line 16 in file "G:\jy62\test.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text616
	file	"G:\jy62\test.c"
	line	16
	global	__size_of_DELAY
	__size_of_DELAY	equ	__end_of_DELAY-_DELAY
	
_DELAY:	
	opt	stack 5
; Regs used in _DELAY: [wreg+status,2+status,0]
	
l4009:	
	movlw	low(03E7h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(DELAY@i)
	movlw	high(03E7h)
	movwf	((DELAY@i))+1
	
l4011:	
	movf	((DELAY@i+1)),w
	iorwf	((DELAY@i)),w
	skipz
	goto	u3461
	goto	u3460
u3461:
	goto	l4015
u3460:
	goto	l729
	
l4013:	
	goto	l729
	
l727:	
	
l4015:	
	movlw	low(01h)
	subwf	(DELAY@i),f
	movlw	high(01h)
	skipc
	decf	(DELAY@i+1),f
	subwf	(DELAY@i+1),f
	
l4017:	
	movf	((DELAY@i+1)),w
	iorwf	((DELAY@i)),w
	skipz
	goto	u3471
	goto	u3470
u3471:
	goto	l4015
u3470:
	goto	l729
	
l728:	
	
l729:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY
	__end_of_DELAY:
;; =============== function _DELAY ends ============

	signat	_DELAY,88
	global	_usart_seve
psect	text617,local,class=CODE,delta=2
global __ptext617
__ptext617:

;; *************** function _usart_seve *****************
;; Defined at:
;;		line 36 in file "G:\jy62\test.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
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
psect	text617
	file	"G:\jy62\test.c"
	line	36
	global	__size_of_usart_seve
	__size_of_usart_seve	equ	__end_of_usart_seve-_usart_seve
	
_usart_seve:	
	opt	stack 4
; Regs used in _usart_seve: [wreg-fsr0h+status,2+status,0+btemp+1]
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
psect	text617
	line	38
	
i1l3317:	
;test.c: 38: data[n]=RCREG;
	movf	(26),w	;volatile
	movwf	(??_usart_seve+0)+0
	movf	(_n),w
	addlw	_data&0ffh
	movwf	fsr0
	movf	(??_usart_seve+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	line	39
	
i1l3319:	
;test.c: 39: if(data[0]!=0x55)n=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_data)^080h,w
	xorlw	055h
	skipnz
	goto	u239_21
	goto	u239_20
u239_21:
	goto	i1l3323
u239_20:
	
i1l3321:	
	clrf	(_n)
	clrf	(_n+1)
	goto	i1l3323
	
i1l743:	
	line	40
	
i1l3323:	
;test.c: 40: TXREG=useful[n];
	movf	(_n),w
	addlw	_useful&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(25)	;volatile
	line	41
;test.c: 41: while(!TRMT);
	goto	i1l744
	
i1l745:	
	
i1l744:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1217/8)^080h,(1217)&7
	goto	u240_21
	goto	u240_20
u240_21:
	goto	i1l744
u240_20:
	goto	i1l3325
	
i1l746:	
	line	42
	
i1l3325:	
;test.c: 42: if(data[0]==0x55)n++;
	movf	(_data)^080h,w
	xorlw	055h
	skipz
	goto	u241_21
	goto	u241_20
u241_21:
	goto	i1l3329
u241_20:
	
i1l3327:	
	movlw	low(01h)
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	goto	i1l3329
	
i1l747:	
	line	43
	
i1l3329:	
;test.c: 43: if(n>=11)n=0;
	movf	(_n+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Bh))^80h
	subwf	btemp+1,w
	skipz
	goto	u242_25
	movlw	low(0Bh)
	subwf	(_n),w
u242_25:

	skipc
	goto	u242_21
	goto	u242_20
u242_21:
	goto	i1l749
u242_20:
	
i1l3331:	
	clrf	(_n)
	clrf	(_n+1)
	goto	i1l749
	
i1l748:	
	line	45
	
i1l749:	
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
psect	text618,local,class=CODE,delta=2
global __ptext618
__ptext618:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
