include "p18f1320.inc" ;include the defaults for the chip
include "log.inc"
include "eep.inc"

  udata
v_log_data res 8
v_log_p_data res 2
v_log_data_size res 1
v_log_tag res 1
v_log_nb_byte_to_write res 1
v_log_addr res 1

	extern v_eep_byte_to_write
	extern f_eep_writebyte
	extern f_eep_readbyte

  code

_f_log_get_next_addr
	movlw ADDR_EEP_NEXT_ADDR_TO_WRITE
	call f_eep_readbyte
	movwf v_log_addr
	return

f_log_write
  call _f_log_get_next_addr
  movlw NB_BYTE
  movwf v_log_nb_byte_to_write


  movlw v_log_data
  movwf v_log_p_data

  movff v_log_p_data+1,FSR0H
  movff v_log_p_data,FSR0L

  movff v_log_tag,v_eep_byte_to_write
  movf v_log_addr,W
  call f_eep_writebyte
  decf v_log_nb_byte_to_write,f

_f_log_write_loop
  incf v_log_addr,f
  movff POSTINC0,v_eep_byte_to_write
  movf v_log_addr,W
  call f_eep_writebyte
  decf v_log_data_size,f
  btfsc STATUS,Z
  goto _f_log_write_loop2;v_log_data_size déjà égal à 0 =>_f_log_write_loop2
  decfsz v_log_nb_byte_to_write,f
  goto _f_log_write_loop
  goto _f_log_write_loop_end

_f_log_write_loop2
  decf v_log_nb_byte_to_write,f
  movlw 0xFF
  movwf v_eep_byte_to_write
_f_log_write_loop3
  incf v_log_addr,f
  movf v_log_addr,W
  call f_eep_writebyte
  decfsz v_log_nb_byte_to_write ,f
  goto _f_log_write_loop3

_f_log_write_loop_end
  incf v_log_addr,f
  movff v_log_addr,v_eep_byte_to_write
  movlw ADDR_EEP_NEXT_ADDR_TO_WRITE
  call f_eep_writebyte


  return



  global f_log_write
  global v_log_data
  global v_log_tag
  global v_log_data_size

  end
