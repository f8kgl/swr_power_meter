	include "p18f1320.inc" ;include the defaults for the chip
	include "eep.inc"


;-----------------------------------------
;Fonction : Message de version courante du logiciel
;Nom :
;Entrée :
;Sortie :
;Traitement :
;	Zone de mémoire (5 bytes) dédiée au stokage de la version logcielle
; 	"V1.0" par exemple
; cette zone de mémoire est placée en 0x2100 systématiquement par le compilateur
; cette zone est remplie par le compilateur
;-----------------------------------------
s_eep code __SW_START_EEP_ADDR
	DE SW_VERSION
	DE 0x00 ;marqueur de fin
	DE LOG_ADDR_IN_EEP
	;FWD
	DE 0x00 ;RDAC0 (n=0)
	DE 0x00
	DE 0x00 ;RDAC1 (n=1)
	DE 0x40
	DE 0x00 ;RDAC2 (n=2)
	DE 0xC0
	DE 0x01 ;RDAC3 (n=3)
	DE 0xC0
	DE 0x03 ;RDAC4 (n=4)
	DE 0xC0
	;REF
	DE 0x00 ;RDAC0 (n=0)
	DE 0x00
	DE 0x00 ;RDAC1 (n=1)
	DE 0x40
	DE 0x00 ;RDAC2 (n=2)
	DE 0xC0
	DE 0x01 ;RDAC3 (n=3)
	DE 0xC0
	DE 0x03 ;RDAC4 (n=4)
	DE 0xC0
	end
