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
# 2 "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
	psect config,class=CONFIG,delta=2 ;#
# 2 "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
	dw 0xFF29 ;#
# 3 "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
	psect eeprom_data,class=EEDATA,delta=2,space=2 ;#
# 3 "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
	db	0xB0,0x27,9,0,0,0,0,0 ;#
	FNCALL	_main,_DELAY
	FNCALL	_main,_ENABLE
	FNCALL	_main,_eeprom_read
	FNCALL	_main,_div
	FNCALL	_main,_ENABLE1
	FNCALL	_main,_eeprom_write
	FNCALL	_main,_speed_calculate
	FNCALL	_speed_calculate,___awdiv
	FNCALL	_speed_calculate,___bmul
	FNCALL	_div,___lldiv
	FNCALL	_div,___lmul
	FNCALL	_div,___aldiv
	FNCALL	_div,___wmul
	FNCALL	_div,___awdiv
	FNCALL	_div,___bmul
	FNCALL	_ENABLE1,_DELAY
	FNCALL	_ENABLE,_DELAY
	FNROOT	_main
	FNCALL	intlevel1,_int_serve
	global	intlevel1
	FNROOT	intlevel1
	global	_table
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
	line	6

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
	global	_li_cheng
	global	_count_temp
	global	_n
	global	_b
	global	_c
	global	_d1
	global	_e
	global	_e1
	global	_f
	global	_f1
	global	_m
	global	_tmr01
	global	_tmr02
	global	_t_speed
	global	_a
	global	_d
	global	_speed
	global	_PORTD
_PORTD	set	8
	global	_TMR0
_TMR0	set	1
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_INTE
_INTE	set	92
	global	_INTF
_INTF	set	89
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
	global	_RE0
_RE0	set	72
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_TRISA
_TRISA	set	133
	global	_TRISD
_TRISD	set	136
	global	_TRISA0
_TRISA0	set	1064
	global	_TRISB0
_TRISB0	set	1072
	global	_TRISE0
_TRISE0	set	1096
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
	file	"sy4.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_tmr01:
       ds      1

_tmr02:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_li_cheng:
       ds      4

_count_temp:
       ds      2

_n:
       ds      2

_b:
       ds      1

_c:
       ds      1

_d1:
       ds      1

_e:
       ds      1

_e1:
       ds      1

_f:
       ds      1

_f1:
       ds      1

_m:
       ds      1

_t_speed:
       ds      2

_a:
       ds      1

_d:
       ds      1

_speed:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
_table:
       ds      10

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
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+015h)
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
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	movlw low(__pdataBANK0+10)
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
	global	?_div
?_div:	; 0 bytes @ 0x0
	global	?_speed_calculate
?_speed_calculate:	; 0 bytes @ 0x0
	global	?_int_serve
?_int_serve:	; 0 bytes @ 0x0
	global	??_int_serve
??_int_serve:	; 0 bytes @ 0x0
	global	?_eeprom_read
?_eeprom_read:	; 1 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	ds	10
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_eeprom_read
??_eeprom_read:	; 0 bytes @ 0x0
	global	??_DELAY
??_DELAY:	; 0 bytes @ 0x0
	global	?_eeprom_write
?_eeprom_write:	; 1 bytes @ 0x0
	global	?___bmul
?___bmul:	; 1 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0x0
	global	?___aldiv
?___aldiv:	; 4 bytes @ 0x0
	global	eeprom_write@value
eeprom_write@value:	; 1 bytes @ 0x0
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x0
	global	DELAY@i
DELAY@i:	; 2 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x0
	global	___aldiv@divisor
___aldiv@divisor:	; 4 bytes @ 0x0
	ds	1
	global	??_eeprom_write
??_eeprom_write:	; 0 bytes @ 0x1
	global	??___bmul
??___bmul:	; 0 bytes @ 0x1
	global	eeprom_read@addr
eeprom_read@addr:	; 1 bytes @ 0x1
	ds	1
	global	??_ENABLE
??_ENABLE:	; 0 bytes @ 0x2
	global	??_ENABLE1
??_ENABLE1:	; 0 bytes @ 0x2
	global	eeprom_write@addr
eeprom_write@addr:	; 1 bytes @ 0x2
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	ds	1
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x3
	ds	1
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x4
	global	___aldiv@dividend
___aldiv@dividend:	; 4 bytes @ 0x4
	ds	1
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	1
	global	??___lmul
??___lmul:	; 0 bytes @ 0x8
	global	??___lldiv
??___lldiv:	; 0 bytes @ 0x8
	global	??___aldiv
??___aldiv:	; 0 bytes @ 0x8
	ds	1
	global	??_speed_calculate
??_speed_calculate:	; 0 bytes @ 0x9
	global	___aldiv@counter
___aldiv@counter:	; 1 bytes @ 0x9
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x9
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x9
	ds	1
	global	___aldiv@sign
___aldiv@sign:	; 1 bytes @ 0xA
	ds	1
	global	___aldiv@quotient
___aldiv@quotient:	; 4 bytes @ 0xB
	ds	1
	global	speed_calculate@z
speed_calculate@z:	; 1 bytes @ 0xC
	ds	1
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0xD
	ds	2
	global	??_div
??_div:	; 0 bytes @ 0xF
	ds	12
	global	div@x
div@x:	; 4 bytes @ 0x1B
	ds	4
	global	div@z
div@z:	; 1 bytes @ 0x1F
	ds	1
	global	div@y
div@y:	; 2 bytes @ 0x20
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x22
	ds	1
