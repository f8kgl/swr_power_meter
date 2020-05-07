EESchema Schematic File Version 4
EELAYER 30 0
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
L power:GNDREF #PWR03
U 1 1 5A3C3EAC
P 8150 5250
F 0 "#PWR03" H 8150 5000 50  0001 C CNN
F 1 "GNDREF" H 8150 5100 50  0000 C CNN
F 2 "" H 8150 5250 50  0001 C CNN
F 3 "" H 8150 5250 50  0001 C CNN
	1    8150 5250
	1    0    0    -1  
$EndComp
Text Notes 1610 6450 3    60   ~ 0
FWD
Text Notes 1900 4100 1    60   ~ 0
REF
$Comp
L power:GNDREF #PWR010
U 1 1 5B1453B6
P 10600 4150
F 0 "#PWR010" H 10600 3900 50  0001 C CNN
F 1 "GNDREF" H 10600 4000 50  0000 C CNN
F 2 "" H 10600 4150 50  0001 C CNN
F 3 "" H 10600 4150 50  0001 C CNN
	1    10600 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 4600 8150 5200
Wire Wire Line
	8250 5200 8150 5200
Wire Wire Line
	8250 4600 8250 5200
Connection ~ 8150 5200
Wire Wire Line
	10800 4000 10600 4000
Wire Wire Line
	8150 5200 8150 5250
Text Notes 10550 900  1    39   ~ 0
vss
$Comp
L Connector:Conn_01x08_Male J4
U 1 1 5CF65409
P 10200 950
F 0 "J4" V 9900 900 50  0000 C CNN
F 1 "LCD 4x20" V 10000 900 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 10200 950 50  0001 C CNN
F 3 "~" H 10200 950 50  0001 C CNN
	1    10200 950 
	0    1    1    0   
$EndComp
Text Notes 10450 900  1    39   ~ 0
D7
Text Notes 10350 900  1    39   ~ 0
D6
Text Notes 10250 900  1    39   ~ 0
D5
Text Notes 10100 900  1    39   ~ 0
D4
Text Notes 10000 900  1    39   ~ 0
RS
Text Notes 9900 900  1    39   ~ 0
E
Text Notes 9800 900  1    39   ~ 0
VDD
Wire Wire Line
	10600 4000 10600 4150
$Comp
L TOSMETRE-rescue:18F1320-16F88 U1
U 1 1 5CF66128
P 8150 4100
F 0 "U1" V 8196 3470 50  0000 R CNN
F 1 "18F1320" V 8105 3470 50  0000 R CNN
F 2 "Package_SO:SSOP-20_4.4x6.5mm_P0.65mm" H 6700 3800 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21919e.pdf" H 7950 3500 50  0001 C CNN
	1    8150 4100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8350 5150 8350 4600
Wire Wire Line
	8450 3250 8450 3600
Wire Wire Line
	8550 3350 8550 3600
Wire Wire Line
	8650 3450 8650 3600
$Comp
L Connector:Conn_01x04_Male J3
U 1 1 5CFBE9AE
P 11000 3900
F 0 "J3" H 10972 3782 50  0000 R CNN
F 1 "PRG PIC" H 10972 3873 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 11000 3900 50  0001 C CNN
F 3 "~" H 11000 3900 50  0001 C CNN
	1    11000 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	8150 1150 9800 1150
$Comp
L TOSMETRE-rescue:MAX11100-16F88 U4
U 1 1 5CFD76E0
P 5400 2250
F 0 "U4" V 5917 2577 50  0000 L CNN
F 1 "MAX11100" V 5995 2457 50  0000 L CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" V 6050 2600 50  0001 C CNN
F 3 "" V 5100 2550 50  0001 C CNN
	1    5400 2250
	0    1    1    0   
$EndComp
Connection ~ 8150 1150
Wire Wire Line
	8250 3600 8250 3150
Wire Wire Line
	8250 3150 8150 3150
Connection ~ 8150 3150
Wire Wire Line
	8150 3150 8150 3600
Wire Wire Line
	10750 1150 10500 1150
$Comp
L power:GNDREF #PWR02
U 1 1 5A343C5D
P 10750 1150
F 0 "#PWR02" H 10750 900 50  0001 C CNN
F 1 "GNDREF" V 10673 936 50  0000 L BNN
F 2 "" H 10750 1150 50  0001 C CNN
F 3 "" H 10750 1150 50  0001 C CNN
	1    10750 1150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7750 3600 7750 2700
Wire Wire Line
	7750 2700 9900 2700
