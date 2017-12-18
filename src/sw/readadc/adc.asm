	include "p16f88.inc" ;include the defaults for the chip

	udata
v_adcfwd res 2
v_adcref res 2
v_delay res 1	
	

	code
;-----------------------------------------
;Fonction : Lire le résultat de la conversion A/N AN0
;Nom : adc_readAN0
;Entrée :
;	-
;Sortie :
; 	-v_adcfwd (2 bytes): résultat de l'ADC sur 10 bits
;Traitement :
	;; 1. Selectionner le canal à échantilloner AN0
	;; 2. Mise en service du convertisseur
	;; 3. Tempo de 20us (adc_tempo20us)
	;; 4. Lancer la phase de conversion
        ;; 5. Si ADCON0(GO) = 1, refaire 5
	;; 6. v_adcfwd = ADRESH
	;;    v_adcfwd(+1) = ADRESL
;----------------------------------------- 	
adc_readAN0
	BANKSEL ADCON0
	bcf ADCON0,CHS2
	bcf ADCON0,CHS1
	bcf ADCON0,CHS0
_adc_readAN0_2
	bsf ADCON0,ADON
_adc_readAN0_3
	call _adc_tempo20us
_adc_readAN0_4
	bsf ADCON0,GO
_adc_readAN0_5
	btfsc ADCON0,GO
	goto _adc_readAN0_5
	BANKSEL ADRESH
	movfw ADRESH
	movwf v_adcfwd
	BANKSEL ADRESL
	movfw ADRESL
	bcf STATUS,RP0 		;bank0 (là ou se trouve v_adcfwd)
	bcf STATUS,RP1
	movwf v_adcfwd+1
	return

_adc_tempo20us
	clrf v_delay ; 
	bsf v_delay, 0 ; Delay 20 usecs
	bsf v_delay, 1 ;
	decfsz v_delay, f ;
	goto $ - 1 ;
	return ;
	
	
	global adc_readAN0
	global v_adcfwd
	global v_adcref

	end
	
