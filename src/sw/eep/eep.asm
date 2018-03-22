	include "p16f88.inc" ;include the defaults for the chip
	include "eep.inc"


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
.s_eep code __SW_VERSION_EEP_ADDR
c_swversion	
	DE SW_VERSION
	DE 0x00 		;marqueur de fin

	end
