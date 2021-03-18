	include "p18f1320.inc" ;include the defaults for the chip

	udata
v_flh_offset_addr res 2

	extern v_calc_10logADC
	extern c_10logADC_table

	code
;-----------------------------------------
;Fonction Lecture d'un octer en flash
;Nom f_flh_get_word_10logADC		;
;Paramètres entrée v_flh_offset_addr
;Paramètres sorties v_flh_read(MSB) v_flh_read+1 (LSB)
;Traitements
	;;
;-----------------------------------------
f_flh_get_word_10logADC
	movf v_flh_offset_addr+1,W
	addlw  LOW c_10logADC_table
	btfss STATUS,C
	goto _f_flh_get_word_10logADC_4
_f_flh_get_word_10logADC_3
	incf v_flh_offset_addr,f
_f_flh_get_word_10logADC_4
	movwf   TBLPTRL

	movf v_flh_offset_addr,W
	addlw  HIGH c_10logADC_table
	movwf TBLPTRH
	movlw   0x00
	movwf   TBLPTRU

	TBLRD*+
	MOVF TABLAT,W
	movwf v_calc_10logADC+1
	TBLRD*+
	MOVF TABLAT,W
	movwf v_calc_10logADC

	return

	global v_flh_offset_addr
	global f_flh_get_word_10logADC
	end
