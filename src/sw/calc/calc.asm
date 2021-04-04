	include "p18f1320.inc" ;include the defaults for the chip
  include "calc.inc"
	include "ltc2305.inc"
	include "eep.inc"


	udata
_v_calc_tmp res 1
IFDEF TEST
v_calc_aarg res 4
_v_calc_barg res 2
_v_calc_bin_in res 2
_v_calc_bcd_out res 2
_v_calc_count res 1
v_calc_10logADC res 2
_v_calc_Kconv_dBm res 2
_v_calc_bin_P_dBm res 2
ENDIF
IFDEF xWATT
_v_calc_bin_in res 2
_v_calc_bcd_out res 2
_v_calc_count res 1
v_calc_10logADC res 2
_v_calc_Kconv_dBm res 2
_v_calc_bin_P_dBm res 2
ENDIF
IFDEF SWR_POWER_METER
v_calc_aarg res 4
_v_calc_barg res 2
_v_calc_Kconv_inv res 2
ENDIF

	extern f_eep_int_readbyte
	extern v_fwd_and_ref_bin
IFDEF TEST
	extern v_fwd_and_ref_mV
	extern v_Pfwd_and_ref_dBm
	extern v_flh_offset_addr
	extern f_flh_get_word_10logADC
ENDIF
IFDEF xWATT
	extern v_Pfwd_and_ref_dBm
	extern v_flh_offset_addr
	extern f_flh_get_word_10logADC
ENDIF
IFDEF SWR_POWER_METER
	extern f_calc_conv_bin_to_bcd_32b
ENDIF

	code
IFNDEF SWR_POWER_METER
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
  	clrf    _v_calc_bcd_out
    clrf    _v_calc_bcd_out+1

_f_calc_dble_dabble_bcd1
    rlcf    _v_calc_bin_in+1,F
    rlcf    _v_calc_bin_in,F
    movf    _v_calc_bcd_out+1,W
    addwfc  _v_calc_bcd_out+1,W
    daw
    movwf   _v_calc_bcd_out+1
    movf    _v_calc_bcd_out,W
    addwfc  _v_calc_bcd_out,W
    daw
    movwf   _v_calc_bcd_out
    ;rlcf    _v_calc_bcd_out,F
    decfsz  _v_calc_count,f
    bra     _f_calc_dble_dabble_bcd1

	return
ENDIF

_f_calc_parse_fwd_bin
  swapf INDF0,W
  andlw 0x0F
  movwf POSTINC1
  movff POSTINC0,INDF1
  swapf INDF1,W
  andlw 0xF0
  movwf INDF1
  swapf INDF0,W
  andlw 0x0F
  iorwf INDF1,f
	return


_f_calc_parse_ref_bin
  movf POSTINC0,W
  andlw 0x0F
  movwf POSTINC1
  clrf INDF1
  movff POSTINC0,INDF1
	return


IFNDEF SWR_POWER_METER
IFNDEF CALIBRATION
_f_calc_left_align_P_dBm
	;; alignement à gauche
	bcf 	STATUS,C
	movlw D'04'
	movwf _v_calc_count
_f_calc_left_align_P_dBm2
	rlcf _v_calc_bcd_out+1
	rlcf _v_calc_bcd_out
	decfsz _v_calc_count
	goto _f_calc_left_align_P_dBm2
	return

_f_calc_P_dBm
	;SI ADC = 000, PdBm = 0xFF
	tstfsz v_flh_offset_addr
	goto _f_calc_P_dBm_1
	tstfsz v_flh_offset_addr+1
	goto _f_calc_P_dBm_1

	movlw 0xFF
	movwf v_Pfwd_and_ref_dBm
	movlw 0xF0
	movwf v_Pfwd_and_ref_dBm+1
	goto _f_calc_P_dBm_2

_f_calc_P_dBm_1
	decf v_flh_offset_addr+1
	movlw 0x02
	mulwf v_flh_offset_addr+1 ;LSB
	movff PRODL,v_flh_offset_addr+1
	movff PRODH,_v_calc_tmp
	movlw 0x02
	mulwf v_flh_offset_addr ;MSB
	movf PRODL,W
	addwf _v_calc_tmp,f
	movff _v_calc_tmp,v_flh_offset_addr
	call f_flh_get_word_10logADC

	;PdBm = Kconv - 10*log(ADC)
	call _f_calc_Kconv_sub_10logADC
_f_calc_P_dBm_2
	return
ENDIF
ENDIF

  ;**********************************************************************************************
  ;**********************************************************************************************
  ;
  ;       16x16 Bit Unsigned Fixed Point Multiply 16 x 16 -> 32
  ;
  ;       Input:  16 bit unsigned fixed point multiplicand in v_calc_aarg+0, v_calc_aarg+1
  ;               16 bit unsigned fixed point multiplier in _v_calc_barg+0, _v_calc_barg+1
  ;
  ;       Result: AARG  <--  AARG * BARG
  ;**********************************************************************************************
  ;**********************************************************************************************
