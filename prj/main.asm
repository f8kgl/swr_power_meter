	include "p16f88.inc" ;include the defaults for the chip
;	include "eep.inc"
	
	ERRORLEVEL 0, -302 ;suppress bank selection messages
	
        __CONFIG  _CONFIG1, _CP_OFF & _WDT_OFF &  _XT_OSC & _PWRTE_ON & _LVP_OFF & _BODEN_OFF & _MCLR_OFF
        __CONFIG    _CONFIG2, _IESO_OFF & _FCMEN_OFF

	extern f_lcd_init
	extern f_lcd_affboot
	extern f_lcd_clear
	extern f_lcd_setposcursor
IFDEF TEST
	extern f_lcd_aff_fwd_and_ref
	extern f_lcd_affadc
ENDIF
	extern f_adc_init
	extern f_adc_readAN0
	extern f_adc_readAN1
	
	udata
v_timer0 res 1 
v_timer1 res 1
v_timer2 res 1
v_mode_calib res 1
v_main_wtmp res 1

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
	movwf v_main_wtmp
	movlw HIGH f_lcd_init
	movwf PCLATH
	movf v_main_wtmp,w	
	call f_lcd_init ; Initialize the LCD Display 

; Initialisation ADC
	movwf v_main_wtmp
	movlw HIGH f_adc_init
	movwf PCLATH
	movf v_main_wtmp,w	
 	call f_adc_init		;

; Afficher le message de boot
	movwf v_main_wtmp
	movlw HIGH f_lcd_affboot
	movwf PCLATH
	movf v_main_wtmp,w	
	call f_lcd_affboot
	
;; Tempo de 5s
	movwf v_main_wtmp
	movlw HIGH f_tempo_boot
	movwf PCLATH
	movf v_main_wtmp,w	
	call f_tempo_boot
	call f_tempo_boot

;; Effacer le LCD (lcd_clear)
	movwf v_main_wtmp
	movlw HIGH f_lcd_clear
	movwf PCLATH
	movf v_main_wtmp,w	
	call f_lcd_clear
	;;Positionner le curseur du LCD sur la ligne 1
	movlw 0x00
	movwf v_main_wtmp
	movlw HIGH f_lcd_setposcursor
	movwf PCLATH
	movf v_main_wtmp,w	
	call f_lcd_setposcursor

IFDEF TEST
	movwf v_main_wtmp
	movlw HIGH f_lcd_aff_fwd_and_ref
	movwf PCLATH
	movf v_main_wtmp,w	
	call f_lcd_aff_fwd_and_ref
test_loop
;; 		lire les registres ADCfwd et ADCref
	movwf v_main_wtmp
	movlw HIGH f_adc_readAN0
	movwf PCLATH
	movf v_main_wtmp,w	
	call f_adc_readAN0
	movwf v_main_wtmp
	movlw HIGH f_adc_readAN1
	movwf PCLATH
	movf v_main_wtmp,w	
	call f_adc_readAN1
;; 		afficher le message de mesure (lcd_affmeas TBD)
	movwf v_main_wtmp
	movlw HIGH f_lcd_affadc
	movwf PCLATH
	movf v_main_wtmp,w	
	call f_lcd_affadc
	
	goto test_loop
ENDIF	


IFDEF CALIBRATION
;; Tester le mode calibration (test l'octet __MODE_CALIB_OR_NOT placé en eeprom)
	movlw __MODE_CALIB_OR_NOT
	call f_eep_readbyte
	xorlw 0xFF ; is it a 0xFF in EEPROM at this addresse ?
	btfsc STATUS, Z
	goto meas_loop; 0xFF calibration effectuée, passer en mode mesure


;; 	afficher le message de calibration (lcd_affcalib)
	call f_lcd_affcalib
ENDIF

IF 0
;; 	Dans une boucle infinie
calib_loop

;; 		lire les registres ADCfwd et ADCref
	call adc_readAN0
	call adc_readAN1
;; 		afficher le message de mesure (lcd_affmeas TBD)
	call lcd_affadc
	goto calib_loop ;endless loop
ENDIF


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

f_tempo_boot
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
