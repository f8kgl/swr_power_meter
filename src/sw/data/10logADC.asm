	include "p18f1320.inc" ;include the defaults for the chip

	udata

	code

c_10logADC_table
	include "10logADC.inc"
IF 0
	DW 0xDEAD
	DW 0xBEEF
ENDIF

	global c_10logADC_table

	end