;;Data sizes: Strings 0, constant 0, data 10, bss 23, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      12
;; BANK0           80     35      66
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?___aldiv	long  size(1) Largest target is 0
;;
;; ?___lmul	unsigned long  size(1) Largest target is 0
;;
;; ?___lldiv	unsigned long  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _int_serve in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_div
;;   _speed_calculate->___awdiv
;;   _div->___aldiv
;;   _ENABLE1->_DELAY
;;   _ENABLE->_DELAY
;;
;; Critical Paths under _int_serve in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _int_serve in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _int_serve in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _int_serve in BANK2
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
;; (0) _main                                                 1     1      0    1865
;;                                             34 BANK0      1     1      0
;;                              _DELAY
;;                             _ENABLE
;;                        _eeprom_read
;;                                _div
;;                            _ENABLE1
;;                       _eeprom_write
;;                    _speed_calculate
;; ---------------------------------------------------------------------------------
;; (1) _speed_calculate                                      4     4      0     437
;;                                              9 BANK0      4     4      0
;;                            ___awdiv
;;                             ___bmul
;; ---------------------------------------------------------------------------------
;; (1) _div                                                 19    19      0    1218
;;                                             15 BANK0     19    19      0
;;                            ___lldiv
;;                             ___lmul
;;                            ___aldiv
;;                             ___wmul
;;                            ___awdiv
;;                             ___bmul
;; ---------------------------------------------------------------------------------
;; (1) _ENABLE1                                              0     0      0      46
;;                              _DELAY
;; ---------------------------------------------------------------------------------
;; (1) _ENABLE                                               0     0      0      46
;;                              _DELAY
;; ---------------------------------------------------------------------------------
;; (2) ___aldiv                                             15     7      8     300
;;                                              0 BANK0     15     7      8
;; ---------------------------------------------------------------------------------
;; (2) ___lldiv                                             14     6      8     162
;;                                              0 BANK0     14     6      8
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              0 BANK0      9     5      4
;; ---------------------------------------------------------------------------------
;; (2) ___lmul                                              13     5      8      92
;;                                              0 BANK0     13     5      8
;; ---------------------------------------------------------------------------------
;; (2) ___wmul                                               6     2      4      92
;;                                              0 BANK0      6     2      4
;; ---------------------------------------------------------------------------------
;; (2) ___bmul                                               4     3      1      92
;;                                              0 BANK0      4     3      1
;; ---------------------------------------------------------------------------------
;; (1) _eeprom_write                                         3     2      1      50
;;                                              0 BANK0      3     2      1
;; ---------------------------------------------------------------------------------
;; (1) _eeprom_read                                          2     2      0      22
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _DELAY                                                2     2      0      46
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _int_serve                                           10    10      0       0
;;                                              0 COMMON    10    10      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DELAY
;;   _ENABLE
;;     _DELAY
;;   _eeprom_read
;;   _div
;;     ___lldiv
;;     ___lmul
;;     ___aldiv
;;     ___wmul
;;     ___awdiv
;;     ___bmul
;;   _ENABLE1
;;     _DELAY
;;   _eeprom_write
;;   _speed_calculate
;;     ___awdiv
;;     ___bmul
;;
;; _int_serve (ROOT)
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
;;DATA                 0      0      50      12        0.0%
;;ABS                  0      0      4E       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       2       2        0.0%
;;BANK0               50     23      42       5       82.5%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      A       C       1       85.7%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 58 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2  750[COMMON] int 
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
;;		_DELAY
;;		_ENABLE
;;		_eeprom_read
;;		_div
;;		_ENABLE1
;;		_eeprom_write
;;		_speed_calculate
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
	line	58
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	
l4586:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	clrf	(133)^080h	;volatile
	line	59
	
l4588:	
;Untitled.c: 59: DELAY();
	fcall	_DELAY
	line	60
	
l4590:	
;Untitled.c: 60: PORTD=1;ENABLE();
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4592:	
	fcall	_ENABLE
	line	61
	
l4594:	
;Untitled.c: 61: PORTD=0x38;ENABLE();
	movlw	(038h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4596:	
	fcall	_ENABLE
	line	62
	
l4598:	
;Untitled.c: 62: PORTD=0x0C;ENABLE();
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4600:	
	fcall	_ENABLE
	line	63
	
l4602:	
;Untitled.c: 63: PORTD=0x06; ENABLE();
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4604:	
	fcall	_ENABLE
	line	64
	
l4606:	
;Untitled.c: 64: li_cheng.da_ta[0]=eeprom_read(0x00);
	movlw	(0)
	fcall	_eeprom_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_li_cheng)
	line	65
	
l4608:	
;Untitled.c: 65: li_cheng.da_ta [1]=eeprom_read(0x01);
	movlw	(01h)
	fcall	_eeprom_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(_li_cheng)+01h
	line	66
	
l4610:	
;Untitled.c: 66: li_cheng.da_ta [2]=eeprom_read (0x02);
	movlw	(02h)
	fcall	_eeprom_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(_li_cheng)+02h
	line	67
	
l4612:	
;Untitled.c: 67: m=250;n =0;
	movlw	(0FAh)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_m)
	
l4614:	
	clrf	(_n)
	clrf	(_n+1)
	line	68
	
l4616:	
;Untitled.c: 68: TRISB0=1;count_temp=0;TRISA0=0;RE0=0;TRISE0=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1072/8)^080h,(1072)&7
	
l4618:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_count_temp)
	clrf	(_count_temp+1)
	
l4620:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1064/8)^080h,(1064)&7
	
l4622:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(72/8),(72)&7
	
l4624:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1096/8)^080h,(1096)&7
	line	69
	
l4626:	
;Untitled.c: 69: OPTION_REG =0B01000111;T0IF=0; TMR0=0;
	movlw	(047h)
	movwf	(129)^080h	;volatile
	
l4628:	
	bcf	(90/8),(90)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(1)	;volatile
	line	70
	
l4630:	
;Untitled.c: 70: GIE =1;INTE =1;INTF =0;
	bsf	(95/8),(95)&7
	
l4632:	
	bsf	(92/8),(92)&7
	
l4634:	
	bcf	(89/8),(89)&7
	goto	l4636
	line	71
;Untitled.c: 71: while (1)
	
l751:	
	line	73
	
l4636:	
;Untitled.c: 72: {
;Untitled.c: 73: div ();
	fcall	_div
	line	74
	
l4638:	
;Untitled.c: 74: PORTD=0x80; ENABLE();
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4640:	
	fcall	_ENABLE
	line	75
	
l4642:	
;Untitled.c: 75: PORTD=table[a];ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_a),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	
l4644:	
	fcall	_ENABLE1
	line	76
	
l4646:	
;Untitled.c: 76: PORTD=table[b];ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_b),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	
l4648:	
	fcall	_ENABLE1
	line	77
	
l4650:	
;Untitled.c: 77: PORTD=table[c];ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_c),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	
l4652:	
	fcall	_ENABLE1
	line	78
	
l4654:	
;Untitled.c: 78: PORTD=table[d];ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_d),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	
l4656:	
	fcall	_ENABLE1
	line	79
	
l4658:	
;Untitled.c: 79: PORTD=table[e];ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_e),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	
l4660:	
	fcall	_ENABLE1
	line	80
	
l4662:	
;Untitled.c: 80: PORTD=table[f];ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_f),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	
l4664:	
	fcall	_ENABLE1
	line	81
	
l4666:	
;Untitled.c: 81: eeprom_write(0x02,li_cheng.da_ta [2]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_li_cheng)+02h,w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_eeprom_write)
	movlw	(02h)
	fcall	_eeprom_write
	line	82
	
l4668:	
;Untitled.c: 82: eeprom_write(0x01,li_cheng.da_ta [1]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_li_cheng)+01h,w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_eeprom_write)
	movlw	(01h)
	fcall	_eeprom_write
	line	83
	
l4670:	
;Untitled.c: 83: eeprom_write(0x00,li_cheng.da_ta [0]);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_li_cheng),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_eeprom_write)
	movlw	(0)
	fcall	_eeprom_write
	line	84
	
l4672:	
;Untitled.c: 84: speed_calculate();
	fcall	_speed_calculate
	line	85
	
l4674:	
;Untitled.c: 85: PORTD=0xc0; ENABLE();
	movlw	(0C0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	
l4676:	
	fcall	_ENABLE
	line	86
	
l4678:	
;Untitled.c: 86: PORTD=table[d1];ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_d1),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	
l4680:	
	fcall	_ENABLE1
	line	87
	
