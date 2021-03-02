	include "p18f1320.inc" ;include the defaults for the chip
  include "calc.inc"



	udata
v_adcfwd_mV res 2
v_adcref_mV res 2
v_calc_n res 1
v_calc_n_fwd res 1
v_calc_n_ref res 1
IFDEF TEST
v_calc_count res 1
v_calc_adc res 2
ENDIF
v_calctmp res 2
v_calc_fwd res 2
v_calc_ref res 2

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
f_calc_adc_hex_fwd_and_ref
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
	global f_calc_adc_hex_fwd_and_ref
ENDIF
	global v_adcfwd_mV
	global v_adcref_mV
	global v_calc_n_fwd
	global v_calc_n_ref


	end
