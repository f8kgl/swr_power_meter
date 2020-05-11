	include "p18f1320.inc" ;include the defaults for the chip

	udata
v_lcdmsg_temp res 1
v_lcdmsg_change_page res 1
v_lcdmsg_addr_offset res 1

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
	retlw ' '
	retlw ' '
	retlw ' '
	retlw ' '
	retlw 'I'
	retlw '2'
	retlw 'C'
	retlw ' '
	retlw ' '
	retlw 'T'
	retlw 'e'
	retlw 's'
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
;	w (1 byte) :position du caractère à retourner
;Sortie :
;	W (1 byte) : contient le caractère ou 0x00 si pas de caractère
;Traitement :
;	Zone de mémoire dédiée au stokage du message de calibration (L1 du LCD)
; 	"FWD "
;-----------------------------------------
c_testmsgL1
	movwf v_lcdmsg_temp
  movlw HIGH c_testmsgL1 
	movwf PCLATH
	movlw _c_testmsgL1_2
	movwf v_lcdmsg_addr_offset
	movlw c_testmsgL1
	subwf v_lcdmsg_addr_offset,f         ;v_lcdmsg_addr_offset = v_lcdmsg_addr_offset - W = c_testmsgL1_2 - c_testmsgL1

	movlw c_testmsgL1
	addwf v_lcdmsg_addr_offset,w ;pour pointer sur le début de la table (ignore addwd pcl)
	btfsc STATUS,C
	bsf	v_lcdmsg_change_page,0
	addlw 0x02 ;pour ignore l'instruction addwf pcl
	btfsc STATUS,C
	bsf	v_lcdmsg_change_page,0
	addwf v_lcdmsg_temp,W
	btfsc STATUS,C
	bsf	v_lcdmsg_change_page,0

	btfss v_lcdmsg_change_page,0
	goto _c_testmsgL1_2 ;retenu à 0 => pas de changement de page dans le programme
  movlw HIGH c_testmsgL1 ;sinon la retenue est à 1, et il faut changer de page
 	addlw 0x01
	movwf PCLATH
_c_testmsgL1_2
	movf v_lcdmsg_temp,w
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
;	w (1 byte) :position du caractère à retourner
;Sortie :
;	W (1 byte) : contient le caractère ou 0x00 si pas de caractère
;Traitement :
;	Zone de mémoire dédiée au stockage du message de calibration (L2 du LCD)
; 	"REF "
;-----------------------------------------
c_testmsgL2
	movwf v_lcdmsg_temp
  movlw HIGH c_testmsgL2
	movwf PCLATH
	movlw _c_testmsgL2_2
	movwf v_lcdmsg_addr_offset
	movlw c_testmsgL2
	subwf v_lcdmsg_addr_offset,f         ;v_lcdmsg_addr_offset = v_lcdmsg_addr_offset - W = c_testmsgL1_2 - c_testmsgL1
	movlw c_testmsgL2
	addwf  v_lcdmsg_addr_offset,w ;pour pointer sur le début de la table
	btfsc STATUS,C
	bsf	v_lcdmsg_change_page,0
	addwf v_lcdmsg_temp,W
	btfsc STATUS,C
	bsf	v_lcdmsg_change_page,0

	btfss v_lcdmsg_change_page,0
	goto _c_testmsgL2_2 ;retenu à 0 => pas de changement de page dans le programme
  movlw HIGH c_testmsgL2 ;sinon la retenue est à 1, et il faut changer de page
 	addlw 0x01
_c_testmsgL2_2
	movf v_lcdmsg_temp,w
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