l4682:	
;Untitled.c: 87: PORTD=table[e1];ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_e1),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	
l4684:	
	fcall	_ENABLE1
	line	88
	
l4686:	
;Untitled.c: 88: PORTD=table[f1];ENABLE1();
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_f1),w
	addlw	_table&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(8)	;volatile
	
l4688:	
	fcall	_ENABLE1
	goto	l4636
	line	89
	
l752:	
	line	71
	goto	l4636
	
l753:	
	line	90
	
l754:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_speed_calculate
psect	text341,local,class=CODE,delta=2
global __ptext341
__ptext341:

;; *************** function _speed_calculate *****************
;; Defined at:
;;		line 34 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  z               1   12[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___awdiv
;;		___bmul
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text341
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
	line	34
	global	__size_of_speed_calculate
	__size_of_speed_calculate	equ	__end_of_speed_calculate-_speed_calculate
	
_speed_calculate:	
	opt	stack 5
; Regs used in _speed_calculate: [wreg+status,2+status,0+pclath+cstack]
	line	35
	
l4584:	
;Untitled.c: 35: speed=18998/t_speed;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_t_speed+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(_t_speed),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	movlw	low(04A36h)
	movwf	0+(?___awdiv)+02h
	movlw	high(04A36h)
	movwf	(0+(?___awdiv)+02h)+1
	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	movwf	(??_speed_calculate+0)+0
	movf	(??_speed_calculate+0)+0,w
	movwf	(_speed)
	line	36
;Untitled.c: 36: d1=speed/100;z=speed-d1*100;
	movlw	low(064h)
	movwf	(?___awdiv)
	movlw	high(064h)
	movwf	((?___awdiv))+1
	movf	(_speed),w
	movwf	(??_speed_calculate+0)+0
	clrf	(??_speed_calculate+0)+0+1
	movf	0+(??_speed_calculate+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_speed_calculate+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	movwf	(??_speed_calculate+2)+0
	movf	(??_speed_calculate+2)+0,w
	movwf	(_d1)
	movlw	(064h)
	movwf	(??_speed_calculate+0)+0
	movf	(??_speed_calculate+0)+0,w
	movwf	(?___bmul)
	movf	(_d1),w
	fcall	___bmul
	xorlw	0ffh
	addlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(_speed),w
	movwf	(??_speed_calculate+1)+0
	movf	(??_speed_calculate+1)+0,w
	movwf	(speed_calculate@z)
	line	37
;Untitled.c: 37: e1=z/10;f1=z-e1*10;
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(speed_calculate@z),w
	movwf	(??_speed_calculate+0)+0
	clrf	(??_speed_calculate+0)+0+1
	movf	0+(??_speed_calculate+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_speed_calculate+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	movwf	(??_speed_calculate+2)+0
	movf	(??_speed_calculate+2)+0,w
	movwf	(_e1)
	movlw	(0Ah)
	movwf	(??_speed_calculate+0)+0
	movf	(??_speed_calculate+0)+0,w
	movwf	(?___bmul)
	movf	(_e1),w
	fcall	___bmul
	xorlw	0ffh
	addlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(speed_calculate@z),w
	movwf	(??_speed_calculate+1)+0
	movf	(??_speed_calculate+1)+0,w
	movwf	(_f1)
	line	38
	
l739:	
	return
	opt stack 0
GLOBAL	__end_of_speed_calculate
	__end_of_speed_calculate:
;; =============== function _speed_calculate ends ============

	signat	_speed_calculate,88
	global	_div
psect	text342,local,class=CODE,delta=2
global __ptext342
__ptext342:

;; *************** function _div *****************
;; Defined at:
;;		line 24 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  x               4   27[BANK0 ] long 
;;  y               2   32[BANK0 ] int 
;;  z               1   31[BANK0 ] unsigned char 
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
;;      Locals:         0       7       0       0       0
;;      Temps:          0      12       0       0       0
;;      Totals:         0      19       0       0       0
;;Total ram usage:       19 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___lldiv
;;		___lmul
;;		___aldiv
;;		___wmul
;;		___awdiv
;;		___bmul
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text342
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
	line	24
	global	__size_of_div
	__size_of_div	equ	__end_of_div-_div
	
_div:	
	opt	stack 5
; Regs used in _div: [wreg+status,2+status,0+pclath+cstack]
	line	25
	
l4582:	
;Untitled.c: 25: a=li_cheng.count/100000;x=li_cheng.count-a*100000;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lldiv+3)
	movlw	01h
	movwf	(?___lldiv+2)
	movlw	086h
	movwf	(?___lldiv+1)
	movlw	0A0h
	movwf	(?___lldiv)

	movf	(_li_cheng+3),w
	movwf	3+(?___lldiv)+04h
	movf	(_li_cheng+2),w
	movwf	2+(?___lldiv)+04h
	movf	(_li_cheng+1),w
	movwf	1+(?___lldiv)+04h
	movf	(_li_cheng),w
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___lldiv)))),w
	movwf	(??_div+0)+0
	movf	(??_div+0)+0,w
	movwf	(_a)
	movf	(_li_cheng),w
	movwf	(??_div+0)+0
	movf	(_li_cheng+1),w
	movwf	((??_div+0)+0+1)
	movf	(_li_cheng+2),w
	movwf	((??_div+0)+0+2)
	movf	(_li_cheng+3),w
	movwf	((??_div+0)+0+3)
	movf	(_a),w
	movwf	(??_div+4)+0
	clrf	((??_div+4)+0+1)
	clrf	((??_div+4)+0+2)
	clrf	((??_div+4)+0+3)
	movf	3+(??_div+4)+0,w
	movwf	(?___lmul+3)
	movf	2+(??_div+4)+0,w
	movwf	(?___lmul+2)
	movf	1+(??_div+4)+0,w
	movwf	(?___lmul+1)
	movf	0+(??_div+4)+0,w
	movwf	(?___lmul)

	movlw	0
	movwf	3+(?___lmul)+04h
	movlw	01h
	movwf	2+(?___lmul)+04h
	movlw	086h
	movwf	1+(?___lmul)+04h
	movlw	0A0h
	movwf	0+(?___lmul)+04h

	fcall	___lmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	comf	(0+(?___lmul)),w
	movwf	(??_div+8)+0
	comf	(1+(?___lmul)),w
	movwf	((??_div+8)+0+1)
	comf	(2+(?___lmul)),w
	movwf	((??_div+8)+0+2)
	comf	(3+(?___lmul)),w
	movwf	((??_div+8)+0+3)
	incf	(??_div+8)+0,f
	skipnz
	incf	((??_div+8)+0+1),f
	skipnz
	incf	((??_div+8)+0+2),f
	skipnz
	incf	((??_div+8)+0+3),f
	movf	0+(??_div+8)+0,w
	addwf	(??_div+0)+0,f
	movf	1+(??_div+8)+0,w
	skipnc
	incfsz	1+(??_div+8)+0,w
	goto	u2830
	goto	u2831
