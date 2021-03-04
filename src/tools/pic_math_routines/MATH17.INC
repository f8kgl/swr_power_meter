;	RCS Header $Id: math17.inc 2.9 1997/01/31 02:23:41 F.J.Testa Exp $

;	$Revision: 2.9 $

;       MATH17 INCLUDE FILE
;
;       IMPORTANT NOTE: The math library routines can be used in a dedicated application on
;       an individual basis and memory allocation may be modified with the stipulation that
;       P type registers must remain so since P type specific instructions were used to
;       realize some performance improvements. This applies only to the PIC17.

;*********************************************************************************************

;       GENERAL MATH LIBRARY DEFINITIONS


;	general literal constants

;	define assembler constants

B0		equ	0
B1		equ	1
B2		equ	2
B3		equ	3
B4		equ	4
B5		equ	5
B6		equ	6
B7		equ	7

MSB		equ	7
LSB		equ	0


;     define commonly used bits

;     STATUS bit definitions

#define	_C		ALUSTA,0
#define	_DC		ALUSTA,1
#define	_Z		ALUSTA,2
#define	_OV		ALUSTA,3

;       general register variables

ACCB7           equ     0x18
ACCB6           equ     0x19
ACCB5           equ     0x1A
ACCB4           equ     0x1B
ACCB3           equ     0x1C
ACCB2           equ     0x1D
ACCB1           equ     0x1E
ACCB0           equ     0x1F
ACC             equ     0x1F    ; most significant byte of contiguous 8 byte accumulator

SIGN            equ     0x21    ; save location for sign in MSB

TEMPB3          equ     0x28
TEMPB2          equ     0x29
TEMPB1          equ     0x2A
TEMPB0          equ     0x2B
TEMP            equ     0x2B    ; temporary storage

;       binary operation arguments

AARGB7          equ     0x18
AARGB6          equ     0x19
AARGB5          equ     0x1A
AARGB4          equ     0x1B
AARGB3          equ     0x1C
AARGB2          equ     0x1D
AARGB1          equ     0x1E
AARGB0          equ     0x1F
AARG            equ     0x1F    ; most significant byte of argument A

BARGB3          equ     0x23
BARGB2          equ     0x24
BARGB1          equ     0x25
BARGB0          equ     0x26
BARG            equ     0x26    ; most significant byte of argument B


;       Note that AARG and ACC reference the same storage locations

;*********************************************************************************************

;       FIXED POINT SPECIFIC DEFINITIONS

;       remainder storage

REMB3           equ     0x18
REMB2           equ     0x19
REMB1           equ     0x1A
REMB0           equ     0x1B    ; most significant byte of remainder

;*********************************************************************************************

;       FLOATING POINT SPECIFIC DEFINITIONS

;       literal constants

EXPBIAS         equ     D'127'

;       biased exponents

EXP             equ     0x20    ; 8 bit biased exponent

AEXP            equ     0x20    ; 8 bit biased exponent for argument A

BEXP            equ     0x27    ; 8 bit biased exponent for argument B

;       floating point library exception flags

FPFLAGS         equ     0x22    ; floating point library exception flags
                
IOV             equ     0       ; bit0 = integer overflow flag

FOV             equ     1       ; bit1 = floating point overflow flag

FUN             equ     2       ; bit2 = floating point underflow flag

FDZ             equ     3       ; bit3 = floating point divide by zero flag

NAN		equ	4	; bit4 = not-a-number exception flag

DOM		equ	5	; bit5 = domain error flag

RND             equ     6       ; bit6 = floating point rounding flag, 0 = truncation
                                ; 1 = unbiased rounding to nearest LSB

SAT             equ     7       ; bit7 = floating point saturate flag, 0 = terminate on
                                ; exception without saturation, 1 = terminate on
                                ; exception with saturation to appropriate value

;**********************************************************************************************

;	ELEMENTARY FUNCTION MEMORY

CEXP		equ	0x34

CARGB0		equ	0x33

CARGB1		equ	0x32

CARGB2		equ	0x31

CARGB3		equ	0x30


DEXP		equ	0x39

DARGB0		equ	0x38

DARGB1		equ	0x37

DARGB2		equ	0x36

DARGB3		equ	0x35


EEXP		equ	0x3E

EARGB0		equ	0x3D

EARGB1		equ	0x3C

EARGB2		equ	0x3B

EARGB3		equ	0x3A


FEXP		equ	0x43

FARGB0		equ	0x42

FARGB1		equ	0x41

FARGB2		equ	0x40

FARGB3		equ	0x3F


