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
P 3950 2000
F 0 "D1" H 3950 2100 50  0000 C CNN
F 1 "D" H 3950 1900 50  0000 C CNN
F 2 "Diodes_SMD:D_1206" H 3950 2000 50  0001 C CNN
F 3 "" H 3950 2000 50  0001 C CNN
	1    3950 2000
	-1   0    0    1   
$EndComp
$Comp
L TOSMETRE-rescue:L7805-TOSMETRE-rescue-TOSMETRE-rescue U2
U 1 1 5A33E692
P 5350 2000
F 0 "U2" H 5200 2125 50  0000 C CNN
F 1 "L7805" H 5350 2125 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Horizontal" H 5375 1850 50  0001 L CIN
F 3 "" H 5350 1950 50  0001 C CNN
	1    5350 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR01
U 1 1 5A343ADA
P 6200 3150
F 0 "#PWR01" H 6200 2900 50  0001 C CNN
F 1 "GNDREF" H 6200 3000 50  0000 C CNN
F 2 "" H 6200 3150 50  0001 C CNN
F 3 "" H 6200 3150 50  0001 C CNN
	1    6200 3150
	0    1    1    0   
$EndComp
$Comp
L power:GNDREF #PWR02
U 1 1 5A343C5D
P 10450 2000
F 0 "#PWR02" H 10450 1750 50  0001 C CNN
F 1 "GNDREF" H 10450 1850 50  0000 C CNN
F 2 "" H 10450 2000 50  0001 C CNN
F 3 "" H 10450 2000 50  0001 C CNN
	1    10450 2000
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C1
U 1 1 5A3C3936
P 4500 2250
F 0 "C1" H 4525 2350 50  0000 L CNN
F 1 "C" H 4525 2150 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 4538 2100 50  0001 C CNN
F 3 "" H 4500 2250 50  0001 C CNN
	1    4500 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR03
U 1 1 5A3C3EAC
P 6600 6100
F 0 "#PWR03" H 6600 5850 50  0001 C CNN
F 1 "GNDREF" H 6600 5950 50  0000 C CNN
F 2 "" H 6600 6100 50  0001 C CNN
F 3 "" H 6600 6100 50  0001 C CNN
	1    6600 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR04
U 1 1 5AA42E24
P 5350 2500
F 0 "#PWR04" H 5350 2250 50  0001 C CNN
F 1 "GNDREF" H 5350 2350 50  0000 C CNN
F 2 "" H 5350 2500 50  0001 C CNN
F 3 "" H 5350 2500 50  0001 C CNN
	1    5350 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR05
U 1 1 5AA44D09
P 4500 2500
F 0 "#PWR05" H 4500 2250 50  0001 C CNN
F 1 "GNDREF" H 4500 2350 50  0000 C CNN
F 2 "" H 4500 2500 50  0001 C CNN
F 3 "" H 4500 2500 50  0001 C CNN
	1    4500 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR06
U 1 1 5AA44E43
P 4500 2500
F 0 "#PWR06" H 4500 2250 50  0001 C CNN
F 1 "GNDREF" H 4500 2350 50  0000 C CNN
F 2 "" H 4500 2500 50  0001 C CNN
F 3 "" H 4500 2500 50  0001 C CNN
	1    4500 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C5
U 1 1 5AA53058
P 6400 3150
F 0 "C5" H 6410 3220 50  0000 L CNN
F 1 "CP_Small" H 6410 3070 50  0000 L CNN
F 2 "Capacitors_SMD:CP_Elec_3x5.3" H 6400 3150 50  0001 C CNN
F 3 "" H 6400 3150 50  0001 C CNN
	1    6400 3150
	0    1    1    0   
$EndComp
Text Notes 4900 5800 0    60   ~ 0
FWD
Text Notes 4900 5900 0    60   ~ 0
REF
$Comp
L power:GNDREF #PWR07
U 1 1 5AA93D0C
P 3300 2250
F 0 "#PWR07" H 3300 2000 50  0001 C CNN
F 1 "GNDREF" H 3300 2100 50  0000 C CNN
F 2 "" H 3300 2250 50  0001 C CNN
F 3 "" H 3300 2250 50  0001 C CNN
	1    3300 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR08
U 1 1 5AA93D13
P 3300 2250
F 0 "#PWR08" H 3300 2000 50  0001 C CNN
F 1 "GNDREF" H 3300 2100 50  0000 C CNN
F 2 "" H 3300 2250 50  0001 C CNN
F 3 "" H 3300 2250 50  0001 C CNN
	1    3300 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5AACE979
P 6050 2250
F 0 "C2" H 6075 2350 50  0000 L CNN
F 1 "C" H 6075 2150 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 6088 2100 50  0001 C CNN
F 3 "" H 6050 2250 50  0001 C CNN
	1    6050 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR09
U 1 1 5AAD17B7
P 6050 2500
F 0 "#PWR09" H 6050 2250 50  0001 C CNN
F 1 "GNDREF" H 6050 2350 50  0000 C CNN
F 2 "" H 6050 2500 50  0001 C CNN
F 3 "" H 6050 2500 50  0001 C CNN
	1    6050 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR010
U 1 1 5B1453B6
P 9000 5150
F 0 "#PWR010" H 9000 4900 50  0001 C CNN
F 1 "GNDREF" H 9000 5000 50  0000 C CNN
F 2 "" H 9000 5150 50  0001 C CNN
F 3 "" H 9000 5150 50  0001 C CNN
	1    9000 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 5450 6600 6050
Connection ~ 6600 2000
Wire Wire Line
	3150 2000 3800 2000
Wire Wire Line
	10450 2000 10200 2000