Wire Wire Line
	9900 2700 9900 1150
Wire Wire Line
	8350 5150 10400 5150
Wire Wire Line
	10400 5150 10400 1150
Wire Wire Line
	8650 3450 10300 3450
Wire Wire Line
	10300 3450 10300 1150
Wire Wire Line
	8550 3350 9450 3350
Wire Wire Line
	10200 3350 10200 1150
Wire Wire Line
	8450 3250 9600 3250
Wire Wire Line
	10100 3250 10100 1150
Wire Wire Line
	8350 3150 9750 3150
Wire Wire Line
	10000 3150 10000 1150
Wire Wire Line
	9750 3700 9750 3150
Wire Wire Line
	9750 3700 10800 3700
Connection ~ 9750 3150
Wire Wire Line
	9750 3150 10000 3150
Wire Wire Line
	9600 3800 9600 3250
Wire Wire Line
	9600 3800 10800 3800
Connection ~ 9600 3250
Wire Wire Line
	9600 3250 10100 3250
Wire Wire Line
	9450 3900 9450 3350
Wire Wire Line
	9450 3900 10800 3900
Connection ~ 9450 3350
Wire Wire Line
	9450 3350 10200 3350
Wire Wire Line
	8150 1150 8150 1450
Wire Wire Line
	7850 1450 7750 1450
Wire Wire Line
	8050 1450 8150 1450
$Comp
L Device:CP_Small C5
U 1 1 5AA53058
P 7950 1450
F 0 "C5" H 7960 1520 50  0000 L CNN
F 1 "CP_Small" H 7960 1370 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 7950 1450 50  0001 C CNN
F 3 "" H 7950 1450 50  0001 C CNN
	1    7950 1450
	0    1    1    0   
$EndComp
$Comp
L power:GNDREF #PWR01
U 1 1 5A343ADA
P 7750 1450
F 0 "#PWR01" H 7750 1200 50  0001 C CNN
F 1 "GNDREF" H 7750 1300 50  0000 C CNN
F 2 "" H 7750 1450 50  0001 C CNN
F 3 "" H 7750 1450 50  0001 C CNN
	1    7750 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	8350 3150 8350 3600
Text Notes 4700 2500 0    50   ~ 0
+5V
$Comp
L Device:C C3
U 1 1 5CFDD413
P 4600 2300
F 0 "C3" H 4625 2400 50  0000 L CNN
F 1 "C" H 4625 2200 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4638 2150 50  0001 C CNN
F 3 "" H 4600 2300 50  0001 C CNN
	1    4600 2300
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5CF5834C
P 1050 1150
F 0 "J1" H 967 1108 50  0000 C CNN
F 1 "Alim" H 1123 999 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1050 1150 50  0001 C CNN
F 3 "~" H 1050 1150 50  0001 C CNN
	1    1050 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 1250 3800 1150
Wire Wire Line
	3800 1550 3800 1650
Wire Wire Line
	2250 1650 2250 1550
Connection ~ 2250 1150
Wire Wire Line
	2250 1150 2250 1250
Wire Wire Line
	1850 1150 2250 1150
$Comp
L power:GNDREF #PWR09
U 1 1 5AAD17B7
P 3800 1650
F 0 "#PWR09" H 3800 1400 50  0001 C CNN
F 1 "GNDREF" H 3800 1500 50  0000 C CNN
F 2 "" H 3800 1650 50  0001 C CNN
F 3 "" H 3800 1650 50  0001 C CNN
	1    3800 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5AACE979
P 3800 1400
F 0 "C2" H 3825 1500 50  0000 L CNN
F 1 "C" H 3825 1300 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3838 1250 50  0001 C CNN
F 3 "" H 3800 1400 50  0001 C CNN
	1    3800 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR08
U 1 1 5AA93D13
P 1400 1650
F 0 "#PWR08" H 1400 1400 50  0001 C CNN
F 1 "GNDREF" H 1400 1500 50  0000 C CNN
F 2 "" H 1400 1650 50  0001 C CNN
F 3 "" H 1400 1650 50  0001 C CNN
	1    1400 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR07
U 1 1 5AA93D0C
P 1400 1650
F 0 "#PWR07" H 1400 1400 50  0001 C CNN
F 1 "GNDREF" H 1400 1500 50  0000 C CNN
F 2 "" H 1400 1650 50  0001 C CNN
F 3 "" H 1400 1650 50  0001 C CNN
	1    1400 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR06
