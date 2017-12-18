	include "p16f88.inc" ;include the defaults for the chip
	include "eep.inc"


	code
;-----------------------------------------
;Fonction : Lecture d'un octet en EEPROM
;Nom : eep_readbyte
;Entrée :
;	-W : contient l'adresse de l'octer à lire en EEPROM
;Sortie :
; 	-W : contient l'octet lu
;Traitement :
;	-EECON(RF) = b(1)
;	-W = EEDATA
;----------------------------------------- 	
eep_readbyte
	BANKSEL EEADR
	movwf EEADR
	BANKSEL EECON1
	bcf EECON1, EEPGD
	bsf EECON1,RD
	BANKSEL EEDATA
	movfw EEDATA
	return

	global eep_readbyte

	end