GEXP		equ	0x48

GARGB0		equ	0x47

GARGB1		equ	0x46

GARGB2		equ	0x45

GARGB3		equ	0x44


ZARGB0		equ	0x2F

ZARGB1		equ	0x2E

ZARGB2		equ	0x2D

ZARGB3		equ	0x2C


RANDB0		equ	0x4C

RANDB1		equ	0x4B

RANDB2		equ	0x4A

RANDB3		equ	0x49


;**********************************************************************************************

;	24 BIT FLOATING POINT CONSTANTS

;	Machine precision

MACHEP24EXP	equ	0x6F		; 1.52587890625e-5 = 2**-16

MACHEP24B0	equ	0x00

MACHEP24B1	equ	0x00

;	Maximum argument to EXP24

MAXLOG24EXP	equ	0x85		; 88.7228391117 = log(2**128)

MAXLOG24B0	equ	0x31

MAXLOG24B1	equ	0x72

;	Minimum argument to EXP24

MINLOG24EXP	equ	0x85		; -87.3365447506 = log(2**-126)

MINLOG24B0	equ	0xAE

MINLOG24B1	equ	0xAC

;	Maximum argument to EXP1024

MAXLOG1024EXP	equ	0x84		; 38.531839445 = log10(2**128)

MAXLOG1024B0	equ	0x1A

MAXLOG1024B1	equ	0x21

;	Minimum argument to EXP1024

MINLOG1024EXP	equ	0x84		; -37.9297794537 = log10(2**-126)

MINLOG1024B0	equ	0x97

MINLOG1024B1	equ	0xB8

;	Maximum representable number before overflow

MAXNUM24EXP	equ	0xFF		; 6.80554349248E38 = (2**128) * (2 - 2**-15)

MAXNUM24B0	equ	0x7F

MAXNUM24B1	equ	0xFF

;	Minimum representable number before underflow

MINNUM24EXP	equ	0x01		; 1.17549435082E-38 = (2**-126) * 1

MINNUM24B0	equ	0x00

MINNUM24B1	equ	0x00

;	Loss threshhold for argument to SIN24 and COS24

LOSSTHR24EXP	equ	0x8A		; LOSSTHR = sqrt(2**24)*PI/4

LOSSTHR24B0	equ	0x49

LOSSTHR24B1	equ	0x10

;**********************************************************************************************

;	32 BIT FLOATING POINT CONSTANTS

;	Machine precision

MACHEP32EXP	equ	0x67		; 5.96046447754E-8 = 2**-24

MACHEP32B0	equ	0x00

MACHEP32B1	equ	0x00

MACHEP32B2	equ	0x00

;	Maximum argument to EXP32

MAXLOG32EXP	equ	0x85		; 88.7228391117 = log(2**128)

MAXLOG32B0	equ	0x31

MAXLOG32B1	equ	0x72

MAXLOG32B2	equ	0x18

;	Minimum argument to EXP32

MINLOG32EXP	equ	0x85		; -87.3365447506 = log(2**-126)

MINLOG32B0	equ	0xAE

MINLOG32B1	equ	0xAC

MINLOG32B2	equ	0x50

;	Maximum argument to EXP1032

MAXLOG1032EXP	equ	0x84		; 38.531839445 = log10(2**128)

MAXLOG1032B0	equ	0x1A

MAXLOG1032B1	equ	0x20

MAXLOG1032B2	equ	0x9B

;	Minimum argument to EXP1032

MINLOG1032EXP	equ	0x84		; -37.9297794537 = log10(2**-126)

MINLOG1032B0	equ	0x97

MINLOG1032B1	equ	0xB8

MINLOG1032B2	equ	0x18

;	Maximum representable number before overflow

MAXNUM32EXP	equ	0xFF		; 6.80564774407E38 = (2**128) * (2 - 2**-23)

MAXNUM32B0	equ	0x7F

MAXNUM32B1	equ	0xFF

MAXNUM32B2	equ	0xFF

;	Minimum representable number before underflow

MINNUM32EXP	equ	0x01		; 1.17549435082E-38 = (2**-126) * 1

MINNUM32B0	equ	0x00

MINNUM32B1	equ	0x00

MINNUM32B2	equ	0x00

;	Loss threshhold for argument to SIN32 and COS32

LOSSTHR32EXP	equ	0x8A		; LOSSTHR = sqrt(2**24)*PI/4

LOSSTHR32B0	equ	0x49

LOSSTHR32B1	equ	0x0F

LOSSTHR32B2	equ	0xDB


