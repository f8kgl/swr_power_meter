	include "p16f88.inc" ;include the defaults for the chip
;	include "eep.inc"
	
	ERRORLEVEL 0, -302 ;suppress bank selection messages
	
        __CONFIG  _CONFIG1, _CP_OFF & _WDT_OFF &  _XT_OSC & _PWRTE_ON & _LVP_OFF & _BODEN_OFF & _MCLR_OFF
        __CONFIG    _CONFIG2, _IESO_OFF & _FCMEN_OFF

	extern lcd_init
	extern lcd_affboot
	extern lcd_clear
	extern lcd_setposcursor
IFDEF TEST
	extern lcd_aff_fwd_and_ref
ENDIF
	;extern lcd_affadc	
	extern adc_init
	;extern adc_readAN0
	;extern adc_readAN1
	
	udata
v_timer0 res 1 
v_timer1 res 1
v_timer2 res 1
v_mode_calib res 1

	code
	goto Init ;

Init
; Initialisation PIC
	BANKSEL CMCON
	movlw 0x07 ; Turn comparators off and
	movwf CMCON ; enable pins for I/O functions
	BANKSEL PORTA	
	clrf PORTA ; Initialize PORTA by setting output data latches
	BANKSEL TRISA	
	movlw b'00000011' ; PortA Outputs
	movwf TRISA ; RA0, RA1 input
	movlw b'00000000' ; PortB Outputs
	movwf TRISB ; Change PortB I/O
	
; Initialisation LCD 
	call lcd_init ; Initialize the LCD Display 

; Initialisation ADC
 	call adc_init		;

; Afficher le message de boot
	call lcd_affboot
	
;; Tempo de 5s
	call tempo_boot
	call tempo_boot

;; Effacer le LCD (lcd_clear)
	call lcd_clear
	;;Positionner le curseur du LCD sur la ligne 1
	movlw 0x00
	call lcd_setposcursor

IFDEF TEST
	call lcd_aff_fwd_and_ref
ENDIF	


IFDEF CALIBRATION
;; Tester le mode calibration (test l'octet __MODE_CALIB_OR_NOT placé en eeprom)
	movlw __MODE_CALIB_OR_NOT
	call eep_readbyte
	xorlw 0xFF ; is it a 0xFF in EEPROM at this addresse ?
	btfsc STATUS, Z
	goto meas_loop; 0xFF calibration effectuée, passer en mode mesure


;; 	afficher le message de calibration (lcd_affcalib)
	call lcd_affcalib
ENDIF

;; 	Dans une boucle infinie
calib_loop
IF 0
;; 		lire les registres ADCfwd et ADCref
	call adc_readAN0
	call adc_readAN1
;; 		afficher le message de mesure (lcd_affmeas TBD)
	call lcd_affadc
ENDIF
	goto calib_loop ;endless loop


IF 0
meas_loop
;; Sinon	;
;; 	Dans une boucle infinie (TBD) : ;
;; 		lire les registres ADCfwd et ADCref
;; 		calculer la puissance FWD et REF
;; 		Calculer le SWR
;; 		Afficher le message de mesure
	goto meas_loop
ENDIF
	
;-----------------------------------------
;Fonction : temporisation de 2.5s
;Nom : tempo_boot 
;Entrée : 
;Sortie : 
;Traitement : 
;		1.	appeler 10x une temporisation de 250ms
;-----------------------------------------

tempo_boot
	call delay_250ms
	call delay_250ms
	call delay_250ms
	call delay_250ms
	call delay_250ms
	call delay_250ms
	call delay_250ms
	call delay_250ms
	call delay_250ms
	call delay_250ms
	return

delay_250ms
	movlw d'250' ; delay 250mS
	movwf v_timer0 ;
	goto delay1
delay1
	movlw 0xC7 ; delay 1mS
	movwf v_timer1 ;
	movlw 0x01 ;
	movwf v_timer2 ;
delay
	decfsz v_timer1,f ;
	goto $+2 ;
	decfsz v_timer2,f ;
	goto delay ;
	decfsz v_timer0,f ;
	goto delay1 ;
	retlw 0x00 ;

	end 
