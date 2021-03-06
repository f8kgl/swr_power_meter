include "p18f1320.inc" ;include the defaults for the chip
include "calc.inc"
include "ltc2305.inc"

    udata

v_calc_mul_out res 6
IF 0
v_calc_count res 1
ENDIF

	extern v_calc_bin_in
	extern v_calc_bcd_out
	extern v_calc_bcd_count
	extern f_calc_dble_dabble_bcd

	extern v_calc_aarg
	extern v_calc_barg
  extern f_calc_fxm1616u
  extern f_calc_shift_12bits

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
_f_calc_conv_bin_to_ascii
	mullw 0x02
	movlw HIGH _f_calc_conv_bin_to_ascii_2
	movwf PCLATH
	movlw _f_calc_conv_bin_to_ascii_2
	addwf PRODL,W
	btfsc STATUS,C
	incf PCLATH ;retenu à 1 => pas de changement de page
	movf PRODL,w
	addwf PCL, f
_f_calc_conv_bin_to_ascii_2
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

f_calc_conv_bin_to_ascii
	swapf INDF0,W
  andlw 0x0F
	call _f_calc_conv_bin_to_ascii
	movwf POSTINC1
	movf  POSTINC0,W
  andlw 0x0F
	call _f_calc_conv_bin_to_ascii
	movwf POSTINC1
	swapf INDF0,W
  andlw 0x0F
	call _f_calc_conv_bin_to_ascii
	movwf POSTINC1

	movf POSTINC0,W
  andlw 0x0F
	call _f_calc_conv_bin_to_ascii
	movwf POSTINC1
	swapf  INDF0,W
  andlw 0x0F
	call _f_calc_conv_bin_to_ascii
	movwf POSTINC1
	movf INDF0,W
  andlw 0x0F
	call _f_calc_conv_bin_to_ascii
	movwf POSTINC1

	return


f_calc_conv_mV_to_ascii
	swapf INDF0,W
	andlw 0x0F
	call _f_calc_conv_bin_to_ascii
	movwf POSTINC1
	movf POSTINC0,W
	andlw 0x0F
	call _f_calc_conv_bin_to_ascii
	movwf POSTINC1
	swapf INDF0,W
	andlw 0x0F
	call _f_calc_conv_bin_to_ascii
	movwf POSTINC1
	movf POSTINC0,W
	andlw 0x0F
	call _f_calc_conv_bin_to_ascii
	movwf POSTINC1
	swapf INDF0,W
	andlw 0x0F
	call _f_calc_conv_bin_to_ascii
	movwf POSTINC1
	movf POSTINC0,W
	andlw 0x0F
	call _f_calc_conv_bin_to_ascii
	movwf POSTINC1
	swapf INDF0,W
	andlw 0x0F
	call _f_calc_conv_bin_to_ascii
	movwf POSTINC1
	movf POSTINC0,W
	andlw 0x0F
	call _f_calc_conv_bin_to_ascii
	movwf POSTINC1
	return


_f_calc_conv_mv_to_bcd
	movff POSTINC2,v_calc_bin_in
	movff POSTINC2,v_calc_bin_in+1
	call f_calc_dble_dabble_bcd
	movff v_calc_bcd_out,POSTINC1
	movff v_calc_bcd_out+1,POSTINC1
	return


f_calc_conv_bin_to_mV
	;;FXM1616U (ADC,(5000)10) :

  movlw V_ADC_FULL_SCALE_MSB
  movwf v_calc_barg
  movlw V_ADC_FULL_SCALE_LSB
  movwf v_calc_barg+1

  swapf INDF0,W
  andlw 0x0F
  movwf v_calc_aarg
  movff POSTINC0,v_calc_aarg+1
  swapf v_calc_aarg+1,W
  andlw 0xF0
  movwf v_calc_aarg+1
  swapf INDF0,W
  andlw 0x0F
  iorwf v_calc_aarg+1,f
  call f_calc_fxm1616u
  movff v_calc_aarg+1,v_calc_mul_out
  movff v_calc_aarg+2,v_calc_mul_out+1
  movff v_calc_aarg+3,v_calc_mul_out+2

  clrf v_calc_aarg
  movf POSTINC0,W
  andlw 0x0F
  movwf v_calc_aarg
  clrf v_calc_aarg+1
  movff POSTINC0,v_calc_aarg+1
  call f_calc_fxm1616u
  movff v_calc_aarg+1,v_calc_mul_out+3
  movff v_calc_aarg+2,v_calc_mul_out+4
  movff v_calc_aarg+3,v_calc_mul_out+5

IF 0
  ;; décalage à droite de 12 bits
  movlw D'8' ;en fait non, que de 8. Car il faut que les datas soient alignées à gauche, pour la conversion BCD
  movwf v_calc_count
f_calc_conv_bin_to_mV_1
  bcf STATUS,0
  rrcf v_calc_mul_out,f
  rrcf v_calc_mul_out+1,f
  rrcf v_calc_mul_out+2,f
  decfsz v_calc_count
  goto f_calc_conv_bin_to_mV_1

  movlw D'8' ;en fait non, que de 8. Car il faut que les datas soient alignées à gauche, pour la conversion BCD
  movwf v_calc_count
f_calc_conv_bin_to_mV_2
  bcf STATUS,0
  rrcf v_calc_mul_out+3,f
  rrcf v_calc_mul_out+4,f
  rrcf v_calc_mul_out+5,f
  decfsz v_calc_count
  goto f_calc_conv_bin_to_mV_2
ENDIF

	lfsr FSR2, v_calc_mul_out
	call f_calc_shift_12bits
	lfsr FSR2, v_calc_mul_out+3
	call f_calc_shift_12bits

  ;; Conversion 12 bits en BCD
  lfsr FSR2,v_calc_mul_out+1
	call _f_calc_conv_mv_to_bcd ;FWD
  lfsr FSR2,v_calc_mul_out+4
	call _f_calc_conv_mv_to_bcd ;REF

	return

f_calc_conv_dBm_to_ascii
	return

ENDIF

	global f_calc_conv_bin_to_ascii
	global f_calc_conv_bin_to_mV
	global f_calc_conv_mV_to_ascii
	global f_calc_conv_dBm_to_ascii

    end
