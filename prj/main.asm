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
	extern f_digit_pot_set_gain_fwd
	extern f_lcd_aff_fwd_and_ref
	extern f_lcd_affadc
	extern f_calc_adcmV
	extern f_lcd_aff_adcmV
ENDIF
	extern f_adc_init
	extern f_adc_read_vfwd
	extern f_adc_read_vref

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
  clrf ADCON0
	movlw B'01111111' 	;digital input on PORTA
	movwf ADCON1
	clrf ADCON2

	movlw b'00000000' ; PortA Outputs
	movwf TRISA ;
	clrf PORTA
	movlw b'00000000' ; PortB Outputs
	movwf TRISB ; Change PortB I/O
	clrf PORTB

; Initialisation ADC
 	call f_adc_init		;

; Initialisation LCD
	call f_lcd_init ; Initialize the LCD Display

; Afficher le message de boot
	call f_lcd_affboot

;; Tempo de 3s
	call f_tempo_boot

;; Effacer le LCD (lcd_clear)
	call f_lcd_clear
	;;Positionner le curseur du LCD sur la ligne 1
	movlw 0x00
	call f_lcd_setposcursor

	;; Initialise le gain de la chaîne
	call f_digit_pot_set_gain_fwd

IFDEF TEST
	call f_lcd_aff_fwd_and_ref
test_loop
	;;lire les registres ADCfwd et ADCref
	call f_adc_read_vfwd
	call f_adc_read_vref

	;; afficher la mesure des ADC en mode test
	call f_lcd_affadc
	;; Convertir la mesure des ADC en mV
	call f_calc_adcmV
	call f_lcd_aff_adcmV

	goto test_loop
ENDIF


IFNDEF TEST
IFNDEF CALIBRATION
	;; test du strap de calibration/mesure
	btfsc STATUS, Z
	goto meas_loop; 0xFF calibration effectuée, passer en mode mesure
ENDIF
;; 	afficher le message de calibration (lcd_affcalib)
	call f_lcd_affcalib

IFNDEF CALIBRATION
	;; phase mesure
ENDIF

ENDIF


;-----------------------------------------
;Fonction : temporisation de 3s
;Nom : tempo_boot
;Entrée :
;Sortie :
;Traitement :
;		1.	appeler 12x une temporisation de 250ms
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
