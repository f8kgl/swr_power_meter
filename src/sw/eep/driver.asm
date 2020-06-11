	include "p18f1320.inc" ;include the defaults for the chip
	include "eep.inc"

	udata
v_eep_int_byte_to_write res 1
v_eep_int_status res 1
v_eep_int_timer res 1
v_eep_ext_cde res 2
v_eep_ext_addr res 2
v_eep_ext_byte_read res 1

	extern delay_10ms
	extern v_i2c_data_size
	extern v_i2c_device_addr
	extern v_i2c_p_receive_data
	extern v_i2c_p_send_data
	extern v_i2c_p_send_data
	extern f_i2c_read_in_device
	extern f_i2c_write_in_device

	code
_f_eep_int_timeout
	  bsf v_eep_int_status,BIT_EEP_STATUS_TIMEOUT
	  return


f_eep_ext_readbyte
	movlw I2C_ADDR_DEVICE_24AA256
	movwf v_i2c_device_addr
	movlw 0x02
	movwf v_i2c_data_size
	movff v_eep_ext_addr, v_eep_ext_cde
	movff v_eep_ext_addr+1, v_eep_ext_cde+1
	movlw v_eep_ext_cde
	movwf v_i2c_p_send_data
	call f_i2c_write_in_device
_f_eep_ext_readbyte_2
	movlw 0x01
	movwf v_i2c_data_size
	movlw v_eep_ext_byte_read
	movwf v_i2c_p_receive_data
	call f_i2c_read_in_device
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
f_eep_int_readbyte
	movwf EEADR
	bcf 	EECON1,CFGS
	bcf EECON1, EEPGD
	bsf EECON1,RD
	movf EEDATA,w
	clrf	EECON1
	return


f_eep_int_writebyte
	movwf EEADR            ;address being transferred to EEADR
	movlw D'10'
	movwf v_eep_int_timer
  movf  v_eep_int_byte_to_write,W
	movwf EEDATA        ;data goes to EEDATA register
	bcf EECON1, EEPGD
	bsf EECON1,WREN
  movlw 0x55
	movwf EECON2
	movlw 0xAA
	movwf EECON2
	bsf EECON1,WR

_f_eep_int_writebyte_loop
	btfsc PIR2,EEIF
  goto _f_eep_int_writebyte_is_timeout
	goto _f_eep_int_writebyte_end

_f_eep_int_writebyte_is_timeout
	call delay_10ms
	decfsz v_eep_int_timer,f
	goto _f_eep_int_writebyte_loop
  call _f_eep_int_timeout

_f_eep_int_writebyte_end
	bcf EECON1,WREN
	return

	global f_eep_int_readbyte
	global f_eep_int_writebyte
	global v_eep_int_byte_to_write
	global f_eep_ext_readbyte
	global v_eep_ext_addr
	global v_eep_ext_byte_read
	
	end
