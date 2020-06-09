	include "p18f1320.inc" ;include the defaults for the chip
	include "ad5175.inc"
	include "calc.inc"
	include "eep.inc"

  udata
v_aop_cde res 2
v_aop_temp res 1
v_aop_rdac res 2

  extern v_i2c_device_addr
  extern v_i2c_data_size
	extern v_i2c_p_send_data
	extern v_i2c_p_receive_data
	extern f_i2c_write_in_device
	extern f_i2c_read_in_device
	extern v_calc_n_fwd
	extern v_calc_n_ref
	extern v_calc_port
	extern v_eep_byte_to_write
	extern f_eep_readbyte
	extern f_eep_writebyte
	code

f_aop_set_rdac_eep_fwd
		movff v_aop_rdac,v_eep_byte_to_write
		movf v_calc_n_fwd,W
		mullw 0x02
		movf PRODL,W
		addlw EEP_ADDR_DAC_FWD
		call f_eep_writebyte
		movff v_aop_rdac+1,v_eep_byte_to_write
		movf v_calc_n_fwd,W
		mullw 0x02
		movf PRODL,W
		addlw EEP_ADDR_DAC_FWD+1
		call f_eep_writebyte
		return


f_aop_set_rdac_eep_ref
	movff v_aop_rdac,v_eep_byte_to_write
	movf v_calc_n_ref,W
	mullw 0x02
	movf PRODL,W
	addlw EEP_ADDR_DAC_REF
	call f_eep_writebyte
	movff v_aop_rdac+1,v_eep_byte_to_write
	movf v_calc_n_ref,W
	mullw 0x02
	movf PRODL,W
	addlw EEP_ADDR_DAC_REF+1
	call f_eep_writebyte
	return

f_aop_get_rdac_ref
	movf v_calc_n_ref,W
	mullw 0x02
	movf PRODL,W
	addlw EEP_ADDR_DAC_REF
	call f_eep_readbyte
	movwf v_aop_rdac
	movf v_calc_n_ref,W
	mullw 0x02
	movf PRODL,W
	addlw EEP_ADDR_DAC_REF+1
	call f_eep_readbyte
	movwf v_aop_rdac+1
	return

f_aop_get_rdac_fwd
	movf v_calc_n_fwd,W
	mullw 0x02
	movf PRODL,W
	addlw EEP_ADDR_DAC_FWD
	call f_eep_readbyte
	movwf v_aop_rdac
	movf v_calc_n_fwd,W
	mullw 0x02
	movf PRODL,W
	addlw EEP_ADDR_DAC_FWD+1
	call f_eep_readbyte
	movwf v_aop_rdac+1
	return


f_aop_set_rdac_fwd
	call f_aop_get_rdac_fwd
	movlw I2C_ADDR_DEVICE_AD5175_FWD
	movwf v_i2c_device_addr
	movlw 0x02
	movwf v_i2c_data_size
  clrf  v_aop_cde
	movlw CDE_AD5175_SET_RDAC
  movwf v_aop_cde
  rlncf v_aop_cde,f
  rlncf v_aop_cde,f

	movlw 0x3 ;masque sur DAC(9:8)
	andwf v_aop_rdac,w
	iorwf v_aop_cde,f
	movff v_aop_rdac+1,v_aop_cde+1

	movlw v_aop_cde
	movwf v_i2c_p_send_data
	call f_i2c_write_in_device
  return

f_aop_set_rdac_ref
	call f_aop_get_rdac_ref
	movlw I2C_ADDR_DEVICE_AD5175_REF
	movwf v_i2c_device_addr
	movlw 0x02
	movwf v_i2c_data_size
  clrf  v_aop_cde
	movlw CDE_AD5175_SET_RDAC
  movwf v_aop_cde
  rlncf v_aop_cde,f
  rlncf v_aop_cde,f

	movlw 0x3 ;masque sur DAC(9:8)
	andwf v_aop_rdac,w
	iorwf v_aop_cde,f
	movff v_aop_rdac+1,v_aop_cde+1

	movlw v_aop_cde
	movwf v_i2c_p_send_data
	call f_i2c_write_in_device
  return


  global f_aop_set_rdac_fwd
  global f_aop_set_rdac_ref
	global f_aop_get_rdac_ref
	global f_aop_get_rdac_fwd
	global f_aop_set_rdac_eep_fwd
	global f_aop_set_rdac_eep_ref
	global v_aop_rdac

  end