U 1 1 5AA44E43
P 2250 1650
F 0 "#PWR06" H 2250 1400 50  0001 C CNN
F 1 "GNDREF" H 2250 1500 50  0000 C CNN
F 2 "" H 2250 1650 50  0001 C CNN
F 3 "" H 2250 1650 50  0001 C CNN
	1    2250 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR05
U 1 1 5AA44D09
P 2250 1650
F 0 "#PWR05" H 2250 1400 50  0001 C CNN
F 1 "GNDREF" H 2250 1500 50  0000 C CNN
F 2 "" H 2250 1650 50  0001 C CNN
F 3 "" H 2250 1650 50  0001 C CNN
	1    2250 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR04
U 1 1 5AA42E24
P 3150 1650
F 0 "#PWR04" H 3150 1400 50  0001 C CNN
F 1 "GNDREF" H 3150 1500 50  0000 C CNN
F 2 "" H 3150 1650 50  0001 C CNN
F 3 "" H 3150 1650 50  0001 C CNN
	1    3150 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5A3C3936
P 2250 1400
F 0 "C1" H 2275 1500 50  0000 L CNN
F 1 "C" H 2275 1300 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2288 1250 50  0001 C CNN
F 3 "" H 2250 1400 50  0001 C CNN
	1    2250 1400
	1    0    0    -1  
$EndComp
$Comp
L TOSMETRE-rescue:L7805-TOSMETRE-rescue-TOSMETRE-rescue U2
U 1 1 5A33E692
P 3150 1150
F 0 "U2" H 3000 1275 50  0000 C CNN
F 1 "L7805" H 3150 1275 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 3175 1000 50  0001 L CIN
F 3 "" H 3150 1100 50  0001 C CNN
	1    3150 1150
	1    0    0    -1  
$EndComp
$Comp
L Device:D D1
U 1 1 5A324E39
P 1700 1150
F 0 "D1" H 1700 1250 50  0000 C CNN
F 1 "D" H 1700 1050 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1700 1150 50  0001 C CNN
F 3 "" H 1700 1150 50  0001 C CNN
	1    1700 1150
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR0104
U 1 1 5D25B703
P 3450 5200
F 0 "#PWR0104" H 3450 4950 50  0001 C CNN
F 1 "GNDREF" V 3455 4909 50  0000 C CNN
F 2 "" H 3450 5200 50  0001 C CNN
F 3 "" H 3450 5200 50  0001 C CNN
	1    3450 5200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3450 5200 3250 5200
Wire Wire Line
	1400 1650 1400 1250
Wire Wire Line
	1400 1250 1250 1250
Connection ~ 1400 1650
Wire Wire Line
	1250 1150 1550 1150
Connection ~ 2250 1650
Wire Wire Line
	3150 1450 3150 1650
Wire Wire Line
	3800 1150 4150 1150
Wire Wire Line
	3800 1150 3450 1150
Connection ~ 3800 1150
Wire Wire Line
	4150 5300 3250 5300
Connection ~ 4150 1150
$Comp
L power:GNDREF #PWR0102
U 1 1 5D11E244
P 4600 1900
F 0 "#PWR0102" H 4600 1650 50  0001 C CNN
F 1 "GNDREF" H 4605 1727 50  0000 C CNN
F 2 "" H 4600 1900 50  0001 C CNN
F 3 "" H 4600 1900 50  0001 C CNN
	1    4600 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	4650 2550 4650 2600
$Comp
L power:GNDREF #PWR0101
U 1 1 5E7F5C1D
P 4650 2600
F 0 "#PWR0101" H 4650 2350 50  0001 C CNN
F 1 "GNDREF" H 4655 2427 50  0000 C CNN
F 2 "" H 4650 2600 50  0001 C CNN
F 3 "" H 4650 2600 50  0001 C CNN
	1    4650 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5CFDE822
P 6500 2900
F 0 "C4" H 6525 3000 50  0000 L CNN
F 1 "C" H 6525 2800 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6538 2750 50  0001 C CNN
F 3 "" H 6500 2900 50  0001 C CNN
	1    6500 2900
	1    0    0    -1  
$EndComp
Text Notes 6750 2750 0    50   ~ 0
VREF
Wire Wire Line
	6500 1150 6500 1600
Wire Wire Line
	6250 2550 6500 2550
Text Notes 6500 1300 0    50   ~ 0
+5V
$Comp
L Device:C C6
U 1 1 5CFDED1A
P 6000 1600
F 0 "C6" H 6025 1700 50  0000 L CNN
F 1 "C" H 6025 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6038 1450 50  0001 C CNN
F 3 "" H 6000 1600 50  0001 C CNN
	1    6000 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 1150 6500 1150
