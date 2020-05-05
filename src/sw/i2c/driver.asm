	include "p18f1320.inc" ;include the defaults for the chip
	include "i2c.inc"

  	udata
v_i2c_data_byte_to_send res 1
v_i2c_data_byte_received res 1
v_i2c_count res 1
v_i2c_status res 1


	extern Del_11us

	code

f_i2c_init
	m_sda_output
	bsf	I2C_PORT,SDA		;SDA a 1
	bsf	I2C_PORT,SCL		;SCL a 1
	return

f_i2c_start
	bsf	I2C_PORT,SCL		;SCL a 1
	bsf	I2C_PORT,SDA		;SDA a 1
	bcf	I2C_PORT,SDA		;SDA a 0
	return

f_i2c_stop
	bcf	I2C_PORT,SDA		;SDA a 0
	bsf	I2C_PORT,SCL		;SCL a 1
	bsf	I2C_PORT,SDA		;SDA a 1
	return

f_i2c_check_slave_ack
	bcf	I2C_PORT,SCL		;SCL a 0
	m_sda_input			;SDA en entrée
	CALL	Del_11us
	bsf	I2C_PORT,SCL		;SCL a 1
	CALL	Del_11us
	btfsc	I2C_PORT,SDA		;Si 1 ecriture d'un flag d'erreur
	call	_f_i2c_no_ack_received
	bcf	I2C_PORT,SCL		;SCL a 0
	CALL	Del_11us
	m_sda_output			;SDA en sortie
	return

f_i2c_send_master_ack
	bcf	I2C_PORT,SCL		;SCL a 0
	m_sda_output			;SDA en sortie
	bcf	I2C_PORT,SDA		;SDA a 0
	bsf	I2C_PORT,SCL		;SCL a 1
	CALL	Del_11us
	bcf	I2C_PORT,SCL		;SCL a 0
	CALL	Del_11us
	bsf	I2C_PORT,SDA		;SDA a 1
	return

f_i2c_send_master_nack
	bcf	I2C_PORT,SCL		;SCL a 0
	m_sda_output			;SDA en sortie
	bsf	I2C_PORT,SDA		;SDA a 1
	bsf	I2C_PORT,SCL		;SCL a 1
	CALL	Del_11us
	bcf	I2C_PORT,SCL		;SCL a 0
	CALL	Del_11us
	bcf	I2C_PORT,SDA		;SDA a 0
	return

f_i2c_send_byte
	movwf	v_i2c_data_byte_to_send
	movlw	d'8'
	movwf	v_i2c_count
_f_i2c_send_byte_next_data_s
	bcf	I2C_PORT,SCL		;SCL a 0
	CALL	Del_11us
	rlcf	v_i2c_data_byte_to_send,f	;Rotation a gauche bit(I) dans la carry
	btfsc	carry_bit		;Si I=1
	bsf	I2C_PORT,SDA		;SDA a 1
	btfss	carry_bit		;Si I=0
	bcf	I2C_PORT,SDA		;SDA a 0
	bsf	I2C_PORT,SCL		;SCL a 1
	CALL	Del_11us
	decfsz	v_i2c_count,f		;Si I!=0
	goto	_f_i2c_send_byte_next_data_s

	bcf	I2C_PORT,SCL	;SCL a 0
	CALL	Del_11us ;est-ce que ce sera assez long ???

	call	f_i2c_check_slave_ack

	return

f_i2c_receive_byte
	movlw	d'8'
	movwf	v_i2c_count
	clrf	v_i2c_data_byte_received
	m_sda_input			;SDA en entrée
_f_i2c_send_byte_next_data_next_data_r:
	bcf	I2C_PORT,SCL		;SCL a 0
	CALL	Del_11us
	bsf	I2C_PORT,SCL		;SCL a 1
	CALL	Del_11us
	btfsc	I2C_PORT,SDA		;Si SDA=1
 	bsf	carry_bit
	btfss	I2C_PORT,SDA		;Si SDA=0
	bcf	carry_bit

	rlcf	v_i2c_data_byte_received,f	;décallage à gauche et met la carry dans le LSB

	decfsz	v_i2c_count,f		;Si I!=0
	goto	_f_i2c_send_byte_next_data_next_data_r

	bcf	I2C_PORT,SCL	;SCL a 0
	CALL	Del_11us

	call	f_i2c_send_master_ack

	return

f_i2c_receive_last_byte
	movlw	d'8'
	movwf	v_i2c_count
	m_sda_input			;SDA en entrée
_f_i2c_receive_last_byte_next_data_r
	bcf	I2C_PORT,SCL		;SCL a 0
	CALL	Del_11us
	bsf	I2C_PORT,SCL		;SCL a 1
	CALL	Del_11us
	btfsc	I2C_PORT,SDA		;Si SDA=1
 	bsf	carry_bit
	btfss	I2C_PORT,SDA		;Si SDA=0
	bcf	carry_bit

	rlcf	v_i2c_data_byte_received,f	;décalage à gauche et met la carry dans le LSB

	decfsz	v_i2c_count,f		;Si I!=0
	goto	_f_i2c_receive_last_byte_next_data_r

	bcf	I2C_PORT,SCL	;SCL a 0
	CALL	Del_11us

	call	f_i2c_send_master_nack

	return


;-----------------------------------------------------------------------------------------
;	v_i2c_status
;		0: NO_ACK
;		1:
;		2:
;		3:
;		4:
;		5:
;		6:
;		7:
;


_f_i2c_no_ack_received
	bsf	v_i2c_status,0	;Pas d'ack de l'esclave -> problème de comm

	return

	global v_i2c_data_byte_to_send
	global v_i2c_data_byte_received
	global v_i2c_count
	global v_i2c_status

	global f_i2c_init
	global f_i2c_start
	global f_i2c_stop
	global f_i2c_send_byte
	global f_i2c_check_slave_ack
	global f_i2c_receive_byte
	global f_i2c_receive_last_byte

	end