u2830:
	addwf	(??_div+0)+1,f
u2831:
	movf	2+(??_div+8)+0,w
	skipnc
	incfsz	2+(??_div+8)+0,w
	goto	u2832
	goto	u2833
u2832:
	addwf	(??_div+0)+2,f
u2833:
	movf	3+(??_div+8)+0,w
	skipnc
	incf	3+(??_div+8)+0,w
	addwf	(??_div+0)+3,f
	movf	3+(??_div+0)+0,w
	movwf	(div@x+3)
	movf	2+(??_div+0)+0,w
	movwf	(div@x+2)
	movf	1+(??_div+0)+0,w
	movwf	(div@x+1)
	movf	0+(??_div+0)+0,w
	movwf	(div@x)

	line	26
;Untitled.c: 26: b=x/10000;y=x-b*10000;
	movlw	0
	movwf	(?___aldiv+3)
	movlw	0
	movwf	(?___aldiv+2)
	movlw	027h
	movwf	(?___aldiv+1)
	movlw	010h
	movwf	(?___aldiv)

	movf	(div@x+3),w
	movwf	3+(?___aldiv)+04h
	movf	(div@x+2),w
	movwf	2+(?___aldiv)+04h
	movf	(div@x+1),w
	movwf	1+(?___aldiv)+04h
	movf	(div@x),w
	movwf	0+(?___aldiv)+04h

	fcall	___aldiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___aldiv)))),w
	movwf	(??_div+0)+0
	movf	(??_div+0)+0,w
	movwf	(_b)
	movf	(_b),w
	movwf	(??_div+0)+0
	clrf	(??_div+0)+0+1
	movf	0+(??_div+0)+0,w
	movwf	(?___wmul)
	movf	1+(??_div+0)+0,w
	movwf	(?___wmul+1)
	movlw	low(02710h)
	movwf	0+(?___wmul)+02h
	movlw	high(02710h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	comf	(0+(?___wmul)),w
	movwf	(??_div+2)+0
	comf	(1+(?___wmul)),w
	movwf	((??_div+2)+0+1)
	incf	(??_div+2)+0,f
	skipnz
	incf	((??_div+2)+0+1),f
	movf	(div@x),w
	addwf	0+(??_div+2)+0,w
	movwf	(div@y)
	movf	(div@x+1),w
	skipnc
	incf	(div@x+1),w
	addwf	1+(??_div+2)+0,w
	movwf	1+(div@y)
	line	27
;Untitled.c: 27: c=y/1000;y=y-c*1000;
	movlw	low(03E8h)
	movwf	(?___awdiv)
	movlw	high(03E8h)
	movwf	((?___awdiv))+1
	movf	(div@y+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(div@y),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	movwf	(??_div+0)+0
	movf	(??_div+0)+0,w
	movwf	(_c)
	movf	(_c),w
	movwf	(??_div+0)+0
	clrf	(??_div+0)+0+1
	movf	0+(??_div+0)+0,w
	movwf	(?___wmul)
	movf	1+(??_div+0)+0,w
	movwf	(?___wmul+1)
	movlw	low(03E8h)
	movwf	0+(?___wmul)+02h
	movlw	high(03E8h)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	comf	(0+(?___wmul)),w
	movwf	(??_div+2)+0
	comf	(1+(?___wmul)),w
	movwf	((??_div+2)+0+1)
	incf	(??_div+2)+0,f
	skipnz
	incf	((??_div+2)+0+1),f
	movf	(div@y),w
	addwf	0+(??_div+2)+0,w
	movwf	(div@y)
	movf	(div@y+1),w
	skipnc
	incf	(div@y+1),w
	addwf	1+(??_div+2)+0,w
	movwf	1+(div@y)
	line	28
;Untitled.c: 28: d=y/100;z=y-d*100;
	movlw	low(064h)
	movwf	(?___awdiv)
	movlw	high(064h)
	movwf	((?___awdiv))+1
	movf	(div@y+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(div@y),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	movwf	(??_div+0)+0
	movf	(??_div+0)+0,w
	movwf	(_d)
	movlw	(064h)
	movwf	(??_div+0)+0
	movf	(??_div+0)+0,w
	movwf	(?___bmul)
	movf	(_d),w
	fcall	___bmul
	xorlw	0ffh
	addlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(div@y),w
	movwf	(??_div+1)+0
	movf	(??_div+1)+0,w
	movwf	(div@z)
	line	29
;Untitled.c: 29: e=z/10;f=z-e*10;
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(div@z),w
	movwf	(??_div+0)+0
	clrf	(??_div+0)+0+1
	movf	0+(??_div+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_div+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	movwf	(??_div+2)+0
	movf	(??_div+2)+0,w
	movwf	(_e)
	movlw	(0Ah)
	movwf	(??_div+0)+0
	movf	(??_div+0)+0,w
	movwf	(?___bmul)
	movf	(_e),w
	fcall	___bmul
	xorlw	0ffh
	addlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(div@z),w
	movwf	(??_div+1)+0
	movf	(??_div+1)+0,w
	movwf	(_f)
	line	30
	
l736:	
	return
	opt stack 0
GLOBAL	__end_of_div
	__end_of_div:
;; =============== function _div ends ============

	signat	_div,88
	global	_ENABLE1
psect	text343,local,class=CODE,delta=2
global __ptext343
__ptext343:

;; *************** function _ENABLE1 *****************
;; Defined at:
;;		line 20 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
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
psect	text343
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
	line	20
	global	__size_of_ENABLE1
	__size_of_ENABLE1	equ	__end_of_ENABLE1-_ENABLE1
	
_ENABLE1:	
	opt	stack 5
; Regs used in _ENABLE1: [wreg+status,2+status,0+pclath+cstack]
	
l4576:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(45/8),(45)&7
	bcf	(44/8),(44)&7
	bcf	(43/8),(43)&7
	
l4578:	
	fcall	_DELAY
	
l4580:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	
l733:	
	return
	opt stack 0
GLOBAL	__end_of_ENABLE1
	__end_of_ENABLE1:
;; =============== function _ENABLE1 ends ============

	signat	_ENABLE1,88
	global	_ENABLE
psect	text344,local,class=CODE,delta=2
global __ptext344
__ptext344:

;; *************** function _ENABLE *****************
;; Defined at:
;;		line 16 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
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
psect	text344
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
	line	16
	global	__size_of_ENABLE
	__size_of_ENABLE	equ	__end_of_ENABLE-_ENABLE
	
_ENABLE:	
	opt	stack 5
; Regs used in _ENABLE: [wreg+status,2+status,0+pclath+cstack]
	
l4570:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(45/8),(45)&7
	bcf	(44/8),(44)&7
	bcf	(43/8),(43)&7
	
l4572:	
	fcall	_DELAY
	
l4574:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	
l730:	
	return
	opt stack 0
GLOBAL	__end_of_ENABLE
	__end_of_ENABLE:
;; =============== function _ENABLE ends ============

	signat	_ENABLE,88
	global	___aldiv
psect	text345,local,class=CODE,delta=2
global __ptext345
__ptext345:

;; *************** function ___aldiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\aldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[BANK0 ] long 
;;  dividend        4    4[BANK0 ] long 
;; Auto vars:     Size  Location     Type
;;  quotient        4   11[BANK0 ] long 
;;  sign            1   10[BANK0 ] unsigned char 
;;  counter         1    9[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       8       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0      15       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_div
;; This function uses a non-reentrant model
;;
psect	text345
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\aldiv.c"
	line	5
	global	__size_of___aldiv
	__size_of___aldiv	equ	__end_of___aldiv-___aldiv
	
___aldiv:	
	opt	stack 5
; Regs used in ___aldiv: [wreg+status,2+status,0]
	line	9
	
l4528:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___aldiv@sign)
	line	10
	btfss	(___aldiv@divisor+3),7
	goto	u2731
	goto	u2730
u2731:
	goto	l4534
u2730:
	line	11
	
l4530:	
	comf	(___aldiv@divisor),f
	comf	(___aldiv@divisor+1),f
	comf	(___aldiv@divisor+2),f
	comf	(___aldiv@divisor+3),f
	incf	(___aldiv@divisor),f
	skipnz
	incf	(___aldiv@divisor+1),f
	skipnz
	incf	(___aldiv@divisor+2),f
	skipnz
	incf	(___aldiv@divisor+3),f
	line	12
	
l4532:	
	clrf	(___aldiv@sign)
	bsf	status,0
	rlf	(___aldiv@sign),f
	goto	l4534
	line	13
	
l2871:	
	line	14
	
l4534:	
	btfss	(___aldiv@dividend+3),7
	goto	u2741
	goto	u2740
u2741:
	goto	l4540
u2740:
	line	15
	
l4536:	
	comf	(___aldiv@dividend),f
	comf	(___aldiv@dividend+1),f
	comf	(___aldiv@dividend+2),f
	comf	(___aldiv@dividend+3),f
	incf	(___aldiv@dividend),f
	skipnz
	incf	(___aldiv@dividend+1),f
	skipnz
	incf	(___aldiv@dividend+2),f
	skipnz
	incf	(___aldiv@dividend+3),f
	line	16
	
l4538:	
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	xorwf	(___aldiv@sign),f
	goto	l4540
	line	17
	
l2872:	
	line	18
	
l4540:	
	movlw	0
	movwf	(___aldiv@quotient+3)
	movlw	0
	movwf	(___aldiv@quotient+2)
	movlw	0
	movwf	(___aldiv@quotient+1)
	movlw	0
	movwf	(___aldiv@quotient)

	line	19
	
l4542:	
	movf	(___aldiv@divisor+3),w
	iorwf	(___aldiv@divisor+2),w
	iorwf	(___aldiv@divisor+1),w
	iorwf	(___aldiv@divisor),w
	skipnz
	goto	u2751
	goto	u2750
u2751:
	goto	l4562
u2750:
	line	20
	
l4544:	
	clrf	(___aldiv@counter)
	bsf	status,0
	rlf	(___aldiv@counter),f
	line	21
	goto	l4548
	
l2875:	
	line	22
	
l4546:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u2765:
	clrc
	rlf	(___aldiv@divisor),f
	rlf	(___aldiv@divisor+1),f
	rlf	(___aldiv@divisor+2),f
	rlf	(___aldiv@divisor+3),f
	decfsz	(??___aldiv+0)+0
	goto	u2765
	line	23
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	addwf	(___aldiv@counter),f
	goto	l4548
	line	24
	
l2874:	
	line	21
	
l4548:	
	btfss	(___aldiv@divisor+3),(31)&7
	goto	u2771
	goto	u2770
u2771:
	goto	l4546
u2770:
	goto	l4550
	
l2876:	
	goto	l4550
	line	25
	
l2877:	
	line	26
	
l4550:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u2785:
	clrc
	rlf	(___aldiv@quotient),f
	rlf	(___aldiv@quotient+1),f
	rlf	(___aldiv@quotient+2),f
	rlf	(___aldiv@quotient+3),f
	decfsz	(??___aldiv+0)+0
	goto	u2785
	line	27
	
l4552:	
	movf	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),w
	skipz
	goto	u2795
	movf	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),w
	skipz
	goto	u2795
	movf	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),w
	skipz
	goto	u2795
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),w
u2795:
	skipc
	goto	u2791
	goto	u2790
