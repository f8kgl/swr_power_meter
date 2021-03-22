include "p18f1320.inc" ;include the defaults for the chip
include "calc.inc"
include "ltc2305.inc"

    udata
_v_calc_conv_count res 1

  extern v_fwd_and_ref_bin
  extern v_fwd_and_ref_ascii
  extern v_fwd_and_ref_mV
  extern v_fwd_and_ref_mV_ascii
  extern v_Pfwd_and_ref_dBm
  extern v_Pfwd_and_ref_dBm_ascii



	code
IFDEF TEST
;-----------------------------------------
;Fonction : Conversion hexa-ASCII
;Nom : lcd_convtoascii
;Entrée :
;		-W
;		 +taille = 1 byte (données utile sur le quartet de poid faible)
;		 +description = contient la valeur à convertir
;Sortie :
;		-W
;		 +taille = 1 byte
;		 +description = contient la valeur convertie
;Traitement :
;
;-----------------------------------------
_f_calc_conv_ascii_table
	mullw 0x02
	movlw HIGH _f_calc_conv_ascii_table_2
	movwf PCLATH
	movlw _f_calc_conv_ascii_table_2
	addwf PRODL,W
	btfsc STATUS,C
	incf PCLATH ;retenu à 1 => pas de changement de page
	movf PRODL,w
	addwf PCL, f
_f_calc_conv_ascii_table_2
	retlw 0x30		;'0'
	retlw 0x31		;'1'
	retlw 0x32		;'2'
	retlw 0x33		;'3'
	retlw 0x34		;'4'
	retlw 0x35		;'5'
	retlw 0x36		;'6'
	retlw 0x37		;'7'
	retlw 0x38		;'8'
	retlw 0x39		;'9'
	retlw 0x41		;'A'
	retlw 0x42		;'B'
	retlw 0x43		;'C'
	retlw 0x44		;'D'
	retlw 0x45		;'E'
	retlw 0x46		;'F'
	return
ENDIF

IFDEF TEST
_f_calc_conv_bin_to_ascii
	swapf INDF0,W
	andlw 0x0F
	call _f_calc_conv_ascii_table
	movwf POSTINC1
	movf POSTINC0,W
	andlw 0x0F
	call _f_calc_conv_ascii_table
	movwf POSTINC1
	decfsz _v_calc_conv_count
	goto _f_calc_conv_bin_to_ascii
	return
ENDIF



IFDEF TEST
f_calc_conv_bin_to_ascii
	lfsr FSR0, v_fwd_and_ref_bin
	lfsr FSR1, v_fwd_and_ref_ascii
	movlw D'03'
	movwf _v_calc_conv_count
	call _f_calc_conv_bin_to_ascii
	return
ENDIF

IFDEF TEST
f_calc_conv_mV_to_ascii
	lfsr FSR0, v_fwd_and_ref_mV
	lfsr FSR1, v_fwd_and_ref_mV_ascii
	movlw D'04'
	movwf _v_calc_conv_count
	call _f_calc_conv_bin_to_ascii
	return
ENDIF

IFDEF TEST
f_calc_conv_dBm_to_ascii
	lfsr FSR0, v_Pfwd_and_ref_dBm
	lfsr FSR1, v_Pfwd_and_ref_dBm_ascii
	movlw D'04'
	movwf _v_calc_conv_count
	call _f_calc_conv_bin_to_ascii
	return
ENDIF

IFDEF TEST
f_calc_conv_W_to_ascii
	return
ENDIF


IFDEF TEST
	global f_calc_conv_bin_to_ascii
	global f_calc_conv_mV_to_ascii
	global f_calc_conv_dBm_to_ascii
	global f_calc_conv_W_to_ascii
ENDIF

    end
