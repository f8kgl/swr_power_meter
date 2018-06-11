	include "p16f88.inc" ;include the defaults for the chip

	udata
v_adcfwd res 2
v_adcref res 2
v_delay res 1	
	

	code
;-----------------------------------------
;Fonction : Initialisation adc
;Nom : adc_init
;Entrée :
;Sortie :
;Traitement :
;-----------------------------------------
f_adc_init	
	BANKSEL ANSEL
	movlw b'00000011'
	movwf ANSEL 		;AN0, AN1 analog I/O
	BANKSEL ADCON1
	bcf ADCON1 , VCFG0 ; VCFG0 = 0
	bcf ADCON1 , VCFG1 ; VCFG1 = 0
	bsf ADCON1 , ADFM  ; ADRESH = 0 0 0 0 0 0 b9 b8;
	   		   ;ADRESL = b7 b6 b5 b4 b3 b2 b1 b0 ;
	bsf ADCON1, ADCS2
	BANKSEL ADCON0
	bcf ADCON0, ADCS1
	bsf ADCON0, ADCS0 ;Tad = 16xTosc = 16/4Mhz = 4uS
	return

	
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
f_adc_readAN0
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

;-----------------------------------------
;Fonction : Lire le résultat de la conversion A/N AN1
;Nom : adc_readAN1
;Entrée :
;	-
;Sortie :
; 	-v_adcref (2 bytes): résultat de l'ADC sur 10 bits
;Traitement :
	;; 1. Selectionner le canal à échantilloner AN1
	;; 2. Mise en service du convertisseur
	;; 3. Tempo de 20us (adc_tempo20us)
	;; 4. Lancer la phase de conversion
        ;; 5. Si ADCON0(GO) = 1, refaire 5
	;; 6. v_adcref = ADRESH
	;;    v_adcref(+1) = ADRESL
;----------------------------------------- 	
f_adc_readAN1
	BANKSEL ADCON0
	bcf ADCON0,CHS2
	bcf ADCON0,CHS1
	bsf ADCON0,CHS0
_adc_readAN1_2
	bsf ADCON0,ADON
_adc_readAN1_3
	call _adc_tempo20us
_adc_readAN1_4
	bsf ADCON0,GO
_adc_readAN1_5
	btfsc ADCON0,GO
	goto _adc_readAN1_5
	BANKSEL ADRESH
	movfw ADRESH
	movwf v_adcref
	BANKSEL ADRESL
	movfw ADRESL
	bcf STATUS,RP0 		;bank0 (là ou se trouve v_adcref)
	bcf STATUS,RP1
	movwf v_adcref+1
	return
	
_adc_tempo20us
	clrf v_delay ; 
	bsf v_delay, 0 ; Delay 20 usecs
	bsf v_delay, 1 ;
	decfsz v_delay, f ;
	goto $ - 1 ;
	return ;
	
	
	global f_adc_init
	global f_adc_readAN0
	global f_adc_readAN1
	global v_adcfwd
	global v_adcref

	end
	
