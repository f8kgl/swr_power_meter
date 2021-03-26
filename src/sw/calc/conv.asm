include "p18f1320.inc" ;include the defaults for the chip
include "calc.inc"
include "ltc2305.inc"

    udata
_v_calc_conv_count res 1
_v_calc_conv_tmp res 1

  extern v_calc_aarg
  extern v_fwd_and_ref_bin
IFDEF TEST
  extern v_fwd_and_ref_ascii
  extern v_fwd_and_ref_mV
  extern v_fwd_and_ref_mV_ascii
  extern v_Pfwd_and_ref_dBm
  extern v_Pfwd_and_ref_dBm_ascii
ENDIF
IFDEF CALIBRATION
ENDIF
IFDEF SWR_POWER_METER
  extern v_Pfwd_W
  extern v_Pfwd_W_ascii
ENDIF
IFDEF xWATT
  extern v_Pfwd_and_ref_dBm
  extern v_Pfwd_and_ref_dBm_ascii
ENDIF

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

IFDEF SWR_POWER_METER
;******************************************************************
; Convert 32-bit binary number at <bin> into a bcd number
; at <bcd>. Uses Mike Keitz's procedure for handling bcd
; adjust; Modified Microchip AN526 for 32-bits.

f_calc_conv_bin_to_bcd_32b
	movlw	32		; 32-bits
	movwf	_v_calc_conv_tmp		; make cycle counter
	clrf	v_Pfwd_W		; clear result area
	clrf	v_Pfwd_W+1
	clrf	v_Pfwd_W+2
	clrf	v_Pfwd_W+3
	clrf	v_Pfwd_W+4

_f_calc_conv_bin_to_bcd_32b_2
  lfsr FSR0,	v_Pfwd_W		; make pointer
	movlw	5
	movwf	_v_calc_conv_count

_f_calc_conv_bin_to_bcd_32b_3
	movlw	0x33
	addwf	INDF0,f		; add to both nybbles
	btfsc	INDF0,3		; test if low result > 7
	andlw	0xf0		; low result >7 so take the 3 out
	btfsc	INDF0,7		; test if high result > 7
	andlw	0x0f		; high result > 7 so ok
	subwf	INDF0,f		; any results <= 7, subtract back
	incf	FSR0,f		; point to next
	decfsz	_v_calc_conv_count
	goto	_f_calc_conv_bin_to_bcd_32b_3

	rlcf	v_calc_aarg+3,f		; get another bit
	rlcf	v_calc_aarg+2,f
	rlcf	v_calc_aarg+1,f
	rlcf	v_calc_aarg+0,f
	rlcf	v_Pfwd_W+4,f		; put it into bcd
	rlcf	v_Pfwd_W+3,f
	rlcf	v_Pfwd_W+2,f
	rlcf	v_Pfwd_W+1,f
	rlcf	v_Pfwd_W+0,f
	decfsz	_v_calc_conv_tmp,f		; all done?
	goto	_f_calc_conv_bin_to_bcd_32b_2		; no, loop
	return			; yes

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

IFDEF SWR_POWER_METER
f_calc_conv_W_to_ascii
	lfsr FSR0, v_Pfwd_W
	lfsr FSR1, v_Pfwd_W_ascii
	movlw D'10'
	movwf _v_calc_conv_count
	call _f_calc_conv_bin_to_ascii
	return
ENDIF


IFDEF TEST
	global f_calc_conv_bin_to_ascii
	global f_calc_conv_mV_to_ascii
ENDIF
IFDEF xWATT
	global f_calc_conv_dBm_to_ascii
ENDIF
IFDEF SWR_POWER_METER
	global f_calc_conv_W_to_ascii
  global f_calc_conv_bin_to_bcd_32b
ENDIF

    end