IFNDEF CALIBRATION
IFNDEF xWATT
_f_calc_fxm1616u
	    movff	v_calc_aarg+1,_v_calc_tmp

  		movf	v_calc_aarg+1,W
  		MULWF	_v_calc_barg+1
  		movff	PRODH,v_calc_aarg+2
  		movff	PRODL,v_calc_aarg+3

  		movf	v_calc_aarg,W
  		MULWF	_v_calc_barg
  		movff	PRODH,v_calc_aarg
  		movff	PRODL,v_calc_aarg+1

  		MULWF	_v_calc_barg+1
  		movf	PRODL,W
  		ADDWF	v_calc_aarg+2,F
  		movf	PRODH,W
  		ADDWFC	v_calc_aarg+1,F
      movlw 0x00
  		ADDWFC	v_calc_aarg,F

  		movf	_v_calc_tmp,W
  		MULWF	_v_calc_barg
  		movf	PRODL,W
  		ADDWF	v_calc_aarg+2,F
  		movf	PRODH,W
  		ADDWFC	v_calc_aarg+1,F
      movlw 0x00
  		ADDWFC	v_calc_aarg,F

  		return
ENDIF
ENDIF

IFDEF TEST
IFNDEF DEBUG_ISSUE_379
_f_calc_shift_12bits
  ;; décalage à droite de 12 bits
  movlw D'8' ;en fait non, que de 8. Car il faut que les datas soient alignées à gauche, pour la conversion BCD
  movwf _v_calc_tmp
_f_calc_shift_12bits_1
  bcf STATUS,0
  rrcf POSTINC2,f
  rrcf POSTINC2,f
  rrcf POSTINC2,f
  decf FSR2L
  decf FSR2L
  decf FSR2L
  decfsz _v_calc_tmp
  goto _f_calc_shift_12bits_1
  return
ENDIF
ENDIF

IFDEF TEST
_f_calc_div_by_4096
IFDEF DEBUG_ISSUE_379
  ;; décalage à droite de 12 bits
  movlw D'8' ;en fait non, que de 8. Car il faut que les datas soient alignées à gauche, pour la conversion BCD
  movwf _v_calc_count
_f_calc_div_by_4096_1
  bcf STATUS,C
 	rrcf v_calc_aarg+1,f
 	rrcf v_calc_aarg+2,f
 	rrcf v_calc_aarg+3,f
  decfsz _v_calc_count
  goto _f_calc_div_by_4096_1
  return
ELSE
	lfsr FSR2, v_calc_aarg
	call _f_calc_shift_12bits
	lfsr FSR2, v_calc_aarg+2
	call _f_calc_shift_12bits
	return
ENDIF ;ISSUE_379
ENDIF

IFNDEF SWR_POWER_METER
IFNDEF CALIBRATION
_f_calc_Kconv_sub_10logADC
;;Kconv - 10*log(ADC) sur 12 bits
;;; résultat dans _v_calc_bin_P_dBm aligné à gauche

	movff _v_calc_Kconv_dBm,_v_calc_bin_P_dBm
	movff _v_calc_Kconv_dBm+1,_v_calc_bin_P_dBm+1

    movf    v_calc_10logADC+1,W
    subwf   _v_calc_bin_P_dBm+1
    movf    v_calc_10logADC,W
    btfss   STATUS,C
    incfsz  v_calc_10logADC,W
    subwf   _v_calc_bin_P_dBm           ;dest = dest - source, WITH VALID CARRY
                                ;(although the Z flag is not valid).

	;; rlcf _v_calc_bin_P_dBm à faire 4 fois avec propagation de la retenue
	;; pour aligner à gauche pour la conversion BCD à suivre
	bcf 	STATUS,C
	movlw D'04'
	movwf _v_calc_count
_f_calc_Kconv_sub_10logADC_1
	rlcf _v_calc_bin_P_dBm+1
	rlcf _v_calc_bin_P_dBm
	decfsz _v_calc_count
	goto _f_calc_Kconv_sub_10logADC_1

	return
ENDIF
ENDIF


IFDEF TEST
f_calc_V_mV
	;;FWD
  ;;FXM1616U (ADC,(5000)10) 
  movlw V_ADC_FULL_SCALE_MSB
  movwf _v_calc_barg
  movlw V_ADC_FULL_SCALE_LSB
  movwf _v_calc_barg+1

	lfsr FSR0, v_fwd_and_ref_bin
	lfsr FSR1, v_calc_aarg
	call _f_calc_parse_fwd_bin

  call _f_calc_fxm1616u

	;; division par 4096
	call _f_calc_div_by_4096

  ;; Conversion 12 bits en BCD
	movlw   D'12'  ;ou 11 ?
	movwf   _v_calc_count
	movff v_calc_aarg+2,_v_calc_bin_in
	movff v_calc_aarg+3,_v_calc_bin_in+1
	call _f_calc_dble_dabble_bcd
	movff _v_calc_bcd_out,v_fwd_and_ref_mV
	movff _v_calc_bcd_out+1,v_fwd_and_ref_mV+1

	;;REF
	;;FXM1616U (ADC,(5000)10) 
	lfsr FSR0, v_fwd_and_ref_bin+1
	lfsr FSR1, v_calc_aarg
	call _f_calc_parse_ref_bin

  call _f_calc_fxm1616u

	;; division par 4096
	call _f_calc_div_by_4096

	;; Conversion 12 bits en BCD
	movlw   D'12'  ;ou 11 ?
	movwf   _v_calc_count
	movff v_calc_aarg+2,_v_calc_bin_in
	movff v_calc_aarg+3,_v_calc_bin_in+1
	call _f_calc_dble_dabble_bcd
	movff _v_calc_bcd_out,v_fwd_and_ref_mV+2
	movff _v_calc_bcd_out+1,v_fwd_and_ref_mV+3

	return