u2791:
	goto	l4558
u2790:
	line	28
	
l4554:	
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),f
	movf	(___aldiv@divisor+1),w
	skipc
	incfsz	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),f
	movf	(___aldiv@divisor+2),w
	skipc
	incfsz	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),f
	movf	(___aldiv@divisor+3),w
	skipc
	incfsz	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),f
	line	29
	
l4556:	
	bsf	(___aldiv@quotient)+(0/8),(0)&7
	goto	l4558
	line	30
	
l2878:	
	line	31
	
l4558:	
	movlw	01h
u2805:
	clrc
	rrf	(___aldiv@divisor+3),f
	rrf	(___aldiv@divisor+2),f
	rrf	(___aldiv@divisor+1),f
	rrf	(___aldiv@divisor),f
	addlw	-1
	skipz
	goto	u2805

	line	32
	
l4560:	
	movlw	low(01h)
	subwf	(___aldiv@counter),f
	btfss	status,2
	goto	u2811
	goto	u2810
u2811:
	goto	l4550
u2810:
	goto	l4562
	
l2879:	
	goto	l4562
	line	33
	
l2873:	
	line	34
	
l4562:	
	movf	(___aldiv@sign),w
	skipz
	goto	u2820
	goto	l4566
u2820:
	line	35
	
l4564:	
	comf	(___aldiv@quotient),f
	comf	(___aldiv@quotient+1),f
	comf	(___aldiv@quotient+2),f
	comf	(___aldiv@quotient+3),f
	incf	(___aldiv@quotient),f
	skipnz
	incf	(___aldiv@quotient+1),f
	skipnz
	incf	(___aldiv@quotient+2),f
	skipnz
	incf	(___aldiv@quotient+3),f
	goto	l4566
	
l2880:	
	line	36
	
l4566:	
	movf	(___aldiv@quotient+3),w
	movwf	(?___aldiv+3)
	movf	(___aldiv@quotient+2),w
	movwf	(?___aldiv+2)
	movf	(___aldiv@quotient+1),w
	movwf	(?___aldiv+1)
	movf	(___aldiv@quotient),w
	movwf	(?___aldiv)

	goto	l2881
	
l4568:	
	line	37
	
l2881:	
	return
	opt stack 0
GLOBAL	__end_of___aldiv
	__end_of___aldiv:
;; =============== function ___aldiv ends ============

	signat	___aldiv,8316
	global	___lldiv
psect	text346,local,class=CODE,delta=2
global __ptext346
__ptext346:

