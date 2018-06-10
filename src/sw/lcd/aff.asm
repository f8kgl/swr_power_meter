	include "p16f88.inc" ;include the defaults for the chip
	include "lcd.inc"
	include "eep.inc"
	
  	udata
v_charpos res 1
v_tmp res 1
v_lcd_wtmp res 1	
	
	extern lcd_affchar
	extern lcd_setposcursor
	extern lcd_convtoascii
 	extern eep_readbyte
	extern v_adcfwd		;
	extern v_adcref
	extern bootmsgL1
	extern bootmsgL2
IFDEF TEST
	extern testmsgL1
	extern testmsgL2
ENDIF

	code

;-----------------------------------------
;Fonction : Affichage du message de boot
;Nom : lcd_affboot
;Entrée :
;	-message de boot L1 et L2 en mémoire bootmsgL1 bootmsgL2 
;	-SW_VERSION (EEPROM)
;Sortie :
; 	Sur le LCD :
;       1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
; 	S W R - P O W E R    m  e  t  e  r
; 	      F 8 K G L   V  0  .  5
;Traitement :
;	1.v_charpos = 0
;	2.Afficher le message de boot ligne 1 
;	tant que W !=0
;		récupérer le caractère de boot ligne 1
;		afficher 1 caractère sur le LCD
; 		incrémenter v_charpos
;	3.positionner le curseur sur la ligne 2, 4ème case
;		W=0x13
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
lcd_affboot 
	bcf STATUS,RP0
	bcf STATUS,RP1
	movlw 0x00
	movwf v_charpos
_lcd_affboot_2
	movf v_charpos, w ; put counter value in W
	movwf v_lcd_wtmp
	movlw HIGH bootmsgL1
	movwf PCLATH
	movf v_lcd_wtmp,w
	call bootmsgL1 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affboot_3 ; display next message if finished
	movwf v_lcd_wtmp
	movlw HIGH lcd_affchar
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_affchar
	incf v_charpos, f
	goto _lcd_affboot_2
_lcd_affboot_3
	movlw 0x10
	movwf v_lcd_wtmp
	movlw HIGH lcd_setposcursor
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_setposcursor
_lcd_affboot_4
	movlw 0x00
	movwf v_charpos
_lcd_affboot_5
	movf v_charpos, w ; put counter value in W
	movwf v_lcd_wtmp
	movlw HIGH bootmsgL2
	movwf PCLATH
	movf v_lcd_wtmp,w
	call bootmsgL2 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affboot_6 ; display next message if finished
	movwf v_lcd_wtmp
	movlw HIGH lcd_affchar
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_affchar
	incf v_charpos, f
	goto _lcd_affboot_5
_lcd_affboot_6
;	movlw 0x19 idem
	movlw 0x1C
	movwf v_lcd_wtmp
	movlw HIGH lcd_setposcursor
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_setposcursor
_lcd_affboot_7
	movlw 0x00
	movwf v_charpos
_lcd_affboot_8
	movf v_charpos,w
	movwf v_lcd_wtmp
	movlw HIGH eep_readbyte
	movwf PCLATH
	movf v_lcd_wtmp,w
	call eep_readbyte
	bcf STATUS, RP1
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affboot_9 ; finished
	movwf v_lcd_wtmp
	movlw HIGH lcd_affchar
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_affchar
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
; 	REF
;Traitement :
;	1.v_charpos = 0
;	2.Afficher le message de test ligne 1 
;	tant que W !=0
;		récupérer le caractère de test ligne 1
;		afficher 1 caractère sur le LCD
; 		incrémenter v_charpos
;	3.positionner le curseur sur la ligne 2
;		W=0x10
;	 	postionner le curseur
;	4.v_charpos = 0
;	5.Afficher le message de boot ligne 2
;	tant que W !=0
;		récupérer le caractère de test ligne 2
;		afficher 1 caractère sur le LCD
;		incrémenter v_charpos
;----------------------------------------- 

lcd_aff_fwd_and_ref
	bcf STATUS,RP0
	bcf STATUS,RP1
	movlw 0x00
	movwf v_charpos
_lcd_aff_fwd_and_ref_2
	movf v_charpos, w ; put counter value in W
	movwf v_lcd_wtmp
	movlw HIGH testmsgL1
	movwf PCLATH
	movf v_lcd_wtmp,w
	call testmsgL1 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_aff_fwd_and_ref_3 ; display next message if finished
	movwf v_lcd_wtmp
	movlw HIGH lcd_affchar
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_affchar
	incf v_charpos, f
	goto _lcd_aff_fwd_and_ref_2
_lcd_aff_fwd_and_ref_3
	movlw 0x10
	movwf v_lcd_wtmp
	movlw HIGH lcd_setposcursor
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_setposcursor
_lcd_aff_fwd_and_ref_4
	movlw 0x00
	movwf v_charpos
_lcd_aff_fwd_and_ref_5
	movf v_charpos, w ; put counter value in W
	movwf v_lcd_wtmp
	movlw HIGH testmsgL2
	movwf PCLATH
	movf v_lcd_wtmp,w
	call testmsgL2 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_aff_fwd_and_ref_6 ; display next message if finished
	movwf v_lcd_wtmp
	movlw HIGH lcd_affchar
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_affchar
	incf v_charpos, f
	goto _lcd_aff_fwd_and_ref_5
_lcd_aff_fwd_and_ref_6	
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
lcd_affhexa
	movwf v_tmp
