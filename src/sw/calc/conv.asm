include "p18f1320.inc" ;include the defaults for the chip
include "calc.inc"


    udata
v_calc_p_bin_in res 2
v_calc_p_bcd_out res 2

	code
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
_f_calc_conv_to_ascii
	mullw 0x02
	movlw HIGH _f_calc_conv_to_ascii_2
	movwf PCLATH
	movlw _f_calc_conv_to_ascii_2
	addwf PRODL,W
	btfsc STATUS,C
	incf PCLATH ;retenu à 1 => pas de changement de page
	movf PRODL,w
	addwf PCL, f
_f_calc_conv_to_ascii_2
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

f_calc_conv_to_ascii
	swapf INDF0,W
	call _f_calc_conv_to_ascii
	movwf POSTINC1
	movf  POSTINC0,W
	call _f_calc_conv_to_ascii
	movwf POSTINC1
	swapf INDF0,W
	call _f_calc_conv_to_ascii
	movwf POSTINC1
	
	movf POSTINC0,W
	call _f_calc_conv_to_ascii
	movwf POSTINC1
	movf POSTINC0,W
	call _f_calc_conv_to_ascii
	movwf POSTINC1
	
	return
	
IF 0
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

    lfsr FSR0, v_calc_p_bcd_out
    clrf POSTINC0
    clrf POSTINC0


    movlw   D'11'
    movwf   v_calc_count
  _f_calc_conv_to_1
    lfsr FSR0, v_calc_p_bin_in+1
    rlcf POSTDEC0
    rlcf POSTDEC0

    lfsr FSR0, v_calc_p_bcd_out+1
    movf INDF0,W
    ;movf    v_lcd_bcd+2,W
    addwfc  INDF0,W
    daw
      movwf   INDF0
    lfsr FSR0, v_calc_p_bcd_out
    rlcf    INDF0
    decfsz  v_lcd_count,f
    bra     _f_calc_conv_to_1
    return



  f_calc_conv_to_bcd
    rlncf   v_adcfwd        ;12->13
    rlncf   v_adcfwd        ;13->14
    rlncf   v_adcfwd        ;14->15
    rlncf   v_adcfwd        ;15->16
    movlw   v_adcfwd
    movwf   v_calc_p_bin_in
    movlw   v_calc_adc_fwd_mV
    movwf   v_calc_p_bcd_out
    call  _f_calc_dble_dabble_bcd

    return
ENDIF

IF 0
    rlncf           ;12->13
    rlncf           ;13->14
    rlncf           ;14->15
    rlncf           ;15->16

  	clrf    v_calc_adc_mV_bcd
    clrf    v_calc_adc_mV_bcd+1
    ;clrf    v_lcd_bcd+2

    movlw   D'11'
    movwf   v_calc_count
  _f_calc_conv_to__1
    rlcf    v_lcd_hexa_to_conv+1,F
    rlcf    v_lcd_hexa_to_conv,F
    movf    v_lcd_bcd+2,W
    addwfc  v_lcd_bcd+2,W
    daw
    movwf   v_lcd_bcd+2
    movf    v_lcd_bcd+1,W
    addwfc  v_lcd_bcd+1,W
    daw
    movwf   v_lcd_bcd+1
    rlcf    v_lcd_bcd,F
    decfsz  v_lcd_count,f
    bra     _f_calc_conv_to_1
    return
ENDIF


    global f_calc_conv_to_ascii

    end
