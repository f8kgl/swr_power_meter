	include "p18f1320.inc" ;include the defaults for the chip
	include "lcd.inc"
	include "eep.inc"
	include "bp.inc"
	include "calc.inc"

  	udata
v_hexa_to_conv res 2
v_bcd res 3
v_charpos res 1
v_tmp res 1
v_lcd_wtmp res 1
IFDEF TEST
v_lcd_toggle_port res 1
ENDIF

	extern f_lcd_affchar
	extern f_lcd_setposcursor
	extern f_lcd_convtoascii
	extern f_lcd_convtobcd
 	extern f_eep_readbyte
	extern v_adcfwd		;
	extern v_adcref
	extern v_adcfwd_mV		;
	extern v_adcref_mV
	extern c_bootmsgL1
	extern c_bootmsgL2
IFDEF TEST
	extern c_testmsgL1
	extern c_testmsgL2
	extern v_menu
	extern v_calc_port
	extern Del200
ENDIF

	code

;-----------------------------------------
;Fonction : Affichage du message de boot
;Nom : lcd_affboot
;Entrée :
;	-message de boot L1 et L2 en mémoire c_bootmsgL1 c_bootmsgL2
;	-SW_VERSION (EEPROM)
;Sortie :
; 	Sur le LCD :
;       1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
; 	S W R - P O W E R    m  e  t  e  r
; 	F 8 K G L                   V  0  .  5
;Traitement :
;	1.v_charpos = 0
;	2.Afficher le message de boot ligne 1
;	tant que W !=0
;		récupérer le caractère de boot ligne 1
;		afficher 1 caractère sur le LCD
; 		incrémenter v_charpos
;	3.positionner le curseur sur la ligne 2, 4ème case
;		W=0x10
;	 	postionner le curseur
;	4.v_charpos = 0
;	5.Afficher le message de boot ligne 2
;	tant que W !=0
;		récupérer le caractère de boot ligne 2
;		afficher 1 caractère sur le LCD
;		incrémenter v_charpos
;	6.positionner le curseur sur la ligne 2, 10 ème case
;		W=0x1C
;		positionner le curseur
;	7. v_charpos=0
;	8.afficher la version 	;
;	tant que W !=0
;		récupérer le caractère en EEPROM
;		afficher 1 caractère sur le LCD
;		incrémenter v_charpos
;	9. FIN
;-----------------------------------------
f_lcd_affboot
	movlw 0x00
	movwf v_charpos
_lcd_affboot_2
	movf v_charpos, w ; put counter value in W
	call c_bootmsgL1 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affboot_3 ; display next message if finished
	call f_lcd_affchar
	incf v_charpos, f
	incf v_charpos, f
	goto _lcd_affboot_2
_lcd_affboot_3
	movlw 0x10
	call f_lcd_setposcursor
_lcd_affboot_4
	movlw 0x00
	movwf v_charpos
_lcd_affboot_5
	movf v_charpos, w ; put counter value in W
	call c_bootmsgL2 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affboot_6 ; display next message if finished
	call f_lcd_affchar
	incf v_charpos, f
	incf v_charpos, f
	goto _lcd_affboot_5
_lcd_affboot_6
	movlw 0x1C
	call f_lcd_setposcursor
_lcd_affboot_7
	movlw 0x00
	movwf v_charpos
_lcd_affboot_8
	movf v_charpos,w
	call f_eep_readbyte
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affboot_9 ; finished
	call f_lcd_affchar
	incf v_charpos, f
	goto _lcd_affboot_8
_lcd_affboot_9
	return

IFDEF TEST
;-----------------------------------------
;Fonction : Affichage du message du mode test
;Nom : lcd_aff_fwd_and_ref
;Entrée :
;	testmsgL1: zone mémoire (7bytes) contenant le message de calibration L1
;	testmsgL2 : zone mémoire (7bytes) contenant le message de calibration L2 ;
;Sortie :
; 	Sur le LCD :
;       1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
; 	F W D
; 	R E F
;Traitement :
;-----------------------------------------

f_lcd_aff_fwd_and_ref
	btfss v_lcd_toggle_port,PORT_FWD_BIT
	goto _f_lcd_aff_no_fwd
	call _f_lcd_aff_fwd
	goto _f_lcd_aff_fwd_and_ref_2
_f_lcd_aff_no_fwd
	movlw 0x00
	call f_lcd_setposcursor
	movlw ' '
	call f_lcd_affchar
	call f_lcd_affchar
	call f_lcd_affchar