Wire Wire Line
	4150 2450 4600 2450
Wire Wire Line
	4150 1150 4150 2450
Connection ~ 4150 2450
Wire Wire Line
	4150 2450 4150 5300
Connection ~ 4600 2450
Wire Wire Line
	4600 2450 5300 2450
$Comp
L power:GNDREF #PWR0103
U 1 1 5E82596D
P 4950 1900
F 0 "#PWR0103" H 4950 1650 50  0001 C CNN
F 1 "GNDREF" H 4955 1727 50  0000 C CNN
F 2 "" H 4950 1900 50  0001 C CNN
F 3 "" H 4950 1900 50  0001 C CNN
	1    4950 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	5300 2350 4950 2350
Wire Wire Line
	4950 2350 4950 1900
Wire Wire Line
	4600 2150 4600 1900
$Comp
L power:GNDREF #PWR0105
U 1 1 5E82F361
P 6500 3250
F 0 "#PWR0105" H 6500 3000 50  0001 C CNN
F 1 "GNDREF" H 6505 3077 50  0000 C CNN
F 2 "" H 6500 3250 50  0001 C CNN
F 3 "" H 6500 3250 50  0001 C CNN
	1    6500 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3050 6500 3250
$Comp
L power:GNDREF #PWR0106
U 1 1 5E83AA23
P 5750 1600
F 0 "#PWR0106" H 5750 1350 50  0001 C CNN
F 1 "GNDREF" H 5750 1450 50  0000 C CNN
F 2 "" H 5750 1600 50  0001 C CNN
F 3 "" H 5750 1600 50  0001 C CNN
	1    5750 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	5850 1600 5750 1600
Wire Wire Line
	6500 2650 6500 2750
Wire Wire Line
	6500 2650 6800 2650
Connection ~ 6500 2650
Wire Wire Line
	2250 1150 2850 1150
Connection ~ 6500 1150
Wire Wire Line
	6500 1150 8150 1150
Wire Wire Line
	6500 1600 6150 1600
Wire Wire Line
	6250 2650 6500 2650
Wire Wire Line
	7750 4600 7750 5400
Connection ~ 6500 1600
Wire Wire Line
	6500 1600 6500 2550
Wire Wire Line
	3250 5400 7750 5400
$Comp
L TOSMETRE-rescue:MAX4624-16F88 U3
U 1 1 5CFD8181
P 3150 5400
F 0 "U3" V 3437 5671 50  0000 C CNN
F 1 "MAX4624" V 3503 5668 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" V 3650 5650 50  0001 C CNN
F 3 "" V 3500 5450 50  0001 C CNN
	1    3150 5400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2500 5400 1700 5400
NoConn ~ 8650 4600
NoConn ~ 8550 4600
NoConn ~ 8450 4600
NoConn ~ 8050 4600
NoConn ~ 7950 4600
NoConn ~ 7850 4600
Connection ~ 8150 1450
Wire Wire Line
	8150 1450 8150 3150
Wire Wire Line
	6250 2350 7850 2350
Wire Wire Line
	7850 2350 7850 3600
Wire Wire Line
	6250 2250 7950 2250
Wire Wire Line
	7950 2250 7950 3600
Wire Wire Line
	5300 2250 5150 2250
Wire Wire Line
	5150 2250 5150 2100
Wire Wire Line
	5150 2100 8050 2100
Wire Wire Line
	8050 2100 8050 3600
Wire Wire Line
	6250 2450 7250 2450
Wire Wire Line
	7250 2450 7250 2800
$Comp
L power:GNDREF #PWR0107
U 1 1 5EA31A54
P 7250 2800
F 0 "#PWR0107" H 7250 2550 50  0001 C CNN
F 1 "GNDREF" H 7255 2627 50  0000 C CNN
F 2 "" H 7250 2800 50  0001 C CNN
F 3 "" H 7250 2800 50  0001 C CNN
	1    7250 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3250 2350 5300
Wire Wire Line
	4650 2550 5300 2550
Wire Wire Line
	4850 3250 4850 2650
Wire Wire Line
	4850 2650 5300 2650
Wire Wire Line
	4850 3250 2350 3250
Wire Wire Line
	2500 5300 2350 5300
