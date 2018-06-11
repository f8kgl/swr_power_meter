	include "p16f88.inc" ;include the defaults for the chip

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
c_bootmsgL1 
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
	retlw 'M'
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
c_bootmsgL2 
	addwf PCL, f
	retlw 'F'
	retlw '8'
	retlw 'K'
	retlw 'G'
	retlw 'L'
	retlw 0x00

IFDEF TEST
;-----------------------------------------
;Fonction : Message du mode de test ligne 1 du LCD
;Nom : testmsgL1
;Entrée : 
;	v_charpos (1 byte) :position du caractère à retourner
;Sortie :
;	W (1 byte) : contient le caractère ou 0x00 si pas de caractère
;Traitement :
;	Zone de mémoire dédiée au stokage du message de calibration (L1 du LCD)
; 	"FWD "
;-----------------------------------------  
c_testmsgL1
	addwf PCL, f
	retlw 'F'
	retlw 'W'
	retlw 'D'
	retlw ' '
	retlw 0x00

;-----------------------------------------
;Fonction : Message du mode de test ligne 2 du LCD
;Nom : calibmsgL2
;Entrée : 
;	v_charpos (1 byte) :position du caractère à retourner
;Sortie :
;	W (1 byte) : contient le caractère ou 0x00 si pas de caractère
;Traitement :
;	Zone de mémoire dédiée au stokage du message de calibration (L2 du LCD)
; 	"REF "
;-----------------------------------------  
c_testmsgL2 
	addwf PCL, f
	retlw 'R'
	retlw 'E'
	retlw 'F'
	retlw ' '
	retlw 0x00
ENDIF

	global c_bootmsgL1
	global c_bootmsgL2
IFDEF TEST
	global c_testmsgL1
	global c_testmsgL2
ENDIF
	
	end

	
