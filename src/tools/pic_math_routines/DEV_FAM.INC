;	RCS Header $Id: dev_fam.inc 1.2 1997/03/24 23:25:07 F.J.Testa Exp $

;	$Revision: 1.2 $

;  DEV_FAM.INC   Device Family Type File, Version 1.00    Microchip Technology, Inc.
;
; This file takes the defined device from the LIST directive, and specifies a
; device family type and the Reset Vector Address (in RESET_V).
;
;*******
;*******   Device Family Type, Returns one of these three Symbols (flags) set  
;*******   (other two are cleared) depending on processor selected in LIST Directive:
;*******          P16C5X, P16CXX, or P17CXX
;*******   Also sets the Reset Vector Address in symbol RESET_V
;*******
;*******   File Name:   DEV_FAM.INC
;*******   Revision:    1.00.00        08/24/95       MP
;*******                1.00.01        03/21/97       AL
;*******
;
TRUE		EQU   1
FALSE		EQU   0
;
P16C5X      SET    FALSE       ; If P16C5X, use INHX8M file format.
P16CXX      SET    FALSE       ; If P16CXX, use INHX8M file format.
P17CXX      SET    FALSE       ; If P17CXX, the INHX32 file format is required
;                              ;            in the LIST directive
RESET_V     SET    0x0000      ; Default Reset Vector address of 0h
                               ;   (16Cxx and 17Cxx devices)
P16_MAP1    SET    FALSE       ; FOR 16C60/61/70/71/84 Memory Map
P16_MAP2    SET    FALSE       ; For all other 16Cxx Memory Maps
;
;******    16CXX  ***********
;
    IFDEF   __14000
P16CXX      SET    TRUE        ; If P14000, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C554
P16CXX      SET    TRUE        ; If P16C554, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C556
P16CXX      SET    TRUE        ; If P16C556, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C558
P16CXX      SET    TRUE        ; If P16C558, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C61
P16CXX      SET    TRUE        ; If P16C61, use INHX8M file format.
P16_MAP1    SET    TRUE
    ENDIF
;	
    IFDEF   __16C62
P16CXX      SET    TRUE        ; If P16C62, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C62A
P16CXX      SET    TRUE        ; If P16C62A, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C63
P16CXX      SET    TRUE        ; If P16C63, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C64
P16CXX      SET    TRUE        ; If P16C64, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C64A
P16CXX      SET    TRUE        ; If P16C64A, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C65
P16CXX      SET    TRUE        ; If P16C65, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C65A
P16CXX      SET    TRUE        ; If P16C65A, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C620
P16CXX      SET    TRUE        ; If P16C620, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C621
P16CXX      SET    TRUE        ; If P16C621, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C622
P16CXX      SET    TRUE        ; If P16C622, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C642
P16CXX      SET    TRUE        ; If P16C642, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C662
P16CXX      SET    TRUE        ; If P16C662, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C710
P16CXX      SET    TRUE        ; If P16CXX, use INHX8M file format.
P16_MAP1    SET    TRUE
    ENDIF
;
    IFDEF   __16C71
P16CXX      SET    TRUE        ; If P16CXX, use INHX8M file format.
P16_MAP1    SET    TRUE
    ENDIF
;
    IFDEF   __16C711
P16CXX      SET    TRUE        ; If P16CXX, use INHX8M file format.
P16_MAP1    SET    TRUE
    ENDIF
;
    IFDEF   __16C72
P16CXX      SET    TRUE        ; If P16C72, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;	
    IFDEF   __16C73
P16CXX      SET    TRUE        ; If P16CXX, use INHX8M file format.
P16_MAP2    SET    TRUE        ;
    ENDIF
;
    IFDEF   __16C73A
P16CXX      SET    TRUE        ; If P16CXX, use INHX8M file format.
P16_MAP2    SET    TRUE        ;
    ENDIF
;
    IFDEF   __16C74
P16CXX      SET    TRUE        ; If P16CXX, use INHX8M file format.
P16_MAP2    SET    TRUE        ;
    ENDIF
;
    IFDEF   __16C74A
