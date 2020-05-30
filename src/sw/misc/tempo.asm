  include "p18f1320.inc" ;include the defaults for the chip

  	udata
v_timer res 1
v_timerA res 1
v_timerB res 1
v_timer0 res 1
v_timer1 res 1
v_timer2 res 1


  code
;-----------------------------------------
; Delay routines...
D160us
	clrf v_timer ;
	bsf v_timer, 5 ; Delay 160 usecs
	bsf v_timer, 4 ;
_D160us_2
	decfsz v_timer, f ;
	goto _D160us_2
	return ;

Del255
	movlw 0xff ; delay 255 mS
	goto d0 ;
Del200
	movlw d'200' ; delay 200mS
	goto d0 ;
Del100
	movlw d'100' ; delay 100mS
	goto d0 ;
Del50
	movlw d'50' ; delay 50mS
	goto d0 ;
Del20
	movlw d'20' ; delay 20mS
	goto d0 ;
Del05
	movlw 0x05 ; delay 5.000 ms (4 MHz clock)
	goto d0 ;
Del01
	movlw 0x01 ; delay 1.000 ms (4 MHz clock)
d0
	movwf v_timer ;
d1
	movlw 0xC7 ; delay 1mS
	movwf v_timerA ;
	movlw 0x01 ;
	movwf v_timerB ;
Del_0
	decfsz v_timerA,f ;
	goto $+0x0a ;
	decfsz v_timerB,f ;
	goto Del_0 ;
	decfsz v_timer,f ;
	goto d1 ;
	retlw 0x00 ;

Del_11us:			;11us soit 11 cycles	(temp1*3)+2
	movlw	d'3'		;1 cycle
	movwf	v_timer		;1 cycle
Del_11:
	decfsz	v_timer,f		;2 cycles si temp1=0 sinon 1 cycle
	goto	Del_11	;2 cycles
	return

delay_10ms
	movlw d'10' ; delay 10mS
	movwf v_timer0 ;
	goto delay1

delay_250ms
	movlw d'250' ; delay 250mS
	movwf v_timer0 ;
	goto delay1
delay1
	movlw 0xC7 ; delay 1mS
	movwf v_timer1 ;
	movlw 0x01 ;
	movwf v_timer2 ;
delay
	decfsz v_timer1,f ;
	goto delay2 ;
	decfsz v_timer2,f ;
delay2
	goto delay ;
	decfsz v_timer0,f ;
	goto delay1 ;
	retlw 0x00 ;


	global D160us
	global Del255
	global Del200
	global Del100
	global Del50
	global Del20
	global Del05
	global Del01
  global Del_11us
  global delay_250ms
  global delay_10ms


  end
