	include "p18f1320.inc" ;include the defaults for the chip
	include "lcd.inc"

  	udata
v_temp res 1
v_poscursor res 1
v_lcd_count res 1
;v_lcd_change_page res 1
;v_lcd_addr_offset res 1


	extern D160us
	extern Del255
	extern Del200
	extern Del100
	extern Del50
	extern Del20
	extern Del05
	extern Del01
	extern v_lcd_hexa_to_conv
	extern v_lcd_bcd

	code
;-----------------------------------------
Pulse_e
	bsf LCD_PORT, LCD_E ; LCD Enable pulse to write data from PORTB
	nop ; into LCD module.
	bcf LCD_PORT, LCD_E ;
	nop ;
	retlw 0x00 ;

;-----------------------------------------
;Fonction : Envoi d’une commande au LCD
;Nom : lcd_sendcmd
;Entrée :
;		-W
;		 +taille = 1 byte
;		 +description = contient la commande
;  			0x28  Set Interface Length
;			0x10  Turn Off Display
;			0x01  Clear Display RAM
;			0x06  Set Cursor Movement
;		 	0x0C  Turn on Display/Cursor
;			0x01  Clear display
;			0xc0  move to 2nd row, first column
;Sortie :
;Traitement :
;-----------------------------------------
_f_lcd_sendcmd	; Send the Instruction to the LCD
	movwf v_temp ; Save the Value
	andlw 0xF0 ; Most Significant Nibble first
	movwf LCD_PORT ;
	bcf LCD_PORT, LCD_RS ;
	call Pulse_e ;
	swapf v_temp, w ; Least Significant Nibble Second
	andlw 0xF0 ;
	movwf LCD_PORT ;
	bcf LCD_PORT, LCD_RS ;
	call Pulse_e ;
	call Del01 ; wait 1 ms
	movf v_temp, w ;
	andlw 0xFC ; Have to Delay 5 msecs?
	btfsc STATUS, Z ;
	call Del01 ; 1ms
	return ;

;-----------------------------------------
;Fonction : Positionne le curseur du LCD
;Nom : lcd_setposcursor
;Entrée :
;		-W
;		 +taille = 1 byte
;		 +description = contient la position du curseur
;  			0-15 : 1ère ligne
;			16-31 : 2ème ligne
;Sortie :
;Traitement :
;		1.	Si le curseur doit être positionné sur la première ligne :
;			W = W + 0x80
;			Si le curseur doit être positionné sur la deuxième ligne :
;			W = W + 0xB0
;		2.	Appeler lcd_sendcmd
;-----------------------------------------
f_lcd_setposcursor
	movwf v_poscursor
	sublw 0x10
	btfss STATUS,C
	goto _lcd_setposcursor_testZ; C=0
	btfss STATUS,Z; C=1
	goto  _setposcursorL1; C=1;Z=0
	goto _setposcursorL2; C=1;Z=1
_lcd_setposcursor_testZ
	btfss STATUS,Z; C=0
	goto _setposcursorL2;C=0;Z=0
	goto _lcd_setposcursor_error;; C=0;Z=1
_setposcursorL1
	movf v_poscursor,w
	addlw 0x80
	goto _lcd_setposcursor
_setposcursorL2
	movf v_poscursor,w
	addlw 0xB0
_lcd_setposcursor
	call _f_lcd_sendcmd
_lcd_setposcursor_error
	return ;

;-----------------------------------------
;Fonction : Efface le LCD
;Nom : lcd_clear
;Entrée :
;Sortie :
;Traitement :
;		1.	W=0x01
;		2.	Appeler lcd_sendcmd
;-----------------------------------------
f_lcd_clear
	movlw 0x01 ; Clear display
	call _f_lcd_sendcmd
	return

;-----------------------------------------
;Fonction : Positionne le curseur sur la 2ème ligne
;Nom : lcd_setposL2
;Entrée :
;Sortie :
;Traitement :
;		1.	W=0xC0
;		2.	Appeler lcd_sendcmd
;-----------------------------------------
f_lcd_setposL2
	movlw 0xc0 ; move to 2nd row, first column
	call _f_lcd_sendcmd ;
	return

;-----------------------------------------
;Fonction : Conversion hexa-ASCII
;Nom : lcd_convtoascii
;Entrée :
;		-W
;		 +taille = 1 byte (données utile sur le quartet de poid faible)
;		 +description = contient la valeur à convertir
;Sortie :
;		-W
;		 +taille = 1 byte
;		 +description = contient la valeur convertie
;Traitement :
;
;-----------------------------------------
f_lcd_convtoascii
	mullw 0x02
	movlw HIGH _f_lcd_convtoascii_2
	movwf PCLATH
	movlw _f_lcd_convtoascii_2
	addwf PRODL,W
	btfsc STATUS,C
	incf PCLATH ;retenu à 1 => pas de changement de page
	movf PRODL,w
	addwf PCL, f
