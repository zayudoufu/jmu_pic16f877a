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
# 4 "C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	dw 0xFF29 ;#
	FNCALL	_main,_lcd_init
	FNCALL	_main,_set_pwm_frequency
	FNCALL	_main,_lcd_clear
	FNCALL	_main,_lcd_puts
	FNCALL	_main,_lcd_putnumf
	FNCALL	_main,_keyboard_scan
	FNCALL	_main,___bmul
	FNCALL	_main,_lcd_putc
	FNCALL	_lcd_putnumf,___fttol
	FNCALL	_lcd_putnumf,___llmod
	FNCALL	_lcd_putnumf,___lldiv
	FNCALL	_lcd_putnumf,___lltoft
	FNCALL	_lcd_putnumf,___ftneg
	FNCALL	_lcd_putnumf,___ftadd
	FNCALL	_lcd_putnumf,___lmul
	FNCALL	_lcd_putnumf,___ftmul
	FNCALL	_lcd_putnumf,_lcd_puts
	FNCALL	_lcd_puts,_lcd_data
	FNCALL	_lcd_clear,_lcd_command
	FNCALL	_lcd_clear,_delay_ms
	FNCALL	_set_pwm_frequency,___ftdiv
	FNCALL	_set_pwm_frequency,___fttol
	FNCALL	_lcd_init,_delay_ms
	FNCALL	_lcd_init,_lcd_command
	FNCALL	_lcd_putc,_lcd_data
	FNCALL	___lltoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNCALL	___ftadd,___ftpack
	FNCALL	_lcd_command,_delay_ms
	FNCALL	_keyboard_scan,_delay_ms
	FNCALL	_lcd_data,_delay_ms
	FNROOT	_main
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	keyboard_scan@F1153
	global	_TABLE
	global	_preres
	global	main@F1117
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	268

;initializer for keyboard_scan@F1153
	retlw	0EFh
	retlw	0DFh
	retlw	0BFh
	retlw	07Fh
psect	idataBANK3,class=CODE,space=0,delta=2
global __pidataBANK3
__pidataBANK3:
	line	30

;initializer for _TABLE
	retlw	031h
	retlw	032h
	retlw	033h
	retlw	041h
	retlw	034h
	retlw	035h
	retlw	036h
	retlw	042h
	retlw	037h
	retlw	038h
	retlw	039h
	retlw	043h
	retlw	02Ah
	retlw	030h
	retlw	023h
	retlw	044h
psect	idataCOMMON,class=CODE,space=0,delta=2
global __pidataCOMMON
__pidataCOMMON:
	line	29

;initializer for _preres
	retlw	0FFh
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	line	86

;initializer for main@F1117
	retlw	0xcd
	retlw	0xcc
	retlw	0x3d

	retlw	0x0
	retlw	0x80
	retlw	0x3f

	retlw	0x0
	retlw	0x20
	retlw	0x41

	retlw	0x0
	retlw	0x20
	retlw	0x42

	retlw	0x0
	retlw	0xc8
	retlw	0x42

	retlw	0x0
	retlw	0x7a
	retlw	0x44

	global	_target_count
	global	_timer_count
	global	_current_frequency
	global	_PORTB
_PORTB	set	6
	global	_PORTDbits
_PORTDbits	set	8
	global	_TMR0
_TMR0	set	1
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_PEIE
_PEIE	set	94
	global	_TMR0IE
_TMR0IE	set	93
	global	_TMR0IF
_TMR0IF	set	90
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_TRISE
_TRISE	set	137
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
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_3:	
	retlw	32	;' '
	retlw	70	;'F'
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	113	;'q'
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_2:	
	retlw	73	;'I'
	retlw	110	;'n'
	retlw	105	;'i'
	retlw	116	;'t'
	retlw	105	;'i'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	0
psect	strings
	
STR_1:	
	retlw	75	;'K'
	retlw	101	;'e'
	retlw	121	;'y'
	retlw	58	;':'
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_4:	
	retlw	72	;'H'
	retlw	122	;'z'
	retlw	0
psect	strings
STR_7	equ	STR_4+0
STR_5	equ	STR_1+0
STR_6	equ	STR_3+0
	file	"work_together1.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_timer_count:
       ds      4

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	29
_preres:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_target_count:
       ds      4

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	268
keyboard_scan@F1153:
       ds      4

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_current_frequency:
       ds      3

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	86
main@F1117:
       ds      18

psect	dataBANK3,class=BANK3,space=1
global __pdataBANK3
__pdataBANK3:
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	30
_TABLE:
       ds      16

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
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	((__pbssBANK1)+0)&07Fh
	clrf	((__pbssBANK1)+1)&07Fh
	clrf	((__pbssBANK1)+2)&07Fh
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
; Initialize objects allocated to BANK3
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK3
	bsf	status, 7	;select IRP bank2
	movlw low(__pdataBANK3+16)
	movwf btemp-1,f
	movlw high(__pidataBANK3)
	movwf btemp,f
	movlw low(__pidataBANK3)
	movwf btemp+1,f
	movlw low(__pdataBANK3)
	movwf fsr,f
	fcall init_ram
; Initialize objects allocated to BANK1
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK1
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK1+18)
	movwf btemp-1,f
	movlw high(__pidataBANK1)
	movwf btemp,f
	movlw low(__pidataBANK1)
	movwf btemp+1,f
	movlw low(__pdataBANK1)
	movwf fsr,f
	fcall init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	movlw low(__pdataBANK0+4)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
; Initialize objects allocated to COMMON
	global __pidataCOMMON
psect cinit,class=CODE,delta=2
	fcall	__pidataCOMMON+0		;fetch initializer
	movwf	__pdataCOMMON+0&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackBANK1,class=BANK1,space=1
global __pcstackBANK1
__pcstackBANK1:
	global	lcd_putnumf@buffer
lcd_putnumf@buffer:	; 16 bytes @ 0x0
	ds	16
	global	lcd_putnumf@frac_part
lcd_putnumf@frac_part:	; 3 bytes @ 0x10
	ds	3
	global	lcd_putnumf@temp
lcd_putnumf@temp:	; 1 bytes @ 0x13
	ds	1
	global	lcd_putnumf@j
lcd_putnumf@j:	; 1 bytes @ 0x14
	ds	1
	global	lcd_putnumf@multiplier
lcd_putnumf@multiplier:	; 4 bytes @ 0x15
	ds	4
	global	lcd_putnumf@frac
lcd_putnumf@frac:	; 4 bytes @ 0x19
	ds	4
	global	lcd_putnumf@start
lcd_putnumf@start:	; 1 bytes @ 0x1D
	ds	1
	global	lcd_putnumf@end
lcd_putnumf@end:	; 1 bytes @ 0x1E
	ds	1
	global	lcd_putnumf@int_part
lcd_putnumf@int_part:	; 4 bytes @ 0x1F
	ds	4
	global	lcd_putnumf@i
lcd_putnumf@i:	; 1 bytes @ 0x23
	ds	1
	global	main@frequency_map
main@frequency_map:	; 18 bytes @ 0x24
	ds	18
	global	main@map_index
main@map_index:	; 2 bytes @ 0x36
	ds	2
	global	main@key_index
main@key_index:	; 1 bytes @ 0x38
	ds	1
	global	main@key_char
main@key_char:	; 1 bytes @ 0x39
	ds	1
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_lcd_clear
?_lcd_clear:	; 0 bytes @ 0x0
	global	?_lcd_command
?_lcd_command:	; 0 bytes @ 0x0
	global	?_lcd_putc
?_lcd_putc:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_isr
?_isr:	; 0 bytes @ 0x0
	global	??_isr
??_isr:	; 0 bytes @ 0x0
	global	?_keyboard_scan
?_keyboard_scan:	; 1 bytes @ 0x0
	ds	5
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_delay_ms
?_delay_ms:	; 0 bytes @ 0x0
	global	?___bmul
?___bmul:	; 1 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	?___lmul
?___lmul:	; 4 bytes @ 0x0
	global	?___llmod
?___llmod:	; 4 bytes @ 0x0
	global	?___lldiv
?___lldiv:	; 4 bytes @ 0x0
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x0
	global	delay_ms@ms
delay_ms@ms:	; 2 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	global	___lmul@multiplier
___lmul@multiplier:	; 4 bytes @ 0x0
	global	___llmod@divisor
___llmod@divisor:	; 4 bytes @ 0x0
	global	___lldiv@divisor
___lldiv@divisor:	; 4 bytes @ 0x0
	ds	1
	global	??___bmul
??___bmul:	; 0 bytes @ 0x1
	ds	1
	global	??_delay_ms
??_delay_ms:	; 0 bytes @ 0x2
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x2
	global	delay_ms@i
delay_ms@i:	; 2 bytes @ 0x2
	ds	1
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x3
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	ds	1
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	global	delay_ms@j
delay_ms@j:	; 2 bytes @ 0x4
	global	___lmul@multiplicand
___lmul@multiplicand:	; 4 bytes @ 0x4
	global	___llmod@dividend
___llmod@dividend:	; 4 bytes @ 0x4
	global	___lldiv@dividend
___lldiv@dividend:	; 4 bytes @ 0x4
	ds	1
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x5
	ds	1
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x6
	global	??_keyboard_scan
??_keyboard_scan:	; 0 bytes @ 0x6
	global	??_lcd_command
??_lcd_command:	; 0 bytes @ 0x6
	ds	1
	global	lcd_command@cmd
lcd_command@cmd:	; 1 bytes @ 0x7
	global	lcd_data@data
lcd_data@data:	; 1 bytes @ 0x7
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x8
	global	??_lcd_clear
??_lcd_clear:	; 0 bytes @ 0x8
	global	?_lcd_puts
?_lcd_puts:	; 0 bytes @ 0x8
	global	??_lcd_putc
??_lcd_putc:	; 0 bytes @ 0x8
	global	??___lmul
??___lmul:	; 0 bytes @ 0x8
	global	??___llmod
??___llmod:	; 0 bytes @ 0x8
	global	??___lldiv
??___lldiv:	; 0 bytes @ 0x8
	global	?___fttol
?___fttol:	; 4 bytes @ 0x8
	global	lcd_putc@c
lcd_putc@c:	; 1 bytes @ 0x8
	global	lcd_puts@str
lcd_puts@str:	; 2 bytes @ 0x8
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x8
	global	keyboard_scan@row_pins
keyboard_scan@row_pins:	; 4 bytes @ 0x8
	ds	1
	global	___llmod@counter
___llmod@counter:	; 1 bytes @ 0x9
	global	___lmul@product
___lmul@product:	; 4 bytes @ 0x9
	global	___lldiv@quotient
___lldiv@quotient:	; 4 bytes @ 0x9
	ds	1
	global	??_lcd_puts
??_lcd_puts:	; 0 bytes @ 0xA
	ds	2
	global	??___fttol
??___fttol:	; 0 bytes @ 0xC
	global	keyboard_scan@result
keyboard_scan@result:	; 1 bytes @ 0xC
	ds	1
	global	keyboard_scan@col
keyboard_scan@col:	; 1 bytes @ 0xD
	global	___lldiv@counter
___lldiv@counter:	; 1 bytes @ 0xD
	ds	1
	global	keyboard_scan@col_val
keyboard_scan@col_val:	; 1 bytes @ 0xE
	ds	1
	global	keyboard_scan@row
keyboard_scan@row:	; 1 bytes @ 0xF
	ds	1
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x10
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x11
	ds	4
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x15
	ds	1
	global	?___ftdiv
?___ftdiv:	; 3 bytes @ 0x16
	global	?___ftneg
?___ftneg:	; 3 bytes @ 0x16
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0x16
	global	___ftneg@f1
___ftneg@f1:	; 3 bytes @ 0x16
	ds	3
	global	??___ftneg
??___ftneg:	; 0 bytes @ 0x19
	global	?___lltoft
?___lltoft:	; 3 bytes @ 0x19
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0x19
	global	___lltoft@c
___lltoft@c:	; 4 bytes @ 0x19
	ds	3
	global	??___ftdiv
??___ftdiv:	; 0 bytes @ 0x1C
	ds	1
	global	??___lltoft
??___lltoft:	; 0 bytes @ 0x1D
	ds	1
	global	___lltoft@exp
___lltoft@exp:	; 1 bytes @ 0x1E
	ds	1
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0x1F
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0x1F
	ds	1
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0x20
	ds	1
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0x21
	ds	1
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0x22
	ds	2
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0x24
	ds	1
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0x25
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0x25
	ds	1
	global	?_set_pwm_frequency
?_set_pwm_frequency:	; 0 bytes @ 0x26
	global	set_pwm_frequency@freq
set_pwm_frequency@freq:	; 3 bytes @ 0x26
	ds	3
	global	??_set_pwm_frequency
??_set_pwm_frequency:	; 0 bytes @ 0x29
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x29
	global	set_pwm_frequency@period
set_pwm_frequency@period:	; 3 bytes @ 0x29
	ds	1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x2A
	ds	2
	global	set_pwm_frequency@half_period
set_pwm_frequency@half_period:	; 3 bytes @ 0x2C
	ds	1
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x2D
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x2E
	ds	1
	global	?___ftadd
?___ftadd:	; 3 bytes @ 0x2F
	global	set_pwm_frequency@interrupt_interval
set_pwm_frequency@interrupt_interval:	; 3 bytes @ 0x2F
	global	___ftadd@f1
___ftadd@f1:	; 3 bytes @ 0x2F
	ds	3
	global	___ftadd@f2
___ftadd@f2:	; 3 bytes @ 0x32
	ds	3
	global	??___ftadd
??___ftadd:	; 0 bytes @ 0x35
	ds	4
	global	___ftadd@sign
___ftadd@sign:	; 1 bytes @ 0x39
	ds	1
	global	___ftadd@exp2
___ftadd@exp2:	; 1 bytes @ 0x3A
	ds	1
	global	___ftadd@exp1
___ftadd@exp1:	; 1 bytes @ 0x3B
	ds	1
	global	?_lcd_putnumf
?_lcd_putnumf:	; 0 bytes @ 0x3C
	global	lcd_putnumf@num
lcd_putnumf@num:	; 3 bytes @ 0x3C
	ds	3
	global	lcd_putnumf@decimal_places
lcd_putnumf@decimal_places:	; 1 bytes @ 0x3F
	ds	1
	global	??_lcd_putnumf
??_lcd_putnumf:	; 0 bytes @ 0x40
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x41
	ds	4
