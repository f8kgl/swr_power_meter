include "p18f1320.inc" ;include the defaults for the chip
include "bp.inc"


  udata
v_bp_status res 1
v_bp_timer res 1

  extern delay_10ms

  code
_f_bp_timeout
  bsf v_bp_status,BIT_BP_STATUS_TIMEOUT
  return


;Appui sur le bouton bande ?
f_bp_test_bande
  movlw D'200'
  movwf v_bp_timer
  btfss BP_BANDE
  goto _f_bp_test_bande_4
_f_bp_test_bande_2
  call delay_10ms
  btfss BP_BANDE
  goto _f_bp_test_bande_3
  decfsz v_bp_timer,f
  goto _f_bp_test_bande_2
  call _f_bp_timeout
  goto _f_bp_test_bande_4
_f_bp_test_bande_3
  bsf v_bp_status,BIT_BANDE
_f_bp_test_bande_4
  return


  global f_bp_test_bande
  global v_bp_status

  end
