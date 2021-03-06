	include "p18f1320.inc" ;include the defaults for the chip
  include "calc.inc"
	include "ltc2305.inc"


	udata
v_calc_mul res 4
v_calc_fwd_mV res 2
v_calc_adcfs res 2

	extern v_adcfwd
	extern v_adcref

	code
IFDEF TEST
;**********************************************************************************************
;**********************************************************************************************
;
;       16x16 Bit Unsigned Fixed Point Multiply 16 x 16 -> 32
;
;       Input:  16 bit unsigned fixed point multiplicand in v_calc_mul+0, v_calc_mul+1
;               16 bit unsigned fixed point multiplier in v_calc_adcfs+0, v_calc_adcfs+1
;
;       Use:    CALL    FXM1616U
;
;       Output: 32 bit unsigned fixed point product in v_calc_mul+0, v_calc_mul+1,
;               v_calc_mul+2, v_calc_mul+3
;
;       Result: AARG  <--  AARG * BARG
;
;       Max Timing:     26 clks
;
;       Min Timing:     26 clks
;
;       PM: 25              DM: 7
;
;
f_calc_mul1616U
IF 0
		MOVPF	v_calc_mul+1,TEMPB1

		MOVFP	v_calc_mul+1,WREG
		MULWF	v_calc_adcfs+1
		MOVPF	PRODH,v_calc_mul+2
		MOVPF	PRODL,v_calc_mul+3

		MOVFP	v_calc_mul+0,WREG
		MULWF	v_calc_adcfs+0
		MOVPF	PRODH,v_calc_mul+0
		MOVPF	PRODL,v_calc_mul+1

		MULWF	v_calc_adcfs+1
		MOVPF	PRODL,WREG
		ADDWF	v_calc_mul+2,F
		MOVPF	PRODH,WREG
		ADDWFC	v_calc_mul+1,F
		CLRF	WREG,F
		ADDWFC	v_calc_mul+0,F

		MOVFP	TEMPB1,WREG
		MULWF	v_calc_adcfs+0
		MOVPF	PRODL,WREG
		ADDWF	v_calc_mul+2,F
		MOVPF	PRODH,WREG
		ADDWFC	v_calc_mul+1,F
		CLRF	WREG,F
		ADDWFC	v_calc_mul+0,F

		RETLW	0x00
ENDIF
	return


;-----------------------------------------
;Fonction Convertir la mesure des ADC en mV
;Nom 		;
;Paramètres entrée
;	v_adc résultat de l'ADC sur 12 bits
;Paramètres sorties
;	v_adc_mV (2bytes) : résultat de l'ADC en mV en hexa

;Traitements
;   1. FXM1616U (ADC,(5000)) :
;	2. décalage à droite de 12 bits
;-----------------------------------------
f_calc_conv_adc_mV
	movlw V_ADC_FULL_SCALE_MSB
	movwf v_calc_adcfs
	movlw V_ADC_FULL_SCALE_LSB
	movwf v_calc_adcfs+1

	movlw 0x00
	movwf v_calc_mul
	movwf v_calc_mul+1
	movff v_adcfwd,v_calc_mul+2
	movff v_adcfwd+1,v_calc_mul+3

	call f_calc_mul1616U
	;déclagae à droite de 12 bits
	;transfère dans v_calc_fwd_mV
	movff v_calc_mul+1,v_calc_fwd_mV+1
	movff v_calc_mul,v_calc_fwd_mV



	;faire idem sur la voie REF

	return
ENDIF


IFDEF TEST
	global f_calc_conv_adc_mV
	global v_calc_fwd_mV
ENDIF

	end
