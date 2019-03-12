	include "p18f1320.inc" ;include the defaults for the chip
;	include "eep.inc"
	
	ERRORLEVEL 0, -302 ;suppress bank selection messages
	
	config OSC = INTIO2 ; Internal Oscillator with FOSC/4 -RA6 and RA7 = I/O
	config FSCM = OFF ; Fail-Safe Clock Monitor disabled
	config IESO = OFF ; Internal External Switch Over mode disabled
	config PWRT = OFF ; Power up timer disabled
	config BOR = OFF ; Brown out reset disabled
	config WDT = OFF ; Watch dog timer off
	config MCLRE = OFF ; MCLRE off (pin available for input)
	config LVP = OFF ; Low voltage programming disabled
	config DEBUG = OFF ; Background debugger off 	CONFIG  _CONFIG2L, _PWRT_ON_2L & _BOR_OFF_2L & _BORV_27_2L
	
	extern f_lcd_init
	extern f_lcd_affboot
	extern f_lcd_clear
	extern f_lcd_setposcursor
IFDEF TEST
	extern f_lcd_aff_fwd_and_ref
	extern f_lcd_affadc
	;; 	extern f_calc_adcmV
ENDIF
	extern f_adc_init
	extern f_adc_readAN0
	extern f_adc_readAN1
	
	udata
v_timer0 res 1 
v_timer1 res 1
v_timer2 res 1
v_mode_calib res 1

	code
	goto Init ;

Init
; Initialisation PIC
	movlw   B'01100010'			;4 MHz 
	movwf   OSCCON
	clrf PORTA ; Initialize PORTA by setting output data latches
	movlw b'00000011' ; PortA Outputs
	movwf TRISA ; RA0, RA1 input
	movlw b'00000000' ; PortB Outputs
	movwf TRISB ; Change PortB I/O

	clrf    INTCON              ;disable all interrupts part one
	movlw	B'10000000'         ;disable all interrupts part two & 
	movwf   INTCON2             ;PORTB pull-up disable
	clrf    INTCON3             ;disable all interrupts part three
	clrf    IPR1                ;clear, no priority is used
	clrf    IPR2                ;clear, no priority is used
	clrf    PIE1                ;Individualy disable interrupts
	clrf    PIE2                ;Individualy disable interrupts
	bcf     RCON,IPEN           ;Disable priority levels
	clrf    EECON1              ;clear EEPROM control register
	bcf		WDTCON,SWDTEN		;stop watchdog
	clrf   CCP1CON

; Initialisation ADC
 	call f_adc_init		;

; Initialisation LCD
	call f_lcd_init ; Initialize the LCD Display 
	
; Afficher le message de boot
	call f_lcd_affboot
	
;; Tempo de 5s
	call f_tempo_boot
	call f_tempo_boot

;; Effacer le LCD (lcd_clear)
	call f_lcd_clear
	;;Positionner le curseur du LCD sur la ligne 1
	movlw 0x00
	call f_lcd_setposcursor

IFDEF TEST
	call f_lcd_aff_fwd_and_ref
test_loop
	;;lire les registres ADCfwd et ADCref
	call f_adc_readAN0
	call f_adc_readAN1

	;; afficher la mesure des ADC en mode test
	call f_lcd_affadc
	;; Convertir la mesure des ADC en mV
IF 0
	call f_calc_adcmV
ENDIF
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
	goto $+6 ;
	decfsz v_timer2,f ;
	goto delay ;
	decfsz v_timer0,f ;
	goto delay1 ;
	retlw 0x00 ;

	end 