Wire Wire Line
	4100 2000 4500 2000
Wire Wire Line
	5350 2300 5350 2500
Wire Wire Line
	4500 2000 4500 2100
Connection ~ 4500 2000
Wire Wire Line
	4500 2500 4500 2400
Wire Wire Line
	6600 2000 6600 3150
Wire Wire Line
	6700 6050 6600 6050
Wire Wire Line
	6700 5450 6700 6050
Connection ~ 6600 6050
Wire Wire Line
	3300 2250 3300 2100
Wire Wire Line
	3300 2100 3150 2100
Wire Wire Line
	6050 2400 6050 2500
Wire Wire Line
	6500 3150 6600 3150
Wire Wire Line
	6300 3150 6200 3150
Wire Wire Line
	9200 5000 9000 5000
Wire Wire Line
	9200 4800 8500 4800
Wire Wire Line
	8500 4800 8500 4000
Wire Wire Line
	6050 2100 6050 2000
Connection ~ 6050 2000
Wire Wire Line
	5650 2000 6050 2000
Wire Wire Line
	4500 2000 5050 2000
Wire Wire Line
	6600 6050 6600 6100
Wire Wire Line
	6050 2000 6600 2000
Connection ~ 6600 3150
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 5CF58592
P 5300 5750
F 0 "J?" H 5408 5931 50  0000 C CNN
F 1 "Conn_01x02_Male" H 5408 5840 50  0000 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x02_P1.00mm_Vertical" H 5300 5750 50  0001 C CNN
F 3 "~" H 5300 5750 50  0001 C CNN
	1    5300 5750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J?
U 1 1 5CF60874
P 9200 4800
F 0 "J?" H 9308 5181 50  0000 C CNN
F 1 "Conn_01x05_Male" H 9308 5090 50  0000 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x05_P1.00mm_Vertical" H 9200 4800 50  0001 C CNN
F 3 "~" H 9200 4800 50  0001 C CNN
	1    9200 4800
	1    0    0    -1  
$EndComp
Text Notes 10200 1750 1    39   ~ 0
vss
$Comp
L Connector:Conn_01x08_Male J?
U 1 1 5CF65409
P 9900 1800
F 0 "J?" V 9735 1728 50  0000 C CNN
F 1 "Conn_01x08_Male" V 9820 1728 50  0001 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x08_P1.00mm_Vertical" H 9900 1800 50  0001 C CNN
F 3 "~" H 9900 1800 50  0001 C CNN
	1    9900 1800
	0    1    1    0   
$EndComp
Text Notes 10100 1750 1    39   ~ 0
D7
Text Notes 10000 1750 1    39   ~ 0
D6
Text Notes 9900 1750 1    39   ~ 0
D5
Text Notes 9800 1750 1    39   ~ 0
D4
Text Notes 9700 1750 1    39   ~ 0
RS
Text Notes 9600 1750 1    39   ~ 0
E
Text Notes 9500 1750 1    39   ~ 0
VDD
Wire Wire Line
	10100 2000 10100 4000
Wire Wire Line
	10000 2000 10000 4100
Wire Wire Line
	9900 2000 9900 4200
Wire Wire Line
	9800 2000 9800 4300
Wire Wire Line
	6600 2000 9500 2000
Wire Wire Line
	9700 2000 9700 6000
Wire Wire Line
	9600 2000 9600 3850
$Comp
L Connector:Conn_01x02_Male J?
U 1 1 5CF5834C
P 2950 2000
F 0 "J?" H 3058 2181 50  0000 C CNN
F 1 "Conn_01x02_Male" H 3058 2090 50  0000 C CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x02_P1.00mm_Vertical" H 2950 2000 50  0001 C CNN
F 3 "~" H 2950 2000 50  0001 C CNN
	1    2950 2000
	1    0    0    -1  
$EndComp
Connection ~ 3300 2250
Wire Wire Line
	9000 5000 9000 5150
$Comp
L 16F88:18F1320 U?
U 1 1 5CF66128
P 6600 4950
F 0 "U?" V 6646 4320 50  0000 R CNN
F 1 "18F1320" V 6555 4320 50  0000 R CNN
F 2 "" H 5150 4650 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21919e.pdf" H 6400 4350 50  0001 C CNN
	1    6600 4950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6800 6000 6800 5450
Wire Wire Line
	6800 6000 9700 6000
Wire Wire Line
	6200 5450 6200 5750
Wire Wire Line
	6200 5750 5500 5750
Wire Wire Line
	6300 5450 6300 5850
Wire Wire Line
	6300 5850 5500 5850
Wire Wire Line
	6800 4000 6800 4450
Wire Wire Line
	6900 4100 6900 4450
Wire Wire Line
	6200 4450 6200 3850
Wire Wire Line
	8350 4900 8350 4200
Wire Wire Line
	8350 4900 9200 4900
Wire Wire Line
	7000 4200 7000 4450
Wire Wire Line
	7100 4300 7100 4450
Wire Wire Line
	7100 4300 9800 4300
Wire Wire Line
	8650 4700 8650 4100
Wire Wire Line
	8650 4700 9200 4700
Connection ~ 8350 4200
Wire Wire Line
	8350 4200 9900 4200
Connection ~ 8500 4000
Wire Wire Line
	8500 4000 10100 4000
Connection ~ 8650 4100
Wire Wire Line
	8650 4100 10000 4100
Wire Wire Line
	6900 4100 8650 4100
Wire Wire Line
	7000 4200 8350 4200
Wire Wire Line
	6200 3850 9600 3850
Wire Wire Line
	6800 4000 8500 4000
Wire Wire Line
	6600 3150 6600 4450
$EndSCHEMATC
