	include "p18f1320.inc" ;include the defaults for the chip
  include "calc.inc"
	include "ltc2305.inc"


	udata
v_calc_aarg res 4
v_calc_barg res 2
v_calc_tmp res 1
v_calc_bin_in res 2
v_calc_bcd_out res 2
v_calc_bcd_count res 1
v_calc_count res 1
v_calc_10logADC res 2

	extern 	v_flh_offset_addr
	extern f_flh_get_word_10logADC

	code
IFDEF TEST
  ;-----------------------------------------
  ;Fonction : Conversion hexa-bcd
  ;Nom : f_calc_conv_to_bcd
  ;Entrée :
  ;	v_calc_p_bin_in (2 bytes) : pointeur vers 2 octets à convertir en BCD (données
  ; utiles sur les 12 bits de poids faible)
  ;Sortie :
  ;	v_calc_p_bcd_out (2 bytes) : 2 octets convertis en BCD

  ;Traitement :
  ;http://www.microchip.com/forums/m322713.aspx
  ;-----------------------------------------
_f_calc_dble_dabble_bcd
  	clrf    v_calc_bcd_out
    clrf    v_calc_bcd_out+1

    movlw   D'12'  ;ou 11 ?
    movwf   v_calc_bcd_count
_f_calc_dble_dabble_bcd1
    rlcf    v_calc_bin_in+1,F
    rlcf    v_calc_bin_in,F
    movf    v_calc_bcd_out+1,W
    addwfc  v_calc_bcd_out+1,W
    daw
    movwf   v_calc_bcd_out+1
    movf    v_calc_bcd_out,W
    addwfc  v_calc_bcd_out,W
    daw
    movwf   v_calc_bcd_out
    ;rlcf    v_calc_bcd_out,F
    decfsz  v_calc_bcd_count,f
    bra     _f_calc_dble_dabble_bcd1

	return


f_calc_dble_dabble_bcd
	call _f_calc_dble_dabble_bcd
	return

  ;**********************************************************************************************
  ;**********************************************************************************************
  ;
  ;       16x16 Bit Unsigned Fixed Point Multiply 16 x 16 -> 32
  ;
  ;       Input:  16 bit unsigned fixed point multiplicand in v_calc_aarg+0, v_calc_aarg+1
  ;               16 bit unsigned fixed point multiplier in v_calc_barg+0, v_calc_barg+1
  ;
  ;       Result: AARG  <--  AARG * BARG
  ;**********************************************************************************************
  ;**********************************************************************************************
f_calc_fxm1616u
	    movff	v_calc_aarg+1,v_calc_tmp

  		movf	v_calc_aarg+1,W
  		MULWF	v_calc_barg+1
  		movff	PRODH,v_calc_aarg+2
  		movff	PRODL,v_calc_aarg+3

  		movf	v_calc_aarg,W
  		MULWF	v_calc_barg
  		movff	PRODH,v_calc_aarg
  		movff	PRODL,v_calc_aarg+1

  		MULWF	v_calc_barg+1
  		movf	PRODL,W
  		ADDWF	v_calc_aarg+2,F
  		movf	PRODH,W
  		ADDWFC	v_calc_aarg+1,F
      movlw 0x00
  		ADDWFC	v_calc_aarg,F

  		movf	v_calc_tmp,W
  		MULWF	v_calc_barg
  		movf	PRODL,W
  		ADDWF	v_calc_aarg+2,F
  		movf	PRODH,W
  		ADDWFC	v_calc_aarg+1,F
      movlw 0x00
  		ADDWFC	v_calc_aarg,F

  		return

IFNDEF DEBUG_ISSUE_379
_f_calc_shift_12bits
  ;; décalage à droite de 12 bits
  movlw D'8' ;en fait non, que de 8. Car il faut que les datas soient alignées à gauche, pour la conversion BCD
  movwf v_calc_tmp
_f_calc_shift_12bits_1
  bcf STATUS,0
  rrcf POSTINC2,f
  rrcf POSTINC2,f
  rrcf POSTINC2,f
  decf FSR2L
  decf FSR2L
  decf FSR2L
  decfsz v_calc_tmp
  goto _f_calc_shift_12bits_1
  return
ENDIF

f_calc_div_by_4096
IFDEF DEBUG_ISSUE_379
  ;; décalage à droite de 12 bits
  movlw D'8' ;en fait non, que de 8. Car il faut que les datas soient alignées à gauche, pour la conversion BCD
  movwf v_calc_count
_f_calc_div_by_4096_1
  bcf STATUS,C
 	rrcf v_calc_aarg+1,f
 	rrcf v_calc_aarg+2,f
 	rrcf v_calc_aarg+3,f
  decfsz v_calc_count
  goto _f_calc_div_by_4096_1
  return
ELSE
	lfsr FSR2, v_calc_mul_out
	call _f_calc_shift_12bits
	lfsr FSR2, v_calc_mul_out+3
	call _f_calc_shift_12bits
	return
ENDIF ;ISSUE_379




_f_calc_Kconv_sub_10logADC
	;;Kconv - 10*log(ADC) sur 12 bits

	return

f_calc_P_dBm

	movlw 0x00
	movwf v_flh_offset_addr
	movwf v_flh_offset_addr+1
	call f_flh_get_word_10logADC

	;Port = FWD
	;Recherche de la valeur de Kconv(dBm) pour chaque port (FWD)

    ;Recherche de 10*log(ADC) dans la LUT
IF 0
    ;Addition 12 bits de valeurs codées dans un format spécifique 
	call _f_calc_Kconv_sub_10logADC
	;Conversion 12 bits en BCD
	movff POSTINC2,v_calc_bin_in
	movff POSTINC2,v_calc_bin_in+1
	call _f_calc_dble_dabble_bcd
	movff v_calc_bcd_out,POSTINC1
	movff v_calc_bcd_out+1,POSTINC1
ENDIF
	return


	return


ENDIF


IFDEF TEST
	global v_calc_bin_in
	global v_calc_bcd_out
	global v_calc_bcd_count
	global f_calc_dble_dabble_bcd
	global v_calc_aarg
	global v_calc_barg
	global f_calc_fxm1616u
	global f_calc_div_by_4096
	global f_calc_P_dBm
	global v_calc_10logADC
ENDIF

	end
