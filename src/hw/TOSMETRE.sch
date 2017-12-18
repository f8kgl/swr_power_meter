EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:TOSMETRE-cache
EELAYER 25 0
EELAYER END
$Descr User 7874 5906
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L D D1
U 1 1 5A324E39
P 3100 1800
F 0 "D1" H 3100 1900 50  0000 C CNN
F 1 "D" H 3100 1700 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 3100 1800 50  0001 C CNN
F 3 "" H 3100 1800 50  0001 C CNN
	1    3100 1800
	-1   0    0    1   
$EndComp
$Comp
L MCP23008_SSOP U1
U 1 1 5A324369
P 5400 3150
F 0 "U1" H 5300 3775 50  0000 R CNN
F 1 "16F628A_SSOP" H 5300 3700 50  0000 R CNN
F 2 "Housings_SSOP:SSOP-20_5.3x7.2mm_Pitch0.65mm" H 5450 2500 50  0001 L CNN
F 3 "" H 5650 3750 50  0001 C CNN
	1    5400 3150
	0    -1   1    0   
$EndComp
$Comp
L Conn_Coaxial_Power J2
U 1 1 5A33E01A
P 2100 1700
F 0 "J2" V 1900 1650 50  0000 C CNN
F 1 "Conn_Power" V 1975 1650 50  0000 C CNN
F 2 "Connectors:JACK_ALIM" H 2100 1650 50  0001 C CNN
F 3 "" H 2100 1650 50  0001 C CNN
	1    2100 1700
	0    1    1    0   
$EndComp
$Comp
L L7805 U2
U 1 1 5A33E692
P 3800 1800
F 0 "U2" H 3650 1925 50  0000 C CNN
F 1 "L7805" H 3800 1925 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Horizontal" H 3825 1650 50  0001 L CIN
F 3 "" H 3800 1750 50  0001 C CNN
	1    3800 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2200 3800 2100
Wire Wire Line
	2400 1700 2200 1700
$Comp
L GNDREF #PWR01
U 1 1 5A343ADA
P 3800 2200
F 0 "#PWR01" H 3800 1950 50  0001 C CNN
F 1 "GNDREF" H 3800 2050 50  0000 C CNN
F 2 "" H 3800 2200 50  0001 C CNN
F 3 "" H 3800 2200 50  0001 C CNN
	1    3800 2200
	1    0    0    -1  
$EndComp
$Comp
L GNDREF #PWR02
U 1 1 5A343C5D
P 6250 1800
F 0 "#PWR02" H 6250 1550 50  0001 C CNN
F 1 "GNDREF" H 6250 1650 50  0000 C CNN
F 2 "" H 6250 1800 50  0001 C CNN
F 3 "" H 6250 1800 50  0001 C CNN
	1    6250 1800
	0    -1   -1   0   
$EndComp
$Comp
L +BATT #PWR03
U 1 1 5A343CA9
P 2200 1900
F 0 "#PWR03" H 2200 1750 50  0001 C CNN
F 1 "+BATT" V 2200 2200 50  0000 C CNN
F 2 "" H 2200 1900 50  0001 C BNN
F 3 "" H 2200 1900 50  0001 C CNN
	1    2200 1900
	0    -1   -1   0   
$EndComp
$Comp
L GNDREF #PWR04
U 1 1 5A343D73
P 1550 1700
F 0 "#PWR04" H 1550 1450 50  0001 C CNN
F 1 "GNDREF" V 1550 1450 50  0000 C CNN
F 2 "" H 1550 1700 50  0001 C CNN
F 3 "" H 1550 1700 50  0001 C CNN
	1    1550 1700
	0    1    1    0   
$EndComp
$Comp
L SW_DPDT_x2 SW1
U 1 1 5A343DF6
P 2600 1800
F 0 "SW1" H 2600 1970 50  0000 C CNN
F 1 "SW_DPDT_x2" H 2600 1600 50  0000 C CNN
F 2 "Buttons_Switches_SMD:SW_SPDT_CK-JS102011SAQN" H 2600 1800 50  0001 C CNN
F 3 "" H 2600 1800 50  0001 C CNN
	1    2600 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	1900 1700 1550 1700
Wire Wire Line
	2200 1900 2400 1900
Wire Wire Line
	3500 1800 3250 1800
$Comp
L WC1602A DS1
U 1 1 5A3242FC
P 5200 1800
F 0 "DS1" H 4970 2550 50  0000 C CNN
F 1 "WC1602A" H 5410 2550 50  0000 C CNN
F 2 "Displays:WC1602A" H 5200 900 50  0001 C CIN
F 3 "" H 5900 1800 50  0001 C CNN
	1    5200 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4400 1800 4100 1800
Wire Wire Line
	6250 1800 6000 1800
Wire Wire Line
	2950 1800 2800 1800
Wire Wire Line
	5800 2200 5800 2650
Wire Wire Line
	5700 2200 5700 2650
Wire Wire Line
	5600 2200 5600 2650
Wire Wire Line
	5500 2200 5500 2650
Wire Wire Line
	5400 2200 5400 2650
Wire Wire Line
	5300 2200 5300 2650
Wire Wire Line
	5200 2200 5200 2650
Wire Wire Line
	5100 2200 5100 2650
Wire Wire Line
	4800 3150 4300 3150
Wire Wire Line
	4300 3150 4300 1800
Connection ~ 4300 1800
$Comp
L GNDREF #PWR05
U 1 1 5A346B96
P 6350 3150
F 0 "#PWR05" H 6350 2900 50  0001 C CNN
F 1 "GNDREF" H 6350 3000 50  0000 C CNN
F 2 "" H 6350 3150 50  0001 C CNN
F 3 "" H 6350 3150 50  0001 C CNN
	1    6350 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6350 3150 6100 3150
$EndSCHEMATC