_f_lcd_aff_fwd_and_ref_2
	btfss v_lcd_toggle_port,PORT_REF_BIT
	goto _f_lcd_aff_no_ref
	call _f_lcd_aff_ref
	goto _f_lcd_aff_fwd_and_ref_3
_f_lcd_aff_no_ref
	movlw 0x10
	call f_lcd_setposcursor
	movlw ' '
	call f_lcd_affchar
	call f_lcd_affchar
	call f_lcd_affchar
_f_lcd_aff_fwd_and_ref_3
	return



_f_lcd_aff_fwd
	movlw 0x00
	call f_lcd_setposcursor
	movlw 0x00
	movwf v_charpos
_lcd_aff_fwd_2
	movf v_charpos, w ; put counter value in W
	call c_testmsgL1 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_aff_fwd_3 ; display next message if finished
	call f_lcd_affchar
	incf v_charpos, f
	incf v_charpos, f
	goto _lcd_aff_fwd_2
_lcd_aff_fwd_3
	return

_f_lcd_aff_ref
	movlw 0x10
	call f_lcd_setposcursor
_lcd_aff_ref_1
	movlw 0x00
	movwf v_charpos
_lcd_aff_ref_2
	movf v_charpos, w ; put counter value in W
	call c_testmsgL2 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_aff_ref_3 ; display next message if finished
	call f_lcd_affchar
	incf v_charpos, f
	incf v_charpos, f
	goto _lcd_aff_ref_2
_lcd_aff_ref_3
	return

f_lcd_aff_G_and_rdac
	btfss v_calc_port,PORT_FWD_BIT
	goto _f_lcd_aff_G_and_rdac_4
	bsf  v_lcd_toggle_port,PORT_FWD_BIT
_f_lcd_aff_G_and_rdac_2
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call f_lcd_aff_fwd_and_ref ;affiche FWD et REF
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	bcf  v_lcd_toggle_port,PORT_FWD_BIT
	call f_lcd_aff_fwd_and_ref ;affiche FWD et REF
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	bsf  v_lcd_toggle_port,PORT_FWD_BIT
	call f_lcd_aff_fwd_and_ref ;affiche FWD et REF
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	bsf  v_lcd_toggle_port,PORT_REF_BIT
	call f_lcd_aff_fwd_and_ref ;affiche FWD et REF
	goto _f_lcd_aff_G_and_rdac_5
_f_lcd_aff_G_and_rdac_4
	bsf  v_lcd_toggle_port,PORT_FWD_BIT
	call f_lcd_aff_fwd_and_ref ;affiche FWD et REF
	bsf  v_lcd_toggle_port,PORT_REF_BIT
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call f_lcd_aff_fwd_and_ref ;affiche FWD et REF
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	bcf  v_lcd_toggle_port,PORT_REF_BIT
	call f_lcd_aff_fwd_and_ref ;affiche FWD et REF
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	bsf  v_lcd_toggle_port,PORT_REF_BIT
	call f_lcd_aff_fwd_and_ref ;affiche FWD et REF
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms
	call Del200 ;200ms

_f_lcd_aff_G_and_rdac_5
	btfss BP_BANDE
	goto _f_lcd_aff_G_and_rdac_6
	clrf v_menu
	goto _f_lcd_aff_G_and_rdac_9
_f_lcd_aff_G_and_rdac_6
	movlw 0x0C   ;masque sur bouton cal+ et cal-
	andwf BP_PORT,W
	btfsc STATUS,Z 	;si Z=1, c'est qu'il n'y a pas eu d'appui sur cal
	goto f_lcd_aff_G_and_rdac
_f_lcd_aff_G_and_rdac_8

_f_lcd_aff_G_and_rdac_9
	return

ENDIF

;-----------------------------------------
;Fonction : Affichage d'1 octet en hexa sur le LCD
;Nom : lcd_affhexa
;Entrée :
;	-W : contient l'octet en hexa à afficher
;Sortie :
;Traitement :
;	1.v_tmp= W
;	2.swapper les quartets de v_tmp, et mettre le résultat dans W
;	3.W=W&F0
;	4.Convertir le quartet de poids faible en ASCII
;	5.afficher un caractère sur le LCD
;	6.W=v_tmp&0F
;	7.Convertir le quartet de poids faible en ASCII
;	8.afficher un caractère sur le LCD
;-----------------------------------------
_f_lcd_affhexa
	movwf v_tmp
