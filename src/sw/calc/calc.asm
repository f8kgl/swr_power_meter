	include "p18f1320.inc" ;include the defaults for the chip

	udata
v_adcfwd_mV res 2
v_adcref_mV res 2
v_calctmp res 1

	extern v_adcfwd
	extern v_adcref

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
;-----------------------------------------
f_calc_adcmV
	movf v_adcfwd,W
	movwf v_adcfwd_mV
	movf v_adcfwd+1,W
	movwf v_adcfwd_mV+1

	movf v_adcref,W
	movwf v_adcref_mV
	movf v_adcref+1,W
	movwf v_adcref_mV+1
	return
ENDIF

IFDEF TEST
	global f_calc_adcmV
ENDIF
	global v_adcfwd_mV
	global v_adcref_mV

	end
