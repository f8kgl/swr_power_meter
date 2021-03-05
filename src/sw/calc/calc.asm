	include "p18f1320.inc" ;include the defaults for the chip
  include "calc.inc"
	include "ltc2305.inc"


	udata
v_adc res 2
v_adc_mV res 2
v_adc_fs res 2

	extern v_adcfwd
	extern v_adcref

	code
IFDEF TEST
;**********************************************************************************************
;**********************************************************************************************
;       
;       16x16 Bit Unsigned Fixed Point Multiply 16 x 16 -> 32
;
;       Input:  16 bit unsigned fixed point multiplicand in AARGB0, AARGB1
;               16 bit unsigned fixed point multiplier in BARGB0, BARGB1
;
;       Use:    CALL    FXM1616U
;
;       Output: 32 bit unsigned fixed point product in AARGB0, AARGB1, 
;               AARGB2, AARGB3
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
		MOVPF	AARGB1,TEMPB1	

		MOVFP	AARGB1,WREG
		MULWF	BARGB1
		MOVPF	PRODH,AARGB2
		MOVPF	PRODL,AARGB3
		
		MOVFP	AARGB0,WREG
		MULWF	BARGB0
		MOVPF	PRODH,AARGB0
		MOVPF	PRODL,AARGB1

		MULWF	BARGB1
		MOVPF	PRODL,WREG
		ADDWF	AARGB2,F
		MOVPF	PRODH,WREG
		ADDWFC	AARGB1,F
		CLRF	WREG,F
		ADDWFC	AARGB0,F

		MOVFP	TEMPB1,WREG
		MULWF	BARGB0
		MOVPF	PRODL,WREG
		ADDWF	AARGB2,F
		MOVPF	PRODH,WREG
		ADDWFC	AARGB1,F
		CLRF	WREG,F
		ADDWFC	AARGB0,F
		
		RETLW	0x00



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
	movwf v_adc_fs
	movlw V_ADC_FULL_SCALE_LSB
	movwf v_adc_fs+1
	
	movff v_adcfwd,v_adc
	movff v_adcfwd+1,v_adc+1
	
	call f_calc_mul1616U
	;faire idem sur la voie REF
	
	return
ENDIF


IFDEF TEST
	global f_calc_conv_adc_mV
	global v_adc
	global v_adc_mV
ENDIF

	end