ENDIF

IFNDEF SWR_POWER_METER
IFNDEF CALIBRATION
f_calc_P_dBm

	;Port = FWD

	;Recherche de la valeur de Kconv(dBm) pour chaque port (FWD)
	movlw EEP_KCONV_FWD_BANDE1
	call f_eep_int_readbyte
	movwf _v_calc_Kconv_dBm
	movlw EEP_KCONV_FWD_BANDE1+1
	call f_eep_int_readbyte
	movwf _v_calc_Kconv_dBm+1

  ;Recherche de 10*log(ADC) dans la LUT
	lfsr FSR0, v_fwd_and_ref_bin
	lfsr FSR1, v_flh_offset_addr
	call _f_calc_parse_fwd_bin

	call _f_calc_P_dBm
  ;; Conversion 12 bits en BCD
	movlw   D'12'  ;ou 11 ?
	movwf   _v_calc_count
	movff _v_calc_bin_P_dBm,_v_calc_bin_in
	movff _v_calc_bin_P_dBm+1,_v_calc_bin_in+1
	call _f_calc_dble_dabble_bcd
	call _f_calc_left_align_P_dBm
	movff _v_calc_bcd_out,v_Pfwd_and_ref_dBm
	movff _v_calc_bcd_out+1,v_Pfwd_and_ref_dBm+1

	;REF
	;Recherche de la valeur de Kconv(dBm) pour chaque port (FWD)
	movlw EEP_KCONV_REF_BANDE1
	call f_eep_int_readbyte
	movwf _v_calc_Kconv_dBm
	movlw EEP_KCONV_REF_BANDE1+1
	call f_eep_int_readbyte
	movwf _v_calc_Kconv_dBm+1

  ;Recherche de 10*log(ADC) dans la LUT
	lfsr FSR0, v_fwd_and_ref_bin+1
	lfsr FSR1, v_flh_offset_addr
	call _f_calc_parse_ref_bin

	call _f_calc_P_dBm
  ;; Conversion 12 bits en BCD
	movlw   D'12'  ;ou 11 ?
	movwf   _v_calc_count
	movff _v_calc_bin_P_dBm,_v_calc_bin_in
	movff _v_calc_bin_P_dBm+1,_v_calc_bin_in+1
	call _f_calc_dble_dabble_bcd
	call _f_calc_left_align_P_dBm

	movf v_Pfwd_and_ref_dBm+1,W
	andlw 0xF0
	movwf _v_calc_tmp
	swapf _v_calc_bcd_out,W
	andlw 0x0F
	iorwf _v_calc_tmp,W
	movwf v_Pfwd_and_ref_dBm+1
	swapf _v_calc_bcd_out,W
	andlw 0xF0
	movwf _v_calc_tmp
	swapf _v_calc_bcd_out+1,W
	andlw 0x0F
	iorwf _v_calc_tmp,W
	movwf v_Pfwd_and_ref_dBm+2

	return
ENDIF
ENDIF

IFDEF SWR_POWER_METER
f_calc_P_W

	;Recherche de la valeur de Kconv(dBm) pour chaque port (FWD)
	movlw EEP_KCONV_FWD_BANDE2
	call f_eep_int_readbyte
	movwf _v_calc_Kconv_inv
	movlw EEP_KCONV_FWD_BANDE2+1
	call f_eep_int_readbyte
	movwf _v_calc_Kconv_inv+1


  ;;FXM1616U (ADC,1/Kconv) 
  movff _v_calc_Kconv_inv,_v_calc_barg
  movff _v_calc_Kconv_inv+1,_v_calc_barg+1

	lfsr FSR0, v_fwd_and_ref_bin
	lfsr FSR1, v_calc_aarg
	call _f_calc_parse_fwd_bin

  call _f_calc_fxm1616u

	;;Conversion BCD 32 bits
	call f_calc_conv_bin_to_bcd_32b

	return
ENDIF

IFDEF TEST
	global f_calc_V_mV
	global f_calc_P_dBm
	global v_calc_10logADC
	global v_calc_aarg
ENDIF
IFDEF xWATT
	global f_calc_P_dBm
	global v_calc_10logADC
ENDIF
IFDEF SWR_POWER_METER
	global f_calc_P_W
	global v_calc_aarg
ENDIF

	end
