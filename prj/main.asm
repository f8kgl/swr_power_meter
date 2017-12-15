	include "p16f628a.inc" ;include the defaults for the chip

	ERRORLEVEL 0, -302 ;suppress bank selection messages
	__config 0x3D18 ;sets the configuration settings (osc type etc.) 

	extern lcd_affboot
	extern lcd_init	

	code
	goto Init ;
 

 
; Initialize the PIC and the LCD
Init ;
	movlw 0x07 ; Turn comparators off and
	movwf CMCON ; enable pins for I/O functions
	bsf STATUS, RP0 ; select bank 1 
	clrf PORTA ; Initialize PORTA by setting output data latches
	movlw b'00000000' ; PortA Outputs
	movwf TRISA ; All portA pins are inputs
	movlw b'00000000' ; PortB Outputs
	movwf TRISB ; Change PortB I/O
	bcf STATUS, RP0 ; select bank 0
 
	call lcd_init ; Initialize the LCD Display 
 
; Main program...
	call lcd_affboot
 
; Infinate loop 
Stop
	goto Stop ;endless loop
 
	end 
