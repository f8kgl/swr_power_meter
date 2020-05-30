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
v_lcd_wtmp res 1

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
	call f_lcd_setposcursor
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
	movlw 0x10
	call f_lcd_setposcursor
_lcd_aff_ref_1
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

f_lcd_aff_fwd_and_ref
	call _f_lcd_aff_fwd
	call _f_lcd_aff_ref
	return

f_lcd_aff_no_port
	movlw ' '
	call f_lcd_affchar
	call f_lcd_affchar
	call f_lcd_affchar
	return

f_lcd_aff_n
	return

f_lcd_toogle_port
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
	movwf v_lcd_wtmp
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
	global f_lcd_toogle_port
	global f_lcd_aff_adc_mV
ENDIF

	end
