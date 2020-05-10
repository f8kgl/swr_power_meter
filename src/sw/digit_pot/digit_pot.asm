	include "p18f1320.inc" ;include the defaults for the chip
	include "ad5175.inc"

  udata
v_digit_pot_cde res 1

  extern v_i2c_device_addr
  extern v_i2c_data_size
	extern v_i2c_p_send_data
	extern v_i2c_p_receive_data
	extern f_i2c_init
	extern f_i2c_write_in_device
	extern f_i2c_read_in_device

	code

f_digit_pot_set_gain_fwd
	movlw I2C_ADDR_DEVICE_AD5175_FWD
	movwf v_i2c_device_addr
	movlw 0x01
	movwf v_i2c_data_size
  clrf  v_digit_pot_cde
	movlw CDE_AD5175_SET_RDAC
  movwf v_digit_pot_cde
  rlncf v_digit_pot_cde,f
  rlncf v_digit_pot_cde,f
	movlw v_digit_pot_cde
	movwf v_i2c_p_send_data
	call f_i2c_write_in_device
  return


  global f_digit_pot_set_gain_fwd

  end
