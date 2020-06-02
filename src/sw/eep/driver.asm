	include "p18f1320.inc" ;include the defaults for the chip
	include "eep.inc"

	udata
v_eep_byte_to_write res 1
v_eep_status res 1
v_eep_timer res 1

	extern delay_10ms

	code
_f_eep_timeout
	  bsf v_eep_status,BIT_EEP_STATUS_TIMEOUT
	  return


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
	movlw D'10'
	movwf v_eep_timer
  movf  v_eep_byte_to_write,W
	movwf EEDATA        ;data goes to EEDATA register
	bcf EECON1, EEPGD
	bsf EECON1,WREN
  movlw 0x55
	movwf EECON2
	movlw 0xAA
	movwf EECON2
	bsf EECON1,WR

_f_eep_writebyte_loop
	btfsc PIR2,EEIF
  goto _f_eep_writebyte_is_timeout
	goto _f_eep_writebyte_end

_f_eep_writebyte_is_timeout
	call delay_10ms
	decfsz v_eep_timer,f
	goto _f_eep_writebyte_loop
  call _f_eep_timeout

_f_eep_writebyte_end
	bcf EECON1,WREN
	return

	global f_eep_readbyte
	global f_eep_writebyte
	global v_eep_byte_to_write

	end
