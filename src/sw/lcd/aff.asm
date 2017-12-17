	include "p16f628a.inc" ;include the defaults for the chip
	include "lcd.inc"
	
  	udata
v_charpos res 1
	
	extern lcd_affchar
	extern lcd_setposcursor

;-----------------------------------------
;Fonction : Message de version courante du logiciel
;Nom : 
;Entrée : 
;	SW_VERSION(define du makefile)
;Sortie :
;	SW_VERSION
;Traitement :
;	Zone de mémoire (5 bytes) dédiée au stokage de la version logcielle
; 	"V1.0" par exemple
; cette zone de mémoire est placée en 0x2100 systématiquement par le compilateur
; cette zone est remplie par le compilateur
;-----------------------------------------  
c_swversion code __EEPROM_START
	DE SW_VERSION
	DE 0x00 		;marqueur de fin
	
	code
;-----------------------------------------
;Fonction : Message de boot ligne 1 du LCD
;Nom : bootmsgL1
;Entrée : 
;	v_charpos (1 byte) :position du caractère à retourner
;Sortie :
;	W (1 byte) : contient le caractère ou 0x00 si pas de caractère
;Traitement :
;	Zone de mémoire dédiée au stokage du message de boot (L1 du LCD)
; 	"SWR-POWER meter"
;-----------------------------------------  
bootmsgL1 
	addwf PCL, f
	retlw 'S'
	retlw 'W'
	retlw 'R'
	retlw '-'
	retlw 'P'
	retlw 'O'
	retlw 'W'
	retlw 'E'
	retlw 'R'
	retlw ' '
	retlw 'm'
	retlw 'e'
	retlw 't'
	retlw 'e'
	retlw 'r'
	retlw 0x00

;-----------------------------------------
;Fonction : Message de boot ligne 2 du LCD
;Nom : bootmsgL2
;Entrée : 
;	v_charpos (1 byte) :position du caractère à retourner
;Sortie :
;	W (1 byte) : contient le caractère ou 0x00 si pas de caractère
;Traitement :
;	Zone de mémoire dédiée au stokage du message de boot (L2 du LCD)
; 	"F8KGL"
;-----------------------------------------  
bootmsgL2 
	addwf PCL, f
	retlw 'F'
	retlw '8'
	retlw 'K'
	retlw 'G'
	retlw 'L'
	retlw 0x00

;-----------------------------------------
;Fonction : Message de calibration ligne 1 du LCD
;Nom : calibmsgL1
;Entrée : 
;	v_charpos (1 byte) :position du caractère à retourner
;Sortie :
;	W (1 byte) : contient le caractère ou 0x00 si pas de caractère
;Traitement :
;	Zone de mémoire dédiée au stokage du message de calibration (L1 du LCD)
; 	"ADCfwd "
;-----------------------------------------  
calibmsgL1 
	addwf PCL, f
	retlw 'A'
	retlw 'D'
	retlw 'C'
	retlw 'f'
	retlw 'w'
	retlw 'd'
	retlw ' '
	retlw 0x00

;-----------------------------------------
;Fonction : Message de calibration ligne 2 du LCD
;Nom : calibmsgL2
;Entrée : 
;	v_charpos (1 byte) :position du caractère à retourner
;Sortie :
;	W (1 byte) : contient le caractère ou 0x00 si pas de caractère
;Traitement :
;	Zone de mémoire dédiée au stokage du message de calibration (L2 du LCD)
; 	"ADCref "
;-----------------------------------------  
calibmsgL2 
	addwf PCL, f
	retlw 'A'
	retlw 'D'
	retlw 'C'
	retlw 'r'
	retlw 'e'
	retlw 'f'
	retlw ' '
	retlw 0x00

	
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
; 	F 8 K G L                  v  0  .  1
;Traitement :
;	1.v_charpos = 0
;	2.Afficher le message de boot ligne 1 
;	tant que W !=0
;		récupérer le caractère de boot ligne 1
;		afficher 1 caractère sur le LCD
; 		incrémenter v_charpos
;	3.positionner le curseur sur la ligne 2
;		W=0x10
;	 	postionner le curseur
;	4.v_charpos = 0
;	5.Afficher le message de boot ligne 2
;	tant que W !=0
;		récupérer le caractère de boot ligne 2
;		afficher 1 caractère sur le LCD
;		incrémenter v_charpos
;	6.positionner le curseur sur la ligne 2, 13 ème colonne
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
	movlw 0x00
	movwf v_charpos
_lcd_affboot2 
	movf v_charpos, w ; put counter value in W
	call bootmsgL1 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affboot_3 ; display next message if finished
	call lcd_affchar
	incf v_charpos, f
	goto _lcd_affboot2
_lcd_affboot_3
	movlw 0x10
	call lcd_setposcursor
_lcd_affboot_4
	movlw 0x00
	movwf v_charpos
_lcd_affboot_5
	movf v_charpos, w ; put counter value in W
	call bootmsgL2 ; get a character from the text table
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affboot_6 ; display next message if finished
	call lcd_affchar
	incf v_charpos, f
	goto _lcd_affboot_5
_lcd_affboot_6
	movlw 0x1C
	call lcd_setposcursor
_lcd_affboot_7
	movlw 0x00
	movwf v_charpos
_lcd_affboot_8
	movf v_charpos,w
	bsf STATUS,RP0
	movwf EEADR
	bsf EECON1,RD
	movfw EEDATA
	bcf STATUS, RP0
	xorlw 0x00 ; is it a zero?
	btfsc STATUS, Z
	goto _lcd_affboot_9 ; finished
	call lcd_affchar
	incf v_charpos, f
	goto _lcd_affboot_8
_lcd_affboot_9	
	return

;-----------------------------------------
;Fonction : Affichage du message de calibration
;Nom : lcd_affcalib
;Entrée :
;	-message de calibration L1 et L2 en mémoire calibmsgL1 calibmsgL2
;Sortie :
; 	Sur le LCD :
;       1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
; 	A D C f w d   x x x  x
; 	A D C r e f   y y y  y
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
	
	global lcd_affboot
	global lcd_affcalib

	end 
