	include "p18f1320.inc" ;include the defaults for the chip
	include "bp.inc"
	include "log.inc"
	include "timer.inc"

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

	extern v_bp_status
	extern f_bp_test_bande

	extern f_adc_read

	extern f_log_write
	extern f_eep_int_readbyte
	extern delay_250ms


	extern v_log_data
	extern v_log_data_size
	extern v_log_tag
	extern v_i2c_nb_nack
IFDEF TEST
	extern f_calc_conv_bin_to_ascii
	extern f_lcd_aff_adc_ascii
	extern f_calc_V_mV
	extern f_calc_conv_mV_to_ascii
	extern f_calc_P_dBm
	extern f_calc_conv_dBm_to_ascii
	extern Del_11us ;pour trace timer 0 uniquement
	extern D160us ;pour trace timer 0 uniquement
	extern f_lcd_aff_PdBm_ascii
	extern f_calc_P_W
	extern f_calc_conv_W_to_ascii
	extern f_lcd_aff_P_W_ascii
ENDIF


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
	clrf v_bp_status
	call f_bp_test_bande
	btfss v_bp_status,BIT_BANDE
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
	MOVFF	v_tmp,v_log_data+4
	MOVFF	v_tmp+1,v_log_data+5

	lfsr FSR0, v_fwd_and_ref_bin
	call f_adc_read

	m_timer0_reset
	m_timer0_start

	m_timer0_stop
	;trace les valeurs d'ADC
	movff v_i2c_nb_nack,v_log_data
	movff v_fwd_and_ref_bin,v_log_data+1
	movff v_fwd_and_ref_bin+1,v_log_data+2
	movff v_fwd_and_ref_bin+2,v_log_data+3
	movlw HIGH TAG_ADC
	movwf v_log_tag
	movlw LOW TAG_ADC
	movwf v_log_tag+1
	movlw D'06'
	movwf v_log_data_size
	call f_log_write
	m_timer0_restart

	;;
	;; Conversion des ADC FWD et REF brutes en ASCII
	;;
	call f_calc_conv_bin_to_ascii

	;;
	;;Calcul des tensions en entrée des ADC FWD et REF en mV
	;;
	call f_calc_V_mV

	;;
	;;Conversion des valeurs d’ADC FWD et REF en mV en ASCII
	;;
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
	lfsr FSR0, v_fwd_and_ref_bin
	call f_adc_read

	;;
	;; Calcul de Pfwd et Pref en dBm
	;;
	call f_calc_P_dBm

	call f_calc_conv_dBm_to_ascii

	call f_lcd_aff_PdBm_ascii

	goto test_loop

menu_puissance_W

;;
	;;Lecture des valeurs ADC FWD et REF
	;;
	lfsr FSR0, v_fwd_and_ref_bin
	call f_adc_read

	;;
	;; Calcul de Pfwd et Pref en W
	;;
	call f_calc_P_W

	;;
	;; Calcul de ADCfwd/ADCref
	;;
	;call f_calc_ADCfwd_over_ADCref_W

	call f_calc_conv_W_to_ascii
	;call f_calc_conv_ADCfwd_over_ADCref_to_ascii

	call f_lcd_aff_P_W_ascii
	;call f_lcd_aff_ADCfwd_over_ADCref_ascii

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
ENDIF
	movlw 0x01
	call f_eep_int_readbyte
	movwf v_log_data+1
	movlw 0x03
	call f_eep_int_readbyte
	movwf v_log_data+2

	movff RCON,v_log_data+3
	movff STKPTR,v_log_data+4

	movlw HIGH TAG_LOG_BOOT
	movwf v_log_tag
	movlw LOW TAG_LOG_BOOT
	movwf v_log_tag+1
	movlw D'05'
	movwf v_log_data_size
	call f_log_write

;trace timer 0 pour calibration
IFDEF TEST
	m_timer0_start
	call Del_11us
	m_timer0_stop

	MOVFF	v_tmp,v_log_data
	MOVFF	v_tmp+1,v_log_data+1

	m_timer0_start
	call D160us
	m_timer0_stop

	MOVFF	v_tmp,v_log_data+2
	MOVFF	v_tmp+1,v_log_data+3

	movlw HIGH TAG_CALIBRATION_TIMER
	movwf v_log_tag
	movlw LOW TAG_CALIBRATION_TIMER
	movwf v_log_tag+1
	movlw D'04'
	movwf v_log_data_size
	call f_log_write
ENDIF

	return

	global v_fwd_and_ref_bin
	global v_fwd_and_ref_mV
	global v_fwd_and_ref_ascii
	global v_fwd_and_ref_mV_ascii
	global v_Pfwd_and_ref_dBm
	global v_Pfwd_and_ref_dBm_ascii
	end
