	include "p18f1320.inc" ;include the defaults for the chip
  include "calc.inc"
	include "ltc2305.inc"


	udata
v_calc_aarg res 4
v_calc_barg res 2
v_calc_tmp res 1

	code
IFDEF TEST
  ;**********************************************************************************************
  ;**********************************************************************************************
  ;
  ;       16x16 Bit Unsigned Fixed Point Multiply 16 x 16 -> 32
  ;
  ;       Input:  16 bit unsigned fixed point multiplicand in v_calc_aarg+0, v_calc_aarg+1
  ;               16 bit unsigned fixed point multiplier in v_calc_barg+0, v_calc_barg+1
  ;
  ;       Result: AARG  <--  AARG * BARG
  ;**********************************************************************************************
  ;**********************************************************************************************
f_calc_fxm1616u
	    movff	v_calc_aarg+1,v_calc_tmp

  		movf	v_calc_aarg+1,W
  		MULWF	v_calc_barg+1
  		movff	PRODH,v_calc_aarg+2
  		movff	PRODL,v_calc_aarg+3

  		movf	v_calc_aarg,W
  		MULWF	v_calc_barg
  		movff	PRODH,v_calc_aarg
  		movff	PRODL,v_calc_aarg+1

  		MULWF	v_calc_barg+1
  		movf	PRODL,W
  		ADDWF	v_calc_aarg+2,F
  		movf	PRODH,W
  		ADDWFC	v_calc_aarg+1,F
      movlw 0x00
  		ADDWFC	v_calc_aarg,F

  		movf	v_calc_tmp,W
  		MULWF	v_calc_barg
  		movf	PRODL,W
  		ADDWF	v_calc_aarg+2,F
  		movf	PRODH,W
  		ADDWFC	v_calc_aarg+1,F
      movlw 0x00
  		ADDWFC	v_calc_aarg,F

  		return

ENDIF


IFDEF TEST
	global v_calc_aarg
	global v_calc_barg
	global f_calc_fxm1616u
ENDIF

	end