P16CXX      SET    TRUE        ; If P16CXX, use INHX8M file format.
P16_MAP2    SET    TRUE        ;
    ENDIF
;
    IFDEF   __16C84
P16CXX      SET    TRUE        ; If P16CXX, use INHX8M file format.
P16_MAP1    SET    TRUE
    ENDIF
;
    IFDEF   __16F84
P16CXX      SET    TRUE        ; If P16CXX, use INHX8M file format.
P16_MAP1    SET    TRUE
    ENDIF
;
    IFDEF   __16F83
P16CXX      SET    TRUE        ; If P16CXX, use INHX8M file format.
P16_MAP1    SET    TRUE
    ENDIF
;
    IFDEF   __16CR83
P16CXX      SET    TRUE        ; If P16CXX, use INHX8M file format.
P16_MAP1    SET    TRUE
    ENDIF
;
    IFDEF   __16CR84
P16CXX      SET    TRUE        ; If P16CXX, use INHX8M file format.
P16_MAP1    SET    TRUE
    ENDIF
;
    IFDEF   __16C923
P16CXX      SET    TRUE        ; If P16CXX, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;
    IFDEF   __16C924
P16CXX      SET    TRUE        ; If P16CXX, use INHX8M file format.
P16_MAP2    SET    TRUE
    ENDIF
;
    IFDEF   __16CXX            ; Generic Processor Type
P16CXX      SET    TRUE        ; If P16CXX, use INHX8M file format.
P16_MAP2    SET    TRUE        ;
    ENDIF
;
;
;
;******    17CXX  ***********
;
;
    IFDEF   __17C42
P17CXX      SET    TRUE        ; If P17CXX, the INHX32 file format is required
;                              ;            in the LIST directive
    ENDIF
;
    IFDEF   __17C43
P17CXX      SET    TRUE        ; If P17CXX, the INHX32 file format is required
;                              ;            in the LIST directive
    ENDIF
;
    IFDEF   __17C44
P17CXX      SET    TRUE        ; If P17CXX, the INHX32 file format is required
;                              ;            in the LIST directive
    ENDIF
;
    IFDEF   __17CXX            ; Generic Processor Type
P17CXX      SET    TRUE        ; If P17CXX, the INHX32 file format is required
;                              ;            in the LIST directive
    ENDIF
;
;******    16C5X  ***********
;
;
    IFDEF   __16C54
P16C5X      SET    TRUE        ; If P16C5X, use INHX8M file format.
RESET_V     SET    0x01FF      ; Reset Vector at end of 512 words
    ENDIF
;
    IFDEF   __16C54A
P16C5X      SET    TRUE        ; If P16C5X, use INHX8M file format.
RESET_V     SET    0x01FF      ; Reset Vector at end of 512 words
    ENDIF
;
    IFDEF   __16C55
P16C5X      SET    TRUE        ; If P16C5X, use INHX8M file format.
RESET_V     SET    0x01FF      ; Reset Vector at end of 512 words
    ENDIF
;
    IFDEF   __16C56
P16C5X      SET    TRUE        ; If P16C5X, use INHX8M file format.
RESET_V     SET    0x03FF      ; Reset Vector at end of 1K words
    ENDIF
;
    IFDEF   __16C57
P16C5X      SET    TRUE        ; If P16C5X, use INHX8M file format.
RESET_V     SET    0x07FF      ; Reset Vector at end of 2K words
    ENDIF
;
    IFDEF   __16C58A
P16C5X      SET    TRUE        ; If P16C5X, use INHX8M file format.
RESET_V     SET    0x07FF      ; Reset Vector at end of 2K words
    ENDIF
;
    IFDEF   __16C5X            ; Generic Processor Type
P16C5X      SET    TRUE        ; If P16C5X, use INHX8M file format.
RESET_V     SET    0x07FF      ; Reset Vector at end of 2K words
    ENDIF
;
;
    if ( P16C5X + P16CXX + P17CXX != 1 )
MESSG  "WARNING - USER DEFINED: One and only one device family can be selected"
MESSG  "                        May be NEW processor not defined in this file"
    endif
;

