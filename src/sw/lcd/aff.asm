	include "p18f1320.inc" ;include the defaults for the chip
	include "lcd.inc"
	include "eep.inc"
	include "bp.inc"
	include "calc.inc"

  	udata
v_lcd_charpos res 1
IFDEF TEST
v_lcd_tmp res 1
v_lcd_string res 3 ;a priori, la taille max est de 3 : FWD, REF, ADC
v_lcd_string_len res 1
v_lcd_string_pos res 1
v_lcd_p_string res 2
v_lcd_dec res 2
ENDIF

	extern f_lcd_aff_char
	extern f_lcd_setposcursor
	extern f_eep_int_readbyte
	extern c_bootmsgL1
	extern c_bootmsgL2
IFDEF TEST


ENDIF


	code

_f_lcd_set_fwd_string
  movlw 'F'
  movwf v_lcd_string
  movlw 'W'
  movwf v_lcd_string+1
  movlw 'D'
  movwf v_lcd_string+2
  movlw v_lcd_string
  movwf v_lcd_p_string+1
	movlw 0x03
	movwf v_lcd_string_len
  return

_f_lcd_set_ref_string
	movlw 'R'
	movwf v_lcd_string
	movlw 'E'
	movwf v_lcd_string+1
	movlw 'F'
	movwf v_lcd_string+2
	movlw v_lcd_string
	movwf v_lcd_p_string+1
	movlw 0x03
	movwf v_lcd_string_len
	return

f_lcd_affboot
	movlw 0x00
	movwf v_lcd_charpos
_lcd_affboot_2
	movf v_lcd_charpos, w ; put counter value in W
	call c_bootmsgL1 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affboot_3 ; display next message if finished
	call f_lcd_aff_char
	incf v_lcd_charpos, f
	incf v_lcd_charpos, f
	goto _lcd_affboot_2
_lcd_affboot_3
	movlw 0x10
	call f_lcd_setposcursor
_lcd_affboot_4
	movlw 0x00
	movwf v_lcd_charpos
_lcd_affboot_5
	movf v_lcd_charpos, w ; put counter value in W
	call c_bootmsgL2 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affboot_6 ; display next message if finished
	call f_lcd_aff_char
	incf v_lcd_charpos, f
	incf v_lcd_charpos, f
	goto _lcd_affboot_5
_lcd_affboot_6
	movlw 0x1C
	call f_lcd_setposcursor
_lcd_affboot_7
	movlw 0x00
	movwf v_lcd_charpos
_lcd_affboot_8
	movf v_lcd_charpos,w
	call f_eep_int_readbyte
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affboot_9 ; finished
	call f_lcd_aff_char
	incf v_lcd_charpos, f
	goto _lcd_affboot_8
_lcd_affboot_9
	return


f_lcd_aff
	movf v_lcd_p_string,W
	movwf FSR2H
	movf v_lcd_p_string+1 ,W
	movwf FSR2L
	movff v_lcd_string_len,v_lcd_charpos
_f_lcd_aff_2
	movf v_lcd_charpos, w ; put counter value in W
	movf POSTINC2,W
	call f_lcd_aff_char
	decfsz v_lcd_charpos, f
	goto _f_lcd_aff_2
	return

f_lcd_aff_fwd_and_ref
	movlw 0x00
	call f_lcd_setposcursor
	call _f_lcd_set_fwd_string
	call f_lcd_aff
	movlw 0x10
	call f_lcd_setposcursor
	call _f_lcd_set_ref_string
	call f_lcd_aff
	return

f_lcd_aff_adc_ascii
	;;Affichage des valeurs d’ADC brute
	call f_lcd_aff_fwd_and_ref
	movlw 0x05
	call f_lcd_setposcursor
	movf POSTINC0,w
	call f_lcd_aff_char
	movf POSTINC0,w
	call f_lcd_aff_char
	movf POSTINC0,w
	call f_lcd_aff_char
	movlw 'h'
	call f_lcd_aff_char
	movlw '-'
	call f_lcd_aff_char

	movlw 0x15
	call f_lcd_setposcursor
	movf POSTINC0,w
	call f_lcd_aff_char
	movf POSTINC0,w
	call f_lcd_aff_char
	movf POSTINC0,w
	call f_lcd_aff_char
	movlw 'h'
	call f_lcd_aff_char
	movlw '-'
	call f_lcd_aff_char


	;;Affichage des valeurs d’ADC en mV
	movlw 0x0A
	call f_lcd_setposcursor
	movf POSTINC1,w
	call f_lcd_aff_char
	movf POSTINC1,w
	call f_lcd_aff_char
	movf POSTINC1,w
	call f_lcd_aff_char
	movf POSTINC1,w
	call f_lcd_aff_char
	movlw 'm'
	call f_lcd_aff_char
	movlw 'V'
	call f_lcd_aff_char

	movlw 0x1A
	call f_lcd_setposcursor
	movf POSTINC1,w
	call f_lcd_aff_char
	movf POSTINC1,w
	call f_lcd_aff_char
	movf POSTINC1,w
	call f_lcd_aff_char
	movf POSTINC1,w
	call f_lcd_aff_char
	movlw 'm'
	call f_lcd_aff_char
	movlw 'V'
	call f_lcd_aff_char
	return


	global f_lcd_affboot
	global f_lcd_aff
	global f_lcd_aff_adc_ascii
	global v_lcd_string
	global v_lcd_string_len
	global v_lcd_string_pos
	global v_lcd_p_string

	end
