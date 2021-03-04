		LIST	P = 16C74

		INCLUDE <P16C74.INC>	; P16C74 include file

		INCLUDE <DEV_FAM.INC>	; PIC16 device specific definitions

		INCLUDE <MATH16.INC>	; PIC16 math library definitions

;**********************************************************************************************
;**********************************************************************************************

                org             0x0000

;       All arguments to the fixed point routines in the math library are passed through
;	the locations

;		AARGB0,AARGB1,AARGB2,AARGB3

;		BARGB0,BARGB1,BARGB2,BARGB3

;	with the result in

;		AARGB0,AARGB1,AARGB2,AARGB3,AARGB4,AARGB5,AARGB6,AARGB7

;	All fixed point operands are left justified to xARGB0, and are either unsigned or
;	in signed two's complement representation. 

;**********************************************************************************************

;	For example, to multiply the 24 bit unsigned integer AARG = 0xED85E1 by the 16 bit
;	unsigned integer BARG = 0x2292, simply load AARG and BARG with the appropriate
;	values and call FXM2416U. The 40 bit unsigned result, 0x20133E3C52, is left justified
;	in AARG, occupying AARGB0,AARGB1,AARGB2,AARGB3 and AARGB4.

		MOVLW	0xED
		MOVWF	AARGB0
		MOVLW	0x85
		MOVWF	AARGB1
		MOVLW	0xE1
		MOVWF	AARGB2

		MOVLW	0x22
		MOVWF	BARGB0
		MOVLW	0x92
		MOVWF	BARGB1

		CALL	FXM2416U

;**********************************************************************************************

;	To divide the 32 bit signed integer AARG = 0x835A3FC1 the the 24 bit signed integer
;	BARG = 0x5C3BE5, simply load AARG and BARG with the appropriate values and call
;	FXD3224S. The 32 bit signed quotient, 0xFFFFFEA7, is left justified in AARG and the
;	24 bit signed remainder, 0xA6F75E, is left justified in REM.


		MOVLW	0x83
		MOVWF	AARGB0
		MOVLW	0x5A
		MOVWF	AARGB1
		MOVLW	0x3F
		MOVWF	AARGB2
		MOVLW	0xC1
		MOVWF	AARGB3

		MOVLW	0x5C
		MOVWF	BARGB0
		MOVLW	0x3B
		MOVWF	BARGB1
		MOVLW	0xE5
		MOVWF	BARGB2

		CALL	FXD3224S

SELF		GOTO	SELF

;**********************************************************************************************

;	These include files contain all of the fixed point multiply routines for convenience
;	in experimenting with routines in addition to the above example. In a specific case,
;	only the necessary routine need be included.

;		INCLUDE <FXM22.A16>

;		INCLUDE <FXM24.A16>

;		INCLUDE <FXM26.A16>

;		INCLUDE <FXM44.A16>

		INCLUDE <FXM46.A16>

;		INCLUDE <FXM66.A16>

;		INCLUDE <FXM68.A16>

;		INCLUDE <FXM88.A16>

;	These include files contain all of the fixed point divide routines for convenience
;	in experimenting with routines in addition to the above example. In a specific case,
;	only the necessary routine and divide macro need be included.

;		INCLUDE <FXD22.A16>

		INCLUDE <FXD24.A16>

;		INCLUDE <FXD26.A16>

;		INCLUDE <FXD44.A16>

;		INCLUDE <FXD46.A16>

;		INCLUDE <FXD66.A16>

;		INCLUDE <FXD68.A16>

;		INCLUDE <FXD88.A16>

;**********************************************************************************************

		END