;;Data sizes: Strings 25, constant 0, data 39, bss 11, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5      10
;; BANK0           80     69      77
;; BANK1           80     58      79
;; BANK3           96      0      16
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___ftpack	float  size(1) Largest target is 0
;;
;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?___lmul	unsigned long  size(1) Largest target is 0
;;
;; ?___ftadd	float  size(1) Largest target is 0
;;
;; ?___ftneg	float  size(1) Largest target is 0
;;
;; ?___lltoft	float  size(1) Largest target is 0
;;
;; ?___lldiv	unsigned long  size(1) Largest target is 0
;;
;; ?___llmod	unsigned long  size(1) Largest target is 0
;;
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?___ftdiv	float  size(1) Largest target is 0
;;
;; lcd_puts@str	PTR const unsigned char  size(2) Largest target is 16
;;		 -> lcd_putnumf@buffer(BANK1[16]), STR_7(CODE[3]), STR_6(CODE[8]), STR_5(CODE[6]), 
;;		 -> STR_4(CODE[3]), STR_3(CODE[8]), STR_2(CODE[8]), STR_1(CODE[6]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_lcd_putnumf
;;   _lcd_putnumf->___ftadd
;;   _lcd_puts->_lcd_data
;;   _lcd_clear->_lcd_command
;;   _set_pwm_frequency->___ftdiv
;;   _lcd_init->_lcd_command
;;   _lcd_putc->_lcd_data
;;   ___lltoft->___ftneg
;;   ___ftmul->___lltoft
;;   ___ftdiv->___fttol
;;   ___ftadd->___ftmul
;;   _lcd_command->_delay_ms
;;   _keyboard_scan->_delay_ms
;;   _lcd_data->_delay_ms
;;   ___ftneg->___fttol
;;   ___fttol->___ftpack
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   _main->_lcd_putnumf
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _isr in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _isr in BANK2
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
;; (0) _main                                                26    26      0    9348
;;                                             65 BANK0      4     4      0
;;                                             36 BANK1     22    22      0
;;                           _lcd_init
;;                  _set_pwm_frequency
;;                          _lcd_clear
;;                           _lcd_puts
;;                        _lcd_putnumf
;;                      _keyboard_scan
;;                             ___bmul
;;                           _lcd_putc
;; ---------------------------------------------------------------------------------
;; (1) _lcd_putnumf                                         41    37      4    5449
;;                                             60 BANK0      5     1      4
;;                                              0 BANK1     36    36      0
;;                            ___fttol
;;                            ___llmod
;;                            ___lldiv
;;                           ___lltoft
;;                            ___ftneg
;;                            ___ftadd
;;                             ___lmul
;;                            ___ftmul
;;                           _lcd_puts
;; ---------------------------------------------------------------------------------
;; (2) _lcd_puts                                             2     0      2     449
;;                                              8 BANK0      2     0      2
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_clear                                            0     0      0     520
;;                        _lcd_command
;;                           _delay_ms
;; ---------------------------------------------------------------------------------
;; (1) _set_pwm_frequency                                   12     9      3    1148
;;                                             38 BANK0     12     9      3
;;                            ___ftdiv
;;                            ___fttol
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0     520
;;                           _delay_ms
;;                        _lcd_command
;; ---------------------------------------------------------------------------------
;; (1) _lcd_putc                                             1     1      0     415
;;                                              8 BANK0      1     1      0
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (2) ___lltoft                                             6     2      4     414
;;                                             25 BANK0      6     2      4
;;                           ___ftpack
;;                            ___fttol (ARG)
;;                            ___ftneg (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftmul                                             16    10      6     800
;;                                             31 BANK0     16    10      6
;;                           ___ftpack
;;                           ___lltoft (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftdiv                                             16    10      6     732
;;                                             22 BANK0     16    10      6
;;                           ___ftpack
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftadd                                             13     7      6    1537
;;                                             47 BANK0     13     7      6
;;                           ___ftpack
;;                            ___ftneg (ARG)
;;                           ___lltoft (ARG)
;;                            ___fttol (ARG)
;;                            ___ftmul (ARG)
;; ---------------------------------------------------------------------------------
;; (2) _lcd_command                                          2     2      0     384
;;                                              6 BANK0      2     2      0
;;                           _delay_ms
;; ---------------------------------------------------------------------------------
;; (1) _keyboard_scan                                       10    10      0     516
;;                                              6 BANK0     10    10      0
;;                           _delay_ms
;; ---------------------------------------------------------------------------------
;; (2) _lcd_data                                             2     2      0     384
;;                                              6 BANK0      2     2      0
;;                           _delay_ms
;; ---------------------------------------------------------------------------------
;; (2) ___lldiv                                             14     6      8     241
;;                                              0 BANK0     14     6      8
;; ---------------------------------------------------------------------------------
;; (2) ___ftneg                                              3     0      3      65
;;                                             22 BANK0      3     0      3
;;                           ___ftpack (ARG)
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___llmod                                             10     2      8     232
;;                                              0 BANK0     10     2      8
;; ---------------------------------------------------------------------------------
;; (2) ___fttol                                             14    10      4     252
;;                                              8 BANK0     14    10      4
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___lmul                                              13     5      8     136
;;                                              0 BANK0     13     5      8
;; ---------------------------------------------------------------------------------
;; (3) ___ftpack                                             8     3      5     312
;;                                              0 BANK0      8     3      5
;; ---------------------------------------------------------------------------------
;; (1) ___bmul                                               4     3      1      68
;;                                              0 BANK0      4     3      1
;; ---------------------------------------------------------------------------------
;; (3) _delay_ms                                             6     4      2     136
;;                                              0 BANK0      6     4      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _isr                                                  5     5      0       0
;;                                              0 COMMON     5     5      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _delay_ms
;;     _lcd_command
;;       _delay_ms
;;   _set_pwm_frequency
;;     ___ftdiv
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;     ___fttol
;;       ___ftpack (ARG)
;;   _lcd_clear
;;     _lcd_command
;;       _delay_ms
;;     _delay_ms
;;   _lcd_puts
;;     _lcd_data
;;       _delay_ms
;;   _lcd_putnumf
;;     ___fttol
;;       ___ftpack (ARG)
;;     ___llmod
;;     ___lldiv
;;     ___lltoft
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;     ___ftneg
;;       ___ftpack (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;     ___ftadd
;;       ___ftpack
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;       ___lltoft (ARG)
;;         ___ftpack
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;       ___ftmul (ARG)
;;         ___ftpack
;;         ___lltoft (ARG)
;;           ___ftpack
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;           ___ftneg (ARG)
;;             ___ftpack (ARG)
;;             ___fttol (ARG)
;;               ___ftpack (ARG)
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;     ___lmul
;;     ___ftmul
;;       ___ftpack
;;       ___lltoft (ARG)
;;         ___ftpack
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;           ___fttol (ARG)
;;             ___ftpack (ARG)
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;     _lcd_puts
;;       _lcd_data
;;         _delay_ms
;;   _keyboard_scan
;;     _delay_ms
;;   ___bmul
;;   _lcd_putc
;;     _lcd_data
;;       _delay_ms
;;
;; _isr (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0      10       9       16.7%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50     3A      4F       7       98.8%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      BA      12        0.0%
;;ABS                  0      0      B6       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               50     45      4D       5       96.3%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      5       A       1       71.4%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 52 in file "C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  map_index       2   54[BANK1 ] int 
;;  frequency_ma   18   36[BANK1 ] float [6]
;;  key_char        1   57[BANK1 ] unsigned char 
;;  key_index       1   56[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0      22       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       4      22       0       0
;;Total ram usage:       26 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_lcd_init
;;		_set_pwm_frequency
;;		_lcd_clear
;;		_lcd_puts
;;		_lcd_putnumf
;;		_keyboard_scan
;;		___bmul
;;		_lcd_putc
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	52
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	54
	
l4544:	
;Untitled.c: 54: TRISD = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	55
;Untitled.c: 55: TRISE = 0x00;
	clrf	(137)^080h	;volatile
	line	56
	
l4546:	
;Untitled.c: 56: TRISB = 0x0F;
	movlw	(0Fh)
	movwf	(134)^080h	;volatile
	line	59
;Untitled.c: 59: TRISD = TRISD & 0xF7;
	movf	(136)^080h,w
	andlw	0F7h
	movwf	(136)^080h	;volatile
	line	61
	
l4548:	
;Untitled.c: 61: lcd_init();
	fcall	_lcd_init
	line	64
	
l4550:	
;Untitled.c: 64: OPTION_REG = 0x07;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	65
	
l4552:	
;Untitled.c: 65: TMR0IE = 1;
	bsf	(93/8),(93)&7
	line	66
	
l4554:	
;Untitled.c: 66: GIE = 1;
	bsf	(95/8),(95)&7
	line	67
	
l4556:	
;Untitled.c: 67: PEIE = 1;
	bsf	(94/8),(94)&7
	line	70
	
l4558:	
;Untitled.c: 70: current_frequency = 1000;
	movlw	0x0
	movwf	(_current_frequency)^080h
	movlw	0x7a
	movwf	(_current_frequency+1)^080h
	movlw	0x44
	movwf	(_current_frequency+2)^080h
	line	71
	
l4560:	
;Untitled.c: 71: set_pwm_frequency(current_frequency);
	movf	(_current_frequency)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_set_pwm_frequency)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_current_frequency+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_set_pwm_frequency+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_current_frequency+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_set_pwm_frequency+2)
	fcall	_set_pwm_frequency
	line	74
	
l4562:	
;Untitled.c: 74: lcd_clear();
	fcall	_lcd_clear
	line	75
	
l4564:	
;Untitled.c: 75: lcd_puts("Key: ");
	movlw	low((STR_1-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	line	76
	
l4566:	
;Untitled.c: 76: lcd_puts("Initial");
	movlw	low((STR_2-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	line	77
	
l4568:	
;Untitled.c: 77: lcd_puts(" Freq: ");
	movlw	low((STR_3-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	line	78
	
l4570:	
;Untitled.c: 78: lcd_putnumf(current_frequency, 1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_current_frequency)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_putnumf)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_current_frequency+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_putnumf+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_current_frequency+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_putnumf+2)
	clrf	0+(?_lcd_putnumf)+03h
	bsf	status,0
	rlf	0+(?_lcd_putnumf)+03h,f
	fcall	_lcd_putnumf
	line	79
	
l4572:	
;Untitled.c: 79: lcd_puts("Hz");
	movlw	low((STR_4-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	goto	l4574
	line	81
;Untitled.c: 81: while (1) {
	
l714:	
	line	82
	
l4574:	
;Untitled.c: 82: unsigned char key_index = keyboard_scan();
	fcall	_keyboard_scan
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@key_index)^080h
	line	84
	
l4576:	
;Untitled.c: 84: if (key_index != 0xFF) {
	movf	(main@key_index)^080h,w
	xorlw	0FFh
	skipnz
	goto	u4691
	goto	u4690
u4691:
	goto	l4574
u4690:
	line	85
	
l4578:	
;Untitled.c: 85: char key_char = TABLE[key_index];
	movf	(main@key_index)^080h,w
	addlw	_TABLE&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@key_char)^080h
	line	86
	
l4580:	
;Untitled.c: 86: float frequency_map[] = {0.1, 1, 10, 40, 100, 1000};
	movlw	(main@frequency_map)&0ffh
	movwf	fsr0
	movlw	low(main@F1117)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	18
	movwf	((??_main+0)+0+2)
u4700:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u4700
	line	88
	
l4582:	
;Untitled.c: 88: if (key_char >= '1' && key_char <= '6') {
	movlw	(031h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(main@key_char)^080h,w
	skipc
	goto	u4711
	goto	u4710
u4711:
	goto	l4574
u4710:
	
l4584:	
	movlw	(037h)
	subwf	(main@key_char)^080h,w
	skipnc
	goto	u4721
	goto	u4720
u4721:
	goto	l4574
u4720:
	line	89
	
l4586:	
;Untitled.c: 89: int map_index = key_char - '1';
	movf	(main@key_char)^080h,w
	addlw	low(0FFCFh)
	movwf	(main@map_index)^080h
	movlw	high(0FFCFh)
	skipnc
	movlw	(high(0FFCFh)+1)&0ffh
	movwf	((main@map_index)^080h)+1
	line	90
	
l4588:	
;Untitled.c: 90: current_frequency = frequency_map[map_index];
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?___bmul)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@map_index)^080h,w
	fcall	___bmul
	addlw	main@frequency_map&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_current_frequency)^080h
	incf	fsr0,f
	movf	indf,w
	movwf	(_current_frequency+1)^080h
	incf	fsr0,f
	movf	indf,w
	movwf	(_current_frequency+2)^080h
	line	93
	
l4590:	
;Untitled.c: 93: lcd_clear();
	fcall	_lcd_clear
	line	94
	
l4592:	
;Untitled.c: 94: lcd_puts("Key: ");
	movlw	low((STR_5-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	line	95
	
l4594:	
;Untitled.c: 95: lcd_putc(key_char);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(main@key_char)^080h,w
	fcall	_lcd_putc
	line	96
	
l4596:	
;Untitled.c: 96: lcd_puts(" Freq: ");
	movlw	low((STR_6-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	line	97
	
l4598:	
;Untitled.c: 97: lcd_putnumf(current_frequency, 1);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_current_frequency)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_putnumf)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_current_frequency+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_putnumf+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_current_frequency+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_putnumf+2)
	clrf	0+(?_lcd_putnumf)+03h
	bsf	status,0
	rlf	0+(?_lcd_putnumf)+03h,f
	fcall	_lcd_putnumf
	line	98
	
l4600:	
;Untitled.c: 98: lcd_puts("Hz");
	movlw	low((STR_7-__stringbase))
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_puts)
	movlw	80h
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	line	101
	
l4602:	
;Untitled.c: 101: set_pwm_frequency(current_frequency);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_current_frequency)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_set_pwm_frequency)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_current_frequency+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_set_pwm_frequency+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_current_frequency+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_set_pwm_frequency+2)
	fcall	_set_pwm_frequency
	goto	l4574
	line	102
	
l718:	
	goto	l4574
	line	103
	
l715:	
	goto	l4574
	line	104
	
l719:	
	line	81
	goto	l4574
	
l720:	
	line	105
	
l721:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_putnumf
psect	text769,local,class=CODE,delta=2
global __ptext769
__ptext769:

;; *************** function _lcd_putnumf *****************
;; Defined at:
;;		line 219 in file "C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
;; Parameters:    Size  Location     Type
;;  num             3   60[BANK0 ] float 
;;  decimal_plac    1   63[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  j               1   20[BANK1 ] unsigned char 
;;  frac            4   25[BANK1 ] unsigned long 
;;  multiplier      4   21[BANK1 ] unsigned long 
;;  frac_part       3   16[BANK1 ] float 
;;  temp            1   19[BANK1 ] unsigned char 
;;  buffer         16    0[BANK1 ] unsigned char [16]
;;  int_part        4   31[BANK1 ] unsigned long 
;;  i               1   35[BANK1 ] unsigned char 
;;  end             1   30[BANK1 ] unsigned char 
;;  start           1   29[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       0      36       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       5      36       0       0
;;Total ram usage:       41 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		___fttol
;;		___llmod
;;		___lldiv
;;		___lltoft
;;		___ftneg
;;		___ftadd
;;		___lmul
;;		___ftmul
;;		_lcd_puts
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text769
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	219
	global	__size_of_lcd_putnumf
	__size_of_lcd_putnumf	equ	__end_of_lcd_putnumf-_lcd_putnumf
	
_lcd_putnumf:	
	opt	stack 3
; Regs used in _lcd_putnumf: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	221
	
l4482:	
;Untitled.c: 220: char buffer[16];
;Untitled.c: 221: unsigned char i = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(lcd_putnumf@i)^080h
	line	224
	
l4484:	
;Untitled.c: 224: unsigned long int_part = (unsigned long)num;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_putnumf@num),w
	movwf	(?___fttol)
	movf	(lcd_putnumf@num+1),w
	movwf	(?___fttol+1)
	movf	(lcd_putnumf@num+2),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(3+(?___fttol)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@int_part+3)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(2+(?___fttol)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@int_part+2)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___fttol)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@int_part+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___fttol)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@int_part)^080h

	line	225
	
l4486:	
;Untitled.c: 225: if (int_part == 0) {
	movf	(lcd_putnumf@int_part+3)^080h,w
	iorwf	(lcd_putnumf@int_part+2)^080h,w
	iorwf	(lcd_putnumf@int_part+1)^080h,w
	iorwf	(lcd_putnumf@int_part)^080h,w
	skipz
	goto	u4631
	goto	u4630
u4631:
	goto	l4498
u4630:
	line	226
	
l4488:	
;Untitled.c: 226: buffer[i++] = '0';
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_lcd_putnumf+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@i)^080h,w
	addlw	lcd_putnumf@buffer&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_lcd_putnumf+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
l4490:	
	movlw	(01h)
	movwf	(??_lcd_putnumf+0)+0
	movf	(??_lcd_putnumf+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(lcd_putnumf@i)^080h,f
	line	227
;Untitled.c: 227: } else {
	goto	l760
	
l759:	
	line	228
;Untitled.c: 228: while (int_part > 0) {
	goto	l4498
	
l762:	
	line	229
	
l4492:	
;Untitled.c: 229: buffer[i++] = (int_part % 10) + '0';
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___llmod+3)
	movlw	0
	movwf	(?___llmod+2)
	movlw	0
	movwf	(?___llmod+1)
	movlw	0Ah
	movwf	(?___llmod)

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@int_part+3)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	3+(?___llmod)+04h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@int_part+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	2+(?___llmod)+04h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@int_part+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(?___llmod)+04h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@int_part)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___llmod)+04h

	fcall	___llmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___llmod)))),w
	addlw	030h
	movwf	(??_lcd_putnumf+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@i)^080h,w
	addlw	lcd_putnumf@buffer&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_lcd_putnumf+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
