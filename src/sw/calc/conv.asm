include "p18f1320.inc" ;include the defaults for the chip
include "calc.inc"


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
f_calc_conv_to_ascii
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


  ;-----------------------------------------
  ;Fonction : Conversion hexa-bcd
  ;Nom : f_calc_conv_to_bcd
  ;Entrée :
  ;	v_lcd_hexa_to_conv (2 bytes) : 2 octets à convertir en BCD
  ;Sortie :
  ;	v_lcd_bcd (3 bytes) : 2 octets convertis en BCD

  ;Traitement :
  ;http://www.microchip.com/forums/m322713.aspx
  ;-----------------------------------------
  f_calc_conv_to_bcd
  	clrf    v_lcd_bcd
    clrf    v_lcd_bcd+1
    clrf    v_lcd_bcd+2

    movlw   D'16'
    movwf   v_lcd_count
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



    global f_calc_conv_to_ascii
    global f_calc_conv_to_bcd

    end
