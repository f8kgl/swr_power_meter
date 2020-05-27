	include "p18f1320.inc" ;include the defaults for the chip
	include "ad5175.inc"

  udata
v_aop_cde res 2
v_aop_temp res 1
v_aop_G_fwd res 1

  extern v_i2c_device_addr
  extern v_i2c_data_size
	extern v_i2c_p_send_data
	extern v_i2c_p_receive_data
	extern f_i2c_write_in_device
	extern f_i2c_read_in_device

	code

f_aop_set_gain_fwd
	movlw I2C_ADDR_DEVICE_AD5175_FWD
	movwf v_i2c_device_addr
	movlw 0x02
	movwf v_i2c_data_size
  clrf  v_aop_cde
	movlw CDE_AD5175_SET_RDAC
  movwf v_aop_cde
  rlncf v_aop_cde,f
  rlncf v_aop_cde,f
  ;Pour le FW de test, on fixe le gain à G=2 dans le menu ADC #250
  ;dans le cas présente, ça veut dire Rdac = 0x34. Seul 8 bits suffisent.
  ;du coup, on ne remplit que v_aop_cde+1
  ; et on laisse les 2bits de poids faible de v_aop_cde à  0
IFDEF TEST
	movlw RDAC_REG_AD5175_GAIN_IS_2
	movwf v_aop_cde+1
ENDIF
	movlw v_aop_cde
	movwf v_i2c_p_send_data
	call f_i2c_write_in_device
  return

f_aop_set_gain_ref
	movlw I2C_ADDR_DEVICE_AD5175_REF
	movwf v_i2c_device_addr
	movlw 0x02
	movwf v_i2c_data_size
  clrf  v_aop_cde
	movlw CDE_AD5175_SET_RDAC
  movwf v_aop_cde
  rlncf v_aop_cde,f
  rlncf v_aop_cde,f
  ;Pour le FW de test, on fixe le gain à G=2 dans le menu ADC #250
  ;dans le cas présente, ça veut dire Rdac = 0x34. Seuls 8 bits suffisent.
  ;du coup, on ne remplit que v_aop_cde+1
  ; et on laisse les 2bits de poids faible de v_aop_cde à  0
IFDEF TEST
	movlw RDAC_REG_AD5175_GAIN_IS_2
	movwf v_aop_cde+1
ENDIF

	movlw v_aop_cde
	movwf v_i2c_p_send_data
	call f_i2c_write_in_device
  return


  global f_aop_set_gain_fwd
  global f_aop_set_gain_ref

  end
