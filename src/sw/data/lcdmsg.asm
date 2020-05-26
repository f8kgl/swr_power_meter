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
	movwf v_lcdmsg_temp
	movlw HIGH _c_bootmsgL1_2
	movwf PCLATH
	movlw _c_bootmsgL1_2
	addwf v_lcdmsg_temp,W
	btfsc STATUS,C
	incf PCLATH ;retenu à 1 => pas de changement de page
	movf v_lcdmsg_temp,w
	addwf PCL, f
_c_bootmsgL1_2
IFDEF TEST
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
	retlw 'm'
	retlw 'e'
	retlw 't'
	retlw 'e'
	retlw 'r'
ELSE
IFDEF SWR_POWER_METER
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
	retlw 'm'
	retlw 'e'
	retlw 't'
	retlw 'e'
	retlw 'r'
ELIFDEF xWATT_METER
	retlw ' '
	retlw ' '
	retlw ' '
	retlw ' '
	retlw 'x'
	retlw 'W'
	retlw 'A'
	retlw 'T'
	retlw 'T'
	retlw ' '
	retlw 'm'
	retlw 'e'
	retlw 't'
	retlw 'e'
	retlw 'r'
ENDIF ;#ifdef CALIBRATION ou OPERATIONNEL
ENDIF ;#ifdef TEST
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
	movwf v_lcdmsg_temp
	movlw HIGH _c_bootmsgL2_2
	movwf PCLATH
	movlw _c_bootmsgL2_2
	addwf v_lcdmsg_temp,W
	btfsc STATUS,C
	incf PCLATH ;retenu à 1 => pas de changement de page
	movf v_lcdmsg_temp,w
	addwf PCL, f
_c_bootmsgL2_2
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
	movlw HIGH _c_testmsgL1_2
	movwf PCLATH
	movlw _c_testmsgL1_2
	addwf v_lcdmsg_temp,W
	btfsc STATUS,C
	incf PCLATH ;retenu à 1 => pas de changement de page
	movf v_lcdmsg_temp,w
	addwf PCL, f
_c_testmsgL1_2
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
	movlw HIGH _c_testmsgL2_2
	movwf PCLATH
	movlw _c_testmsgL2_2
	addwf v_lcdmsg_temp,W
	btfsc STATUS,C
	incf PCLATH ;retenu à 1 => pas de changement de page
	movf v_lcdmsg_temp,w
	addwf PCL, f
_c_testmsgL2_2
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
