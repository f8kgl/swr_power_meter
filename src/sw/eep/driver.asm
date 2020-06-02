	include "p18f1320.inc" ;include the defaults for the chip
	include "eep.inc"

	udata
v_eep_byte_to_write res 1

	code
;-----------------------------------------
;Fonction : Lecture d'un octet en EEPROM
;Nom : eep_readbyte
;Entrée :
;	-W : contient l’offset à partir de __EEPROM_START de l'adresse à lire en EEPROM
;Sortie :
; 	-W : contient l'octet lu
;Traitement :
;	-EEADR = W
;	-EECON(EEPGD) = b(0)
;	-EECON(RD) = b(1)
;	-W = EEDATA
;----------------------------------------- 	
f_eep_readbyte
	movwf EEADR
	bcf 	EECON1,CFGS
	bcf EECON1, EEPGD
	bsf EECON1,RD
	movf EEDATA,w
	clrf	EECON1
	return
	
	
f_eep_writebyte
	movwf EEADR            ;address being transferred to EEADR
    movf  v_eep_byte_to_write,W
	movwf EEDATA        ;data goes to EEDATA register
	bcf EECON1, EEPGD
	bsf EECON1,WREN
	bcf INTCON, GIE        ;all interrupts are disabled
    movlw 55h            
	movwf EECON2
	movlw AAh  
	movwf EECON2
	bsf EECON1,WR
	bsf INTCON, GIE        ;all interrupts are disabled
	SLEEP
	bcf EECON1,WREN
	return

	global f_eep_readbyte
	global f_eep_writebyte
	global v_eep_byte_to_write

	end
