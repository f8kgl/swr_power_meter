include "p18f1320.inc" ;include the defaults for the chip
include "log.inc"

  udata
v_log_data res 8
v_log_data_size res 1
v_log_tag res 1

	extern v_eep_byte_to_write
	extern f_eep_writebyte

  code

f_log_write
  movff v_log_tag,v_eep_byte_to_write
  movlw 0x10
  call f_eep_writebyte
  movff v_log_data,v_eep_byte_to_write
  movlw 0x11
  call f_eep_writebyte
	return



  global f_log_write
  global v_log_data
  global v_log_tag

  end