_lcd_affhexa_2
	swapf v_tmp,W
_lcd_affhexa_3
	andlw 0x0F
_lcd_affhexa_4
	call f_lcd_convtoascii
_lcd_affhexa_5
	call f_lcd_affchar
_lcd_affhexa_6
	movf v_tmp,w
	andlw 0x0F
_lcd_affhexa_7
	call f_lcd_convtoascii
_lcd_affhexa_8
	call f_lcd_affchar
	return

IFDEF TEST
;-----------------------------------------
;Fonction : Affichage de la mesure de calibration sur le LCD
;Nom : lcd_affadc
;Entrée :
;	-v_adcfwd (2 bytes) : résultat de l'ADC AN0 du 10 bits
; 	-v_adcref (2 bytes) : résultat de l'ADC AN1 du 10 bits
;Sortie :
; 	Sur le LCD :
;       1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
; 	        x x x x h -
;               y y y y h -
;Traitement :
;	1.positionner le curseur sur la ligne 1, 5ème case
;	2.W=v_adcfwd
;	3.Afficher un octet en hexa (lcd_affhexa)
;	4.W =v_adcfwd +1
;	5.Afficher un octet en hexa (lcd_affhexa)
;	6. W='h'
;	7. Afficher 1 caractère sur le LCD (lcd_affchar)
;	8. W='-'
;	9. Afficher 1 caractère sur le LCD (lcd_affchar)
;	10.positionner le curseur sur la ligne 2, 5ème case
;	11.W=v_adcref
;	12.Afficher un octet en hexa (lcd_affhexa)
;	13.W =v_adcref +1
;	14.Afficher un octet en hexa (lcd_affhexa)
;	15. W='h'
;	16. Afficher 1 caractère sur le LCD (lcd_affchar)
;	17. W='-'
;	18. Afficher 1 caractère sur le LCD (lcd_affchar)
;-----------------------------------------
f_lcd_aff_hexa
	movlw 0x05
	call f_lcd_setposcursor
_lcd_affadc_2
	movf v_adcfwd,w
_lcd_affadc_3
	movwf v_lcd_wtmp
	call _f_lcd_affhexa
_lcd_affadc_4
	movf v_adcfwd+1,w
_lcd_affadc_5
	call _f_lcd_affhexa
_lcd_affadc_6
	movlw 'h'
_lcd_affadc_7
	call f_lcd_affchar
_lcd_affadc_8
	movlw '-'
_lcd_affadc_9
	call f_lcd_affchar
_lcd_affadc_10
	movlw 0x15
	call f_lcd_setposcursor
_lcd_affadc_11
	movf v_adcref,w
_lcd_affadc_12
	call _f_lcd_affhexa
_lcd_affadc_13
	movf v_adcref+1,w
_lcd_affadc_14
	call _f_lcd_affhexa
_lcd_affadc_15
	movlw 'h'
_lcd_affadc_16
	call f_lcd_affchar
_lcd_affadc_17
	movlw '-'
_lcd_affadc_18
	call f_lcd_affchar
	return

;-----------------------------------------
;Fonction : Affichage de la mesure de calibration sur le LCD
;Nom : lcd_affadc
;Entrée :
; 	v_adcfwd_mV (2bytes) : résultat de l'ADC en mV compris entre [0;5000] (v_adcfwd_mV+1 = LSB)
; 	v_adcref_mV (2bytes) : résultat de l'ADC en mV compris entre [0;5000]
;Sortie :
; 	Sur le LCD :
;       1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
; 	                      v  v  v  v m  V
;                             y  y  y  y m  V
;Traitement :
;1.positionner le curseur sur la ligne 1, 11ème case
;2.v_hexa_to_conv = v_adcfwd_mV
;3.v_hexa_to_conv +1 = v_adcfwd_mV +1
;4. Conversion hexa-BCD (f_lcd_convtobcd) ;
;5. W = v_bcd
;6. Affichage d'un octet en hexa (_f_lcd_affhexa)
;7. W = v_bcd+1
;8. Affichage d'un octet en hexa (_f_lcd_affhexa)
;9. W = v_bcd+2
;10. Affichage d'un octet en hexa (_f_lcd_affhexa)
;11. Afficher "mV"
;12.positionner le curseur sur la ligne 2, 11ème case
;13.v_hexa_to_conv = v_adcref_mV
;14.v_hexa_to_conv +1 = v_adcref_mV +1
;15. Conversion hexa-BCD (f_lcd_convtobcd) ;
;16. W = v_bcd
;17. Affichage d'un octet en hexa (_f_lcd_affhexa)
;18. W = v_bcd+1
;19. Affichage d'un octet en hexa (_f_lcd_affhexa)
;20. W = v_bcd+2
;21. Afficher "mV"
;-----------------------------------------
f_lcd_aff_adcmV
	movlw 0x0B
	call f_lcd_setposcursor
	movf v_adcfwd_mV,w
	movwf v_hexa_to_conv
	movf v_adcfwd_mV+1,w
	movwf v_hexa_to_conv+1
