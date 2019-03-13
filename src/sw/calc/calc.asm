	include "p18f1320.inc" ;include the defaults for the chip

	udata
v_flh_offset_addr res 2
v_flh_read res 2
v_adcfwd_mV res 2
v_adcref_mV res 2
v_calctmp res 1	
	
	extern v_adcfwd
	extern v_adcref
	extern f_flh_readword
	
	code
IFDEF TEST
;-----------------------------------------
;Fonction Convertir la mesure des ADC en mV
;Nom 		;
;Paramètres entrée
;	v_adcfwd (2bytes) : résultat de l'ADC AN0 sur 10 bits
;	v_adcref (2bytes) : résultat de l'ADC AN1 sur 10 bits
;Paramètres sorties
;	v_adcfwd_mV (2bytes) : résultat de l'ADC en mV en hexa
;	v_adcref_mV (2bytes) : résultat de l'ADC en mV en hexa 
;Traitements
;1. v_flh_offset_addr = v_adcfwd
;2. v_flh_offset_addr + 1 = v_adcfwd + 1
;3. Lecture d'un octet en flash (f_flh_readword)
;4.v_adcfwd_mV = v_flh_read
;5.v_adcfwd_mV +1 = v_flh_read+1
;6. v_flh_offset_addr = v_adcref
;7. v_flh_offset_addr + 1= v_adcref + 1
;8. Lecture d'un octet en flash (f_flh_readword)
;9.v_adcref_mV = v_flh_read
;10.v_adcref_mV +1 = v_flh_read+1	
;-----------------------------------------
f_calc_adcmV
	movf v_adcfwd,W
	movwf v_flh_offset_addr
	movlw 0x02
	mulwf v_flh_offset_addr
	movf PRODL,W
	movwf v_flh_offset_addr
	movf PRODH,W
	movwf v_calctmp
	
	movf v_adcfwd+1,W
	movlw 0x02
	mulwf v_flh_offset_addr+1
	movf PRODL,W
	addwf v_calctmp,W
	movwf v_flh_offset_addr+1
	
	call f_flh_readword

	movf v_flh_read,W
	movwf v_adcfwd_mV
	movf v_flh_read+1,W
	movwf v_adcfwd_mV+1
f_calc_adcmV_6
	movf v_adcref,W
	movwf v_flh_offset_addr
	movf v_adcref+1,W
	movwf v_flh_offset_addr+1
	call f_flh_readword
	movf v_flh_read,W
	movwf v_adcref_mV
	movf v_flh_read+1,W
	movwf v_adcref_mV+1
	return
ENDIF

IFDEF TEST	
	global f_calc_adcmV
ENDIF
	global v_flh_offset_addr
	global v_flh_read
	global v_adcfwd_mV
	global v_adcref_mV
	
	end
