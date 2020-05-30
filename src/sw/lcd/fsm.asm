include "p18f1320.inc" ;include the defaults for the chip
include "lcd.inc"

  udata
v_lcd_fsm_tmp res 1
v_lcd_fsm_toggle_state res 1
v_lcd_fsm_timer_count res 1

  extern f_lcd_affchar
  extern f_lcd_setposcursor
  extern f_lcd_convtoascii
  extern v_calc_port
  extern delay_10ms
  extern v_lcd_string
  extern v_lcd_string_len
  extern v_lcd_string_pos
  extern v_lcd_p_string
  extern f_lcd_aff
  extern f_lcd_aff_not

  code

f_lcd_fsm_toggle_state
  clrf v_lcd_fsm_toggle_state

_f_lcd_fsm_toggle_start
  movf	v_lcd_fsm_toggle_state,w
  xorlw	D'0'
  btfsc	STATUS,Z
  goto	_fsm_lcd_toggle_state0
  movf	v_lcd_fsm_toggle_state,w
  xorlw	D'1'
  btfsc	STATUS,Z
  goto	_fsm_lcd_toggle_state1
  movf	v_lcd_fsm_toggle_state,w
  xorlw	D'2'
  btfsc	STATUS,Z
  goto	_fsm_lcd_toggle_state2
  movf	v_lcd_fsm_toggle_state,w
  xorlw	D'3'
  btfsc	STATUS,Z
  goto	_fsm_lcd_toggle_state3
  movf	v_lcd_fsm_toggle_state,w
  xorlw	D'4'
  btfsc	STATUS,Z
  goto	_fsm_lcd_toggle_end
_fsm_lcd_toggle_end
  return

_fsm_lcd_toggle_state0
_fsm_lcd_toggle_state0_do
  movlw D'50'
  movwf v_lcd_fsm_timer_count
_fsm_lcd_toggle_state0_calc_next_state
  incf v_lcd_fsm_toggle_state,f
  goto _fsm_lcd_toggle_exit

_fsm_lcd_toggle_state1
_fsm_lcd_toggle_state1_do
  movf v_lcd_string_pos,w
  call f_lcd_setposcursor
  call f_lcd_aff
  call delay_10ms
_fsm_lcd_toggle_state1_calc_next_state
  decfsz v_lcd_fsm_timer_count,f
  goto __fsm_lcd_toggle_state1_calc_next_state ;si timer<500ms
  movlw D'50' ;si timer>500ms
  movwf v_lcd_fsm_timer_count
  incf v_lcd_fsm_toggle_state,f;si timer>500ms => state 2
  goto _fsm_lcd_toggle_exit
__fsm_lcd_toggle_state1_calc_next_state;si timer<500ms
  ;si cal+/cal-=>state 3
  ;si bande => state 4
  ;sinon => state 1
  goto _fsm_lcd_toggle_exit

_fsm_lcd_toggle_state2
_fsm_lcd_toggle_state2_do
  movf v_lcd_string_pos,w
  call f_lcd_setposcursor
  call f_lcd_aff_not
  call delay_10ms
_fsm_lcd_toggle_state2_calc_next_state
  decfsz v_lcd_fsm_timer_count,f
  goto __fsm_lcd_toggle_state2_calc_next_state ;si timer<500ms
  movlw D'50' ;si timer>500ms
  movwf v_lcd_fsm_timer_count
  decf v_lcd_fsm_toggle_state,f;si timer>500ms => state 1
  goto _fsm_lcd_toggle_exit
__fsm_lcd_toggle_state2_calc_next_state;si timer<500ms
  ;si cal+/cal-=>state 3
  ;si bande => state 4
  ;sinon => state 2
  goto _fsm_lcd_toggle_exit

_fsm_lcd_toggle_state3
_fsm_lcd_toggle_state3_do
  incf v_calc_port,f ;à généraliser
_fsm_lcd_toggle_state3_calc_next_state
  incf v_lcd_fsm_toggle_state
  goto _fsm_lcd_toggle_exit

_fsm_lcd_toggle_exit
  goto _f_lcd_fsm_toggle_start

  global f_lcd_fsm_toggle_state

  end
