	include "p18f1320.inc" ;include the defaults for the chip
	include "bp.inc"
	include "log.inc"

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
	extern f_i2c_init
	extern f_lcd_affboot
	extern f_lcd_clear

	extern f_adc_read

	extern f_log_write
	extern f_eep_int_readbyte
IFDEF TEST
	extern f_calc_conv_bin_to_ascii
	extern f_lcd_aff_adc_ascii
	extern f_calc_conv_bin_to_mV
	extern f_calc_conv_mV_to_ascii
	extern f_calc_P_dBm
	extern f_calc_conv_dBm_to_ascii
	extern Del_11us ;pour trace timer 0 uniquement
	extern D160us ;pour trace timer 0 uniquement
ENDIF
	extern delay_250ms


	extern v_log_data
	extern v_log_data_size
	extern v_log_tag



	udata

IFDEF TEST
v_menu res 1
v_tmp res 2
v_fwd_and_ref_bin res 3 ;FWD=12bits - REF=12bits => 24bits = 8*3
v_fwd_and_ref_ascii res 6
v_fwd_and_ref_mV res 4 ;2 octets par port (4 bits BCD par digit)
v_fwd_and_ref_mV_ascii res 8 ;4 digits par port
v_Pfwd_and_ref_dBm res 3;3 octets (12 bits par port)
v_Pfwd_and_ref_dBm_ascii res 6;3 digits par port
ENDIF


	code
	goto Boot ;

Boot
;; Initialisation PIC
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

; Initialisation I/O
	movlw b'00010011' ; RA0/1/4 input
	movwf TRISA ;
	clrf PORTA
	movlw b'00000000' ; PortB Outputs
	movwf TRISB ; Change PortB I/O
	clrf PORTB

; Initialize the LCD Display
	call f_lcd_init

;; Afficher le message de boot
	call f_lcd_affboot
;; Tempo de 3s
	call f_tempo_boot

;; LOG au démarrage
	call f_boot_log


;;Initialisation des composants logiciels
	call f_i2c_init

;; Effacer le LCD (lcd_clear)
	call f_lcd_clear

IFDEF DEBUG_ISSUE_134
	;Fiche #121 #157 #134
	;appelle l'init des composants branchés sur le bus i2c
	;pour contourner le NACK reçu uniquement lors de la 1ère trame sous GPSIM
	call f_adc_read
ENDIF

IFDEF TEST
	clrf v_menu ; menu mesure par défaut au démarrage

test_loop

	;;Appui sur le bouton bande ?
	btfss BP_BANDE
	goto choix_menu

	incf v_menu,f
	;; Effacer le LCD (lcd_clear)
	call f_lcd_clear


choix_menu

	movf	v_menu,w
	xorlw	D'0'
	btfsc	STATUS,Z
	goto	menu_tension
	movf	v_menu,w
	xorlw	D'1'
	btfsc	STATUS,Z
	goto	menu_puissance_dBm
	movf	v_menu,w
	xorlw	D'2'
	btfsc	STATUS,Z
	goto	menu_puissance_W
	movf	v_menu,w
	xorlw	D'3'
	btfsc	STATUS,Z
	clrf v_menu
	goto test_loop

menu_tension
	clrf v_menu

	;;
	;;Lecture des valeurs ADC FWD et REF
	;;
	m_timer0_stop
	m_timer0_reset
	movlw TAG_TIMER_SAMPLE_FW_TEST_TENSION
	movwf v_log_tag
	movlw D'02'
	movwf v_log_data_size
	call f_log_write
	m_timer0_start

	lfsr FSR0, v_fwd_and_ref_bin
	call f_adc_read

	m_timer0_stop
	;trace les valeurs d'ADC
	movff v_fwd_and_ref_bin,v_log_data
	movff v_fwd_and_ref_bin+1,v_log_data+1
	movff v_fwd_and_ref_bin+2,v_log_data+2
	movlw TAG_ADC
	movwf v_log_tag
	movlw D'03'
	movwf v_log_data_size
	call f_log_write
	m_timer0_restart

	;;
	;; Conversion des ADC FWD et REF brutes en ASCII
	;;
	lfsr FSR0, v_fwd_and_ref_bin
	lfsr FSR1, v_fwd_and_ref_ascii
	call f_calc_conv_bin_to_ascii

	;;
	;;Conversion des valeurs d’ADC FWD et REF brutes en mV
	;;

	lfsr FSR0, v_fwd_and_ref_bin
	lfsr FSR1, v_fwd_and_ref_mV
	call f_calc_conv_bin_to_mV

	;;
	;;Conversion des valeurs d’ADC FWD et REF en mV en ASCII
	;;
	lfsr FSR0, v_fwd_and_ref_mV
	lfsr FSR1, v_fwd_and_ref_mV_ascii
	call f_calc_conv_mV_to_ascii

	;;
	;; affichage des valeurs d'ADC
	;;
	lfsr FSR0,v_fwd_and_ref_ascii
	lfsr FSR1, v_fwd_and_ref_mV_ascii
	call f_lcd_aff_adc_ascii

	goto test_loop


menu_puissance_dBm
	;;
	;;Lecture des valeurs ADC FWD et REF
	;;
	m_timer0_stop
	m_timer0_reset
	movlw TAG_TIMER_SAMPLE_FW_TEST_TENSION
	movwf v_log_tag
	movlw D'02'
	movwf v_log_data_size
	call f_log_write
	m_timer0_start

	lfsr FSR0, v_fwd_and_ref_bin
	call f_adc_read

	;;
	;; Calcul de Pfwd et Pref en dBm
	;;
	lfsr FSR0, v_fwd_and_ref_bin
	lfsr FSR1, v_Pfwd_and_ref_dBm
	call f_calc_P_dBm

	lfsr FSR0, v_Pfwd_and_ref_dBm
	lfsr FSR1, v_Pfwd_and_ref_dBm_ascii
	call f_calc_conv_dBm_to_ascii

	goto test_loop

menu_puissance_W
	goto test_loop

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
	return


f_boot_log
;Trace la version en cours d'éxecution
IFDEF TEST
	movlw 'T'
	movwf v_log_data
	movlw 'E'
	movwf v_log_data+1
	movlw 'S'
	movwf v_log_data+2
ENDIF
	movlw 0x00
	call f_eep_int_readbyte
	movwf v_log_data+3
	movlw 0x01
	call f_eep_int_readbyte
	movwf v_log_data+4
	movlw 0x02
	call f_eep_int_readbyte
	movwf v_log_data+5
	movlw 0x03
	call f_eep_int_readbyte
	movwf v_log_data+6
	movlw TAG_FW_VERSION
	movwf v_log_tag
	movlw D'08'
	movwf v_log_data_size
	call f_log_write

;Trace le contenu de RCON au démarrage
	movff RCON,v_log_data
	movff STKPTR,v_log_data+1
	movlw TAG_PIC_REG
	movwf v_log_tag
	movlw D'02'
	movwf v_log_data_size
	call f_log_write

;trace timer 0 pour calibration
IFDEF TEST
	m_timer0_start
	call Del_11us
	m_timer0_stop

	movlw TAG_TIMER
	movwf v_log_tag
	movlw D'02'
	movwf v_log_data_size
	call f_log_write

	m_timer0_start
	call D160us
	m_timer0_stop

	movlw TAG_TIMER
	movwf v_log_tag
	movlw D'02'
	movwf v_log_data_size
	call f_log_write
ENDIF

	return


	end