l4494:	
	movlw	(01h)
	movwf	(??_lcd_putnumf+0)+0
	movf	(??_lcd_putnumf+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(lcd_putnumf@i)^080h,f
	line	230
	
l4496:	
;Untitled.c: 230: int_part /= 10;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	0
	movwf	(?___lldiv+1)
	movlw	0Ah
	movwf	(?___lldiv)

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@int_part+3)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	3+(?___lldiv)+04h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@int_part+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	2+(?___lldiv)+04h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@int_part+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(?___lldiv)+04h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@int_part)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(3+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@int_part+3)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(2+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@int_part+2)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@int_part+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@int_part)^080h

	goto	l4498
	line	231
	
l761:	
	line	228
	
l4498:	
	movf	(lcd_putnumf@int_part+3)^080h,w
	iorwf	(lcd_putnumf@int_part+2)^080h,w
	iorwf	(lcd_putnumf@int_part+1)^080h,w
	iorwf	(lcd_putnumf@int_part)^080h,w
	skipz
	goto	u4641
	goto	u4640
u4641:
	goto	l4492
u4640:
	goto	l760
	
l763:	
	line	232
	
l760:	
	line	235
;Untitled.c: 231: }
;Untitled.c: 232: }
;Untitled.c: 235: unsigned char start = 0, end = i - 1;
	clrf	(lcd_putnumf@start)^080h
	
l4500:	
	movf	(lcd_putnumf@i)^080h,w
	addlw	0FFh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_lcd_putnumf+0)+0
	movf	(??_lcd_putnumf+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@end)^080h
	line	236
;Untitled.c: 236: while (start < end) {
	goto	l4508
	
l765:	
	line	237
	
l4502:	
;Untitled.c: 237: char temp = buffer[start];
	movf	(lcd_putnumf@start)^080h,w
	addlw	lcd_putnumf@buffer&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_lcd_putnumf+0)+0
	movf	(??_lcd_putnumf+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@temp)^080h
	line	238
;Untitled.c: 238: buffer[start] = buffer[end];
	movf	(lcd_putnumf@end)^080h,w
	addlw	lcd_putnumf@buffer&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_lcd_putnumf+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@start)^080h,w
	addlw	lcd_putnumf@buffer&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_lcd_putnumf+0)+0,w
	movwf	indf
	line	239
;Untitled.c: 239: buffer[end] = temp;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@temp)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_lcd_putnumf+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@end)^080h,w
	addlw	lcd_putnumf@buffer&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_lcd_putnumf+0)+0,w
	movwf	indf
	line	240
	
l4504:	
;Untitled.c: 240: start++;
	movlw	(01h)
	movwf	(??_lcd_putnumf+0)+0
	movf	(??_lcd_putnumf+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(lcd_putnumf@start)^080h,f
	line	241
	
l4506:	
;Untitled.c: 241: end--;
	movlw	low(01h)
	subwf	(lcd_putnumf@end)^080h,f
	goto	l4508
	line	242
	
l764:	
	line	236
	
l4508:	
	movf	(lcd_putnumf@end)^080h,w
	subwf	(lcd_putnumf@start)^080h,w
	skipc
	goto	u4651
	goto	u4650
u4651:
	goto	l4502
u4650:
	goto	l4510
	
l766:	
	line	245
	
l4510:	
;Untitled.c: 242: }
;Untitled.c: 245: if (decimal_places > 0) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_putnumf@decimal_places),w
	skipz
	goto	u4660
	goto	l4540
u4660:
	line	246
	
l4512:	
;Untitled.c: 246: buffer[i++] = '.';
	movlw	(02Eh)
	movwf	(??_lcd_putnumf+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@i)^080h,w
	addlw	lcd_putnumf@buffer&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_lcd_putnumf+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
l4514:	
	movlw	(01h)
	movwf	(??_lcd_putnumf+0)+0
	movf	(??_lcd_putnumf+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(lcd_putnumf@i)^080h,f
	line	247
	
l4516:	
;Untitled.c: 247: float frac_part = num - (float)(unsigned long)num;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_putnumf@num),w
	movwf	(?___ftadd)
	movf	(lcd_putnumf@num+1),w
	movwf	(?___ftadd+1)
	movf	(lcd_putnumf@num+2),w
	movwf	(?___ftadd+2)
	movf	(lcd_putnumf@num),w
	movwf	(?___fttol)
	movf	(lcd_putnumf@num+1),w
	movwf	(?___fttol+1)
	movf	(lcd_putnumf@num+2),w
	movwf	(?___fttol+2)
	fcall	___fttol
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(3+(?___fttol)),w
	movwf	(?___lltoft+3)
	movf	(2+(?___fttol)),w
	movwf	(?___lltoft+2)
	movf	(1+(?___fttol)),w
	movwf	(?___lltoft+1)
	movf	(0+(?___fttol)),w
	movwf	(?___lltoft)

	fcall	___lltoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lltoft)),w
	movwf	(?___ftneg)
	movf	(1+(?___lltoft)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___lltoft)),w
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
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@frac_part)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___ftadd)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@frac_part+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(2+(?___ftadd)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@frac_part+2)^080h
	line	248
	
l4518:	
;Untitled.c: 248: unsigned long multiplier = 1;
	movlw	0
	movwf	(lcd_putnumf@multiplier+3)^080h
	movlw	0
	movwf	(lcd_putnumf@multiplier+2)^080h
	movlw	0
	movwf	(lcd_putnumf@multiplier+1)^080h
	movlw	01h
	movwf	(lcd_putnumf@multiplier)^080h

	line	249
	
l4520:	
;Untitled.c: 249: for (unsigned char j = 0; j < decimal_places; j++) {
	clrf	(lcd_putnumf@j)^080h
	goto	l4526
	
l769:	
	line	250
	
l4522:	
;Untitled.c: 250: multiplier *= 10;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lmul+3)
	movlw	0
	movwf	(?___lmul+2)
	movlw	0
	movwf	(?___lmul+1)
	movlw	0Ah
	movwf	(?___lmul)

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@multiplier+3)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	3+(?___lmul)+04h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@multiplier+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	2+(?___lmul)+04h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@multiplier+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(?___lmul)+04h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@multiplier)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___lmul)+04h

	fcall	___lmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(3+(?___lmul)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@multiplier+3)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(2+(?___lmul)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@multiplier+2)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lmul)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@multiplier+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lmul)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@multiplier)^080h

	line	249
	
l4524:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_lcd_putnumf+0)+0
	movf	(??_lcd_putnumf+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(lcd_putnumf@j)^080h,f
	goto	l4526
	
l768:	
	
l4526:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_putnumf@decimal_places),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(lcd_putnumf@j)^080h,w
	skipc
	goto	u4671
	goto	u4670
u4671:
	goto	l4522
u4670:
	goto	l4528
	
l770:	
	line	252
	
l4528:	
;Untitled.c: 251: }
;Untitled.c: 252: unsigned long frac = (unsigned long)(frac_part * multiplier + 0.5);
	movf	(lcd_putnumf@multiplier+3)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lltoft+3)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@multiplier+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lltoft+2)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@multiplier+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lltoft+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@multiplier)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lltoft)

	fcall	___lltoft
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lltoft)),w
	movwf	0+(?___ftmul)+03h
	movf	(1+(?___lltoft)),w
	movwf	1+(?___ftmul)+03h
	movf	(2+(?___lltoft)),w
	movwf	2+(?___ftmul)+03h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@frac_part)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftmul)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@frac_part+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftmul+1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@frac_part+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___ftmul)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___ftmul)),w
	movwf	2+(?___ftadd)+03h
	movlw	0x0
	movwf	(?___ftadd)
	movlw	0x0
	movwf	(?___ftadd+1)
	movlw	0x3f
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
	movf	(3+(?___fttol)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@frac+3)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(2+(?___fttol)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@frac+2)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___fttol)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@frac+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___fttol)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@frac)^080h

	line	253
;Untitled.c: 253: while (decimal_places > 0) {
	goto	l4538
	
l772:	
	line	254
	
l4530:	
;Untitled.c: 254: buffer[i++] = (frac % 10) + '0';
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?___llmod+3)
	movlw	0
	movwf	(?___llmod+2)
	movlw	0
	movwf	(?___llmod+1)
	movlw	0Ah
	movwf	(?___llmod)

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@frac+3)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	3+(?___llmod)+04h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@frac+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	2+(?___llmod)+04h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@frac+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(?___llmod)+04h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@frac)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___llmod)+04h

	fcall	___llmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(((0+(?___llmod)))),w
	addlw	030h
	movwf	(??_lcd_putnumf+0)+0
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@i)^080h,w
	addlw	lcd_putnumf@buffer&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_lcd_putnumf+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
l4532:	
	movlw	(01h)
	movwf	(??_lcd_putnumf+0)+0
	movf	(??_lcd_putnumf+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(lcd_putnumf@i)^080h,f
	line	255
	
l4534:	
;Untitled.c: 255: frac /= 10;
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lldiv+3)
	movlw	0
	movwf	(?___lldiv+2)
	movlw	0
	movwf	(?___lldiv+1)
	movlw	0Ah
	movwf	(?___lldiv)

	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@frac+3)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	3+(?___lldiv)+04h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@frac+2)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	2+(?___lldiv)+04h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@frac+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	1+(?___lldiv)+04h
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@frac)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___lldiv)+04h

	fcall	___lldiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(3+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@frac+3)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(2+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@frac+2)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@frac+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lldiv)),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(lcd_putnumf@frac)^080h

	line	256
	
l4536:	
;Untitled.c: 256: decimal_places--;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(lcd_putnumf@decimal_places),f
	goto	l4538
	line	257
	
l771:	
	line	253
	
l4538:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(lcd_putnumf@decimal_places),f
	skipz
	goto	u4681
	goto	u4680
u4681:
	goto	l4530
u4680:
	goto	l4540
	
l773:	
	goto	l4540
	line	258
	
l767:	
	line	261
	
l4540:	
;Untitled.c: 257: }
;Untitled.c: 258: }
;Untitled.c: 261: buffer[i] = '\0';
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(lcd_putnumf@i)^080h,w
	addlw	lcd_putnumf@buffer&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	line	262
	
l4542:	
;Untitled.c: 262: lcd_puts(buffer);
	movlw	(lcd_putnumf@buffer&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_lcd_puts)
	movlw	(0x1/2)
	movwf	(?_lcd_puts+1)
	fcall	_lcd_puts
	line	263
	
l774:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_putnumf
	__end_of_lcd_putnumf:
;; =============== function _lcd_putnumf ends ============

	signat	_lcd_putnumf,8312
	global	_lcd_puts
psect	text770,local,class=CODE,delta=2
global __ptext770
__ptext770:

