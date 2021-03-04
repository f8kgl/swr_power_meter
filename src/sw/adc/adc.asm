	include "p18f1320.inc" ;include the defaults for the chip
	include "ltc2305.inc"

	udata
v_adcfwd res 2
v_adcref res 2
v_adccde res 1
v_adc_count res 1

	extern v_i2c_device_addr
  extern v_i2c_data_size
	extern v_i2c_p_send_data
	extern v_i2c_p_receive_data
	extern f_i2c_init
	extern f_i2c_write_in_device
	extern f_i2c_read_in_device


	code

;-----------------------------------------
;Fonction : Lire le résultat de la conversion A/N AN0
;Nom : f_adc_read_fwd
;Entrée :
;	-
;Sortie :
;Traitement :
;-----------------------------------------
f_adc_read_fwd
	movlw I2C_ADDR_DEVICE_LTC2305
	movwf v_i2c_device_addr
	movlw 0x01
	movwf v_i2c_data_size
	movlw LTC2305_CDE_READ_CHO
	movwf v_adccde
	movlw v_adccde
	movwf v_i2c_p_send_data
	call f_i2c_write_in_device
_f_adc_read_fwd_2
	movlw 0x02
	movwf v_i2c_data_size
	movlw v_adcfwd
	movwf v_i2c_p_receive_data
	call f_i2c_read_in_device
_f_adc_read_fwd_3
	movlw 0x04
	movwf v_adc_count
_f_adc_read_fwd_4
	bcf STATUS,0 ;carry=0 pour shifter dans v_adcfwd
	rrcf v_adcfwd,f
	rrcf v_adcfwd+1,f
	decfsz v_adc_count,f
	goto _f_adc_read_fwd_4
_f_adc_read_fwd_5
	movlw 0x08
	iorwf v_adcfwd,f
	comf  v_adcfwd,f
	movlw 0x0F   ;le résultat est sur 12 bits
	andwf v_adcfwd,f ;alors on masque les 4 bits de poids fort
	comf  v_adcfwd+1,f
	incf  v_adcfwd+1,f
	return

;-----------------------------------------
;Fonction : Lire le résultat de la conversion A/N AN1
;Nom : adc_readAN1
;Entrée :
;	-
;Sortie :
;Traitement :
;-----------------------------------------
f_adc_read_ref
	movlw I2C_ADDR_DEVICE_LTC2305
	movwf v_i2c_device_addr
	movlw 0x01
	movwf v_i2c_data_size
	movlw LTC2305_CDE_READ_CH1
	movwf v_adccde
	movlw v_adccde
	movwf v_i2c_p_send_data
	call f_i2c_write_in_device
_f_adc_read_ref_2
	movlw 0x02
	movwf v_i2c_data_size
	movlw v_adcref
	movwf v_i2c_p_receive_data
	call f_i2c_read_in_device
_f_adc_read_ref_3
	movlw 0x04
	movwf v_adc_count
_f_adc_read_ref_4
	bcf STATUS,0 ;carry=0 pour shifter dans v_adcfwd
	rrcf v_adcref,f
	rrcf v_adcref+1,f
	decfsz v_adc_count,f
	goto _f_adc_read_ref_4
_f_adc_read_ref_5
	movlw 0x08
	iorwf v_adcref,f
	comf  v_adcref,f
	movlw 0x0F          ;le résultat est sur 12 bits
	andwf v_adcref,f    ;alors on masque les 4 bits de poids de fort
	comf  v_adcref+1,f
	incf  v_adcref+1,f
	return

	global f_adc_read_fwd
	global f_adc_read_ref
	global v_adcfwd
	global v_adcref

	end