_f_lcd_convtoascii_2
	retlw 0x30		;'0'
	retlw 0x31		;'1'
	retlw 0x32		;'2'
	retlw 0x33		;'3'
	retlw 0x34		;'4'
	retlw 0x35		;'5'
	retlw 0x36		;'6'
	retlw 0x37		;'7'
	retlw 0x38		;'8'
	retlw 0x39		;'9'
	retlw 0x41		;'A'
	retlw 0x42		;'B'
	retlw 0x43		;'C'
	retlw 0x44		;'D'
	retlw 0x45		;'E'
	retlw 0x46		;'F'
	return

;-----------------------------------------
;Fonction : Conversion hexa-bcd
;Nom : f_lcd_convtobcd
;Entrée :
;	v_lcd_hexa_to_conv (2 bytes) : 2 octets à convertir en BCD
;Sortie :
;	v_lcd_bcd (3 bytes) : 3 octets convertis en BCD

;Traitement :
;http://www.microchip.com/forums/m322713.aspx
;-----------------------------------------
f_lcd_convtobcd
	clrf    v_lcd_bcd
  clrf    v_lcd_bcd+1
  clrf    v_lcd_bcd+2

  movlw   D'16'
  movwf   v_lcd_count
_f_lcd_convtobcd_1
  rlcf    v_lcd_hexa_to_conv+1,F
  rlcf    v_lcd_hexa_to_conv,F
  movf    v_lcd_bcd+2,W
  addwfc  v_lcd_bcd+2,W
  daw
  movwf   v_lcd_bcd+2
  movf    v_lcd_bcd+1,W
  addwfc  v_lcd_bcd+1,W
  daw
  movwf   v_lcd_bcd+1
  rlcf    v_lcd_bcd,F
  decfsz  v_lcd_count,f
  bra     _f_lcd_convtobcd_1
  return


;Fonction : Initialisation du LCD
;Nom : f_lcd_init
;Entrée :
;Sortie :
;Traitement :
;-----------------------------------------
f_lcd_init
	call Del05 ; Wait 15 msecs
	call Del05 ;
	call Del05 ;
	movlw 0x030 ; Send the Reset Instruction
	movwf LCD_PORT ;
	call Pulse_e ; Pulse LCD_E
	call Del05 ; Delay 5ms
	call Pulse_e ; Pulse LCD_E
	call D160us ; Delay of 160us
	call Pulse_e ; Pulse LCD_E
	call D160us ; Delay of 160us
	movlw 0x020 ; Send the Data Length Specification
	movwf LCD_PORT ;
	call Pulse_e ; Pulse LCD_E
	call D160us ; Delay of 160us
	movlw 0x028 ; Set Interface Length
	call _f_lcd_sendcmd ;
	movlw 0x010 ; Turn Off Display
	call _f_lcd_sendcmd ;
	movlw 0x001 ; Clear Display RAM
	call _f_lcd_sendcmd ;
	movlw 0x006 ; Set Cursor Movement
	call _f_lcd_sendcmd ;
	movlw 0x00C ; Turn on Display/Cursor
	call _f_lcd_sendcmd ;
	call f_lcd_clear ; Clear the LCD
	return ;

;-----------------------------------------
;Fonction : Affichage d'un caractère
;Nom : lcd_affchar
;Entrée :
;		-W
;		 +taille = 1 byte
;		 +description = contient le caractère à afficher à la position courante du curseur
;Sortie :
;Traitement :
;-----------------------------------------
f_lcd_affchar	; Send the Character to the LCD
	movwf v_temp ; Save the Value
	andlw 0xF0 ; Most Significant Nibble first
	movwf LCD_PORT ;
 	bsf LCD_PORT, LCD_RS ;
	call Pulse_e ;
	swapf v_temp, w ; Least Significant Nibble Second
	andlw 0xF0 ;
	movwf LCD_PORT ;
 	bsf LCD_PORT, LCD_RS ;
	call Pulse_e ;
	call Del05 ;
	return ;

	global f_lcd_init
	global f_lcd_affchar
	global f_lcd_setposcursor
	global f_lcd_clear
	global f_lcd_convtoascii
	global f_lcd_convtobcd

	end