;; *************** function ___lldiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[BANK0 ] unsigned long 
;;  dividend        4    4[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  quotient        4    9[BANK0 ] unsigned long 
;;  counter         1   13[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       8       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       1       0       0       0
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
psect	text346
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lldiv.c"
	line	5
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
	opt	stack 5
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	9
	
l4504:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___lldiv@quotient+3)
	movlw	0
	movwf	(___lldiv@quotient+2)
	movlw	0
	movwf	(___lldiv@quotient+1)
	movlw	0
	movwf	(___lldiv@quotient)

	line	10
	movf	(___lldiv@divisor+3),w
	iorwf	(___lldiv@divisor+2),w
	iorwf	(___lldiv@divisor+1),w
	iorwf	(___lldiv@divisor),w
	skipnz
	goto	u2661
	goto	u2660
u2661:
	goto	l4524
u2660:
	line	11
	
l4506:	
	clrf	(___lldiv@counter)
	bsf	status,0
	rlf	(___lldiv@counter),f
	line	12
	goto	l4510
	
l2850:	
	line	13
	
l4508:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u2675:
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	decfsz	(??___lldiv+0)+0
	goto	u2675
	line	14
	movlw	(01h)
	movwf	(??___lldiv+0)+0
	movf	(??___lldiv+0)+0,w
	addwf	(___lldiv@counter),f
	goto	l4510
	line	15
	
l2849:	
	line	12
	
l4510:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u2681
	goto	u2680
u2681:
	goto	l4508
u2680:
	goto	l4512
	
l2851:	
	goto	l4512
	line	16
	
l2852:	
	line	17
	
l4512:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u2695:
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	decfsz	(??___lldiv+0)+0
	goto	u2695
	line	18
	
l4514:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u2705
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u2705
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u2705
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u2705:
	skipc
	goto	u2701
	goto	u2700
u2701:
	goto	l4520
u2700:
	line	19
	
l4516:	
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),f
	movf	(___lldiv@divisor+1),w
	skipc
	incfsz	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),f
	movf	(___lldiv@divisor+2),w
	skipc
	incfsz	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),f
	movf	(___lldiv@divisor+3),w
	skipc
	incfsz	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),f
	line	20
	
l4518:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	goto	l4520
	line	21
	
l2853:	
	line	22
	
l4520:	
	movlw	01h
u2715:
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	addlw	-1
	skipz
	goto	u2715

	line	23
	
l4522:	
	movlw	low(01h)
	subwf	(___lldiv@counter),f
	btfss	status,2
	goto	u2721
	goto	u2720
u2721:
	goto	l4512
u2720:
	goto	l4524
	
l2854:	
	goto	l4524
	line	24
	
l2848:	
	line	25
	
l4524:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	goto	l2855
	
l4526:	
	line	26
	
l2855:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
;; =============== function ___lldiv ends ============

	signat	___lldiv,8316
	global	___awdiv
psect	text347,local,class=CODE,delta=2
global __ptext347
__ptext347:

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
;;		_speed_calculate
;; This function uses a non-reentrant model
;;
psect	text347
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 5
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l4464:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u2561
	goto	u2560
u2561:
	goto	l4468
u2560:
	line	11
	
l4466:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l4468
	line	13
	
l2816:	
	line	14
	
l4468:	
	btfss	(___awdiv@dividend+1),7
	goto	u2571
	goto	u2570
u2571:
	goto	l4474
u2570:
	line	15
	
l4470:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l4472:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l4474
	line	17
	
l2817:	
	line	18
	
l4474:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l4476:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2581
	goto	u2580
u2581:
	goto	l4496
u2580:
	line	20
	
l4478:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l4484
	
l2820:	
	line	22
	
l4480:	
	movlw	01h
	
u2595:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2595
	line	23
	
l4482:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l4484
	line	24
	
l2819:	
	line	21
	
l4484:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2601
	goto	u2600
u2601:
	goto	l4480
u2600:
	goto	l4486
	
l2821:	
	goto	l4486
	line	25
	
l2822:	
	line	26
	
l4486:	
	movlw	01h
	
u2615:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2615
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2625
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2625:
	skipc
	goto	u2621
	goto	u2620
u2621:
	goto	l4492
u2620:
	line	28
	
l4488:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l4490:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l4492
	line	30
	
l2823:	
	line	31
	
l4492:	
	movlw	01h
	
u2635:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2635
	line	32
	
l4494:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2641
	goto	u2640
u2641:
	goto	l4486
u2640:
	goto	l4496
	
l2824:	
	goto	l4496
	line	33
	
l2818:	
	line	34
	
l4496:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2650
	goto	l4500
u2650:
	line	35
	
l4498:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l4500
	
l2825:	
	line	36
	
l4500:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l2826
	
l4502:	
	line	37
	
l2826:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___lmul
psect	text348,local,class=CODE,delta=2
global __ptext348
__ptext348:

;; *************** function ___lmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      4    0[BANK0 ] unsigned long 
;;  multiplicand    4    4[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  product         4    9[BANK0 ] unsigned long 
;; Return value:  Size  Location     Type
;;                  4    0[BANK0 ] unsigned long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       8       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_div
;; This function uses a non-reentrant model
;;
psect	text348
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lmul.c"
	line	3
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
	opt	stack 5
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	4
	
l4450:	
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___lmul@product+3)
	movlw	0
	movwf	(___lmul@product+2)
	movlw	0
	movwf	(___lmul@product+1)
	movlw	0
	movwf	(___lmul@product)

	goto	l4452
	line	6
	
l2751:	
	line	7
	
l4452:	
	btfss	(___lmul@multiplier),(0)&7
	goto	u2511
	goto	u2510
u2511:
	goto	l4456
u2510:
	line	8
	
l4454:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2521
	addwf	(___lmul@product+1),f
u2521:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2522
	addwf	(___lmul@product+2),f
u2522:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u2523
	addwf	(___lmul@product+3),f
u2523:

	goto	l4456
	
l2752:	
	line	9
	
l4456:	
	movlw	01h
	movwf	(??___lmul+0)+0
u2535:
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	decfsz	(??___lmul+0)+0
	goto	u2535
	line	10
	
l4458:	
	movlw	01h
u2545:
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	addlw	-1
	skipz
	goto	u2545

	line	11
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u2551
	goto	u2550
u2551:
	goto	l4452
u2550:
	goto	l4460
	
l2753:	
	line	12
	
l4460:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	goto	l2754
	
l4462:	
	line	13
	
l2754:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
;; =============== function ___lmul ends ============

	signat	___lmul,8316
	global	___wmul
psect	text349,local,class=CODE,delta=2
global __ptext349
__ptext349:

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
psect	text349
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 5
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l4438:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l4440
	line	6
	
l2676:	
	line	7
	
l4440:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u2471
	goto	u2470
u2471:
	goto	l2677
u2470:
	line	8
	
l4442:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l2677:	
	line	9
	movlw	01h
	
u2485:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u2485
	line	10
	
