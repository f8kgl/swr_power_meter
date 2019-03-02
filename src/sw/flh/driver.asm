	include "p16f88.inc" ;include the defaults for the chip

	extern v_flh_offset_addr
	extern v_flh_read
	extern c_data_adc_theoric_caltable

	code
;-----------------------------------------
;Fonction Lecture d'un octer en flash
;Nom f_flh_readword		;
;Paramètres entrée v_flh_offset_addr
;Paramètres sorties v_flh_read
;Traitements
; 1.Choisir la bank de EEADRH
; 2. W = v_flh_offset_addr
; 3. EEADRH = W
; 4. W = v_flh_offset_addr +1
; 5. EEADR = W
; 6. Choisir la bank de EECON1
; 7. EECON(EEPGD) = b'1’
; 8. EECON(RD) = b’1’
; 9. Pas d'instruction
; 10. Pas d'instruction
; 11. Choisir la bank de EEDATA
; 12. W = EEDATA
; 13. v_flh_read+1=W;
; 14. W = EEDATH
; 15. v_flh_read=W;
;-----------------------------------------
f_flh_readword
	BANKSEL v_flh_offset_addr+1
	movf v_flh_offset_addr+1,W
	addlw c_data_adc_theoric_caltable
	btfss STATUS,C
	goto f_flh_readword_5
	incf v_flh_offset_addr,f
f_flh_readword_5
	BANKSEL EEADR
	movwf EEADR
	BANKSEL v_flh_offset_addr
	movf v_flh_offset_addr,W
	BANKSEL EEADRH
	movwf EEADRH
	BANKSEL EECON1
	bsf EECON1, EEPGD
	bsf EECON1,RD
	nop
	nop
	BANKSEL EEDATA
	movf EEDATA,W
	BANKSEL v_flh_read+1
	movwf v_flh_read+1
	BANKSEL EEDATH
	movf EEDATH,W
	BANKSEL v_flh_read
	movwf v_flh_read
	return

	global f_flh_readword
	end
