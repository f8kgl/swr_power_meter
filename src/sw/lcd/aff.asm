	include "p18f1320.inc" ;include the defaults for the chip
	include "lcd.inc"
	include "eep.inc"
	include "bp.inc"
	include "calc.inc"

  	udata
v_hexa_to_conv res 2
v_bcd res 3
v_charpos res 1
v_tmp res 1
v_lcd_fsm_tmp res 1
IFDEF TEST
v_lcd_fsm_toggle_state res 1
v_lcd_fsm_timer_count res 1
v_lcd_fsm_string res 3 ;a priori, la taille max est de 3 : FWD, REF, ADC
v_lcd_fsm_string_len res 1
v_lcd_fsm_string_pos res 1
ENDIF

	extern f_lcd_affchar
	extern f_lcd_setposcursor
	extern f_lcd_convtoascii
	extern f_lcd_convtobcd
 	extern f_eep_readbyte
	extern v_adcfwd		;
	extern v_adcref
	extern v_adcfwd_mV		;
	extern v_adcref_mV
	extern c_bootmsgL1
	extern c_bootmsgL2
	extern v_calc_n_fwd
	extern v_calc_n_ref
IFDEF TEST
	extern c_msg_fwd
	extern c_msg_ref
	extern c_msg_n_and_rdac
	extern v_menu
	extern v_calc_port
	extern delay_10ms
ENDIF


	code

f_lcd_affboot
	movlw 0x00
	movwf v_charpos
_lcd_affboot_2
	movf v_charpos, w ; put counter value in W
	call c_bootmsgL1 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affboot_3 ; display next message if finished
	call f_lcd_affchar
	incf v_charpos, f
	incf v_charpos, f
	goto _lcd_affboot_2
_lcd_affboot_3
	movlw 0x10
	call f_lcd_setposcursor
_lcd_affboot_4
	movlw 0x00
	movwf v_charpos
_lcd_affboot_5
	movf v_charpos, w ; put counter value in W
	call c_bootmsgL2 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affboot_6 ; display next message if finished
	call f_lcd_affchar
	incf v_charpos, f
	incf v_charpos, f
	goto _lcd_affboot_5
_lcd_affboot_6
	movlw 0x1C
	call f_lcd_setposcursor
_lcd_affboot_7
	movlw 0x00
	movwf v_charpos
_lcd_affboot_8
	movf v_charpos,w
	call f_eep_readbyte
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affboot_9 ; finished
	call f_lcd_affchar
	incf v_charpos, f
	goto _lcd_affboot_8
_lcd_affboot_9
	return

_f_lcd_aff_hexa
		movwf v_tmp
		swapf v_tmp,W
		andlw 0x0F
		call f_lcd_convtoascii
		call f_lcd_affchar
		movf v_tmp,w
		andlw 0x0F
		call f_lcd_convtoascii
		call f_lcd_affchar
		return

IFDEF TEST
f_lcd_aff_adc_mV
	movlw 0x0B
	call f_lcd_setposcursor
	movf v_adcfwd_mV,w
	movwf v_hexa_to_conv
	movf v_adcfwd_mV+1,w
	movwf v_hexa_to_conv+1
_f_lcd_aff_adc_mV_4
	call f_lcd_convtobcd
_f_lcd_aff_adc_mV_5
	movf v_bcd+1,W
	call _f_lcd_aff_hexa
	movf v_bcd+2,W
	call _f_lcd_aff_hexa
	movlw 'm'
	call f_lcd_affchar
	movlw 'V'
	call f_lcd_affchar
_f_lcd_aff_adc_mV_12
	movlw 0x1B
	call f_lcd_setposcursor
	movf v_adcref_mV,w
	movwf v_hexa_to_conv
	movf v_adcref_mV+1,w
	movwf v_hexa_to_conv+1
_f_lcd_aff_adc_mV_15
	call f_lcd_convtobcd
_f_lcd_aff_adc_mV_16
	movf v_bcd+1,W
	call _f_lcd_aff_hexa
	movf v_bcd+2,W
	call _f_lcd_aff_hexa
	movlw 'm'
	call f_lcd_affchar
	movlw 'V'
	call f_lcd_affchar
	return

_f_lcd_aff_fwd
	movlw 0x00
	movwf v_charpos
_lcd_aff_fwd_2
	movf v_charpos, w ; put counter value in W
	call c_msg_fwd ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_aff_fwd_3 ; display next message if finished
	call f_lcd_affchar
	incf v_charpos, f
	incf v_charpos, f
	goto _lcd_aff_fwd_2
_lcd_aff_fwd_3
	return

_f_lcd_aff_ref
	movlw 0x00
	movwf v_charpos
_lcd_aff_ref_2
	movf v_charpos, w ; put counter value in W
	call c_msg_ref ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_aff_ref_3 ; display next message if finished
	call f_lcd_affchar
	incf v_charpos, f
	incf v_charpos, f
	goto _lcd_aff_ref_2
_lcd_aff_ref_3
	return

_f_lcd_aff_not
	movff v_lcd_fsm_string_len, v_lcd_fsm_tmp
	movlw ' '
_f_lcd_aff_not_2
	call f_lcd_affchar
	decfsz v_lcd_fsm_tmp
	goto _f_lcd_aff_not_2
	return

_f_lcd_fsm_toggle_state
	clrf v_lcd_fsm_toggle_state