_f_lcd_aff_adcmV_4
	call f_lcd_convtobcd
_f_lcd_aff_adcmV_5
	;; pour la V0.5, n'affiche pas le poids fort
	;; car l'ADC du PIC est sur 10 bits, et donc 4 digits suffisent
	;; la question se reposera quand nous passerons à l'ADC 16 bits
	;; 	movf v_bcd,W
	;; 	call _f_lcd_affhexa
	movf v_bcd+1,W
	call _f_lcd_affhexa
	movf v_bcd+2,W
	call _f_lcd_affhexa
	movlw 'm'
	call f_lcd_affchar
	movlw 'V'
	call f_lcd_affchar
_f_lcd_aff_adcmV_12
	movlw 0x1B
	call f_lcd_setposcursor
	movf v_adcref_mV,w
	movwf v_hexa_to_conv
	movf v_adcref_mV+1,w
	movwf v_hexa_to_conv+1
_f_lcd_aff_adcmV_15
	call f_lcd_convtobcd
_f_lcd_aff_adcmV_16
	;; pour la V0.5, n'affiche pas le poids fort
	;; car l'ADC du PIC est sur 10 bits, et donc 4 digits suffisent
	;; la question se reposera quand nous passerons à l'ADC 16 bits
	;; 	movf v_bcd,W
	;; 	call _f_lcd_affhexa
	movf v_bcd+1,W
	call _f_lcd_affhexa
	movf v_bcd+2,W
	call _f_lcd_affhexa
	movlw 'm'
	call f_lcd_affchar
	movlw 'V'
	call f_lcd_affchar

	return
ENDIF


IF 0
;-----------------------------------------
;Fonction : Affichage du message de calibration
;Nom : lcd_affcalib
;Entrée :
;	-message de calibration L1 et L2 en mémoire calibmsgL1 calibmsgL2
;Sortie :
; 	Sur le LCD :
;       1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
; 	A D C f w d
; 	A D C r e f
;Traitement :
;	1.v_charpos = 0
;	2.Afficher le message de calibration ligne 1
;	tant que W !=0
;		récupérer le caractère de calibration ligne 1
;		afficher 1 caractère sur le LCD
; 		incrémenter v_charpos
;	3.positionner le curseur sur la ligne 2
;		W=0x10
;	 	postionner le curseur
;	4.v_charpos = 0
;	5.Afficher le message de calibration ligne 2
;	tant que W !=0
;		récupérer le caractère de calibration ligne 2
;		afficher 1 caractère sur le LCD
;		incrémenter v_charpos
;	6. FIN
;-----------------------------------------
f_lcd_affcalib
	movlw 0x00
	movwf v_charpos
_lcd_affcalib2
	movf v_charpos, w ; put counter value in W
	call calibmsgL1 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affcalib_3 ; display next message if finished
	call f_lcd_affchar
	incf v_charpos, f
	incf v_charpos, f
	goto _lcd_affcalib2
_lcd_affcalib_3
	movlw 0x10
	call f_lcd_setposcursor
_lcd_affcalib_4
	movlw 0x00
	movwf v_charpos
_lcd_affcalib_5
	movf v_charpos, w ; put counter value in W
	call calibmsgL2 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affcalib_6 ; display next message if finished
	call f_lcd_affchar
	incf v_charpos, f
	incf v_charpos, f
	goto _lcd_affcalib_5
_lcd_affcalib_6
	return
ENDIF

	global v_hexa_to_conv
	global v_bcd
	global f_lcd_affboot
IFDEF TEST
	global f_lcd_aff_hexa
	global f_lcd_aff_fwd_and_ref
	global f_lcd_aff_G_and_rdac
	global f_lcd_aff_adcmV
	global v_lcd_toggle_port
ENDIF

	end
