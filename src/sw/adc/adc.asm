	include "p18f1320.inc" ;include the defaults for the chip
	include "ltc2305.inc"

	extern v_i2c_device_addr
	extern v_i2c_data_size
	extern v_i2c_p_send_data
	extern v_i2c_p_receive_data

	extern f_i2c_write_in_device
	extern f_i2c_read_in_device


	udata
_v_adc res 2
_v_adc_cde res 1
_v_adc_count res 1



	code

;-----------------------------------------
;Fonction : Lire le résultat de la conversion A/N AN0
;Nom : _f_adc_read_fwd
;Entrée :
;	-
;Sortie :
;Traitement :
;-----------------------------------------
_f_adc_send_read_fwd_cde
	movlw I2C_ADDR_DEVICE_LTC2305
	movwf v_i2c_device_addr
	movlw 0x01
	movwf v_i2c_data_size
	movlw LTC2305_CDE_READ_CHO
	movwf _v_adc_cde
	movlw _v_adc_cde
	movwf v_i2c_p_send_data+1
	call f_i2c_write_in_device
	return

_f_adc_send_read_ref_cde
	movlw I2C_ADDR_DEVICE_LTC2305
	movwf v_i2c_device_addr
	movlw 0x01
	movwf v_i2c_data_size
	movlw LTC2305_CDE_READ_CH1
	movwf _v_adc_cde
	movlw _v_adc_cde
	movwf v_i2c_p_send_data+1
	call f_i2c_write_in_device
	return

_f_adc_read
	movlw 0x02
	movwf v_i2c_data_size
	movlw _v_adc
	movwf v_i2c_p_receive_data+1
	call f_i2c_read_in_device
_f_adc_read_fwd_2
	movlw 0x04
	movwf _v_adc_count
_f_adc_read_fwd_3
	bcf STATUS,0 ;carry=0 pour shifter dans v_adcfwd
	rrcf _v_adc,f
	rrcf _v_adc+1,f
	decfsz _v_adc_count,f
	goto _f_adc_read_fwd_3
_f_adc_read_fwd_4
	movlw 0x08
	iorwf _v_adc,f
	comf  _v_adc,f
	movlw 0x0F   ;le résultat est sur 12 bits alors on masque les 4 bits
	andwf _v_adc,f ;de poids faible sur le nibble de poids fort
	comf  _v_adc+1,f
	incf  _v_adc+1,f ;propagation de la retenue
	btfsc STATUS,C
	incf _v_adc,f
	return

f_adc_read

	call _f_adc_send_read_fwd_cde
	call _f_adc_read
	swapf _v_adc,f
	movff _v_adc,INDF0
	swapf _v_adc+1,W
	andlw 0x0F
	iorwf POSTINC0
	swapf _v_adc+1,W
	andlw 0xF0
	iorwf INDF0

	call _f_adc_send_read_ref_cde
	call _f_adc_read
	movlw 0x0F
	andwf _v_adc,W
	iorwf POSTINC0
	movff _v_adc+1,INDF0

	return


	global f_adc_read

	end
