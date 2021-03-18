	include "p18f1320.inc"
	include "eep.inc"



s_kconv_eep code __SW_START_EEP_ADDR+EEP_KCONV_FWD_BANDE1
	DW 0x01A4 		;Kconv FWD Bande 1
	DW 0x01A4 		;Kconv REF Bande 1
	DW 0x01A4 		;Kconv FWD Bande 2
	DW 0x01A4 		;Kconv REF Bande 2
	DW 0x01A4 		;Kconv FWD Bande 3
	DW 0x01A4 		;Kconv REF Bande 3

	end
	


