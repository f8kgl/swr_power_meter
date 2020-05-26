	include "p18f1320.inc" ;include the defaults for the chip
	include "ad5175.inc"

  udata
v_aop_cde res 2

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
	movlw 0x00 ;fixe RDAC à 0
	movwf v_aop_cde+1
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
	movlw 0x00 ;fixe RDAC à 0
	movwf v_aop_cde+1
	movlw v_aop_cde
	movwf v_i2c_p_send_data
	call f_i2c_write_in_device
  return


  global f_aop_set_gain_fwd
  global f_aop_set_gain_ref

  end