l4444:	
	movlw	01h
	
u2495:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u2495
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u2501
	goto	u2500
u2501:
	goto	l4440
u2500:
	goto	l4446
	
l2678:	
	line	12
	
l4446:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l2679
	
l4448:	
	line	13
	
l2679:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	___bmul
psect	text350,local,class=CODE,delta=2
global __ptext350
__ptext350:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\bmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1    3[BANK0 ] unsigned char 
;;  product         1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       2       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_div
;;		_speed_calculate
;; This function uses a non-reentrant model
;;
psect	text350
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 5
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___bmul@multiplier)
	line	4
	
l4424:	
	clrf	(___bmul@product)
	line	6
	
l2670:	
	line	7
	btfss	(___bmul@multiplier),(0)&7
	goto	u2451
	goto	u2450
u2451:
	goto	l4428
u2450:
	line	8
	
l4426:	
	movf	(___bmul@multiplicand),w
	movwf	(??___bmul+0)+0
	movf	(??___bmul+0)+0,w
	addwf	(___bmul@product),f
	goto	l4428
	
l2671:	
	line	9
	
l4428:	
	clrc
	rlf	(___bmul@multiplicand),f

	line	10
	
l4430:	
	clrc
	rrf	(___bmul@multiplier),f

	line	11
	
l4432:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u2461
	goto	u2460
u2461:
	goto	l2670
u2460:
	goto	l4434
	
l2672:	
	line	12
	
l4434:	
	movf	(___bmul@product),w
	goto	l2673
	
l4436:	
	line	13
	
l2673:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_eeprom_write
psect	text351,local,class=CODE,delta=2
global __ptext351
__ptext351:

;; *************** function _eeprom_write *****************
;; Defined at:
;;		line 7 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\eewrite.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;;  value           1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text351
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\eewrite.c"
	line	7
	global	__size_of_eeprom_write
	__size_of_eeprom_write	equ	__end_of_eeprom_write-_eeprom_write
	
_eeprom_write:	
	opt	stack 6
; Regs used in _eeprom_write: [wreg+status,2+status,0]
;eeprom_write@addr stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(eeprom_write@addr)
	line	8
	
l1986:	
	goto	l1987
	
l1988:	
	
l1987:	
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfsc	(3169/8)^0180h,(3169)&7
	goto	u2421
	goto	u2420
u2421:
	goto	l1987
u2420:
	goto	l4404
	
l1989:	
	
l4404:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(eeprom_write@addr),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(eeprom_write@value),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(268)^0100h	;volatile
	
l4406:	
	movlw	(03Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_eeprom_write+0)+0
	movf	(??_eeprom_write+0)+0,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(396)^0180h,f	;volatile
	
l4408:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(24/8),(24)&7
	
l4410:	
	btfss	(95/8),(95)&7
	goto	u2431
	goto	u2430
u2431:
	goto	l1990
u2430:
	
l4412:	
	bsf	(24/8),(24)&7
	
l1990:	
	bcf	(95/8),(95)&7
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3170/8)^0180h,(3170)&7
	
l4414:	
	movlw	(055h)
	movwf	(397)^0180h	;volatile
	movlw	(0AAh)
	movwf	(397)^0180h	;volatile
	
l4416:	
	bsf	(3169/8)^0180h,(3169)&7
	
l4418:	
	bcf	(3170/8)^0180h,(3170)&7
	
l4420:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(24/8),(24)&7
	goto	u2441
	goto	u2440
u2441:
	goto	l1993
u2440:
	
l4422:	
	bsf	(95/8),(95)&7
	goto	l1993
	
l1991:	
	goto	l1993
	
l1992:	
	line	10
;	Return value of _eeprom_write is never used
	
l1993:	
	return
	opt stack 0
GLOBAL	__end_of_eeprom_write
	__end_of_eeprom_write:
;; =============== function _eeprom_write ends ============

	signat	_eeprom_write,8313
	global	_eeprom_read
psect	text352,local,class=CODE,delta=2
global __ptext352
__ptext352:

;; *************** function _eeprom_read *****************
;; Defined at:
;;		line 7 in file "eeread.c"
;; Parameters:    Size  Location     Type
;;  addr            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  addr            1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text352
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\eeread.c"
	line	7
	global	__size_of_eeprom_read
	__size_of_eeprom_read	equ	__end_of_eeprom_read-_eeprom_read
	
_eeprom_read:	
	opt	stack 6
; Regs used in _eeprom_read: [wreg+status,2+status,0]
;eeprom_read@addr stored from wreg
	line	9
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(eeprom_read@addr)
	line	8
	
l1369:	
	line	9
# 9 "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\eeread.c"
clrwdt ;#
psect	text352
	line	10
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	btfsc	(3169/8)^0180h,(3169)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l1369
u2410:
	goto	l4400
	
l1370:	
	line	11
	
l4400:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(eeprom_read@addr),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(269)^0100h	;volatile
	movlw	(03Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_eeprom_read+0)+0
	movf	(??_eeprom_read+0)+0,w
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	andwf	(396)^0180h,f	;volatile
	bsf	(3168/8)^0180h,(3168)&7
	clrc
	btfsc	(3168/8)^0180h,(3168)&7
	setc
	movlw	0
	skipnc
	movlw	1

	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(268)^0100h,w	;volatile
	goto	l1371
	
l4402:	
	line	12
	
l1371:	
	return
	opt stack 0
GLOBAL	__end_of_eeprom_read
	__end_of_eeprom_read:
;; =============== function _eeprom_read ends ============

	signat	_eeprom_read,4217
	global	_DELAY
psect	text353,local,class=CODE,delta=2
global __ptext353
__ptext353:

;; *************** function _DELAY *****************
;; Defined at:
;;		line 12 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
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
psect	text353
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
	global	__size_of_DELAY
	__size_of_DELAY	equ	__end_of_DELAY-_DELAY
	
_DELAY:	
	opt	stack 5
; Regs used in _DELAY: [wreg+status,2+status,0]
	
l4352:	
	movlw	low(03E7h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(DELAY@i)
	movlw	high(03E7h)
	movwf	((DELAY@i))+1
	
l4354:	
	movf	((DELAY@i+1)),w
	iorwf	((DELAY@i)),w
	skipz
	goto	u2341
	goto	u2340
u2341:
	goto	l4358
u2340:
	goto	l727
	
l4356:	
	goto	l727
	
l725:	
	
l4358:	
	movlw	low(01h)
	subwf	(DELAY@i),f
	movlw	high(01h)
	skipc
	decf	(DELAY@i+1),f
	subwf	(DELAY@i+1),f
	
l4360:	
	movf	((DELAY@i+1)),w
	iorwf	((DELAY@i)),w
	skipz
	goto	u2351
	goto	u2350
u2351:
	goto	l4358
u2350:
	goto	l727
	
l726:	
	
l727:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY
	__end_of_DELAY:
;; =============== function _DELAY ends ============

	signat	_DELAY,88
	global	_int_serve
psect	text354,local,class=CODE,delta=2
global __ptext354
__ptext354:

;; *************** function _int_serve *****************
;; Defined at:
;;		line 40 in file "D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:         10       0       0       0       0
;;      Totals:        10       0       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text354
	file	"D:\OneDrive - asd\WeiJi\Mplab_workspace\sy4\Untitled.c"
	line	40
	global	__size_of_int_serve
	__size_of_int_serve	equ	__end_of_int_serve-_int_serve
	
_int_serve:	
	opt	stack 5
; Regs used in _int_serve: [wreg+status,2+status,0+btemp+1]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_int_serve+6)
	movf	fsr0,w
	movwf	(??_int_serve+7)
	movf	pclath,w
	movwf	(??_int_serve+8)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_int_serve+9)
	ljmp	_int_serve
