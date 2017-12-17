	include "p16f628a.inc" ;include the defaults for the chip
	include "lcd.inc"

  	udata
v_timer res 1 
v_timerA res 1
v_timerB res 1
v_temp res 1
v_poscursor res 1	

	code
;-----------------------------------------
Pulse_e
	bsf LCD_PORT, LCD_E ; LCD Enable pulse to write data from PORTB
	nop ; into LCD module.
	bcf LCD_PORT, LCD_E ; 
	nop ;
	retlw 0x00 ;
	 
;----------------------------------------- 
; Delay routines...
D160us
	clrf v_timer ; 
	bsf v_timer, 5 ; Delay 160 usecs
	bsf v_timer, 4 ;
	decfsz v_timer, f ;
	goto $ - 1 ;
	return ;
	 
Del255
	movlw 0xff ; delay 255 mS
	goto d0 ;
Del200
	movlw d'200' ; delay 200mS
	goto d0 ;
Del100
	movlw d'100' ; delay 100mS
	goto d0 ;
Del50	
	movlw d'50' ; delay 50mS
	goto d0 ;
Del20
	movlw d'20' ; delay 20mS
	goto d0 ;
Del05
	movlw 0x05 ; delay 5.000 ms (4 MHz clock)
	goto d0 ;
Del01
	movlw 0x01 ; delay 1.000 ms (4 MHz clock)
d0
	movwf v_timer ;
d1
	movlw 0xC7 ; delay 1mS
	movwf v_timerA ;
	movlw 0x01 ;
	movwf v_timerB ;
Del_0
	decfsz v_timerA,f ;
	goto $+2 ;
	decfsz v_timerB,f ;
	goto Del_0 ;
	decfsz v_timer,f ;
	goto d1 ;
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
lcd_sendcmd	; Send the Instruction to the LCD
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
lcd_setposcursor
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
	call lcd_sendcmd
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
lcd_clear
	movlw 0x01 ; Clear display
	call lcd_sendcmd
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
lcd_setposL2
	movlw 0xc0 ; move to 2nd row, first column
	call lcd_sendcmd ;
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
;		W=W+0x30
;----------------------------------------- 
lcd_convtoascii
	addlw 0x30 ; add 0x30 to convert to ASCII
	return	

;Fonction : Initialisation du LCD
;Nom : lcd_init
;Entrée : 
;Sortie : 
;Traitement : 4 Bit Initialization...
;-----------------------------------------
lcd_init
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
	call lcd_sendcmd ;
	movlw 0x010 ; Turn Off Display
	call lcd_sendcmd ; 
	movlw 0x001 ; Clear Display RAM
	call lcd_sendcmd ;
	movlw 0x006 ; Set Cursor Movement
	call lcd_sendcmd ;
	movlw 0x00C ; Turn on Display/Cursor
	call lcd_sendcmd ;
	call lcd_clear ; Clear the LCD
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
lcd_affchar	; Send the Character to the LCD
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
	nop ;
	return ;

	global lcd_init
	global lcd_affchar
	global lcd_setposcursor
	global lcd_clear
	 
	end 