_f_lcd_fsm_toggle_start
	movf	v_lcd_fsm_toggle_state,w
	xorlw	D'0'
	btfsc	STATUS,Z
	goto	_fsm_lcd_toggle_state0
	movf	v_lcd_fsm_toggle_state,w
	xorlw	D'1'
	btfsc	STATUS,Z
	goto	_fsm_lcd_toggle_state1
	movf	v_lcd_fsm_toggle_state,w
	xorlw	D'2'
	btfsc	STATUS,Z
	goto	_fsm_lcd_toggle_state2
	movf	v_lcd_fsm_toggle_state,w
	xorlw	D'3'
	btfsc	STATUS,Z
	goto	_fsm_lcd_toggle_state3
	movf	v_lcd_fsm_toggle_state,w
	xorlw	D'4'
	btfsc	STATUS,Z
	goto	_fsm_lcd_toggle_end
_fsm_lcd_toggle_end
	return

_fsm_lcd_toggle_state0
_fsm_lcd_toggle_state0_do
	movlw D'50'
	movwf v_lcd_fsm_timer_count
_fsm_lcd_toggle_state0_calc_next_state
	incf v_lcd_fsm_toggle_state,f
	goto _fsm_lcd_toggle_exit



_fsm_lcd_toggle_state1
_fsm_lcd_toggle_state1_do
	movlw 0x00 ;à généraliser
	call f_lcd_setposcursor
	call _f_lcd_aff_fwd
	call delay_10ms
_fsm_lcd_toggle_state1_calc_next_state
	decfsz v_lcd_fsm_timer_count,f
	goto __fsm_lcd_toggle_state1_calc_next_state ;si timer<500ms
	movlw D'50' ;si timer>500ms
	movwf v_lcd_fsm_timer_count
	incf v_lcd_fsm_toggle_state,f;si timer>500ms => state 2
	goto _fsm_lcd_toggle_exit
__fsm_lcd_toggle_state1_calc_next_state;si timer<500ms
		;si cal+/cal-=>state 3
		;si bande => state 4
		;sinon => state 1
	goto _fsm_lcd_toggle_exit

_fsm_lcd_toggle_state2
_fsm_lcd_toggle_state2_do
	movlw 0x00 ;à généraliser
	call f_lcd_setposcursor
	call _f_lcd_aff_not
	call delay_10ms
_fsm_lcd_toggle_state2_calc_next_state
	decfsz v_lcd_fsm_timer_count,f
	goto __fsm_lcd_toggle_state2_calc_next_state ;si timer<500ms
	movlw D'50' ;si timer>500ms
	movwf v_lcd_fsm_timer_count
	decf v_lcd_fsm_toggle_state,f;si timer>500ms => state 1
	goto _fsm_lcd_toggle_exit
__fsm_lcd_toggle_state2_calc_next_state;si timer<500ms
		;si cal+/cal-=>state 3
		;si bande => state 4
		;sinon => state 2
	goto _fsm_lcd_toggle_exit

_fsm_lcd_toggle_state3
_fsm_lcd_toggle_state3_do
	incf v_calc_port,f ;à généraliser
_fsm_lcd_toggle_state3_calc_next_state
	incf v_lcd_fsm_toggle_state
	goto _fsm_lcd_toggle_exit



_fsm_lcd_toggle_exit
	goto _f_lcd_fsm_toggle_start




f_lcd_aff_fwd_and_ref
	movlw 0x00
	call f_lcd_setposcursor
	call _f_lcd_aff_fwd
	movlw 0x10
	call f_lcd_setposcursor
	call _f_lcd_aff_ref
	return

f_lcd_aff_n
	return

f_lcd_toggle_fwd_port
	;mettre les paramètres de la fsm :
	;position de la chaine
	movlw 0x00
	movwf v_lcd_fsm_string_pos
	;contenu de la chaine
	movlw 'F'
	movwf v_lcd_fsm_string
	movlw 'W'
	movwf v_lcd_fsm_string+1
	movlw 'D'
	movwf v_lcd_fsm_string+2
	;nb de char de la chaine
	movlw 0x03
	movwf v_lcd_fsm_string_len
	;paramètre à modifier
	call _f_lcd_fsm_toggle_state
	return

f_lcd_toggle_ref_port
	;mettre les paramètres de la fsm :
	;position de la chaine
	;contenu de la chaine
	;nb de char de la chaine
	;paramètre à modifier
	call _f_lcd_fsm_toggle_state
	return

f_lcd_aff_G_and_rdac
	movlw 0x00
	movwf v_charpos
_f_lcd_aff_G_and_rdac_2
	movf v_charpos, w ; put counter value in W
	call c_msg_n_and_rdac ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _f_lcd_aff_G_and_rdac_3 ; display next message if finished
	call f_lcd_affchar
	incf v_charpos, f
	incf v_charpos, f
	goto _f_lcd_aff_G_and_rdac_2
_f_lcd_aff_G_and_rdac_3
	return

f_lcd_aff_adc_hexa
	movlw 0x05
	call f_lcd_setposcursor
	movf v_adcfwd,w
	call _f_lcd_aff_hexa
	movf v_adcfwd+1,w
	call _f_lcd_aff_hexa
	movlw 'h'
	call f_lcd_affchar
	movlw '-'
	call f_lcd_affchar
	movlw 0x15
	call f_lcd_setposcursor
	movf v_adcref,w
	call _f_lcd_aff_hexa
	movf v_adcref+1,w
	call _f_lcd_aff_hexa
	movlw 'h'
	call f_lcd_affchar
	movlw '-'
	call f_lcd_affchar
	return


ENDIF



	global v_hexa_to_conv
	global v_bcd
	global f_lcd_affboot
IFDEF TEST
	global f_lcd_aff_adc_hexa
	global f_lcd_aff_fwd_and_ref
	global f_lcd_aff_G_and_rdac
	global f_lcd_toggle_fwd_port
	global f_lcd_toggle_ref_port
	global f_lcd_aff_adc_mV
ENDIF

	end