;; *************** function _lcd_puts *****************
;; Defined at:
;;		line 206 in file "C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
;; Parameters:    Size  Location     Type
;;  str             2    8[BANK0 ] PTR const unsigned char 
;;		 -> lcd_putnumf@buffer(16), STR_7(3), STR_6(8), STR_5(6), 
;;		 -> STR_4(3), STR_3(8), STR_2(8), STR_1(6), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_main
;;		_lcd_putnumf
;; This function uses a non-reentrant model
;;
psect	text770
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	206
	global	__size_of_lcd_puts
	__size_of_lcd_puts	equ	__end_of_lcd_puts-_lcd_puts
	
_lcd_puts:	
	opt	stack 3
; Regs used in _lcd_puts: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	207
	
l4474:	
;Untitled.c: 207: while (*str) {
	goto	l4480
	
l751:	
	line	208
	
l4476:	
;Untitled.c: 208: lcd_data(*str++);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_puts@str+1),w
	movwf	btemp+1
	movf	(lcd_puts@str),w
	movwf	fsr0
	fcall	stringtab
	fcall	_lcd_data
	
l4478:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(lcd_puts@str),f
	skipnc
	incf	(lcd_puts@str+1),f
	movlw	high(01h)
	addwf	(lcd_puts@str+1),f
	goto	l4480
	line	209
	
l750:	
	line	207
	
l4480:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(lcd_puts@str+1),w
	movwf	btemp+1
	movf	(lcd_puts@str),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u4621
	goto	u4620
u4621:
	goto	l4476
u4620:
	goto	l753
	
l752:	
	line	210
	
l753:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_puts
	__end_of_lcd_puts:
;; =============== function _lcd_puts ends ============

	signat	_lcd_puts,4216
	global	_lcd_clear
psect	text771,local,class=CODE,delta=2
global __ptext771
__ptext771:

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 213 in file "C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
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
;;		_lcd_command
;;		_delay_ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text771
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	213
	global	__size_of_lcd_clear
	__size_of_lcd_clear	equ	__end_of_lcd_clear-_lcd_clear
	
_lcd_clear:	
	opt	stack 4
; Regs used in _lcd_clear: [wreg+status,2+status,0+pclath+cstack]
	line	214
	
