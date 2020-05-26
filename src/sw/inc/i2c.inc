#define I2C_PORT PORTA
#define SDA 1
#define SCL 0
#define carry_bit STATUS,C

m_sda_input	macro
	bsf 	TRISA,SDA			;SDA en entrée
	endm

m_sda_output	macro
	bcf 	TRISA,SDA			;SDA en sortie
	endm
