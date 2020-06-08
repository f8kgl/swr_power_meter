include "p18f1320.inc" ;include the defaults for the chip
include "lcd.inc"
include "bp.inc"

  udata
v_fsm_tmp res 1
v_fsm_toggle_state res 1
v_fsm_timer_count res 1
v_fsm_bp_cal_sens res 1
v_fsm_p_param res 2

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
  extern f_bp_test_bande
  extern f_bp_test_calp
  extern f_bp_test_calm
  extern v_bp_status

  code

f_fsm_toggle_state
  clrf v_fsm_toggle_state

_f_fsm_toggle_start
  movf	v_fsm_toggle_state,w
  xorlw	D'0'
  btfsc	STATUS,Z
  goto	_f_fsm_lcd_toggle_state0
  movf	v_fsm_toggle_state,w
  xorlw	D'1'
  btfsc	STATUS,Z
  goto	_f_fsm_lcd_toggle_state1
  movf	v_fsm_toggle_state,w
  xorlw	D'2'
  btfsc	STATUS,Z
  goto	_f_fsm_lcd_toggle_state2
  movf	v_fsm_toggle_state,w
  xorlw	D'3'
  btfsc	STATUS,Z
  goto	_f_fsm_lcd_toggle_state3
  movf	v_fsm_toggle_state,w
  xorlw	D'4'
  btfsc	STATUS,Z
  goto	_f_fsm_lcd_toggle_end
_f_fsm_lcd_toggle_end
  return

_f_fsm_lcd_toggle_state0
_f_fsm_lcd_toggle_state0_do
  movlw D'50'
  movwf v_fsm_timer_count
_f_fsm_lcd_toggle_state0_calc_next_state
  incf v_fsm_toggle_state,f
  goto _f_fsm_lcd_toggle_exit

_f_fsm_lcd_toggle_state1
_f_fsm_lcd_toggle_state1_do
  movf v_lcd_string_pos,w
  call f_lcd_setposcursor
  call f_lcd_aff
  call delay_10ms
_f_fsm_lcd_toggle_state1_calc_next_state
  decfsz v_fsm_timer_count,f
  goto __f_fsm_lcd_toggle_state1_calc_next_state ;si timer<500ms
  movlw D'50' ;si timer>500ms
  movwf v_fsm_timer_count
  incf v_fsm_toggle_state,f;si timer>500ms => state 2
  goto _f_fsm_lcd_toggle_exit
__f_fsm_lcd_toggle_state1_calc_next_state;si timer<500ms
  ;si cal+=>state 3
  clrf v_bp_status
	call f_bp_test_calp
	btfss v_bp_status,BIT_CALIBRATION_P
  goto __f_fsm_lcd_toggle_state1_calc_next_state2
  bsf v_fsm_bp_cal_sens,0
  movlw D'03'
  movwf v_fsm_toggle_state
  goto _f_fsm_lcd_toggle_exit
__f_fsm_lcd_toggle_state1_calc_next_state2
;si cal-=>state 3
  clrf v_bp_status
  call f_bp_test_calm
  btfss v_bp_status,BIT_CALIBRATION_M
  goto __f_fsm_lcd_toggle_state1_calc_next_state3
  bcf v_fsm_bp_cal_sens,0
  movlw D'03'
  movwf v_fsm_toggle_state
  goto _f_fsm_lcd_toggle_exit
__f_fsm_lcd_toggle_state1_calc_next_state3
  ;si bouton bande => state 4
  clrf v_bp_status
	call f_bp_test_bande
	btfss v_bp_status,BIT_BANDE
  goto __f_fsm_lcd_toggle_state1_calc_next_state4
  movlw D'04'
  movwf v_fsm_toggle_state
__f_fsm_lcd_toggle_state1_calc_next_state4
  ;sinon => state 1
  goto _f_fsm_lcd_toggle_exit

_f_fsm_lcd_toggle_state2
_f_fsm_lcd_toggle_state2_do
  movf v_lcd_string_pos,w
  call f_lcd_setposcursor
  call f_lcd_aff_not
  call delay_10ms
_f_fsm_lcd_toggle_state2_calc_next_state
  decfsz v_fsm_timer_count,f
  goto __f_fsm_lcd_toggle_state2_calc_next_state ;si timer<500ms
  movlw D'50' ;si timer>500ms
  movwf v_fsm_timer_count
  decf v_fsm_toggle_state,f;si timer>500ms => state 1
  goto _f_fsm_lcd_toggle_exit
__f_fsm_lcd_toggle_state2_calc_next_state;si timer<500ms
  ;si cal+=>state 3
  clrf v_bp_status
	call f_bp_test_calp
	btfss v_bp_status,BIT_CALIBRATION_P
  goto __f_fsm_lcd_toggle_state2_calc_next_state2
  bsf v_fsm_bp_cal_sens,0
  movlw D'03'
  movwf v_fsm_toggle_state
  goto _f_fsm_lcd_toggle_exit
__f_fsm_lcd_toggle_state2_calc_next_state2
;si cal-=>state 3
  clrf v_bp_status
  call f_bp_test_calm
  btfss v_bp_status,BIT_CALIBRATION_M
  goto __f_fsm_lcd_toggle_state2_calc_next_state3
  bcf v_fsm_bp_cal_sens,0
  movlw D'03'
  movwf v_fsm_toggle_state
  goto _f_fsm_lcd_toggle_exit
__f_fsm_lcd_toggle_state2_calc_next_state3
  ;si bande => state 4
  clrf v_bp_status
	call f_bp_test_bande
	btfss v_bp_status,BIT_BANDE
  goto __f_fsm_lcd_toggle_state2_calc_next_state4
  movlw D'04'
  movwf v_fsm_toggle_state
__f_fsm_lcd_toggle_state2_calc_next_state4
  ;sinon => state 2
  goto _f_fsm_lcd_toggle_exit

_f_fsm_lcd_toggle_state3
_f_fsm_lcd_toggle_state3_do
  btfss v_fsm_bp_cal_sens,0
  goto __f_fsm_lcd_toggle_state3_do2
  movf v_fsm_p_param +1,W
	movwf FSR0H
	movf v_fsm_p_param ,W
	movwf FSR0L
  incf POSTDEC0,f
  btfsc STATUS,C
  incf POSTDEC0,f
  goto _f_fsm_lcd_toggle_state3_calc_next_state
__f_fsm_lcd_toggle_state3_do2
  movf v_fsm_p_param +1,W
  movwf FSR0H
  movf v_fsm_p_param ,W
  movwf FSR0L
  decf POSTDEC0,f
  btfss STATUS,C
  decf POSTDEC0,f
_f_fsm_lcd_toggle_state3_calc_next_state
  incf v_fsm_toggle_state,f
  goto _f_fsm_lcd_toggle_exit

_f_fsm_lcd_toggle_exit
  goto _f_fsm_toggle_start

  global f_fsm_toggle_state
  global v_fsm_p_param

  end
