	include "p16f628a.inc" ;include the defaults for the chip
	include "eep.inc"


	code
;-----------------------------------------
;Fonction : Lecture d'un octet en EEPROM
;Nom : eep_readbyte
;Entrée :
;	-EEADDR : contient l'adresse de l'octer à lire en EEPROM
;Sortie :
; 	-W : contient l'octet lu
;Traitement :
;	-EECON(RF) = b(1)
;	-W = EEDATA
;----------------------------------------- 	
eep_readbyte
	bsf EECON1,RD
	movfw EEDATA
	return

	global eep_readbyte

	end
