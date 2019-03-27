	include "p18f1320.inc" ;include the defaults for the chip

	extern v_flh_offset_addr
	extern v_flh_read
	extern c_data_adc_theoric_caltable

	code
;-----------------------------------------
;Fonction Lecture d'un octer en flash
;Nom f_flh_readword		;
;Paramètres entrée v_flh_offset_addr
;Paramètres sorties v_flh_read(MSB) v_flh_read+1 (LSB)
;Traitements
	;; 
;-----------------------------------------
f_flh_readword
	movf v_flh_offset_addr+1,W
	addlw c_data_adc_theoric_caltable
	btfss STATUS,C
	goto _f_flh_readword_4
_f_flh_readword_3
	incf v_flh_offset_addr,f
_f_flh_readword_4
	movwf   TBLPTRL
	movf v_flh_offset_addr,W
	movwf TBLPTRH	
	movlw   0x00   
	movwf   TBLPTRU

	TBLRD*+	
	MOVF TABLAT,W
	movwf v_flh_read+1
	TBLRD*+
	MOVF TABLAT,W
	movwf v_flh_read

	return

	global f_flh_readword
	end