psect	text354
	line	41
	
i1l4362:	
;Untitled.c: 41: if (T0IF==1){n ++;T0IF =0;}
	btfss	(90/8),(90)&7
	goto	u236_21
	goto	u236_20
u236_21:
	goto	i1l4368
u236_20:
	
i1l4364:	
	movlw	low(01h)
	addwf	(_n),f
	skipnc
	incf	(_n+1),f
	movlw	high(01h)
	addwf	(_n+1),f
	
i1l4366:	
	bcf	(90/8),(90)&7
	goto	i1l748
	line	42
	
i1l742:	
	line	44
	
i1l4368:	
;Untitled.c: 42: else
;Untitled.c: 43: {
;Untitled.c: 44: count_temp ++;
	movlw	low(01h)
	addwf	(_count_temp),f
	skipnc
	incf	(_count_temp+1),f
	movlw	high(01h)
	addwf	(_count_temp+1),f
	line	45
;Untitled.c: 45: if (count_temp ==740){li_cheng.count ++; count_temp =0;};
	movlw	high(02E4h)
	xorwf	(_count_temp+1),w
	skipz
	goto	u237_25
	movlw	low(02E4h)
	xorwf	(_count_temp),w
u237_25:

	skipz
	goto	u237_21
	goto	u237_20
u237_21:
	goto	i1l4374
u237_20:
	
i1l4370:	
	movlw	01h
	addwf	(_li_cheng),f
	movlw	0
	skipnc
movlw 1
	addwf	(_li_cheng+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(_li_cheng+2),f
	movlw	0
	skipnc
movlw 1
	addwf	(_li_cheng+3),f
	
i1l4372:	
	clrf	(_count_temp)
	clrf	(_count_temp+1)
	goto	i1l4374
	
i1l744:	
	line	46
	
i1l4374:	
;Untitled.c: 46: if (li_cheng.count==0x927C0){INTE =0;RE0=1;};
	movlw	0
	xorwf	(_li_cheng+3),w
	skipz
	goto	u238_25
	movlw	09h
	xorwf	(_li_cheng+2),w
	skipz
	goto	u238_25
	movlw	027h
	xorwf	(_li_cheng+1),w
	skipz
	goto	u238_25
	movlw	0C0h
	xorwf	(_li_cheng),w
u238_25:
	skipz
	goto	u238_21
	goto	u238_20
u238_21:
	goto	i1l4378
u238_20:
	
i1l4376:	
	bcf	(92/8),(92)&7
	bsf	(72/8),(72)&7
	goto	i1l4378
	
i1l745:	
	line	47
	
i1l4378:	
;Untitled.c: 47: m ++;
	movlw	(01h)
	movwf	(??_int_serve+0)+0
	movf	(??_int_serve+0)+0,w
	addwf	(_m),f
	line	48
	
i1l4380:	
;Untitled.c: 48: if (m ==0)
	movf	(_m),f
	skipz
	goto	u239_21
	goto	u239_20
u239_21:
	goto	i1l4390
u239_20:
	line	49
	
i1l4382:	
;Untitled.c: 49: {n =0;tmr01=TMR0;T0IE=1;T0IF=0;};
	clrf	(_n)
	clrf	(_n+1)
	
i1l4384:	
	movf	(1),w	;volatile
	movwf	(??_int_serve+0)+0
	movf	(??_int_serve+0)+0,w
	movwf	(_tmr01)
	
i1l4386:	
	bsf	(93/8),(93)&7
	
i1l4388:	
	bcf	(90/8),(90)&7
	goto	i1l4390
	
i1l746:	
	line	50
	
i1l4390:	
;Untitled.c: 50: if (m==1)
	movf	(_m),w
	xorlw	01h
	skipz
	goto	u240_21
	goto	u240_20
u240_21:
	goto	i1l4398
u240_20:
	line	51
	
i1l4392:	
;Untitled.c: 51: {tmr02=TMR0;T0IE=0;t_speed = n*256+(tmr02-tmr01);};
	movf	(1),w	;volatile
	movwf	(??_int_serve+0)+0
	movf	(??_int_serve+0)+0,w
	movwf	(_tmr02)
	
i1l4394:	
	bcf	(93/8),(93)&7
	
i1l4396:	
	movf	(_tmr01),w
	movwf	(??_int_serve+0)+0
	clrf	(??_int_serve+0)+0+1
	comf	(??_int_serve+0)+0,f
	comf	(??_int_serve+0)+1,f
	incf	(??_int_serve+0)+0,f
	skipnz
	incf	(??_int_serve+0)+1,f
	movf	(_n+1),w
	movwf	(??_int_serve+2)+0+1
	movf	(_n),w
	movwf	(??_int_serve+2)+0
	movf	(??_int_serve+2)+0,w
	movwf	(??_int_serve+2)+1
	clrf	(??_int_serve+2)+0
	movf	(_tmr02),w
	addwf	0+(??_int_serve+2)+0,w
	movwf	(??_int_serve+4)+0
	movf	1+(??_int_serve+2)+0,w
	skipnc
	incf	1+(??_int_serve+2)+0,w
	movwf	((??_int_serve+4)+0)+1
	movf	0+(??_int_serve+0)+0,w
	addwf	0+(??_int_serve+4)+0,w
	movwf	(_t_speed)
	movf	1+(??_int_serve+0)+0,w
	skipnc
	incf	1+(??_int_serve+0)+0,w
	addwf	1+(??_int_serve+4)+0,w
	movwf	1+(_t_speed)
	goto	i1l4398
	
i1l747:	
	line	52
	
i1l4398:	
;Untitled.c: 52: INTF =0;
	bcf	(89/8),(89)&7
	goto	i1l748
	line	53
	
i1l743:	
	line	54
	
i1l748:	
	movf	(??_int_serve+9),w
	movwf	btemp+1
	movf	(??_int_serve+8),w
	movwf	pclath
	movf	(??_int_serve+7),w
	movwf	fsr0
	swapf	(??_int_serve+6)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_int_serve
	__end_of_int_serve:
;; =============== function _int_serve ends ============

	signat	_int_serve,88
psect	text355,local,class=CODE,delta=2
global __ptext355
__ptext355:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