$Comp
L Connector:Conn_Coaxial J5
U 1 1 5EA8C71B
P 1700 3850
F 0 "J5" H 1800 3732 50  0000 L CNN
F 1 "Conn_Coaxial" H 1800 3823 50  0000 L CNN
F 2 "Connector_Coaxial:SMA_Amphenol_132203-12_Horizontal" H 1700 3850 50  0001 C CNN
F 3 " ~" H 1700 3850 50  0001 C CNN
	1    1700 3850
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_Coaxial J2
U 1 1 5EA8D686
P 1700 6750
F 0 "J2" H 1800 6632 50  0000 L CNN
F 1 "Conn_Coaxial" H 1800 6723 50  0000 L CNN
F 2 "Connector_Coaxial:SMA_Amphenol_132203-12_Horizontal" H 1700 6750 50  0001 C CNN
F 3 " ~" H 1700 6750 50  0001 C CNN
	1    1700 6750
	0    1    1    0   
$EndComp
Wire Wire Line
	1500 6750 1300 6750
$Comp
L power:GNDREF #PWR0109
U 1 1 5EAA45E2
P 1300 6750
F 0 "#PWR0109" H 1300 6500 50  0001 C CNN
F 1 "GNDREF" H 1305 6577 50  0000 C CNN
F 2 "" H 1300 6750 50  0001 C CNN
F 3 "" H 1300 6750 50  0001 C CNN
	1    1300 6750
	0    1    1    0   
$EndComp
$Comp
L librairie_projet:BAT54XV2 D3
U 1 1 5EAD20A2
P 1700 6100
F 0 "D3" H 1700 6317 50  0000 C CNN
F 1 "BAT54XV2" H 1700 6226 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 1700 5925 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30396.pdf" H 1700 6100 50  0001 C CNN
	1    1700 6100
	0    1    1    0   
$EndComp
Wire Wire Line
	1700 5950 1700 5750
Wire Wire Line
	1700 5750 1450 5750
$Comp
L Device:C C8
U 1 1 5EAEBEF7
P 1300 5750
F 0 "C8" H 1325 5850 50  0000 L CNN
F 1 "47n" H 1325 5650 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1338 5600 50  0001 C CNN
F 3 "" H 1300 5750 50  0001 C CNN
	1    1300 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1150 5750 1000 5750
$Comp
L power:GNDREF #PWR0108
U 1 1 5EAF3264
P 1000 5750
F 0 "#PWR0108" H 1000 5500 50  0001 C CNN
F 1 "GNDREF" V 1005 5622 50  0000 R CNN
F 2 "" H 1000 5750 50  0001 C CNN
F 3 "" H 1000 5750 50  0001 C CNN
	1    1000 5750
	0    1    1    0   
$EndComp
$Comp
L librairie_projet:BAT54XV2 D2
U 1 1 5EAF4ABA
P 1700 4750
F 0 "D2" H 1700 4967 50  0000 C CNN
F 1 "BAT54XV2" H 1700 4876 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 1700 4575 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30396.pdf" H 1700 4750 50  0001 C CNN
	1    1700 4750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1700 4600 1700 4300
Wire Wire Line
	1700 4300 1450 4300
$Comp
L Device:C C7
U 1 1 5EAF4AC5
P 1300 4300
F 0 "C7" H 1325 4400 50  0000 L CNN
F 1 "47n" H 1325 4200 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1338 4150 50  0001 C CNN
F 3 "" H 1300 4300 50  0001 C CNN
	1    1300 4300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1150 4300 1000 4300
$Comp
L power:GNDREF #PWR0110
U 1 1 5EAF4ACC
P 1000 4300
F 0 "#PWR0110" H 1000 4050 50  0001 C CNN
F 1 "GNDREF" V 1005 4172 50  0000 R CNN
F 2 "" H 1000 4300 50  0001 C CNN
F 3 "" H 1000 4300 50  0001 C CNN
	1    1000 4300
	0    1    1    0   
$EndComp
Connection ~ 1700 4300
Wire Wire Line
	1700 4300 1700 4050
Wire Wire Line
	1700 4900 1700 5200
Wire Wire Line
	1700 5200 2500 5200
$Comp
L power:GNDREF #PWR0111
U 1 1 5EB0E0EA
P 2100 3850
F 0 "#PWR0111" H 2100 3600 50  0001 C CNN
F 1 "GNDREF" V 2105 3722 50  0000 R CNN
F 2 "" H 2100 3850 50  0001 C CNN
F 3 "" H 2100 3850 50  0001 C CNN
	1    2100 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1900 3850 2100 3850
Connection ~ 1700 5750
Wire Wire Line
	1700 5750 1700 5400
Wire Wire Line
	1700 6250 1700 6550
$EndSCHEMATC
