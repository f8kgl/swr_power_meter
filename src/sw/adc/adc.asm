	include "p18f1320.inc" ;include the defaults for the chip
	include "ltc2305.inc"

	udata
v_adcfwd res 2
v_adcref res 2
v_delay res 1
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
;Fonction : Initialisation adc
;Nom : adc_init
;Entrée :
;Sortie :
;Traitement :
;-----------------------------------------
f_adc_init
	call f_i2c_init
	return



;-----------------------------------------
;Fonction : Lire le résultat de la conversion A/N AN0
;Nom : f_adc_read_vfwd
;Entrée :
;	-
;Sortie :
;Traitement :
;-----------------------------------------
f_adc_read_vfwd

	movlw 0xAA
	movwf v_adcfwd

	movlw I2C_ADDR_DEVICE_LTC2305
	movwf v_i2c_device_addr
	movlw 0x02
	movwf v_i2c_data_size
	movlw v_adcfwd
	movwf v_i2c_p_receive_data
	call f_i2c_read_in_device
_f_adc_read_vfwd_2
	movlw 0x04
	movwf v_adc_count
_f_adc_read_vfwd_3
	bcf STATUS,0 ;carry=0 pour shifter dans v_adcfwd
	rrcf v_adcfwd,f
	rrcf v_adcfwd+1,f
	decfsz v_adc_count,f
	goto _f_adc_read_vfwd_3
	return

;-----------------------------------------
;Fonction : Lire le résultat de la conversion A/N AN1
;Nom : adc_readAN1
;Entrée :
;	-
;Sortie :
;Traitement :
;-----------------------------------------
f_adc_readAN1
	movlw 0x02
	movwf v_adcref
	movlw 0x00
	movwf v_adcref+1
	return

_adc_tempo20us
	clrf v_delay ;
	bsf v_delay, 0 ; Delay 20 usecs
	bsf v_delay, 1 ;
	decfsz v_delay, f ;
	goto $ - 1 ;
	return ;


	global f_adc_init
	global f_adc_read_vfwd
	global f_adc_readAN1
	global v_adcfwd
	global v_adcref

	end