_lcd_affhexa_2
	swapf v_tmp,W
_lcd_affhexa_3
	andlw 0x0F
_lcd_affhexa_4
	movwf v_lcd_wtmp
	movlw HIGH lcd_convtoascii
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_convtoascii
_lcd_affhexa_5
	movwf v_lcd_wtmp
	movlw HIGH lcd_affchar
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_affchar
_lcd_affhexa_6
	movfw v_tmp
	andlw 0x0F
_lcd_affhexa_7
	movwf v_lcd_wtmp
	movlw HIGH lcd_convtoascii
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_convtoascii
_lcd_affhexa_8
	movwf v_lcd_wtmp
	movlw HIGH lcd_affchar
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_affchar
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
lcd_affadc
	movlw 0x05
	movwf v_lcd_wtmp
	movlw HIGH lcd_setposcursor
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_setposcursor
_lcd_affadc_2
	bcf STATUS,RP0
	bcf STATUS,RP1
	movfw v_adcfwd
_lcd_affadc_3
	movwf v_lcd_wtmp
	movlw HIGH lcd_affhexa
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_affhexa
_lcd_affadc_4
	bcf STATUS,RP0
	bcf STATUS,RP1
	movfw v_adcfwd+1
_lcd_affadc_5
	movwf v_lcd_wtmp
	movlw HIGH lcd_affhexa
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_affhexa
_lcd_affadc_6
	bcf STATUS,RP0
	bcf STATUS,RP1
	movlw 'h'
_lcd_affadc_7
	movwf v_lcd_wtmp
	movlw HIGH lcd_affchar
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_affchar
_lcd_affadc_8
	bcf STATUS,RP0
	bcf STATUS,RP1
	movlw '-'
_lcd_affadc_9
	movwf v_lcd_wtmp
	movlw HIGH lcd_affchar
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_affchar
_lcd_affadc_10
	movlw 0x15
	movwf v_lcd_wtmp
	movlw HIGH lcd_setposcursor
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_setposcursor
_lcd_affadc_11
	bcf STATUS,RP0
	bcf STATUS,RP1
	movfw v_adcref
_lcd_affadc_12
	movwf v_lcd_wtmp
	movlw HIGH lcd_affhexa
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_affhexa
_lcd_affadc_13
	bcf STATUS,RP0
	bcf STATUS,RP1
	movfw v_adcref+1
_lcd_affadc_14
	movwf v_lcd_wtmp
	movlw HIGH lcd_affhexa
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_affhexa
_lcd_affadc_15
	bcf STATUS,RP0
	bcf STATUS,RP1
	movlw 'h'
_lcd_affadc_16
	movwf v_lcd_wtmp
	movlw HIGH lcd_affchar
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_affchar
_lcd_affadc_17
	bcf STATUS,RP0
	bcf STATUS,RP1
	movlw '-'
_lcd_affadc_18
	movwf v_lcd_wtmp
	movlw HIGH lcd_affchar
	movwf PCLATH
	movf v_lcd_wtmp,w
	call lcd_affchar
	return
ENDIF

IFDEF TEST
;-----------------------------------------
;Fonction : Affichage de la mesure en tension des ADC en mode test
;Nom : lcd_affadcmV
;Entrée :
;	v_adcfwd_mV (2bytes) : résultat de l'ADC en mV compris entre [0;5000]
;	v_adcref_mV (2bytes) : résultat de l'ADC en mV compris entre [0	5000]
;Sortie :
; 	Sur le LCD :
;       1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
; 	                     v  v  v  v   m  V   
; 	                     y  y  y  y   m  V
;Traitement :
;	1.positionner le curseur sur la ligne 1, 11ème case
; 	2.v_hexa_to_conv = v_adcfwd_mV
; 	3.v_hexa_to_conv +1 = v_adcfwd_mV +1
; 	4. Conversion hexa-BCD (lcd_convtobcd)
; 	5. W = v_bcd
; 	6. Affichage d'un octet en hexa (lcd_affhexa)
; 	7. W = v_bcd+1
; 	8.positionner le curseur sur la ligne 2, 11ème case
; 	9.v_hexa_to_conv = v_adcref_mV
; 	10.v_hexa_to_conv +1 = v_adcref_mV +1
; 	11. Conversion hexa-BCD (lcd_convtobcd)
; 	12. W = v_bcd
; 	13. Affichage d'un octet en hexa (lcd_affhexa)
; 	14. W = v_bcd+1
;----------------------------------------- 
lcd_affadcmV	
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
lcd_affcalib 
	bcf STATUS,RP0
	bcf STATUS,RP1
	movlw 0x00
	movwf v_charpos
_lcd_affcalib2 
	movf v_charpos, w ; put counter value in W
	call calibmsgL1 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affcalib_3 ; display next message if finished
	call lcd_affchar
	incf v_charpos, f
	goto _lcd_affcalib2
_lcd_affcalib_3
	movlw 0x10
	call lcd_setposcursor
_lcd_affcalib_4
	movlw 0x00
	movwf v_charpos
_lcd_affcalib_5
	movf v_charpos, w ; put counter value in W
	call calibmsgL2 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affcalib_6 ; display next message if finished
	call lcd_affchar
	incf v_charpos, f
	goto _lcd_affcalib_5
_lcd_affcalib_6
	return
ENDIF

	
	global lcd_affboot
;	global lcd_affcalib
	global lcd_affadc
IFDEF TEST
	global lcd_aff_fwd_and_ref
ENDIF
	
	end 
