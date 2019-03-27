	include "p18f1320.inc" ;include the defaults for the chip
	include "eep.inc"


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

	global f_eep_readbyte

	end
