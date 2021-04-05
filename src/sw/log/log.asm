include "p18f1320.inc" ;include the defaults for the chip
include "log.inc"
include "eep.inc"

  udata
v_log_data res 6
v_log_p_data res 2
v_log_data_size res 1
v_log_tag res 2
v_log_nb_byte_to_write res 1
v_log_addr res 1
v_log_tmp res 1

	extern v_eep_int_byte_to_write
	extern f_eep_int_writebyte
	extern f_eep_int_readbyte

  code

_f_log_get_next_addr
	movlw LOW ADDR_EEP_NEXT_ADDR_TO_WRITE
	call f_eep_int_readbyte
	movwf v_log_addr
	return

_f_log_tag_is_enabled
;v_log_tmp=0 si le tag est activé dans l'octet de config des trace en EEP
	movff v_log_tag,v_log_tmp
	movlw EEP_LOG_CONFIG_MSB
	call f_eep_int_readbyte

	;w contient la config
	;v_log_tmp contient le tag
	andwf v_log_tmp,f
	btfss STATUS,Z
	goto _f_log_tag_is_enabled2	;Z=0 =>, match => activer la trace

	movff v_log_tag+1,v_log_tmp
	movlw EEP_LOG_CONFIG_LSB
	call f_eep_int_readbyte

	;w contient la config
	;v_log_tmp contient le tag
	andwf v_log_tmp,f
	btfss STATUS,Z
	goto _f_log_tag_is_enabled2	;Z=0 =>, match => activer la trace

	setf v_log_tmp
	goto _f_log_tag_is_enabled_end

_f_log_tag_is_enabled2
	clrf v_log_tmp
_f_log_tag_is_enabled_end
	return

f_log_write
  call _f_log_tag_is_enabled
  tstfsz v_log_tmp
  goto _f_log_write_loop_end2
  call _f_log_get_next_addr
  movlw NB_BYTE
  movwf v_log_nb_byte_to_write

  movlw v_log_data
  movwf v_log_p_data+1

  movff v_log_p_data,FSR0H
  movff v_log_p_data+1,FSR0L

  movff v_log_tag,v_eep_int_byte_to_write
  movf v_log_addr,W
  call f_eep_int_writebyte
  decf v_log_nb_byte_to_write,f

  incf v_log_addr,f
  movff v_log_tag+1,v_eep_int_byte_to_write
  movf v_log_addr,W
  call f_eep_int_writebyte
  decf v_log_nb_byte_to_write,f


_f_log_write_loop
  incf v_log_addr,f
  movff POSTINC0,v_eep_int_byte_to_write
  movf v_log_addr,W
  call f_eep_int_writebyte
  decf v_log_data_size,f
  btfsc STATUS,Z
  goto _f_log_write_loop2;v_log_data_size déjà égal à 0 =>_f_log_write_loop2
  decfsz v_log_nb_byte_to_write,f
  goto _f_log_write_loop
  goto _f_log_write_loop4

_f_log_write_loop2
  decf v_log_nb_byte_to_write,f
  btfsc STATUS,Z
  goto _f_log_write_loop4
  movlw 0xFF
  movwf v_eep_int_byte_to_write
_f_log_write_loop3
  incf v_log_addr,f
  movf v_log_addr,W
  call f_eep_int_writebyte
  decfsz v_log_nb_byte_to_write ,f
  goto _f_log_write_loop3

_f_log_write_loop4
  incf v_log_addr,f
  btfss STATUS,C
  goto _f_log_write_loop_end
  movlw LOG_ADDR_IN_EEP
  movwf v_log_addr
_f_log_write_loop_end
  movff v_log_addr,v_eep_int_byte_to_write
  movlw LOW ADDR_EEP_NEXT_ADDR_TO_WRITE
  call f_eep_int_writebyte

_f_log_write_loop_end2
  return



  global f_log_write
  global v_log_data
  global v_log_tag
  global v_log_data_size

  end
