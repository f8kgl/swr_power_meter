EESchema Schematic File Version 4
LIBS:TOSMETRE-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
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
L Device:D D1
U 1 1 5A324E39
P 2100 1100
F 0 "D1" H 2100 1200 50  0000 C CNN
F 1 "D" H 2100 1000 50  0000 C CNN
F 2 "Diode_SMD:D_1206_3216Metric" H 2100 1100 50  0001 C CNN
F 3 "" H 2100 1100 50  0001 C CNN
	1    2100 1100
	-1   0    0    1   
$EndComp
$Comp
L TOSMETRE-rescue:L7805 U2
U 1 1 5A33E692
P 3500 1100
F 0 "U2" H 3350 1225 50  0000 C CNN
F 1 "L7805" H 3500 1225 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 3525 950 50  0001 L CIN
F 3 "" H 3500 1050 50  0001 C CNN
	1    3500 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR02
U 1 1 5A343C5D
P 10800 1100
F 0 "#PWR02" H 10800 850 50  0001 C CNN
F 1 "GNDREF" H 10800 950 50  0000 C CNN
F 2 "" H 10800 1100 50  0001 C CNN
F 3 "" H 10800 1100 50  0001 C CNN
	1    10800 1100
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C1
U 1 1 5A3C3936
P 2650 1350
F 0 "C1" H 2675 1450 50  0000 L CNN
F 1 "C" H 2675 1250 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2688 1200 50  0001 C CNN
F 3 "" H 2650 1350 50  0001 C CNN
	1    2650 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR03
U 1 1 5A3C3EAC
P 7300 3850
F 0 "#PWR03" H 7300 3600 50  0001 C CNN
F 1 "GNDREF" H 7300 3700 50  0000 C CNN
F 2 "" H 7300 3850 50  0001 C CNN
F 3 "" H 7300 3850 50  0001 C CNN
	1    7300 3850
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR04
U 1 1 5AA42E24
P 3500 1600
F 0 "#PWR04" H 3500 1350 50  0001 C CNN
F 1 "GNDREF" H 3500 1450 50  0000 C CNN
F 2 "" H 3500 1600 50  0001 C CNN
F 3 "" H 3500 1600 50  0001 C CNN
	1    3500 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR05
U 1 1 5AA44D09
P 2650 1600
F 0 "#PWR05" H 2650 1350 50  0001 C CNN
F 1 "GNDREF" H 2650 1450 50  0000 C CNN
F 2 "" H 2650 1600 50  0001 C CNN
F 3 "" H 2650 1600 50  0001 C CNN
	1    2650 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR06
U 1 1 5AA44E43
P 2650 1600
F 0 "#PWR06" H 2650 1350 50  0001 C CNN
F 1 "GNDREF" H 2650 1450 50  0000 C CNN
F 2 "" H 2650 1600 50  0001 C CNN
F 3 "" H 2650 1600 50  0001 C CNN
	1    2650 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR07
U 1 1 5AA93D0C
P 1450 1350
F 0 "#PWR07" H 1450 1100 50  0001 C CNN
F 1 "GNDREF" H 1450 1200 50  0000 C CNN
F 2 "" H 1450 1350 50  0001 C CNN
F 3 "" H 1450 1350 50  0001 C CNN
	1    1450 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR08
U 1 1 5AA93D13
P 1450 1350
F 0 "#PWR08" H 1450 1100 50  0001 C CNN
F 1 "GNDREF" H 1450 1200 50  0000 C CNN
F 2 "" H 1450 1350 50  0001 C CNN
F 3 "" H 1450 1350 50  0001 C CNN
	1    1450 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5AACE979
P 4200 1350
F 0 "C2" H 4225 1450 50  0000 L CNN
F 1 "C" H 4225 1250 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4238 1200 50  0001 C CNN
F 3 "" H 4200 1350 50  0001 C CNN
	1    4200 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR09
U 1 1 5AAD17B7
P 4200 1600
F 0 "#PWR09" H 4200 1350 50  0001 C CNN
F 1 "GNDREF" H 4200 1450 50  0000 C CNN
F 2 "" H 4200 1600 50  0001 C CNN
F 3 "" H 4200 1600 50  0001 C CNN
	1    4200 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1100 1950 1100
Wire Wire Line
	2250 1100 2650 1100
Wire Wire Line
	3500 1400 3500 1600
Wire Wire Line
	2650 1100 2650 1200
Connection ~ 2650 1100
Wire Wire Line
	2650 1600 2650 1500
Wire Wire Line
	7250 3750 7250 3850
Wire Wire Line
	1450 1350 1450 1200
Wire Wire Line
	1450 1200 1300 1200
Wire Wire Line
	4200 1500 4200 1600
Wire Wire Line
	4200 1200 4200 1100
Connection ~ 4200 1100
Wire Wire Line
	3800 1100 4200 1100
Wire Wire Line
	2650 1100 3200 1100
Wire Wire Line
	7250 3850 7300 3850
Connection ~ 1450 1350
Connection ~ 2650 1600
Wire Wire Line
	4500 3850 4400 3850
Wire Wire Line
	4700 3850 4750 3850
Wire Wire Line
	4200 1100 4750 1100
$Comp
L Device:CP_Small C5
U 1 1 5AA53058
P 4600 3850
F 0 "C5" H 4610 3920 50  0000 L CNN
F 1 "CP_Small" H 4610 3770 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4600 3850 50  0001 C CNN
F 3 "" H 4600 3850 50  0001 C CNN
	1    4600 3850
	0    1    1    0   
$EndComp
$Comp
L power:GNDREF #PWR01
U 1 1 5A343ADA
P 4400 3850
F 0 "#PWR01" H 4400 3600 50  0001 C CNN
F 1 "GNDREF" H 4400 3700 50  0000 C CNN
F 2 "" H 4400 3850 50  0001 C CNN
F 3 "" H 4400 3850 50  0001 C CNN
	1    4400 3850
	0    1    1    0   
