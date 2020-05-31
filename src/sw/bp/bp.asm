include "p18f1320.inc" ;include the defaults for the chip
include "bp.inc"

  udata
v_bp_status res 1

  extern delay_250ms

  code

f_bp_init
  clrf v_bp_status
  return

;Appui sur le bouton bande ?
f_bp_test_bande
  btfss BP_BANDE
  goto _f_bp_test_bande_3
_f_bp_test_bande_2
  call delay_250ms
  call delay_250ms
  btfsc BP_BANDE
  goto _f_bp_test_bande_3
  bsf v_bp_status,BIT_BANDE
_f_bp_test_bande_3
  return

f_bp_test_calibration
  return


f_bp_test_calp
  return


f_bp_test_calm
  return


  global f_bp_init
  global f_bp_test_calm
  global f_bp_test_calp
  global f_bp_test_bande
  global f_bp_test_calibration
  global v_bp_status

  end