l4472:	
;Untitled.c: 214: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	215
;Untitled.c: 215: delay_ms(2);
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay_ms)
	movlw	high(02h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	216
	
l756:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
;; =============== function _lcd_clear ends ============

	signat	_lcd_clear,88
	global	_set_pwm_frequency
psect	text772,local,class=CODE,delta=2
global __ptext772
__ptext772:

;; *************** function _set_pwm_frequency *****************
;; Defined at:
;;		line 122 in file "C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
;; Parameters:    Size  Location     Type
;;  freq            3   38[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  interrupt_in    3   47[BANK0 ] float 
;;  half_period     3   44[BANK0 ] float 
;;  period          3   41[BANK0 ] float 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       9       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0      12       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___ftdiv
;;		___fttol
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text772
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	122
	global	__size_of_set_pwm_frequency
	__size_of_set_pwm_frequency	equ	__end_of_set_pwm_frequency-_set_pwm_frequency
	
_set_pwm_frequency:	
	opt	stack 4
; Regs used in _set_pwm_frequency: [wreg+status,2+status,0+pclath+cstack]
	line	123
	
l4458:	
;Untitled.c: 123: if (freq == 0) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(set_pwm_frequency@freq+2),w
	iorwf	(set_pwm_frequency@freq+1),w
	iorwf	(set_pwm_frequency@freq),w
	skipz
	goto	u4611
	goto	u4610
u4611:
	goto	l4466
u4610:
	line	124
	
l4460:	
;Untitled.c: 124: target_count = 0;
	movlw	0
	movwf	(_target_count+3)	;volatile
	movlw	0
	movwf	(_target_count+2)	;volatile
	movlw	0
	movwf	(_target_count+1)	;volatile
	movlw	0
	movwf	(_target_count)	;volatile

	line	125
	
l4462:	
;Untitled.c: 125: PORTDbits.RD3 = 0;
	bcf	(8),3	;volatile
	goto	l730
	line	126
	
l4464:	
;Untitled.c: 126: return;
	goto	l730
	line	127
	
l729:	
	line	130
	
l4466:	
;Untitled.c: 127: }
;Untitled.c: 130: float period = 1.0 / freq;
	movf	(set_pwm_frequency@freq),w
	movwf	(?___ftdiv)
	movf	(set_pwm_frequency@freq+1),w
	movwf	(?___ftdiv+1)
	movf	(set_pwm_frequency@freq+2),w
	movwf	(?___ftdiv+2)
	movlw	0x0
	movwf	0+(?___ftdiv)+03h
	movlw	0x80
	movwf	1+(?___ftdiv)+03h
	movlw	0x3f
	movwf	2+(?___ftdiv)+03h
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	(set_pwm_frequency@period)
	movf	(1+(?___ftdiv)),w
	movwf	(set_pwm_frequency@period+1)
	movf	(2+(?___ftdiv)),w
	movwf	(set_pwm_frequency@period+2)
	line	131
;Untitled.c: 131: float half_period = period / 2.0;
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x40
	movwf	(?___ftdiv+2)
	movf	(set_pwm_frequency@period),w
	movwf	0+(?___ftdiv)+03h
	movf	(set_pwm_frequency@period+1),w
	movwf	1+(?___ftdiv)+03h
	movf	(set_pwm_frequency@period+2),w
	movwf	2+(?___ftdiv)+03h
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	(set_pwm_frequency@half_period)
	movf	(1+(?___ftdiv)),w
	movwf	(set_pwm_frequency@half_period+1)
	movf	(2+(?___ftdiv)),w
	movwf	(set_pwm_frequency@half_period+2)
	line	136
	
l4468:	
;Untitled.c: 136: float interrupt_interval = 0.000065536;
	movlw	0x70
	movwf	(set_pwm_frequency@interrupt_interval)
	movlw	0x89
	movwf	(set_pwm_frequency@interrupt_interval+1)
	movlw	0x38
	movwf	(set_pwm_frequency@interrupt_interval+2)
	line	137
	
l4470:	
;Untitled.c: 137: target_count = (unsigned long)(half_period / interrupt_interval);
	movf	(set_pwm_frequency@half_period),w
	movwf	0+(?___ftdiv)+03h
	movf	(set_pwm_frequency@half_period+1),w
	movwf	1+(?___ftdiv)+03h
	movf	(set_pwm_frequency@half_period+2),w
	movwf	2+(?___ftdiv)+03h
	movf	(set_pwm_frequency@interrupt_interval),w
	movwf	(?___ftdiv)
	movf	(set_pwm_frequency@interrupt_interval+1),w
	movwf	(?___ftdiv+1)
	movf	(set_pwm_frequency@interrupt_interval+2),w
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
	movf	(3+(?___fttol)),w
	movwf	(_target_count+3)	;volatile
	movf	(2+(?___fttol)),w
	movwf	(_target_count+2)	;volatile
	movf	(1+(?___fttol)),w
	movwf	(_target_count+1)	;volatile
	movf	(0+(?___fttol)),w
	movwf	(_target_count)	;volatile

	line	138
	
l730:	
	return
	opt stack 0
GLOBAL	__end_of_set_pwm_frequency
	__end_of_set_pwm_frequency:
;; =============== function _set_pwm_frequency ends ============

	signat	_set_pwm_frequency,4216
	global	_lcd_init
psect	text773,local,class=CODE,delta=2
global __ptext773
__ptext773:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 149 in file "C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
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
;;		_delay_ms
;;		_lcd_command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text773
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	149
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 4
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	150
	
l4456:	
;Untitled.c: 150: delay_ms(50);
	movlw	low(032h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay_ms)
	movlw	high(032h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	151
;Untitled.c: 151: lcd_command(0x02);
	movlw	(02h)
	fcall	_lcd_command
	line	152
;Untitled.c: 152: lcd_command(0x28);
	movlw	(028h)
	fcall	_lcd_command
	line	153
;Untitled.c: 153: lcd_command(0x0C);
	movlw	(0Ch)
	fcall	_lcd_command
	line	154
;Untitled.c: 154: lcd_command(0x06);
	movlw	(06h)
	fcall	_lcd_command
	line	155
;Untitled.c: 155: lcd_command(0x01);
	movlw	(01h)
	fcall	_lcd_command
	line	156
;Untitled.c: 156: delay_ms(2);
	movlw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_delay_ms)
	movlw	high(02h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	157
	
l741:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_putc
psect	text774,local,class=CODE,delta=2
global __ptext774
__ptext774:

;; *************** function _lcd_putc *****************
;; Defined at:
;;		line 48 in file "C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    8[BANK0 ] unsigned char 
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
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text774
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	48
	global	__size_of_lcd_putc
	__size_of_lcd_putc	equ	__end_of_lcd_putc-_lcd_putc
	
_lcd_putc:	
	opt	stack 4
; Regs used in _lcd_putc: [wreg+status,2+status,0+pclath+cstack]
;lcd_putc@c stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_putc@c)
	line	49
	
l4454:	
;Untitled.c: 49: lcd_data(c);
	movf	(lcd_putc@c),w
	fcall	_lcd_data
	line	50
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_putc
	__end_of_lcd_putc:
;; =============== function _lcd_putc ends ============

	signat	_lcd_putc,4216
	global	___lltoft
psect	text775,local,class=CODE,delta=2
global __ptext775
__ptext775:

;; *************** function ___lltoft *****************
;; Defined at:
;;		line 36 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lltoft.c"
;; Parameters:    Size  Location     Type
;;  c               4   25[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  exp             1   30[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   25[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_lcd_putnumf
;; This function uses a non-reentrant model
;;
psect	text775
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lltoft.c"
	line	36
	global	__size_of___lltoft
	__size_of___lltoft	equ	__end_of___lltoft-___lltoft
	
___lltoft:	
	opt	stack 4
; Regs used in ___lltoft: [wreg+status,2+status,0+pclath+cstack]
	line	38
	
l4444:	
	movlw	(08Eh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??___lltoft+0)+0
	movf	(??___lltoft+0)+0,w
	movwf	(___lltoft@exp)
	line	41
	goto	l4448
	
l1712:	
	line	42
	
l4446:	
	movlw	01h
u4595:
	clrc
	rrf	(___lltoft@c+3),f
	rrf	(___lltoft@c+2),f
	rrf	(___lltoft@c+1),f
	rrf	(___lltoft@c),f
	addlw	-1
	skipz
	goto	u4595

	line	43
	movlw	(01h)
	movwf	(??___lltoft+0)+0
	movf	(??___lltoft+0)+0,w
	addwf	(___lltoft@exp),f
	goto	l4448
	line	44
	
l1711:	
	line	41
	
l4448:	
	movlw	high highword(-16777216)
	andwf	(___lltoft@c+3),w
	btfss	status,2
	goto	u4601
	goto	u4600
u4601:
	goto	l4446
u4600:
	goto	l4450
	
l1713:	
	line	45
	
l4450:	
	movf	(___lltoft@c),w
	movwf	(?___ftpack)
	movf	(___lltoft@c+1),w
	movwf	(?___ftpack+1)
	movf	(___lltoft@c+2),w
	movwf	(?___ftpack+2)
	movf	(___lltoft@exp),w
	movwf	(??___lltoft+0)+0
	movf	(??___lltoft+0)+0,w
	movwf	0+(?___ftpack)+03h
	clrf	0+(?___ftpack)+04h
	fcall	___ftpack
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftpack)),w
	movwf	(?___lltoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___lltoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___lltoft+2)
	goto	l1714
	
l4452:	
	line	46
	
l1714:	
	return
	opt stack 0
GLOBAL	__end_of___lltoft
	__end_of___lltoft:
;; =============== function ___lltoft ends ============

	signat	___lltoft,4219
	global	___ftmul
psect	text776,local,class=CODE,delta=2
global __ptext776
__ptext776:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3   31[BANK0 ] float 
;;  f2              3   34[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   42[BANK0 ] unsigned um
;;  sign            1   46[BANK0 ] unsigned char 
;;  cntr            1   45[BANK0 ] unsigned char 
;;  exp             1   41[BANK0 ] unsigned char 
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
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_lcd_putnumf
;; This function uses a non-reentrant model
;;
psect	text776
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 4
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l4394:	
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
	goto	u4451
	goto	u4450
u4451:
	goto	l4400
u4450:
	line	57
	
l4396:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l1573
	
l4398:	
	goto	l1573
	
l1572:	
	line	58
	
l4400:	
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
	goto	u4461
	goto	u4460
u4461:
	goto	l4406
u4460:
	line	59
	
l4402:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l1573
	
l4404:	
	goto	l1573
	
l1574:	
	line	60
	
l4406:	
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
u4475:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u4470:
	addlw	-1
	skipz
	goto	u4475
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
u4485:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u4480:
	addlw	-1
	skipz
	goto	u4485
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
	
l4408:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l4410:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l4412:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l4414:	
	movlw	0
	movwf	(___ftmul@f3_as_product)
	movlw	0
	movwf	(___ftmul@f3_as_product+1)
	movlw	0
	movwf	(___ftmul@f3_as_product+2)
	line	69
	
l4416:	
	movlw	(07h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l4418
	line	70
	
l1575:	
	line	71
	
l4418:	
	btfss	(___ftmul@f1),(0)&7
	goto	u4491
	goto	u4490
u4491:
	goto	l4422
u4490:
	line	72
	
l4420:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u4501
	addwf	(___ftmul@f3_as_product+1),f
u4501:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u4502
	addwf	(___ftmul@f3_as_product+2),f
u4502:

	goto	l4422
	
l1576:	
	line	73
	
l4422:	
	movlw	01h
u4515:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u4515

	line	74
	
l4424:	
	movlw	01h
u4525:
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	addlw	-1
	skipz
	goto	u4525
	line	75
	
l4426:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u4531
	goto	u4530
u4531:
	goto	l4418
u4530:
	goto	l4428
	
l1577:	
	line	76
	
l4428:	
	movlw	(09h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l4430
	line	77
	
l1578:	
	line	78
	
l4430:	
	btfss	(___ftmul@f1),(0)&7
	goto	u4541
	goto	u4540
u4541:
	goto	l4434
u4540:
	line	79
	
l4432:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u4551
	addwf	(___ftmul@f3_as_product+1),f
u4551:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u4552
	addwf	(___ftmul@f3_as_product+2),f
u4552:

	goto	l4434
	
l1579:	
	line	80
	
l4434:	
	movlw	01h
u4565:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u4565

	line	81
	
l4436:	
	movlw	01h
u4575:
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	addlw	-1
	skipz
	goto	u4575

	line	82
	
l4438:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u4581
	goto	u4580
u4581:
	goto	l4430
u4580:
	goto	l4440
	
l1580:	
	line	83
	
l4440:	
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
	goto	l1573
	
l4442:	
	line	84
	
l1573:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	___ftdiv
psect	text777,local,class=CODE,delta=2
global __ptext777
__ptext777:

;; *************** function ___ftdiv *****************
;; Defined at:
;;		line 50 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftdiv.c"
;; Parameters:    Size  Location     Type
;;  f2              3   22[BANK0 ] float 
;;  f1              3   25[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3              3   33[BANK0 ] float 
;;  sign            1   37[BANK0 ] unsigned char 
;;  exp             1   36[BANK0 ] unsigned char 
;;  cntr            1   32[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   22[BANK0 ] float 
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
;;		_set_pwm_frequency
;; This function uses a non-reentrant model
;;
psect	text777
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftdiv.c"
	line	50
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:	
	opt	stack 4
; Regs used in ___ftdiv: [wreg+status,2+status,0+pclath+cstack]
	line	55
	
l4352:	
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
	goto	u4371
	goto	u4370
u4371:
	goto	l4358
u4370:
	line	56
	
l4354:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	l1563
	
l4356:	
	goto	l1563
	
l1562:	
	line	57
	
l4358:	
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
	goto	u4381
	goto	u4380
u4381:
	goto	l4364
u4380:
	line	58
	
l4360:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	l1563
	
l4362:	
	goto	l1563
	
l1564:	
	line	59
	
l4364:	
	movlw	0
	movwf	(___ftdiv@f3)
	movlw	0
	movwf	(___ftdiv@f3+1)
	movlw	0
	movwf	(___ftdiv@f3+2)
	line	60
	
l4366:	
	movlw	(089h)
	addwf	(___ftdiv@sign),w
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	subwf	(___ftdiv@exp),f
	line	61
	
l4368:	
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u4395:
	clrc
	rrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u4390:
	addlw	-1
	skipz
	goto	u4395
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@sign)
	line	62
	
l4370:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u4405:
	clrc
	rrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u4400:
	addlw	-1
	skipz
	goto	u4405
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	xorwf	(___ftdiv@sign),f
	line	63
	
l4372:	
	movlw	(080h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	andwf	(___ftdiv@sign),f
	line	64
	
l4374:	
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	65
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	66
	
l4376:	
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
	goto	l4378
	line	69
	
l1565:	
	line	70
	
l4378:	
	movlw	01h
u4415:
	clrc
	rlf	(___ftdiv@f3),f
	rlf	(___ftdiv@f3+1),f
	rlf	(___ftdiv@f3+2),f
	addlw	-1
	skipz
	goto	u4415
	line	71
	
l4380:	
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u4425
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u4425
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u4425:
	skipc
	goto	u4421
	goto	u4420
u4421:
	goto	l4386
u4420:
	line	72
	
l4382:	
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
	
l4384:	
	bsf	(___ftdiv@f3)+(0/8),(0)&7
	goto	l4386
	line	74
	
l1566:	
	line	75
	
l4386:	
	movlw	01h
u4435:
	clrc
	rlf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	addlw	-1
	skipz
	goto	u4435
	line	76
	
l4388:	
	movlw	low(01h)
	subwf	(___ftdiv@cntr),f
	btfss	status,2
	goto	u4441
	goto	u4440
u4441:
	goto	l4378
u4440:
	goto	l4390
	
l1567:	
	line	77
	
l4390:	
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
	goto	l1563
	
l4392:	
	line	78
	
l1563:	
	return
	opt stack 0
GLOBAL	__end_of___ftdiv
	__end_of___ftdiv:
;; =============== function ___ftdiv ends ============

	signat	___ftdiv,8315
	global	___ftadd
psect	text778,local,class=CODE,delta=2
global __ptext778
__ptext778:

;; *************** function ___ftadd *****************
;; Defined at:
;;		line 87 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftadd.c"
;; Parameters:    Size  Location     Type
;;  f1              3   47[BANK0 ] float 
;;  f2              3   50[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  exp1            1   59[BANK0 ] unsigned char 
;;  exp2            1   58[BANK0 ] unsigned char 
;;  sign            1   57[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   47[BANK0 ] float 
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
;;		_lcd_putnumf
;;		___ftsub
;; This function uses a non-reentrant model
;;
psect	text778
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftadd.c"
	line	87
	global	__size_of___ftadd
	__size_of___ftadd	equ	__end_of___ftadd-___ftadd
	
___ftadd:	
	opt	stack 4
; Regs used in ___ftadd: [wreg+status,2+status,0+pclath+cstack]
	line	90
	
l4282:	
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
	
l4284:	
	movf	(___ftadd@exp1),w
	skipz
	goto	u4130
	goto	l4290
u4130:
	
l4286:	
	movf	(___ftadd@exp2),w
	subwf	(___ftadd@exp1),w
	skipnc
	goto	u4141
	goto	u4140
u4141:
	goto	l4294
u4140:
	
l4288:	
	decf	(___ftadd@exp1),w
	xorlw	0ffh
	addwf	(___ftadd@exp2),w
	movwf	(??___ftadd+0)+0
	movlw	(019h)
	subwf	0+(??___ftadd+0)+0,w
	skipc
	goto	u4151
	goto	u4150
u4151:
	goto	l4294
u4150:
	goto	l4290
	
l1520:	
	line	93
	
l4290:	
	movf	(___ftadd@f2),w
	movwf	(?___ftadd)
	movf	(___ftadd@f2+1),w
	movwf	(?___ftadd+1)
	movf	(___ftadd@f2+2),w
	movwf	(?___ftadd+2)
	goto	l1521
	
l4292:	
	goto	l1521
	
l1518:	
	line	94
	
l4294:	
	movf	(___ftadd@exp2),w
	skipz
	goto	u4160
	goto	l1524
u4160:
	
l4296:	
	movf	(___ftadd@exp1),w
	subwf	(___ftadd@exp2),w
	skipnc
	goto	u4171
	goto	u4170
u4171:
	goto	l4300
u4170:
	
l4298:	
	decf	(___ftadd@exp2),w
	xorlw	0ffh
	addwf	(___ftadd@exp1),w
	movwf	(??___ftadd+0)+0
	movlw	(019h)
	subwf	0+(??___ftadd+0)+0,w
	skipc
	goto	u4181
	goto	u4180
u4181:
	goto	l4300
u4180:
	
l1524:	
	line	95
	goto	l1521
	
l1522:	
	line	96
	
l4300:	
	movlw	(06h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	movwf	(___ftadd@sign)
	line	97
	
l4302:	
	btfss	(___ftadd@f1+2),(23)&7
	goto	u4191
	goto	u4190
u4191:
	goto	l1525
u4190:
	line	98
	
l4304:	
	bsf	(___ftadd@sign)+(7/8),(7)&7
	
l1525:	
	line	99
	btfss	(___ftadd@f2+2),(23)&7
	goto	u4201
	goto	u4200
u4201:
	goto	l1526
u4200:
	line	100
	
l4306:	
	bsf	(___ftadd@sign)+(6/8),(6)&7
	
l1526:	
	line	101
	bsf	(___ftadd@f1)+(15/8),(15)&7
	line	102
	
l4308:	
	movlw	0FFh
	andwf	(___ftadd@f1),f
	movlw	0FFh
	andwf	(___ftadd@f1+1),f
	movlw	0
	andwf	(___ftadd@f1+2),f
	line	103
	
l4310:	
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
	goto	u4211
	goto	u4210
u4211:
	goto	l4322
u4210:
	goto	l4312
	line	109
	
l1528:	
	line	110
	
l4312:	
	movlw	01h
u4225:
	clrc
	rlf	(___ftadd@f2),f
	rlf	(___ftadd@f2+1),f
	rlf	(___ftadd@f2+2),f
	addlw	-1
	skipz
	goto	u4225
	line	111
	movlw	low(01h)
	subwf	(___ftadd@exp2),f
	line	112
	
l4314:	
	movf	(___ftadd@exp2),w
	xorwf	(___ftadd@exp1),w
	skipnz
	goto	u4231
	goto	u4230
u4231:
	goto	l4320
u4230:
	
l4316:	
	movlw	low(01h)
	subwf	(___ftadd@sign),f
	movf	((___ftadd@sign)),w
	andlw	07h
	btfss	status,2
	goto	u4241
	goto	u4240
u4241:
	goto	l4312
u4240:
	goto	l4320
	
l1530:	
	goto	l4320
	
l1531:	
	line	113
	goto	l4320
	
l1533:	
	line	114
	
l4318:	
	movlw	01h
u4255:
	clrc
	rrf	(___ftadd@f1+2),f
	rrf	(___ftadd@f1+1),f
	rrf	(___ftadd@f1),f
	addlw	-1
	skipz
	goto	u4255

	line	115
	movlw	(01h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	addwf	(___ftadd@exp1),f
	goto	l4320
	line	116
	
l1532:	
	line	113
	
l4320:	
	movf	(___ftadd@exp1),w
	xorwf	(___ftadd@exp2),w
	skipz
	goto	u4261
	goto	u4260
u4261:
	goto	l4318
u4260:
	goto	l1535
	
l1534:	
	line	117
	goto	l1535
	
l1527:	
	
l4322:	
	movf	(___ftadd@exp1),w
	subwf	(___ftadd@exp2),w
	skipnc
	goto	u4271
	goto	u4270
u4271:
	goto	l1535
u4270:
	goto	l4324
	line	120
	
l1537:	
	line	121
	
l4324:	
	movlw	01h
u4285:
	clrc
	rlf	(___ftadd@f1),f
	rlf	(___ftadd@f1+1),f
	rlf	(___ftadd@f1+2),f
	addlw	-1
	skipz
	goto	u4285
	line	122
	movlw	low(01h)
	subwf	(___ftadd@exp1),f
	line	123
	
l4326:	
	movf	(___ftadd@exp2),w
	xorwf	(___ftadd@exp1),w
	skipnz
	goto	u4291
	goto	u4290
u4291:
	goto	l4332
u4290:
	
l4328:	
	movlw	low(01h)
	subwf	(___ftadd@sign),f
	movf	((___ftadd@sign)),w
	andlw	07h
	btfss	status,2
	goto	u4301
	goto	u4300
u4301:
	goto	l4324
u4300:
	goto	l4332
	
l1539:	
	goto	l4332
	
l1540:	
	line	124
	goto	l4332
	
l1542:	
	line	125
	
l4330:	
	movlw	01h
u4315:
	clrc
	rrf	(___ftadd@f2+2),f
	rrf	(___ftadd@f2+1),f
	rrf	(___ftadd@f2),f
	addlw	-1
	skipz
	goto	u4315

	line	126
	movlw	(01h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	addwf	(___ftadd@exp2),f
	goto	l4332
	line	127
	
l1541:	
	line	124
	
l4332:	
	movf	(___ftadd@exp1),w
	xorwf	(___ftadd@exp2),w
	skipz
	goto	u4321
	goto	u4320
u4321:
	goto	l4330
u4320:
	goto	l1535
	
l1543:	
	goto	l1535
	line	128
	
l1536:	
	line	129
	
l1535:	
	btfss	(___ftadd@sign),(7)&7
	goto	u4331
	goto	u4330
u4331:
	goto	l4336
u4330:
	line	131
	
l4334:	
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
	goto	l4336
	line	133
	
l1544:	
	line	134
	
l4336:	
	btfss	(___ftadd@sign),(6)&7
	goto	u4341
	goto	u4340
u4341:
	goto	l4340
u4340:
	line	136
	
l4338:	
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
	goto	l4340
	line	138
	
l1545:	
	line	139
	
l4340:	
	clrf	(___ftadd@sign)
	line	140
	movf	(___ftadd@f1),w
	addwf	(___ftadd@f2),f
	movf	(___ftadd@f1+1),w
	clrz
	skipnc
	incf	(___ftadd@f1+1),w
	skipnz
	goto	u4351
	addwf	(___ftadd@f2+1),f
u4351:
	movf	(___ftadd@f1+2),w
	clrz
	skipnc
	incf	(___ftadd@f1+2),w
	skipnz
	goto	u4352
	addwf	(___ftadd@f2+2),f
u4352:

	line	141
	
l4342:	
	btfss	(___ftadd@f2+2),(23)&7
	goto	u4361
	goto	u4360
u4361:
	goto	l4348
u4360:
	line	142
	
l4344:	
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
	
l4346:	
	clrf	(___ftadd@sign)
	bsf	status,0
	rlf	(___ftadd@sign),f
	goto	l4348
	line	145
	
l1546:	
	line	146
	
l4348:	
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
	goto	l1521
	
l4350:	
	line	148
	
l1521:	
	return
	opt stack 0
GLOBAL	__end_of___ftadd
	__end_of___ftadd:
;; =============== function ___ftadd ends ============

	signat	___ftadd,8315
	global	_lcd_command
psect	text779,local,class=CODE,delta=2
global __ptext779
__ptext779:

;; *************** function _lcd_command *****************
;; Defined at:
;;		line 160 in file "C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
;; Parameters:    Size  Location     Type
;;  cmd             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  cmd             1    7[BANK0 ] unsigned char 
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
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay_ms
;; This function is called by:
;;		_lcd_init
;;		_lcd_clear
;; This function uses a non-reentrant model
;;
psect	text779
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	160
	global	__size_of_lcd_command
	__size_of_lcd_command	equ	__end_of_lcd_command-_lcd_command
	
_lcd_command:	
	opt	stack 4
; Regs used in _lcd_command: [wreg+status,2+status,0+pclath+cstack]
;lcd_command@cmd stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_command@cmd)
	line	161
	
l4264:	
;Untitled.c: 161: PORTDbits.RD0 = 0;
	bcf	(8),0	;volatile
	line	162
;Untitled.c: 162: PORTDbits.RD1 = 0;
	bcf	(8),1	;volatile
	line	163
;Untitled.c: 163: PORTDbits.RD2 = 1;
	bsf	(8),2	;volatile
	line	164
	
l4266:	
;Untitled.c: 164: PORTDbits.RD4 = (cmd & 0x10) ? 1 : 0;
	movlw	0
	btfsc	(lcd_command@cmd),(4)&7
	movlw	1
	movwf	(??_lcd_command+0)+0
	swapf	(??_lcd_command+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_lcd_command+0)+0,w
	andlw	not (((1<<1)-1)<<4)
	xorwf	(??_lcd_command+0)+0,w
	movwf	(8)	;volatile
	line	165
;Untitled.c: 165: PORTDbits.RD5 = (cmd & 0x20) ? 1 : 0;
	movlw	0
	btfsc	(lcd_command@cmd),(5)&7
	movlw	1
	movwf	(??_lcd_command+0)+0
	swapf	(??_lcd_command+0)+0,f
	rlf	(??_lcd_command+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_lcd_command+0)+0,w
	andlw	not (((1<<1)-1)<<5)
	xorwf	(??_lcd_command+0)+0,w
	movwf	(8)	;volatile
	line	166
;Untitled.c: 166: PORTDbits.RD6 = (cmd & 0x40) ? 1 : 0;
	movlw	0
	btfsc	(lcd_command@cmd),(6)&7
	movlw	1
	movwf	(??_lcd_command+0)+0
	swapf	(??_lcd_command+0)+0,f
	rlf	(??_lcd_command+0)+0,f
	rlf	(??_lcd_command+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_lcd_command+0)+0,w
	andlw	not (((1<<1)-1)<<6)
	xorwf	(??_lcd_command+0)+0,w
	movwf	(8)	;volatile
	line	167
;Untitled.c: 167: PORTDbits.RD7 = (cmd & 0x80) ? 1 : 0;
	movlw	0
	btfsc	(lcd_command@cmd),(7)&7
	movlw	1
	movwf	(??_lcd_command+0)+0
	rrf	(??_lcd_command+0)+0,f
	rrf	(??_lcd_command+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_lcd_command+0)+0,w
	andlw	not (((1<<1)-1)<<7)
	xorwf	(??_lcd_command+0)+0,w
	movwf	(8)	;volatile
	line	168
	
l4268:	
;Untitled.c: 168: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	169
	
l4270:	
;Untitled.c: 169: PORTDbits.RD2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(8),2	;volatile
	line	170
	
l4272:	
;Untitled.c: 170: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	172
	
l4274:	
;Untitled.c: 172: PORTDbits.RD2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(8),2	;volatile
	line	173
;Untitled.c: 173: PORTDbits.RD4 = (cmd & 0x01) ? 1 : 0;
	movlw	0
	btfsc	(lcd_command@cmd),(0)&7
	movlw	1
	movwf	(??_lcd_command+0)+0
	swapf	(??_lcd_command+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_lcd_command+0)+0,w
	andlw	not (((1<<1)-1)<<4)
	xorwf	(??_lcd_command+0)+0,w
	movwf	(8)	;volatile
	line	174
;Untitled.c: 174: PORTDbits.RD5 = (cmd & 0x02) ? 1 : 0;
	movlw	0
	btfsc	(lcd_command@cmd),(1)&7
	movlw	1
	movwf	(??_lcd_command+0)+0
	swapf	(??_lcd_command+0)+0,f
	rlf	(??_lcd_command+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_lcd_command+0)+0,w
	andlw	not (((1<<1)-1)<<5)
	xorwf	(??_lcd_command+0)+0,w
	movwf	(8)	;volatile
	line	175
;Untitled.c: 175: PORTDbits.RD6 = (cmd & 0x04) ? 1 : 0;
	movlw	0
	btfsc	(lcd_command@cmd),(2)&7
	movlw	1
	movwf	(??_lcd_command+0)+0
	swapf	(??_lcd_command+0)+0,f
	rlf	(??_lcd_command+0)+0,f
	rlf	(??_lcd_command+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_lcd_command+0)+0,w
	andlw	not (((1<<1)-1)<<6)
	xorwf	(??_lcd_command+0)+0,w
	movwf	(8)	;volatile
	line	176
;Untitled.c: 176: PORTDbits.RD7 = (cmd & 0x08) ? 1 : 0;
	movlw	0
	btfsc	(lcd_command@cmd),(3)&7
	movlw	1
	movwf	(??_lcd_command+0)+0
	rrf	(??_lcd_command+0)+0,f
	rrf	(??_lcd_command+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_lcd_command+0)+0,w
	andlw	not (((1<<1)-1)<<7)
	xorwf	(??_lcd_command+0)+0,w
	movwf	(8)	;volatile
	line	177
	
l4276:	
;Untitled.c: 177: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	178
	
l4278:	
;Untitled.c: 178: PORTDbits.RD2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(8),2	;volatile
	line	179
	
l4280:	
;Untitled.c: 179: delay_ms(2);
	movlw	low(02h)
	movwf	(?_delay_ms)
	movlw	high(02h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	180
	
l744:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_command
	__end_of_lcd_command:
;; =============== function _lcd_command ends ============

	signat	_lcd_command,4216
	global	_keyboard_scan
psect	text780,local,class=CODE,delta=2
global __ptext780
__ptext780:

;; *************** function _keyboard_scan *****************
;; Defined at:
;;		line 266 in file "C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  col_val         1   14[BANK0 ] unsigned char 
;;  row_pins        4    8[BANK0 ] unsigned char [4]
;;  row             1   15[BANK0 ] unsigned char 
;;  col             1   13[BANK0 ] unsigned char 
;;  result          1   12[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       8       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0      10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay_ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text780
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	266
	global	__size_of_keyboard_scan
	__size_of_keyboard_scan	equ	__end_of_keyboard_scan-_keyboard_scan
	
_keyboard_scan:	
	opt	stack 5
; Regs used in _keyboard_scan: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	267
	
l4220:	
;Untitled.c: 267: unsigned char row, col, result = 0xFF;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_keyboard_scan+0)+0
	movf	(??_keyboard_scan+0)+0,w
	movwf	(keyboard_scan@result)
	line	268
;Untitled.c: 268: unsigned char row_pins[] = {0xEF, 0xDF, 0xBF, 0x7F};
	movf	(keyboard_scan@F1153+3),w
	movwf	(keyboard_scan@row_pins+3)
	movf	(keyboard_scan@F1153+2),w
	movwf	(keyboard_scan@row_pins+2)
	movf	(keyboard_scan@F1153+1),w
	movwf	(keyboard_scan@row_pins+1)
	movf	(keyboard_scan@F1153),w
	movwf	(keyboard_scan@row_pins)

	line	270
	
l4222:	
;Untitled.c: 270: for (row = 0; row < 4; row++) {
	clrf	(keyboard_scan@row)
	movlw	(04h)
	subwf	(keyboard_scan@row),w
	skipc
	goto	u4071
	goto	u4070
u4071:
	goto	l4226
u4070:
	goto	l4260
	
l4224:	
	goto	l4260
	
l779:	
	line	271
	
l4226:	
;Untitled.c: 271: PORTB = row_pins[row];
	movf	(keyboard_scan@row),w
	addlw	keyboard_scan@row_pins&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(6)	;volatile
	line	272
	
l4228:	
# 272 "C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
nop ;#
psect	text780
	line	273
	
l4230:	
;Untitled.c: 273: unsigned char col_val = PORTB & 0x0F;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(6),w
	andlw	0Fh
	movwf	(??_keyboard_scan+0)+0
	movf	(??_keyboard_scan+0)+0,w
	movwf	(keyboard_scan@col_val)
	line	275
	
l4232:	
;Untitled.c: 275: if (col_val != 0x0F) {
	movf	(keyboard_scan@col_val),w
	xorlw	0Fh
	skipnz
	goto	u4081
	goto	u4080
u4081:
	goto	l4256
u4080:
	line	277
	
l4234:	
;Untitled.c: 277: delay_ms(10);
	movlw	low(0Ah)
	movwf	(?_delay_ms)
	movlw	high(0Ah)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	278
	
l4236:	
;Untitled.c: 278: col_val = PORTB & 0x0F;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(6),w
	andlw	0Fh
	movwf	(??_keyboard_scan+0)+0
	movf	(??_keyboard_scan+0)+0,w
	movwf	(keyboard_scan@col_val)
	line	279
	
l4238:	
;Untitled.c: 279: if (col_val != 0x0F) {
	movf	(keyboard_scan@col_val),w
	xorlw	0Fh
	skipnz
	goto	u4091
	goto	u4090
u4091:
	goto	l4256
u4090:
	goto	l4250
	line	281
	
l4240:	
;Untitled.c: 281: switch (col_val) {
	goto	l4250
	line	282
;Untitled.c: 282: case 0x0E: col = 0; break;
	
l784:	
	clrf	(keyboard_scan@col)
	goto	l4252
	line	283
;Untitled.c: 283: case 0x0D: col = 1; break;
	
l786:	
	
l4242:	
	clrf	(keyboard_scan@col)
	bsf	status,0
	rlf	(keyboard_scan@col),f
	goto	l4252
	line	284
;Untitled.c: 284: case 0x0B: col = 2; break;
	
l787:	
	
l4244:	
	movlw	(02h)
	movwf	(??_keyboard_scan+0)+0
	movf	(??_keyboard_scan+0)+0,w
	movwf	(keyboard_scan@col)
	goto	l4252
	line	285
;Untitled.c: 285: case 0x07: col = 3; break;
	
l788:	
	
l4246:	
	movlw	(03h)
	movwf	(??_keyboard_scan+0)+0
	movf	(??_keyboard_scan+0)+0,w
	movwf	(keyboard_scan@col)
	goto	l4252
	line	286
;Untitled.c: 286: default: col = 0xFF;
	
l789:	
	
l4248:	
	movlw	(0FFh)
	movwf	(??_keyboard_scan+0)+0
	movf	(??_keyboard_scan+0)+0,w
	movwf	(keyboard_scan@col)
	line	287
;Untitled.c: 287: }
	goto	l4252
	line	281
	
l783:	
	
l4250:	
	movf	(keyboard_scan@col_val),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 7 to 14
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           35    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	7^0	; case 7
	skipnz
	goto	l4246
	xorlw	11^7	; case 11
	skipnz
	goto	l4244
	xorlw	13^11	; case 13
	skipnz
	goto	l4242
	xorlw	14^13	; case 14
	skipnz
	goto	l784
	goto	l4248
	opt asmopt_on

	line	287
	
l785:	
	line	288
	
l4252:	
;Untitled.c: 288: if (col != 0xFF) {
	movf	(keyboard_scan@col),w
	xorlw	0FFh
	skipnz
	goto	u4101
	goto	u4100
u4101:
	goto	l4256
u4100:
	line	289
	
l4254:	
;Untitled.c: 289: result = row * 4 + col;
	movf	(keyboard_scan@row),w
	movwf	(??_keyboard_scan+0)+0
	movlw	02h
u4115:
	clrc
	rlf	(??_keyboard_scan+0)+0,f
	addlw	-1
	skipz
	goto	u4115
	movf	(keyboard_scan@col),w
	addwf	0+(??_keyboard_scan+0)+0,w
	movwf	(??_keyboard_scan+1)+0
	movf	(??_keyboard_scan+1)+0,w
	movwf	(keyboard_scan@result)
	line	290
;Untitled.c: 290: break;
	goto	l4260
	line	291
	
l790:	
	goto	l4256
	line	292
	
l782:	
	goto	l4256
	line	293
	
l781:	
	line	270
	
l4256:	
	movlw	(01h)
	movwf	(??_keyboard_scan+0)+0
	movf	(??_keyboard_scan+0)+0,w
	addwf	(keyboard_scan@row),f
	
l4258:	
	movlw	(04h)
	subwf	(keyboard_scan@row),w
	skipc
	goto	u4121
	goto	u4120
u4121:
	goto	l4226
u4120:
	goto	l4260
	
l780:	
	line	295
	
l4260:	
;Untitled.c: 291: }
;Untitled.c: 292: }
;Untitled.c: 293: }
;Untitled.c: 294: }
;Untitled.c: 295: return result;
	movf	(keyboard_scan@result),w
	goto	l791
	
l4262:	
	line	296
	
l791:	
	return
	opt stack 0
GLOBAL	__end_of_keyboard_scan
	__end_of_keyboard_scan:
;; =============== function _keyboard_scan ends ============

	signat	_keyboard_scan,89
	global	_lcd_data
psect	text781,local,class=CODE,delta=2
global __ptext781
__ptext781:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 183 in file "C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    7[BANK0 ] unsigned char 
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
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay_ms
;; This function is called by:
;;		_lcd_putc
;;		_lcd_puts
;; This function uses a non-reentrant model
;;
psect	text781
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	183
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 4
; Regs used in _lcd_data: [wreg+status,2+status,0+pclath+cstack]
;lcd_data@data stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(lcd_data@data)
	line	184
	
l4202:	
;Untitled.c: 184: PORTDbits.RD0 = 1;
	bsf	(8),0	;volatile
	line	185
;Untitled.c: 185: PORTDbits.RD1 = 0;
	bcf	(8),1	;volatile
	line	186
;Untitled.c: 186: PORTDbits.RD2 = 1;
	bsf	(8),2	;volatile
	line	187
	
l4204:	
;Untitled.c: 187: PORTDbits.RD4 = (data & 0x10) ? 1 : 0;
	movlw	0
	btfsc	(lcd_data@data),(4)&7
	movlw	1
	movwf	(??_lcd_data+0)+0
	swapf	(??_lcd_data+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_lcd_data+0)+0,w
	andlw	not (((1<<1)-1)<<4)
	xorwf	(??_lcd_data+0)+0,w
	movwf	(8)	;volatile
	line	188
;Untitled.c: 188: PORTDbits.RD5 = (data & 0x20) ? 1 : 0;
	movlw	0
	btfsc	(lcd_data@data),(5)&7
	movlw	1
	movwf	(??_lcd_data+0)+0
	swapf	(??_lcd_data+0)+0,f
	rlf	(??_lcd_data+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_lcd_data+0)+0,w
	andlw	not (((1<<1)-1)<<5)
	xorwf	(??_lcd_data+0)+0,w
	movwf	(8)	;volatile
	line	189
;Untitled.c: 189: PORTDbits.RD6 = (data & 0x40) ? 1 : 0;
	movlw	0
	btfsc	(lcd_data@data),(6)&7
	movlw	1
	movwf	(??_lcd_data+0)+0
	swapf	(??_lcd_data+0)+0,f
	rlf	(??_lcd_data+0)+0,f
	rlf	(??_lcd_data+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_lcd_data+0)+0,w
	andlw	not (((1<<1)-1)<<6)
	xorwf	(??_lcd_data+0)+0,w
	movwf	(8)	;volatile
	line	190
;Untitled.c: 190: PORTDbits.RD7 = (data & 0x80) ? 1 : 0;
	movlw	0
	btfsc	(lcd_data@data),(7)&7
	movlw	1
	movwf	(??_lcd_data+0)+0
	rrf	(??_lcd_data+0)+0,f
	rrf	(??_lcd_data+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_lcd_data+0)+0,w
	andlw	not (((1<<1)-1)<<7)
	xorwf	(??_lcd_data+0)+0,w
	movwf	(8)	;volatile
	line	191
	
l4206:	
;Untitled.c: 191: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	192
	
l4208:	
;Untitled.c: 192: PORTDbits.RD2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(8),2	;volatile
	line	193
	
l4210:	
;Untitled.c: 193: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	195
	
l4212:	
;Untitled.c: 195: PORTDbits.RD2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(8),2	;volatile
	line	196
;Untitled.c: 196: PORTDbits.RD4 = (data & 0x01) ? 1 : 0;
	movlw	0
	btfsc	(lcd_data@data),(0)&7
	movlw	1
	movwf	(??_lcd_data+0)+0
	swapf	(??_lcd_data+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_lcd_data+0)+0,w
	andlw	not (((1<<1)-1)<<4)
	xorwf	(??_lcd_data+0)+0,w
	movwf	(8)	;volatile
	line	197
;Untitled.c: 197: PORTDbits.RD5 = (data & 0x02) ? 1 : 0;
	movlw	0
	btfsc	(lcd_data@data),(1)&7
	movlw	1
	movwf	(??_lcd_data+0)+0
	swapf	(??_lcd_data+0)+0,f
	rlf	(??_lcd_data+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_lcd_data+0)+0,w
	andlw	not (((1<<1)-1)<<5)
	xorwf	(??_lcd_data+0)+0,w
	movwf	(8)	;volatile
	line	198
;Untitled.c: 198: PORTDbits.RD6 = (data & 0x04) ? 1 : 0;
	movlw	0
	btfsc	(lcd_data@data),(2)&7
	movlw	1
	movwf	(??_lcd_data+0)+0
	swapf	(??_lcd_data+0)+0,f
	rlf	(??_lcd_data+0)+0,f
	rlf	(??_lcd_data+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_lcd_data+0)+0,w
	andlw	not (((1<<1)-1)<<6)
	xorwf	(??_lcd_data+0)+0,w
	movwf	(8)	;volatile
	line	199
;Untitled.c: 199: PORTDbits.RD7 = (data & 0x08) ? 1 : 0;
	movlw	0
	btfsc	(lcd_data@data),(3)&7
	movlw	1
	movwf	(??_lcd_data+0)+0
	rrf	(??_lcd_data+0)+0,f
	rrf	(??_lcd_data+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_lcd_data+0)+0,w
	andlw	not (((1<<1)-1)<<7)
	xorwf	(??_lcd_data+0)+0,w
	movwf	(8)	;volatile
	line	200
	
l4214:	
;Untitled.c: 200: delay_ms(1);
	movlw	low(01h)
	movwf	(?_delay_ms)
	movlw	high(01h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	201
	
l4216:	
;Untitled.c: 201: PORTDbits.RD2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(8),2	;volatile
	line	202
	
l4218:	
;Untitled.c: 202: delay_ms(2);
	movlw	low(02h)
	movwf	(?_delay_ms)
	movlw	high(02h)
	movwf	((?_delay_ms))+1
	fcall	_delay_ms
	line	203
	
l747:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	___lldiv
psect	text782,local,class=CODE,delta=2
global __ptext782
__ptext782:

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
;;		_lcd_putnumf
;; This function uses a non-reentrant model
;;
psect	text782
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lldiv.c"
	line	5
	global	__size_of___lldiv
	__size_of___lldiv	equ	__end_of___lldiv-___lldiv
	
___lldiv:	
	opt	stack 5
; Regs used in ___lldiv: [wreg+status,2+status,0]
	line	9
	
l4142:	
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
	goto	u3961
	goto	u3960
u3961:
	goto	l4162
u3960:
	line	11
	
l4144:	
	clrf	(___lldiv@counter)
	bsf	status,0
	rlf	(___lldiv@counter),f
	line	12
	goto	l4148
	
l1648:	
	line	13
	
l4146:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u3975:
	clrc
	rlf	(___lldiv@divisor),f
	rlf	(___lldiv@divisor+1),f
	rlf	(___lldiv@divisor+2),f
	rlf	(___lldiv@divisor+3),f
	decfsz	(??___lldiv+0)+0
	goto	u3975
	line	14
	movlw	(01h)
	movwf	(??___lldiv+0)+0
	movf	(??___lldiv+0)+0,w
	addwf	(___lldiv@counter),f
	goto	l4148
	line	15
	
l1647:	
	line	12
	
l4148:	
	btfss	(___lldiv@divisor+3),(31)&7
	goto	u3981
	goto	u3980
u3981:
	goto	l4146
u3980:
	goto	l4150
	
l1649:	
	goto	l4150
	line	16
	
l1650:	
	line	17
	
l4150:	
	movlw	01h
	movwf	(??___lldiv+0)+0
u3995:
	clrc
	rlf	(___lldiv@quotient),f
	rlf	(___lldiv@quotient+1),f
	rlf	(___lldiv@quotient+2),f
	rlf	(___lldiv@quotient+3),f
	decfsz	(??___lldiv+0)+0
	goto	u3995
	line	18
	
l4152:	
	movf	(___lldiv@divisor+3),w
	subwf	(___lldiv@dividend+3),w
	skipz
	goto	u4005
	movf	(___lldiv@divisor+2),w
	subwf	(___lldiv@dividend+2),w
	skipz
	goto	u4005
	movf	(___lldiv@divisor+1),w
	subwf	(___lldiv@dividend+1),w
	skipz
	goto	u4005
	movf	(___lldiv@divisor),w
	subwf	(___lldiv@dividend),w
u4005:
	skipc
	goto	u4001
	goto	u4000
u4001:
	goto	l4158
u4000:
	line	19
	
l4154:	
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
	
l4156:	
	bsf	(___lldiv@quotient)+(0/8),(0)&7
	goto	l4158
	line	21
	
l1651:	
	line	22
	
l4158:	
	movlw	01h
u4015:
	clrc
	rrf	(___lldiv@divisor+3),f
	rrf	(___lldiv@divisor+2),f
	rrf	(___lldiv@divisor+1),f
	rrf	(___lldiv@divisor),f
	addlw	-1
	skipz
	goto	u4015

	line	23
	
l4160:	
	movlw	low(01h)
	subwf	(___lldiv@counter),f
	btfss	status,2
	goto	u4021
	goto	u4020
u4021:
	goto	l4150
u4020:
	goto	l4162
	
l1652:	
	goto	l4162
	line	24
	
l1646:	
	line	25
	
l4162:	
	movf	(___lldiv@quotient+3),w
	movwf	(?___lldiv+3)
	movf	(___lldiv@quotient+2),w
	movwf	(?___lldiv+2)
	movf	(___lldiv@quotient+1),w
	movwf	(?___lldiv+1)
	movf	(___lldiv@quotient),w
	movwf	(?___lldiv)

	goto	l1653
	
l4164:	
	line	26
	
l1653:	
	return
	opt stack 0
GLOBAL	__end_of___lldiv
	__end_of___lldiv:
;; =============== function ___lldiv ends ============

	signat	___lldiv,8316
	global	___ftneg
psect	text783,local,class=CODE,delta=2
global __ptext783
__ptext783:

;; *************** function ___ftneg *****************
;; Defined at:
;;		line 16 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftneg.c"
;; Parameters:    Size  Location     Type
;;  f1              3   22[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3   22[BANK0 ] float 
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
;;		_lcd_putnumf
;; This function uses a non-reentrant model
;;
psect	text783
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftneg.c"
	line	16
	global	__size_of___ftneg
	__size_of___ftneg	equ	__end_of___ftneg-___ftneg
	
___ftneg:	
	opt	stack 5
; Regs used in ___ftneg: [wreg]
	line	17
	
l4134:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftneg@f1+2),w
	iorwf	(___ftneg@f1+1),w
	iorwf	(___ftneg@f1),w
	skipnz
	goto	u3951
	goto	u3950
u3951:
	goto	l4138
u3950:
	line	18
	
l4136:	
	movlw	080h
	xorwf	(___ftneg@f1+2),f
	goto	l4138
	
l1637:	
	line	19
	
l4138:	
	goto	l1638
	
l4140:	
	line	20
	
l1638:	
	return
	opt stack 0
GLOBAL	__end_of___ftneg
	__end_of___ftneg:
;; =============== function ___ftneg ends ============

	signat	___ftneg,4219
	global	___llmod
psect	text784,local,class=CODE,delta=2
global __ptext784
__ptext784:

;; *************** function ___llmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\llmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[BANK0 ] unsigned long 
;;  dividend        4    4[BANK0 ] unsigned long 
;; Auto vars:     Size  Location     Type
;;  counter         1    9[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0      10       0       0       0
;;Total ram usage:       10 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_putnumf
;; This function uses a non-reentrant model
;;
psect	text784
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\llmod.c"
	line	5
	global	__size_of___llmod
	__size_of___llmod	equ	__end_of___llmod-___llmod
	
___llmod:	
	opt	stack 5
; Regs used in ___llmod: [wreg+status,2+status,0]
	line	8
	
l4114:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___llmod@divisor+3),w
	iorwf	(___llmod@divisor+2),w
	iorwf	(___llmod@divisor+1),w
	iorwf	(___llmod@divisor),w
	skipnz
	goto	u3891
	goto	u3890
u3891:
	goto	l4130
u3890:
	line	9
	
l4116:	
	clrf	(___llmod@counter)
	bsf	status,0
	rlf	(___llmod@counter),f
	line	10
	goto	l4120
	
l1629:	
	line	11
	
l4118:	
	movlw	01h
	movwf	(??___llmod+0)+0
u3905:
	clrc
	rlf	(___llmod@divisor),f
	rlf	(___llmod@divisor+1),f
	rlf	(___llmod@divisor+2),f
	rlf	(___llmod@divisor+3),f
	decfsz	(??___llmod+0)+0
	goto	u3905
	line	12
	movlw	(01h)
	movwf	(??___llmod+0)+0
	movf	(??___llmod+0)+0,w
	addwf	(___llmod@counter),f
	goto	l4120
	line	13
	
l1628:	
	line	10
	
l4120:	
	btfss	(___llmod@divisor+3),(31)&7
	goto	u3911
	goto	u3910
u3911:
	goto	l4118
u3910:
	goto	l4122
	
l1630:	
	goto	l4122
	line	14
	
l1631:	
	line	15
	
l4122:	
	movf	(___llmod@divisor+3),w
	subwf	(___llmod@dividend+3),w
	skipz
	goto	u3925
	movf	(___llmod@divisor+2),w
	subwf	(___llmod@dividend+2),w
	skipz
	goto	u3925
	movf	(___llmod@divisor+1),w
	subwf	(___llmod@dividend+1),w
	skipz
	goto	u3925
	movf	(___llmod@divisor),w
	subwf	(___llmod@dividend),w
u3925:
	skipc
	goto	u3921
	goto	u3920
u3921:
	goto	l4126
u3920:
	line	16
	
l4124:	
	movf	(___llmod@divisor),w
	subwf	(___llmod@dividend),f
	movf	(___llmod@divisor+1),w
	skipc
	incfsz	(___llmod@divisor+1),w
	subwf	(___llmod@dividend+1),f
	movf	(___llmod@divisor+2),w
	skipc
	incfsz	(___llmod@divisor+2),w
	subwf	(___llmod@dividend+2),f
	movf	(___llmod@divisor+3),w
	skipc
	incfsz	(___llmod@divisor+3),w
	subwf	(___llmod@dividend+3),f
	goto	l4126
	
l1632:	
	line	17
	
l4126:	
	movlw	01h
u3935:
	clrc
	rrf	(___llmod@divisor+3),f
	rrf	(___llmod@divisor+2),f
	rrf	(___llmod@divisor+1),f
	rrf	(___llmod@divisor),f
	addlw	-1
	skipz
	goto	u3935

	line	18
	
l4128:	
	movlw	low(01h)
	subwf	(___llmod@counter),f
	btfss	status,2
	goto	u3941
	goto	u3940
u3941:
	goto	l4122
u3940:
	goto	l4130
	
l1633:	
	goto	l4130
	line	19
	
l1627:	
	line	20
	
l4130:	
	movf	(___llmod@dividend+3),w
	movwf	(?___llmod+3)
	movf	(___llmod@dividend+2),w
	movwf	(?___llmod+2)
	movf	(___llmod@dividend+1),w
	movwf	(?___llmod+1)
	movf	(___llmod@dividend),w
	movwf	(?___llmod)

	goto	l1634
	
l4132:	
	line	21
	
l1634:	
	return
	opt stack 0
GLOBAL	__end_of___llmod
	__end_of___llmod:
;; =============== function ___llmod ends ============

	signat	___llmod,8316
	global	___fttol
psect	text785,local,class=CODE,delta=2
global __ptext785
__ptext785:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  lval            4   17[BANK0 ] unsigned long 
;;  exp1            1   21[BANK0 ] unsigned char 
;;  sign1           1   16[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    8[BANK0 ] long 
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
;;		_set_pwm_frequency
;;		_lcd_putnumf
;; This function uses a non-reentrant model
;;
psect	text785
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 5
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l3426:	
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
	goto	u2701
	goto	u2700
u2701:
	goto	l3432
u2700:
	line	50
	
l3428:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l1584
	
l3430:	
	goto	l1584
	
l1583:	
	line	51
	
l3432:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u2715:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u2710:
	addlw	-1
	skipz
	goto	u2715
	movf	0+(??___fttol+0)+0,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l3434:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l3436:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l3438:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l3440:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l3442:	
	btfss	(___fttol@exp1),7
	goto	u2721
	goto	u2720
u2721:
	goto	l3452
u2720:
	line	57
	
l3444:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u2731
	goto	u2730
u2731:
	goto	l3450
u2730:
	line	58
	
l3446:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l1584
	
l3448:	
	goto	l1584
	
l1586:	
	goto	l3450
	line	59
	
l1587:	
	line	60
	
l3450:	
	movlw	01h
u2745:
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	addlw	-1
	skipz
	goto	u2745

	line	61
	movlw	(01h)
	movwf	(??___fttol+0)+0
	movf	(??___fttol+0)+0,w
	addwf	(___fttol@exp1),f
	btfss	status,2
	goto	u2751
	goto	u2750
u2751:
	goto	l3450
u2750:
	goto	l3462
	
l1588:	
	line	62
	goto	l3462
	
l1585:	
	line	63
	
l3452:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u2761
	goto	u2760
u2761:
	goto	l3460
u2760:
	line	64
	
l3454:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l1584
	
l3456:	
	goto	l1584
	
l1590:	
	line	65
	goto	l3460
	
l1592:	
	line	66
	
l3458:	
	movlw	01h
	movwf	(??___fttol+0)+0
u2775:
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	decfsz	(??___fttol+0)+0
	goto	u2775
	line	67
	movlw	low(01h)
	subwf	(___fttol@exp1),f
	goto	l3460
	line	68
	
l1591:	
	line	65
	
l3460:	
	movf	(___fttol@exp1),f
	skipz
	goto	u2781
	goto	u2780
u2781:
	goto	l3458
u2780:
	goto	l3462
	
l1593:	
	goto	l3462
	line	69
	
l1589:	
	line	70
	
l3462:	
	movf	(___fttol@sign1),w
	skipz
	goto	u2790
	goto	l3466
u2790:
	line	71
	
l3464:	
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
	goto	l3466
	
l1594:	
	line	72
	
l3466:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	goto	l1584
	
l3468:	
	line	73
	
l1584:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___lmul
psect	text786,local,class=CODE,delta=2
global __ptext786
__ptext786:

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
;;		_lcd_putnumf
;; This function uses a non-reentrant model
;;
psect	text786
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lmul.c"
	line	3
	global	__size_of___lmul
	__size_of___lmul	equ	__end_of___lmul-___lmul
	
___lmul:	
	opt	stack 5
; Regs used in ___lmul: [wreg+status,2+status,0]
	line	4
	
l4074:	
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

	goto	l4076
	line	6
	
l1549:	
	line	7
	
l4076:	
	btfss	(___lmul@multiplier),(0)&7
	goto	u3821
	goto	u3820
u3821:
	goto	l4080
u3820:
	line	8
	
l4078:	
	movf	(___lmul@multiplicand),w
	addwf	(___lmul@product),f
	movf	(___lmul@multiplicand+1),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3831
	addwf	(___lmul@product+1),f
u3831:
	movf	(___lmul@multiplicand+2),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3832
	addwf	(___lmul@product+2),f
u3832:
	movf	(___lmul@multiplicand+3),w
	clrz
	skipnc
	addlw	1
	skipnz
	goto	u3833
	addwf	(___lmul@product+3),f
u3833:

	goto	l4080
	
l1550:	
	line	9
	
l4080:	
	movlw	01h
	movwf	(??___lmul+0)+0
u3845:
	clrc
	rlf	(___lmul@multiplicand),f
	rlf	(___lmul@multiplicand+1),f
	rlf	(___lmul@multiplicand+2),f
	rlf	(___lmul@multiplicand+3),f
	decfsz	(??___lmul+0)+0
	goto	u3845
	line	10
	
l4082:	
	movlw	01h
u3855:
	clrc
	rrf	(___lmul@multiplier+3),f
	rrf	(___lmul@multiplier+2),f
	rrf	(___lmul@multiplier+1),f
	rrf	(___lmul@multiplier),f
	addlw	-1
	skipz
	goto	u3855

	line	11
	movf	(___lmul@multiplier+3),w
	iorwf	(___lmul@multiplier+2),w
	iorwf	(___lmul@multiplier+1),w
	iorwf	(___lmul@multiplier),w
	skipz
	goto	u3861
	goto	u3860
u3861:
	goto	l4076
u3860:
	goto	l4084
	
l1551:	
	line	12
	
l4084:	
	movf	(___lmul@product+3),w
	movwf	(?___lmul+3)
	movf	(___lmul@product+2),w
	movwf	(?___lmul+2)
	movf	(___lmul@product+1),w
	movwf	(?___lmul+1)
	movf	(___lmul@product),w
	movwf	(?___lmul)

	goto	l1552
	
l4086:	
	line	13
	
l1552:	
	return
	opt stack 0
GLOBAL	__end_of___lmul
	__end_of___lmul:
;; =============== function ___lmul ends ============

	signat	___lmul,8316
	global	___ftpack
psect	text787,local,class=CODE,delta=2
global __ptext787
__ptext787:

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
;;		___lltoft
;;		___lbtoft
;;		___abtoft
;;		___awtoft
;;		___lwtoft
;;		___altoft
;;		___attoft
;;		___lttoft
;; This function uses a non-reentrant model
;;
psect	text787
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 4
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l4044:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftpack@exp),w
	skipz
	goto	u3710
	goto	l4048
u3710:
	
l4046:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u3721
	goto	u3720
u3721:
	goto	l4054
u3720:
	goto	l4048
	
l1808:	
	line	65
	
l4048:	
	movlw	0x0
	movwf	(?___ftpack)
	movlw	0x0
	movwf	(?___ftpack+1)
	movlw	0x0
	movwf	(?___ftpack+2)
	goto	l1809
	
l4050:	
	goto	l1809
	
l1806:	
	line	66
	goto	l4054
	
l1811:	
	line	67
	
l4052:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	68
	movlw	01h
u3735:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u3735

	goto	l4054
	line	69
	
l1810:	
	line	66
	
l4054:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u3741
	goto	u3740
u3741:
	goto	l4052
u3740:
	goto	l1813
	
l1812:	
	line	70
	goto	l1813
	
l1814:	
	line	71
	
l4056:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	72
	
l4058:	
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
	
l4060:	
	movlw	01h
u3755:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u3755

	line	74
	
l1813:	
	line	70
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u3761
	goto	u3760
u3761:
	goto	l4056
u3760:
	goto	l4064
	
l1815:	
	line	75
	goto	l4064
	
l1817:	
	line	76
	
l4062:	
	movlw	low(01h)
	subwf	(___ftpack@exp),f
	line	77
	movlw	01h
u3775:
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	addlw	-1
	skipz
	goto	u3775
	goto	l4064
	line	78
	
l1816:	
	line	75
	
l4064:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u3781
	goto	u3780
u3781:
	goto	l4062
u3780:
	
l1818:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u3791
	goto	u3790
u3791:
	goto	l1819
u3790:
	line	80
	
l4066:	
	movlw	0FFh
	andwf	(___ftpack@arg),f
	movlw	07Fh
	andwf	(___ftpack@arg+1),f
	movlw	0FFh
	andwf	(___ftpack@arg+2),f
	
l1819:	
	line	81
	clrc
	rrf	(___ftpack@exp),f

	line	82
	
l4068:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+2)
	movlw	010h
u3805:
	clrc
	rlf	(??___ftpack+0)+0,f
	rlf	(??___ftpack+0)+1,f
	rlf	(??___ftpack+0)+2,f
u3800:
	addlw	-1
	skipz
	goto	u3805
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l4070:	
	movf	(___ftpack@sign),w
	skipz
	goto	u3810
	goto	l1820
u3810:
	line	84
	
l4072:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l1820:	
	line	85
	line	86
	
l1809:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	___bmul
psect	text788,local,class=CODE,delta=2
global __ptext788
__ptext788:

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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text788
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 6
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___bmul@multiplier)
	line	4
	
l4030:	
	clrf	(___bmul@product)
	line	6
	
l1468:	
	line	7
	btfss	(___bmul@multiplier),(0)&7
	goto	u3691
	goto	u3690
u3691:
	goto	l4034
u3690:
	line	8
	
l4032:	
	movf	(___bmul@multiplicand),w
	movwf	(??___bmul+0)+0
	movf	(??___bmul+0)+0,w
	addwf	(___bmul@product),f
	goto	l4034
	
l1469:	
	line	9
	
l4034:	
	clrc
	rlf	(___bmul@multiplicand),f

	line	10
	
l4036:	
	clrc
	rrf	(___bmul@multiplier),f

	line	11
	
l4038:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u3701
	goto	u3700
u3701:
	goto	l1468
u3700:
	goto	l4040
	
l1470:	
	line	12
	
l4040:	
	movf	(___bmul@product),w
	goto	l1471
	
l4042:	
	line	13
	
l1471:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_delay_ms
psect	text789,local,class=CODE,delta=2
global __ptext789
__ptext789:

;; *************** function _delay_ms *****************
;; Defined at:
;;		line 141 in file "C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
;; Parameters:    Size  Location     Type
;;  ms              2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  j               2    4[BANK0 ] unsigned int 
;;  i               2    2[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       6       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_init
;;		_lcd_command
;;		_lcd_data
;;		_lcd_clear
;;		_keyboard_scan
;; This function uses a non-reentrant model
;;
psect	text789
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	141
	global	__size_of_delay_ms
	__size_of_delay_ms	equ	__end_of_delay_ms-_delay_ms
	
_delay_ms:	
	opt	stack 4
; Regs used in _delay_ms: [wreg+status,2]
	line	143
	
l4018:	
;Untitled.c: 142: unsigned int i, j;
;Untitled.c: 143: for (i = 0; i < ms; i++) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(delay_ms@i)
	clrf	(delay_ms@i+1)
	goto	l733
	
l734:	
	line	144
	
l4020:	
;Untitled.c: 144: for (j = 0; j < 1200; j++);
	clrf	(delay_ms@j)
	clrf	(delay_ms@j+1)
	
l4022:	
	movlw	high(04B0h)
	subwf	(delay_ms@j+1),w
	movlw	low(04B0h)
	skipnz
	subwf	(delay_ms@j),w
	skipc
	goto	u3661
	goto	u3660
u3661:
	goto	l4026
u3660:
	goto	l4028
	
l4024:	
	goto	l4028
	
l735:	
	
l4026:	
	movlw	low(01h)
	addwf	(delay_ms@j),f
	skipnc
	incf	(delay_ms@j+1),f
	movlw	high(01h)
	addwf	(delay_ms@j+1),f
	movlw	high(04B0h)
	subwf	(delay_ms@j+1),w
	movlw	low(04B0h)
	skipnz
	subwf	(delay_ms@j),w
	skipc
	goto	u3671
	goto	u3670
u3671:
	goto	l4026
u3670:
	goto	l4028
	
l736:	
	line	143
	
l4028:	
	movlw	low(01h)
	addwf	(delay_ms@i),f
	skipnc
	incf	(delay_ms@i+1),f
	movlw	high(01h)
	addwf	(delay_ms@i+1),f
	
l733:	
	movf	(delay_ms@ms+1),w
	subwf	(delay_ms@i+1),w
	skipz
	goto	u3685
	movf	(delay_ms@ms),w
	subwf	(delay_ms@i),w
u3685:
	skipc
	goto	u3681
	goto	u3680
u3681:
	goto	l4020
u3680:
	goto	l738
	
l737:	
	line	146
	
l738:	
	return
	opt stack 0
GLOBAL	__end_of_delay_ms
	__end_of_delay_ms:
;; =============== function _delay_ms ends ============

	signat	_delay_ms,4216
	global	_isr
psect	text790,local,class=CODE,delta=2
global __ptext790
__ptext790:

;; *************** function _isr *****************
;; Defined at:
;;		line 108 in file "C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
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
psect	text790
	file	"C:\Users\may\OneDrive\WeiJi\Mplab_workspace\work_together1\Untitled.c"
	line	108
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 3
; Regs used in _isr: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_isr+1)
	movf	fsr0,w
	movwf	(??_isr+2)
	movf	pclath,w
	movwf	(??_isr+3)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_isr+4)
	ljmp	_isr
psect	text790
	line	109
	
i1l3338:	
;Untitled.c: 109: if (TMR0IF) {
	btfss	(90/8),(90)&7
	goto	u245_21
	goto	u245_20
u245_21:
	goto	i1l726
u245_20:
	line	110
	
i1l3340:	
;Untitled.c: 110: TMR0IF = 0;
	bcf	(90/8),(90)&7
	line	111
	
i1l3342:	
;Untitled.c: 111: TMR0 = 0;
	clrf	(1)	;volatile
	line	113
	
i1l3344:	
;Untitled.c: 113: timer_count++;
	movlw	01h
	addwf	(_timer_count),f	;volatile
	movlw	0
	skipnc
movlw 1
	addwf	(_timer_count+1),f	;volatile
	movlw	0
	skipnc
movlw 1
	addwf	(_timer_count+2),f	;volatile
	movlw	0
	skipnc
movlw 1
	addwf	(_timer_count+3),f	;volatile
	line	114
	
i1l3346:	
;Untitled.c: 114: if (timer_count >= target_count) {
	movf	(_target_count+3),w	;volatile
	subwf	(_timer_count+3),w	;volatile
	skipz
	goto	u246_25
	movf	(_target_count+2),w	;volatile
	subwf	(_timer_count+2),w	;volatile
	skipz
	goto	u246_25
	movf	(_target_count+1),w	;volatile
	subwf	(_timer_count+1),w	;volatile
	skipz
	goto	u246_25
	movf	(_target_count),w	;volatile
	subwf	(_timer_count),w	;volatile
u246_25:
	skipc
	goto	u246_21
	goto	u246_20
u246_21:
	goto	i1l726
u246_20:
	line	115
	
i1l3348:	
;Untitled.c: 115: PORTDbits.RD3 = !PORTDbits.RD3;
	movlw	0
	btfss	(8),3	;volatile
	movlw	1
	movwf	(??_isr+0)+0
	rlf	(??_isr+0)+0,f
	rlf	(??_isr+0)+0,f
	rlf	(??_isr+0)+0,f
	movf	(8),w	;volatile
	xorwf	(??_isr+0)+0,w
	andlw	not (((1<<1)-1)<<3)
	xorwf	(??_isr+0)+0,w
	movwf	(8)	;volatile
	line	116
	
i1l3350:	
;Untitled.c: 116: timer_count = 0;
	movlw	0
	movwf	(_timer_count+3)	;volatile
	movlw	0
	movwf	(_timer_count+2)	;volatile
	movlw	0
	movwf	(_timer_count+1)	;volatile
	movlw	0
	movwf	(_timer_count)	;volatile

	goto	i1l726
	line	117
	
i1l725:	
	goto	i1l726
	line	118
	
i1l724:	
	line	119
	
i1l726:	
	movf	(??_isr+4),w
	movwf	btemp+1
	movf	(??_isr+3),w
	movwf	pclath
	movf	(??_isr+2),w
	movwf	fsr0
	swapf	(??_isr+1)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,88
psect	text791,local,class=CODE,delta=2
global __ptext791
__ptext791:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