$EndComp
Connection ~ 4750 3850
$Comp
L Connector:Conn_01x08_Male J4
U 1 1 5CE8DB9D
P 10150 900
F 0 "J4" H 10258 1381 50  0000 C CNN
F 1 "Conn_01x08_Male" V 10258 1290 50  0001 R TNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x08_P1.27mm_Vertical" H 10150 900 50  0001 C CNN
F 3 "~" H 10150 900 50  0001 C CNN
	1    10150 900 
	0    1    1    0   
$EndComp
Text Notes 9850 850  1    39   ~ 0
6 E
Text Notes 9750 850  1    39   ~ 0
2 VDD
Text Notes 10350 850  1    39   ~ 0
14 D7
Text Notes 10250 850  1    39   ~ 0
13 D6
Text Notes 10150 850  1    39   ~ 0
12 D5
Text Notes 10050 850  1    39   ~ 0
11 D4
Text Notes 9950 850  1    39   ~ 0
4 RS
Text Notes 10450 850  1    39   ~ 0
1 GND
Wire Wire Line
	10450 1100 10800 1100
Connection ~ 7250 3850
Wire Wire Line
	6250 5550 9600 5550
Wire Wire Line
	6350 5450 9700 5450
Wire Wire Line
	6050 5750 10050 5750
Wire Wire Line
	6150 5650 10150 5650
Wire Wire Line
	6050 5750 6050 5350
Wire Wire Line
	6150 5650 6150 5350
Wire Wire Line
	6250 5550 6250 5350
Wire Wire Line
	6350 5350 6350 5450
Wire Wire Line
	5450 5350 5450 5550
Wire Wire Line
	5350 5550 5350 5350
Text Notes 5350 6000 1    60   ~ 0
FWD
Text Notes 5500 6000 1    60   ~ 0
REF
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5CE93EA7
P 5350 5750
F 0 "J3" H 5458 5931 50  0000 C CNN
F 1 "Conn_01x02_Male" H 5458 5840 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x02_P1.27mm_Vertical" H 5350 5750 50  0001 C CNN
F 3 "~" H 5350 5750 50  0001 C CNN
	1    5350 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6650 3850 7250 3850
Wire Wire Line
	4750 3850 5050 3850
Wire Wire Line
	4750 1100 9750 1100
Connection ~ 4750 1100
Wire Wire Line
	4750 1100 4750 3850
$Comp
L MCU_Microchip_PIC18:PIC18F13K50-ESS U3
U 1 1 5CF24E19
P 5850 3850
F 0 "U3" H 5850 4831 50  0000 C CNN
F 1 "PIC18F1320" H 5850 4740 50  0000 C CNN
F 2 "Package_SO:SSOP-20_5.3x7.2mm_P0.65mm" H 5850 3850 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/41350c.pdf" H 5850 3950 50  0001 C CNN
	1    5850 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8900 3000 9850 3000
Wire Wire Line
	9850 1100 9850 3000
Connection ~ 8900 3000
Wire Wire Line
	9950 1100 9950 3200
Wire Wire Line
	9600 3950 9600 5550
Wire Wire Line
	9700 5450 9700 4050
Wire Wire Line
	9600 3950 10250 3950
Wire Wire Line
	10250 3950 10600 3950
Connection ~ 10250 3950
Wire Wire Line
	10250 1100 10250 3950
Wire Wire Line
	9700 4050 10350 4050
Wire Wire Line
	10350 4050 10600 4050
Connection ~ 10350 4050
Wire Wire Line
	10350 1100 10350 4050
$Comp
L power:GNDREF #PWR010
U 1 1 5B1453B6
P 10400 4900
F 0 "#PWR010" H 10400 4650 50  0001 C CNN
F 1 "GNDREF" H 10400 4750 50  0000 C CNN
F 2 "" H 10400 4900 50  0001 C CNN
F 3 "" H 10400 4900 50  0001 C CNN
	1    10400 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 4250 10400 4250
Wire Wire Line
	10400 4250 10400 4900
Wire Wire Line
	10150 1100 10150 5650
Wire Wire Line
	10050 1100 10050 5750
Wire Wire Line
	8900 4150 8900 3000
Wire Wire Line
	8900 4150 10600 4150
Text Notes 850  1100 0    60   ~ 0
FWD
Text Notes 850  1250 0    60   ~ 0
REF
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5CEF1019
P 1100 1100
F 0 "J1" H 1208 1281 50  0000 C CNN
F 1 "Conn_01x02_Male" H 1208 1190 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x02_P1.27mm_Vertical" H 1100 1100 50  0001 C CNN
F 3 "~" H 1100 1100 50  0001 C CNN
	1    1100 1100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J2
U 1 1 5CEF1706
P 10800 4050
F 0 "J2" H 10772 3982 50  0000 R CNN
F 1 "Conn_01x05_Male" H 10772 4073 50  0000 R CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x05_P1.27mm_Vertical" H 10800 4050 50  0001 C CNN
F 3 "~" H 10800 4050 50  0001 C CNN
	1    10800 4050
	-1   0    0    1   
$EndComp
Wire Wire Line
	6700 3200 6700 2150
Wire Wire Line
	6700 2150 6050 2150
Wire Wire Line
	6050 2150 6050 2350
Wire Wire Line
	8900 3000 6850 3000
Wire Wire Line
	6850 3000 6850 2000
Wire Wire Line
	6850 2000 5650 2000
Wire Wire Line
	5650 2000 5650 2350
Wire Wire Line
	6700 3200 9950 3200
$EndSCHEMATC
