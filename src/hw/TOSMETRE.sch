EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
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
Wire Wire Line
	5400 5900 5600 5900
Wire Wire Line
	5400 6000 5700 6000
Wire Wire Line
	3950 6200 4400 6200
Wire Wire Line
	4050 6100 4050 4950
Wire Wire Line
	4400 6100 4050 6100
Wire Wire Line
	4150 6000 4150 4850
Wire Wire Line
	4400 6000 4150 6000
Wire Wire Line
	4250 5900 4250 4750
Wire Wire Line
	4400 5900 4250 5900
NoConn ~ 4400 6700
NoConn ~ 4400 6800
NoConn ~ 4400 6500
NoConn ~ 4400 6600
$Comp
L power:GNDREF #PWR0129
U 1 1 5EDAE57E
P 3550 4200
F 0 "#PWR0129" H 3550 3950 50  0001 C CNN
F 1 "GNDREF" V 3555 4072 50  0000 R CNN
F 2 "" H 3550 4200 50  0001 C CNN
F 3 "" H 3550 4200 50  0001 C CNN
	1    3550 4200
	-1   0    0    1   
$EndComp
Wire Wire Line
	2250 6700 2250 6800
Wire Wire Line
	4400 6300 3950 6300
Connection ~ 3950 6400
Wire Wire Line
	3950 6300 3950 6400
$Comp
L power:GNDREF #PWR01
U 1 1 5A343ADA
P 2250 6800
F 0 "#PWR01" H 2250 6550 50  0001 C CNN
F 1 "GNDREF" V 2250 6650 50  0000 R CNN
F 2 "" H 2250 6800 50  0001 C CNN
F 3 "" H 2250 6800 50  0001 C CNN
	1    2250 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C5
U 1 1 5AA53058
P 2250 6600
F 0 "C5" H 2260 6670 50  0000 L CNN
F 1 "CP_Small" H 2260 6520 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2250 6600 50  0001 C CNN
F 3 "" H 2250 6600 50  0001 C CNN
	1    2250 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 6500 2250 6400
$Comp
L Device:R R3
U 1 1 5EC330C0
P 10750 4500
F 0 "R3" V 10750 4450 50  0000 L CNN
F 1 "50" V 10820 4455 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 10680 4500 50  0001 C CNN
F 3 "~" H 10750 4500 50  0001 C CNN
	1    10750 4500
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C12
U 1 1 5EC5241B
P 10100 4900
F 0 "C12" H 10125 5000 50  0000 L CNN
F 1 "2nF" H 10125 4800 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 10138 4750 50  0001 C CNN
F 3 "" H 10100 4900 50  0001 C CNN
	1    10100 4900
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0103
U 1 1 5EC558FE
P 10350 4900
F 0 "#PWR0103" H 10350 4650 50  0001 C CNN
F 1 "GNDREF" H 10355 4727 50  0000 C CNN
F 2 "" H 10350 4900 50  0001 C CNN
F 3 "" H 10350 4900 50  0001 C CNN
	1    10350 4900
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0116
U 1 1 5ECF284C
P 7350 5050
F 0 "#PWR0116" H 7350 4800 50  0001 C CNN
F 1 "GNDREF" H 7355 4877 50  0000 C CNN
F 2 "" H 7350 5050 50  0001 C CNN
F 3 "" H 7350 5050 50  0001 C CNN
	1    7350 5050
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR0117
U 1 1 5ECF2856
P 7750 5050
F 0 "#PWR0117" H 7750 4800 50  0001 C CNN
F 1 "GNDREF" H 7755 4877 50  0000 C CNN
F 2 "" H 7750 5050 50  0001 C CNN
F 3 "" H 7750 5050 50  0001 C CNN
	1    7750 5050
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR0118
U 1 1 5ED1B749
P 8100 5050
F 0 "#PWR0118" H 8100 4800 50  0001 C CNN
F 1 "GNDREF" H 8105 4877 50  0000 C CNN
F 2 "" H 8100 5050 50  0001 C CNN
F 3 "" H 8100 5050 50  0001 C CNN
	1    8100 5050
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR0122
U 1 1 5ED35516
P 7050 5050
F 0 "#PWR0122" H 7050 4800 50  0001 C CNN
F 1 "GNDREF" H 7055 4877 50  0000 C CNN
F 2 "" H 7050 5050 50  0001 C CNN
F 3 "" H 7050 5050 50  0001 C CNN
	1    7050 5050
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR0119
U 1 1 5ED2AB5A
P 9800 6000
F 0 "#PWR0119" H 9800 5750 50  0001 C CNN
F 1 "GNDREF" H 9805 5827 50  0000 C CNN
F 2 "" H 9800 6000 50  0001 C CNN
F 3 "" H 9800 6000 50  0001 C CNN
	1    9800 6000
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C24
U 1 1 5ED64B7D
P 8344 6500
F 0 "C24" H 8369 6600 50  0000 L CNN
F 1 "10µF" H 8369 6400 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8382 6350 50  0001 C CNN
F 3 "" H 8344 6500 50  0001 C CNN
	1    8344 6500
	-1   0    0    1   
$EndComp
Wire Wire Line
	8344 6800 8344 6650
Wire Wire Line
	8744 6650 8744 6800
$Comp
L power:GNDREF #PWR0134
U 1 1 5ED64B72
P 8344 6800
F 0 "#PWR0134" H 8344 6550 50  0001 C CNN
F 1 "GNDREF" H 8349 6627 50  0000 C CNN
F 2 "" H 8344 6800 50  0001 C CNN
F 3 "" H 8344 6800 50  0001 C CNN
	1    8344 6800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0133
U 1 1 5ED64B6C
P 8744 6800
F 0 "#PWR0133" H 8744 6550 50  0001 C CNN
F 1 "GNDREF" H 8749 6627 50  0000 C CNN
F 2 "" H 8744 6800 50  0001 C CNN
F 3 "" H 8744 6800 50  0001 C CNN
	1    8744 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C23
U 1 1 5ED64B66
P 8744 6500
F 0 "C23" H 8769 6600 50  0000 L CNN
F 1 "100nF" H 8769 6400 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8782 6350 50  0001 C CNN
F 3 "" H 8744 6500 50  0001 C CNN
	1    8744 6500
	-1   0    0    1   
$EndComp
Wire Wire Line
	8850 6000 8950 6000
Wire Wire Line
	8950 5900 8850 5900
$Comp
L power:GNDREF #PWR0132
U 1 1 5ED415C0
P 8850 6062
F 0 "#PWR0132" H 8850 5812 50  0001 C CNN
F 1 "GNDREF" V 8855 5934 50  0000 R CNN
F 2 "" H 8850 6062 50  0001 C CNN
F 3 "" H 8850 6062 50  0001 C CNN
	1    8850 6062
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0121
U 1 1 5ED2F594
P 9800 5700
F 0 "#PWR0121" H 9800 5450 50  0001 C CNN
F 1 "GNDREF" V 9805 5527 50  0000 R CNN
F 2 "" H 9800 5700 50  0001 C CNN
F 3 "" H 9800 5700 50  0001 C CNN
	1    9800 5700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9800 5700 9750 5700
Wire Wire Line
	7050 5700 7050 5050
Wire Wire Line
	7350 5600 7350 5500
Connection ~ 7750 5600
Wire Wire Line
	7750 5500 7750 5600
Wire Wire Line
	7350 5600 7750 5600
$Comp
L Device:C C15
U 1 1 5ED1B751
P 8100 5350
F 0 "C15" H 8125 5450 50  0000 L CNN
F 1 "2.2µF" H 8125 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8138 5200 50  0001 C CNN
F 3 "" H 8100 5350 50  0001 C CNN
	1    8100 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 5050 8100 5200
$Comp
L Device:C C14
U 1 1 5ECF2842
P 7750 5350
F 0 "C14" H 7775 5450 50  0000 L CNN
F 1 "10µF" H 7775 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 7788 5200 50  0001 C CNN
F 3 "" H 7750 5350 50  0001 C CNN
	1    7750 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 5050 7750 5200
$Comp
L librairie_projet:LTC2305 U5
U 1 1 5EBEB456
P 9350 5750
F 0 "U5" H 9350 6217 50  0000 C CNN
F 1 "LTC2305" H 9350 6126 50  0000 C CNN
F 2 "Package_SO:MSOP-8_3x3mm_P0.65mm" H 8400 5400 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/MAX31826.pdf" H 9150 5600 50  0001 C CNN
	1    9350 5750
	-1   0    0    1   
$EndComp
Wire Wire Line
	7350 5200 7350 5050
$Comp
L Device:C C13
U 1 1 5ECF2838
P 7350 5350
F 0 "C13" H 7375 5450 50  0000 L CNN
F 1 "100nF" H 7375 5250 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 7388 5200 50  0001 C CNN
F 3 "" H 7350 5350 50  0001 C CNN
	1    7350 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	10250 2800 9950 2800
Connection ~ 9950 2800
$Comp
L Device:C C8
U 1 1 5EAEBEF7
P 9150 1750
F 0 "C8" H 9175 1850 50  0000 L CNN
F 1 "47n" H 9175 1650 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 9188 1600 50  0001 C CNN
F 3 "" H 9150 1750 50  0001 C CNN
	1    9150 1750
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5EC33B75
P 9600 3200
F 0 "R1" V 9600 3150 50  0000 L CNN
F 1 "625" V 9700 3100 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9530 3200 50  0001 C CNN
F 3 "~" H 9600 3200 50  0001 C CNN
	1    9600 3200
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5EC90FB8
P 9200 3050
F 0 "R5" V 9200 3000 50  0000 L CNN
F 1 "625" V 9270 3005 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9130 3050 50  0001 C CNN
F 3 "~" H 9200 3050 50  0001 C CNN
	1    9200 3050
	0    1    1    0   
$EndComp
$Comp
L Device:C C19
U 1 1 5ED297B2
P 10250 2650
F 0 "C19" H 10275 2750 50  0000 L CNN
F 1 "10µF" H 10275 2550 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 10288 2500 50  0001 C CNN
F 3 "" H 10250 2650 50  0001 C CNN
	1    10250 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C20
U 1 1 5ED297B8
P 9950 2650
F 0 "C20" H 9975 2750 50  0000 L CNN
F 1 "100nF" H 9975 2550 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 9988 2500 50  0001 C CNN
F 3 "" H 9950 2650 50  0001 C CNN
	1    9950 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 2350 9950 2500
Wire Wire Line
	10250 2350 10250 2500
Wire Wire Line
	9200 1050 8950 1050
$Comp
L power:GNDREF #PWR0125
U 1 1 5ED297C4
P 10250 2350
F 0 "#PWR0125" H 10250 2100 50  0001 C CNN
F 1 "GNDREF" H 10255 2177 50  0000 C CNN
F 2 "" H 10250 2350 50  0001 C CNN
F 3 "" H 10250 2350 50  0001 C CNN
	1    10250 2350
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR0124
U 1 1 5ED297BE
P 9950 2350
F 0 "#PWR0124" H 9950 2100 50  0001 C CNN
F 1 "GNDREF" H 9955 2177 50  0000 C CNN
F 2 "" H 9950 2350 50  0001 C CNN
F 3 "" H 9950 2350 50  0001 C CNN
	1    9950 2350
	-1   0    0    1   
$EndComp
Wire Wire Line
	9600 2800 9950 2800
Wire Wire Line
	9600 2650 9600 2800
Connection ~ 9400 1750
Wire Wire Line
	9400 1750 9400 2050
Wire Wire Line
	9000 1750 8950 1750
$Comp
L power:GNDREF #PWR0111
U 1 1 5ECE04D2
P 8950 1750
F 0 "#PWR0111" H 8950 1500 50  0001 C CNN
F 1 "GNDREF" H 8955 1577 50  0000 C CNN
F 2 "" H 8950 1750 50  0001 C CNN
F 3 "" H 8950 1750 50  0001 C CNN
	1    8950 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	9400 1750 9300 1750
Wire Wire Line
	9400 1600 9400 1750
Wire Wire Line
	9400 1250 9400 1300
Wire Wire Line
	9500 2050 9500 1900
$Comp
L power:GNDREF #PWR0114
U 1 1 5ECDE620
P 9500 1900
F 0 "#PWR0114" H 9500 1650 50  0001 C CNN
F 1 "GNDREF" V 9505 1772 50  0000 R CNN
F 2 "" H 9500 1900 50  0001 C CNN
F 3 "" H 9500 1900 50  0001 C CNN
	1    9500 1900
	-1   0    0    1   
$EndComp
$Comp
L librairie_projet:BAT54XV2 D3
U 1 1 5EAD20A2
P 9400 1450
F 0 "D3" H 9400 1667 50  0000 C CNN
F 1 "BAT54XV2" H 9400 1576 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 9400 1275 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30396.pdf" H 9400 1450 50  0001 C CNN
	1    9400 1450
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0109
U 1 1 5EAA45E2
P 8950 1050
F 0 "#PWR0109" H 8950 800 50  0001 C CNN
F 1 "GNDREF" H 8955 877 50  0000 C CNN
F 2 "" H 8950 1050 50  0001 C CNN
F 3 "" H 8950 1050 50  0001 C CNN
	1    8950 1050
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_Coaxial J2
U 1 1 5EA8D686
P 9400 1050
F 0 "J2" H 9500 932 50  0000 L CNN
F 1 "Conn_Coaxial" H 9150 1200 50  0000 L CNN
F 2 "Connector_Coaxial:SMA_Amphenol_132203-12_Horizontal" H 9400 1050 50  0001 C CNN
F 3 " ~" H 9400 1050 50  0001 C CNN
	1    9400 1050
	0    1    -1   0   
$EndComp
$Comp
L librairie_projet:LT1818 U3
U 1 1 5EBDDABC
P 9500 2050
F 0 "U3" H 9800 2392 50  0000 C CNN
F 1 "LT1818" H 9800 2301 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-5" H 9800 2375 50  0001 C CIN
F 3 "http://www.st.com/internet/com/TECHNICAL_RESOURCES/TECHNICAL_LITERATURE/DATASHEET/CD00003395.pdf" H 9800 2100 50  0001 C CNN
	1    9500 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	9350 3050 9400 3050
Connection ~ 9400 3050
Wire Wire Line
	9400 3050 9400 3200
Wire Wire Line
	9400 2650 9400 3050
Wire Wire Line
	9750 3200 9950 3200
$Comp
L power:GNDREF #PWR0101
U 1 1 5EC348CB
P 9950 3200
F 0 "#PWR0101" H 9950 2950 50  0001 C CNN
F 1 "GNDREF" H 9955 3027 50  0000 C CNN
F 2 "" H 9950 3200 50  0001 C CNN
F 3 "" H 9950 3200 50  0001 C CNN
	1    9950 3200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9450 3200 9400 3200
$Comp
L Connector:Conn_01x08_Male J3
U 1 1 5F1F0796
P 3200 4750
F 0 "J3" H 3172 4632 50  0000 R CNN
F 1 "Conn_01x08_Male" H 3172 4723 50  0000 R CNN
F 2 "Connector_PinHeader_2.00mm:PinHeader_1x08_P2.00mm_Vertical" H 3200 4750 50  0001 C CNN
F 3 "~" H 3200 4750 50  0001 C CNN
	1    3200 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 5150 3400 6400
Connection ~ 3400 6400
Wire Wire Line
	3400 5050 3950 5050
Wire Wire Line
	3950 5050 3950 6200
Wire Wire Line
	3400 4950 4050 4950
Wire Wire Line
	3400 4850 4150 4850
Wire Wire Line
	3400 4750 4250 4750
Wire Wire Line
	3400 4650 5600 4650
Wire Wire Line
	5600 5900 5600 4650
Wire Wire Line
	3400 4550 5700 4550
Wire Wire Line
	5700 6000 5700 4550
Wire Wire Line
	3400 4450 3550 4450
Wire Wire Line
	3550 4450 3550 4200
$Comp
L power:GNDREF #PWR0137
U 1 1 5F282A68
P 5550 6400
F 0 "#PWR0137" H 5550 6150 50  0001 C CNN
F 1 "GNDREF" V 5555 6272 50  0000 R CNN
F 2 "" H 5550 6400 50  0001 C CNN
F 3 "" H 5550 6400 50  0001 C CNN
	1    5550 6400
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0138
U 1 1 5F284546
P 5550 6300
F 0 "#PWR0138" H 5550 6050 50  0001 C CNN
F 1 "GNDREF" V 5555 6172 50  0000 R CNN
F 2 "" H 5550 6300 50  0001 C CNN
F 3 "" H 5550 6300 50  0001 C CNN
	1    5550 6300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10250 2800 10400 2800
Connection ~ 10250 2800
Wire Wire Line
	8600 2300 9600 2300
Wire Wire Line
	9600 2300 9600 2050
Wire Wire Line
	3700 8500 3700 6400
Wire Wire Line
	3700 6400 3950 6400
Connection ~ 3700 6400
Wire Wire Line
	8600 2300 8600 3050
Connection ~ 2250 6400
Wire Wire Line
	8750 9150 9150 9150
Connection ~ 9150 9150
Wire Wire Line
	9150 9450 9150 9600
Wire Wire Line
	8750 9600 8750 9450
$Comp
L power:GNDREF #PWR0127
U 1 1 5ED3F834
P 8750 9600
F 0 "#PWR0127" H 8750 9350 50  0001 C CNN
F 1 "GNDREF" V 8755 9427 50  0000 R CNN
F 2 "" H 8750 9600 50  0001 C CNN
F 3 "" H 8750 9600 50  0001 C CNN
	1    8750 9600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0126
U 1 1 5ED3F82E
P 9150 9600
F 0 "#PWR0126" H 9150 9350 50  0001 C CNN
F 1 "GNDREF" V 9155 9427 50  0000 R CNN
F 2 "" H 9150 9600 50  0001 C CNN
F 3 "" H 9150 9600 50  0001 C CNN
	1    9150 9600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C21
U 1 1 5ED3F828
P 8750 9300
F 0 "C21" H 8775 9400 50  0000 L CNN
F 1 "10µF" H 8775 9200 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8788 9150 50  0001 C CNN
F 3 "" H 8750 9300 50  0001 C CNN
	1    8750 9300
	-1   0    0    1   
$EndComp
$Comp
L Device:C C22
U 1 1 5ED3F822
P 9150 9300
F 0 "C22" H 9175 9400 50  0000 L CNN
F 1 "100nF" H 9175 9200 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 9188 9150 50  0001 C CNN
F 3 "" H 9150 9300 50  0001 C CNN
	1    9150 9300
	-1   0    0    1   
$EndComp
Wire Wire Line
	9500 9150 9150 9150
Wire Wire Line
	9500 9200 9500 9150
Wire Wire Line
	9600 10000 9600 9890
$Comp
L power:GNDREF #PWR0113
U 1 1 5ECBD33E
P 9600 10000
F 0 "#PWR0113" H 9600 9750 50  0001 C CNN
F 1 "GNDREF" V 9605 9872 50  0000 R CNN
F 2 "" H 9600 10000 50  0001 C CNN
F 3 "" H 9600 10000 50  0001 C CNN
	1    9600 10000
	1    0    0    -1  
$EndComp
$Comp
L librairie_projet:LT1818 U6
U 1 1 5EBDCDD4
P 9600 9800
F 0 "U6" H 9900 10142 50  0000 C CNN
F 1 "LT1818" H 9900 10051 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-5" H 9900 10125 50  0001 C CIN
F 3 "http://www.st.com/internet/com/TECHNICAL_RESOURCES/TECHNICAL_LITERATURE/DATASHEET/CD00003395.pdf" H 9900 9850 50  0001 C CNN
	1    9600 9800
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_Coaxial J5
U 1 1 5EA8C71B
P 6299 9732
F 0 "J5" H 6399 9614 50  0000 L CNN
F 1 "Conn_Coaxial" H 5999 9882 50  0000 L CNN
F 2 "Connector_Coaxial:SMA_Amphenol_132203-12_Horizontal" H 6299 9732 50  0001 C CNN
F 3 " ~" H 6299 9732 50  0001 C CNN
	1    6299 9732
	-1   0    0    -1  
$EndComp
Text Notes 9600 11160 0    60   ~ 0
REF\n
Wire Wire Line
	8750 9150 8700 9150
Connection ~ 8750 9150
Wire Wire Line
	9500 9500 10550 9500
Wire Wire Line
	10550 9150 10550 9500
Wire Wire Line
	9500 9500 9500 9800
$Comp
L Device:R R2
U 1 1 5EC4CAE6
P 11500 8350
F 0 "R2" V 11500 8350 50  0000 C CNN
F 1 "50" V 11384 8350 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 11430 8350 50  0001 C CNN
F 3 "~" H 11500 8350 50  0001 C CNN
	1    11500 8350
	0    -1   1    0   
$EndComp
$Comp
L Device:C C10
U 1 1 5EC4E9B5
P 11300 8500
F 0 "C10" H 11325 8600 50  0000 L CNN
F 1 "2nF" H 11325 8400 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 11338 8350 50  0001 C CNN
F 3 "" H 11300 8500 50  0001 C CNN
	1    11300 8500
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0104
U 1 1 5EC56397
P 11300 8750
F 0 "#PWR0104" H 11300 8500 50  0001 C CNN
F 1 "GNDREF" H 11305 8577 50  0000 C CNN
F 2 "" H 11300 8750 50  0001 C CNN
F 3 "" H 11300 8750 50  0001 C CNN
	1    11300 8750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	11300 8750 11300 8650
Wire Wire Line
	11350 8350 11300 8350
Wire Wire Line
	10950 8350 11300 8350
Connection ~ 10550 9150
Connection ~ 11300 8350
Wire Wire Line
	11100 2050 9600 2050
Connection ~ 9600 2050
Wire Wire Line
	9400 5800 9750 5800
$Comp
L Device:R_Small R8
U 1 1 5F3A76F9
P 6500 8050
F 0 "R8" H 6559 8096 50  0000 L CNN
F 1 "R_Small" H 6559 8005 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" H 6500 8050 50  0001 C CNN
F 3 "~" H 6500 8050 50  0001 C CNN
	1    6500 8050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R7
U 1 1 5F3A7C96
P 5950 8250
F 0 "R7" H 6009 8296 50  0000 L CNN
F 1 "R_Small" H 6009 8205 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" H 5950 8250 50  0001 C CNN
F 3 "~" H 5950 8250 50  0001 C CNN
	1    5950 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 6200 6500 4350
Wire Wire Line
	6500 8150 6500 8500
Wire Wire Line
	10900 4500 11100 4500
Wire Wire Line
	11100 4500 11100 2050
Wire Wire Line
	10600 4500 9750 4500
Wire Wire Line
	9750 4500 9750 4900
Wire Wire Line
	10350 4900 10250 4900
Wire Wire Line
	9950 4900 9750 4900
Connection ~ 9750 4900
Wire Wire Line
	9750 4900 9750 5500
Wire Wire Line
	7050 5700 8950 5700
Wire Wire Line
	7750 5600 8950 5600
Wire Wire Line
	8100 5500 8950 5500
Wire Wire Line
	8700 8500 8700 9150
$Comp
L power:GNDREF #PWR0146
U 1 1 5EF10044
P 9500 10000
F 0 "#PWR0146" H 9500 9750 50  0001 C CNN
F 1 "GNDREF" V 9500 9700 50  0000 C CNN
F 2 "" H 9500 10000 50  0001 C CNN
F 3 "" H 9500 10000 50  0001 C CNN
	1    9500 10000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 10000 9500 9800
Connection ~ 9500 9800
Wire Wire Line
	5050 6100 5400 6100
$Comp
L TOSMETRE-rescue:18F1320-16F88 U1
U 1 1 5CF66128
P 4900 6400
F 0 "U1" V 4946 5770 50  0000 R CNN
F 1 "18F1320" V 4855 5770 50  0000 R CNN
F 2 "Package_SO:SSOP-20_4.4x6.5mm_P0.65mm" H 3450 6100 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21919e.pdf" H 4700 5800 50  0001 C CNN
	1    4900 6400
	-1   0    0    1   
$EndComp
Wire Wire Line
	5400 6200 6500 6200
Connection ~ 6500 8500
Wire Wire Line
	5950 8500 6500 8500
Wire Wire Line
	5400 6400 5550 6400
Wire Wire Line
	5550 6300 5400 6300
Wire Wire Line
	6500 8500 7050 8500
Connection ~ 7050 8500
Wire Wire Line
	7050 5800 7050 8500
Connection ~ 5950 8500
Wire Wire Line
	5050 8050 5950 8050
Connection ~ 5950 8050
Wire Wire Line
	5950 8050 6750 8050
Wire Wire Line
	5400 6700 5450 6700
Wire Wire Line
	5400 6600 5500 6600
Wire Wire Line
	5500 6600 5500 7000
$Comp
L power:GNDREF #PWR0149
U 1 1 5F2AF3C5
P 6250 7000
F 0 "#PWR0149" H 6250 6750 50  0001 C CNN
F 1 "GNDREF" V 6350 7050 50  0000 R CNN
F 2 "" H 6250 7000 50  0001 C CNN
F 3 "" H 6250 7000 50  0001 C CNN
	1    6250 7000
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0150
U 1 1 5F2B062F
P 6250 7450
F 0 "#PWR0150" H 6250 7200 50  0001 C CNN
F 1 "GNDREF" V 6350 7500 50  0000 R CNN
F 2 "" H 6250 7450 50  0001 C CNN
F 3 "" H 6250 7450 50  0001 C CNN
	1    6250 7450
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0151
U 1 1 5F2B0FD4
P 6250 7900
F 0 "#PWR0151" H 6250 7650 50  0001 C CNN
F 1 "GNDREF" V 6350 7950 50  0000 R CNN
F 2 "" H 6250 7900 50  0001 C CNN
F 3 "" H 6250 7900 50  0001 C CNN
	1    6250 7900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9750 5600 13600 5600
Wire Wire Line
	11650 8350 13600 8350
Wire Wire Line
	13600 5600 13600 8350
Text Notes 9250 710  0    60   ~ 0
FWD\n
$Comp
L Switch:SW_Push_Dual_x2 SW1
U 1 1 602CE788
P 5850 7000
F 0 "SW1" H 5850 7285 50  0000 C CNN
F 1 "SW_Push" H 5850 7194 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T-SH_NO_CK_KMR2xxG" H 5850 7200 50  0001 C CNN
F 3 "~" H 5850 7200 50  0001 C CNN
	1    5850 7000
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual_x2 SW2
U 1 1 602F02F4
P 5850 7450
F 0 "SW2" H 5850 7735 50  0000 C CNN
F 1 "SW_Push_Dual_x2" H 5850 7644 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T-SH_NO_CK_KMR2xxG" H 5850 7650 50  0001 C CNN
F 3 "~" H 5850 7650 50  0001 C CNN
	1    5850 7450
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_Push_Dual_x2 SW2
U 2 1 602F1015
P 5850 7900
F 0 "SW2" H 5850 8185 50  0000 C CNN
F 1 "SW_Push_Dual_x2" H 5850 8094 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_Push_1P1T-SH_NO_CK_KMR2xxG" H 5850 8100 50  0001 C CNN
F 3 "~" H 5850 8100 50  0001 C CNN
	2    5850 7900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 7000 5650 7000
Wire Wire Line
	5450 7450 5650 7450
Wire Wire Line
	5400 7900 5650 7900
Wire Wire Line
	6050 7900 6250 7900
Wire Wire Line
	6050 7450 6250 7450
Wire Wire Line
	6050 7000 6250 7000
Wire Wire Line
	5950 8150 5950 8050
Wire Wire Line
	5950 8350 5950 8500
Wire Wire Line
	5050 6100 5050 8050
Wire Wire Line
	6500 6200 6500 7950
Connection ~ 6500 6200
Wire Wire Line
	5400 6800 5400 7900
Wire Wire Line
	5450 6700 5450 7450
Wire Wire Line
	8344 6350 8344 5800
Wire Wire Line
	8744 6350 8744 5800
Wire Wire Line
	10950 8350 10950 9150
Wire Wire Line
	10300 9150 10550 9150
Wire Wire Line
	10000 9150 9700 9150
Wire Wire Line
	10550 9150 10950 9150
Connection ~ 9700 9150
Wire Wire Line
	9700 9150 9700 9200
$Comp
L Device:R R6
U 1 1 5ECBB13D
P 10150 9150
F 0 "R6" V 10150 9200 50  0000 R CNN
F 1 "625" V 10034 9150 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 10080 9150 50  0001 C CNN
F 3 "~" H 10150 9150 50  0001 C CNN
	1    10150 9150
	0    -1   -1   0   
$EndComp
Text Notes 9920 9090 0    60   ~ 0
résistance\ntest AOP1\n
Text Notes 8930 2990 0    60   ~ 0
résistance\ntest AOP1\n
Wire Wire Line
	9750 6000 9800 6000
$Comp
L TOSMETRE-rescue:TPS7A0522PDBV-Regulator_Linear U9
U 1 1 6031691C
P 4140 10350
F 0 "U9" H 4140 10717 50  0000 C CNN
F 1 "TPS70950DBVT" H 4140 10626 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 4140 10700 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/tps7a05.pdf" H 4140 10850 50  0001 C CNN
	1    4140 10350
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0120
U 1 1 60318E9E
P 4140 10850
F 0 "#PWR0120" H 4140 10600 50  0001 C CNN
F 1 "GNDREF" H 4145 10677 50  0000 C CNN
F 2 "" H 4140 10850 50  0001 C CNN
F 3 "" H 4140 10850 50  0001 C CNN
	1    4140 10850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4140 10650 4140 10750
Wire Wire Line
	3585 10250 3585 10450
$Comp
L Device:C C4
U 1 1 60384A34
P 3585 10600
F 0 "C4" H 3610 10700 50  0000 L CNN
F 1 "1µF" H 3610 10500 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3623 10450 50  0001 C CNN
F 3 "" H 3585 10600 50  0001 C CNN
	1    3585 10600
	-1   0    0    1   
$EndComp
Wire Wire Line
	3585 10750 4140 10750
Connection ~ 4140 10750
Wire Wire Line
	4140 10750 4140 10850
$Comp
L Device:C C9
U 1 1 604359F6
P 4970 10400
F 0 "C9" H 4995 10500 50  0000 L CNN
F 1 "1µF" H 4995 10300 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5008 10250 50  0001 C CNN
F 3 "" H 4970 10400 50  0001 C CNN
	1    4970 10400
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 606A489C
P 2720 9430
F 0 "J6" V 2738 9260 50  0000 C CNN
F 1 "Alim Piles" V 2634 9394 50  0000 C CNN
F 2 "Connector_JST:JST_EH_B2B-EH-A_1x02_P2.50mm_Vertical" H 2720 9430 50  0001 C CNN
F 3 "~" H 2720 9430 50  0001 C CNN
	1    2720 9430
	0    1    1    0   
$EndComp
Connection ~ 4970 10250
Wire Wire Line
	4970 10250 5740 10250
Wire Wire Line
	4440 10250 4970 10250
$Comp
L power:GNDREF #PWR0152
U 1 1 608AE8E8
P 4970 10800
F 0 "#PWR0152" H 4970 10550 50  0001 C CNN
F 1 "GNDREF" H 4975 10627 50  0000 C CNN
F 2 "" H 4970 10800 50  0001 C CNN
F 3 "" H 4970 10800 50  0001 C CNN
	1    4970 10800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4970 10550 4970 10800
Wire Wire Line
	3700 8500 5740 8500
Wire Wire Line
	5740 8500 5740 10250
Connection ~ 5740 8500
Wire Wire Line
	5740 8500 5950 8500
$Comp
L Switch:SW_DIP_x01 SW3
U 1 1 60336004
P 3020 9900
F 0 "SW3" H 3020 10167 50  0000 C CNN
F 1 "SW_DIP_x01" H 3020 10076 50  0000 C CNN
F 2 "" H 3020 9900 50  0001 C CNN
F 3 "~" H 3020 9900 50  0001 C CNN
	1    3020 9900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2720 9900 2720 9630
Wire Wire Line
	3510 10150 3510 9900
Wire Wire Line
	3510 9900 3320 9900
Wire Wire Line
	3585 10250 3840 10250
Connection ~ 3585 10250
$Comp
L Connector:Barrel_Jack_Switch J4
U 1 1 602FEAA9
P 1480 10150
F 0 "J4" H 1537 10467 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 1537 10376 50  0000 C CNN
F 2 "" H 1530 10110 50  0001 C CNN
F 3 "~" H 1530 10110 50  0001 C CNN
	1    1480 10150
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0153
U 1 1 604607FE
P 1936 9958
F 0 "#PWR0153" H 1936 9708 50  0001 C CNN
F 1 "GNDREF" H 1941 9785 50  0000 C CNN
F 2 "" H 1936 9958 50  0001 C CNN
F 3 "" H 1936 9958 50  0001 C CNN
	1    1936 9958
	-1   0    0    1   
$EndComp
Wire Wire Line
	1780 10250 2072 10250
Wire Wire Line
	1780 10050 1936 10050
Wire Wire Line
	1936 9958 1936 10050
Wire Wire Line
	1780 10150 3510 10150
$Comp
L Device:D D4
U 1 1 60512A4C
P 2222 10250
F 0 "D4" H 2234 10350 50  0000 C BNN
F 1 "D" H 2310 10272 50  0000 C BNN
F 2 "" H 2222 10250 50  0001 C CNN
F 3 "~" H 2222 10250 50  0001 C CNN
	1    2222 10250
	-1   0    0    1   
$EndComp
Wire Wire Line
	2372 10250 3585 10250
Wire Wire Line
	2620 9630 2620 10050
Wire Wire Line
	6750 4650 6750 8050
Wire Wire Line
	1936 10050 2620 10050
Connection ~ 1936 10050
Wire Wire Line
	8850 5900 8850 6000
Connection ~ 8850 6000
Wire Wire Line
	8850 6000 8850 6062
Connection ~ 8744 5800
Wire Wire Line
	8744 5800 8950 5800
Wire Wire Line
	7050 5800 8744 5800
$Comp
L Device:C C25
U 1 1 5ED3354B
P 3950 6956
F 0 "C25" H 3975 7056 50  0000 L CNN
F 1 "10µF" H 3975 6856 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3988 6806 50  0001 C CNN
F 3 "" H 3950 6956 50  0001 C CNN
	1    3950 6956
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR0130
U 1 1 5ED33551
P 4268 7244
F 0 "#PWR0130" H 4268 6994 50  0001 C CNN
F 1 "GNDREF" V 4273 7071 50  0000 R CNN
F 2 "" H 4268 7244 50  0001 C CNN
F 3 "" H 4268 7244 50  0001 C CNN
	1    4268 7244
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0131
U 1 1 5ED33557
P 3950 7256
F 0 "#PWR0131" H 3950 7006 50  0001 C CNN
F 1 "GNDREF" V 3955 7083 50  0000 R CNN
F 2 "" H 3950 7256 50  0001 C CNN
F 3 "" H 3950 7256 50  0001 C CNN
	1    3950 7256
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 7256 3950 7106
Wire Wire Line
	4268 7094 4268 7244
Wire Wire Line
	2250 6400 3400 6400
Wire Wire Line
	3400 6400 3700 6400
Wire Wire Line
	4266 6402 4268 6402
Wire Wire Line
	4268 6402 4268 6400
$Comp
L Device:C C26
U 1 1 5ED33545
P 4268 6944
F 0 "C26" H 4293 7044 50  0000 L CNN
F 1 "100nF" H 4293 6844 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4306 6794 50  0001 C CNN
F 3 "" H 4268 6944 50  0001 C CNN
	1    4268 6944
	-1   0    0    1   
$EndComp
Wire Wire Line
	4268 6794 4268 6400
Wire Wire Line
	3950 6400 4268 6400
Connection ~ 4268 6400
Wire Wire Line
	4268 6400 4400 6400
Wire Wire Line
	3950 6806 3950 6400
Wire Wire Line
	3950 6400 3950 6398
Text Notes 8836 10226 0    60   ~ 0
résistance\ntest AOP1\n
Text Notes 9790 9944 0    60   ~ 0
pont\n\n
$Comp
L Device:R R4
U 1 1 5EC4DB73
P 9426 8902
F 0 "R4" V 9426 8902 50  0000 C CNN
F 1 "625" V 9310 8902 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9356 8902 50  0001 C CNN
F 3 "~" H 9426 8902 50  0001 C CNN
	1    9426 8902
	0    1    1    0   
$EndComp
Wire Wire Line
	10714 11202 11022 11202
Wire Wire Line
	8036 8902 9276 8902
Wire Wire Line
	9600 9890 9700 9890
Wire Wire Line
	9700 9890 9700 9800
Connection ~ 9600 9890
Wire Wire Line
	9600 9890 9600 9800
Wire Notes Line
	9268 8730 10656 8730
Wire Notes Line
	10656 8730 10656 9950
Wire Notes Line
	10656 9950 9272 9950
Wire Notes Line
	9272 9950 9272 8730
Wire Wire Line
	7050 8500 8700 8500
$Comp
L librairie_projet:BAT54XV2 D1
U 1 1 604B8ED6
P 7780 10404
F 0 "D1" H 7780 10621 50  0000 C CNN
F 1 "BAT54XV2" H 7780 10530 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 7780 10229 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30396.pdf" H 7780 10404 50  0001 C CNN
	1    7780 10404
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8036 8904 8036 9732
Wire Notes Line
	5978 9068 8256 9068
Wire Notes Line
	8256 9068 8256 11020
Wire Notes Line
	8256 11020 5974 11020
Wire Notes Line
	5974 11020 5974 9066
Wire Wire Line
	9300 5900 9750 5900
Wire Notes Line
	9428 6344 12240 6344
Wire Notes Line
	12240 6344 12240 8010
Wire Notes Line
	9460 8010 9460 6336
Wire Notes Line
	9460 6336 9476 6336
Wire Notes Line
	9476 6336 9476 6344
Wire Notes Line
	9460 8010 12240 8010
Wire Wire Line
	8600 3050 9050 3050
Wire Notes Line
	9640 3316 9640 4440
Wire Notes Line
	9640 4440 8460 4440
Wire Notes Line
	8460 4440 8460 4448
Wire Notes Line
	8460 4448 8288 4448
Wire Notes Line
	8288 4448 8288 3316
Wire Notes Line
	8288 3316 9640 3316
Wire Wire Line
	9576 8902 9700 8902
Wire Wire Line
	9700 8902 9700 9150
$Comp
L librairie_projet:BAT54XV2 D2
U 1 1 5EAF4ABA
P 6746 9732
F 0 "D2" H 6746 9949 50  0000 C CNN
F 1 "BAT54XV2" H 6746 9858 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 6746 9557 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30396.pdf" H 6746 9732 50  0001 C CNN
	1    6746 9732
	-1   0    0    1   
$EndComp
Wire Wire Line
	8036 9732 7780 9732
Connection ~ 7780 9732
Wire Wire Line
	7732 9732 7780 9732
$Comp
L Device:R R9
U 1 1 6041C216
P 7582 9732
F 0 "R9" V 7582 9782 50  0000 R CNN
F 1 "625" V 7466 9732 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7512 9732 50  0001 C CNN
F 3 "~" H 7582 9732 50  0001 C CNN
	1    7582 9732
	0    1    1    0   
$EndComp
Wire Wire Line
	6896 9732 7432 9732
Wire Wire Line
	6499 9732 6596 9732
$Comp
L power:GNDREF #PWR0128
U 1 1 5ED90549
P 6299 9992
F 0 "#PWR0128" H 6299 9742 50  0001 C CNN
F 1 "GNDREF" H 6304 9819 50  0000 C CNN
F 2 "" H 6299 9992 50  0001 C CNN
F 3 "" H 6299 9992 50  0001 C CNN
	1    6299 9992
	1    0    0    -1  
$EndComp
Wire Wire Line
	6299 9932 6299 9992
Wire Wire Line
	7780 9732 7780 9896
$Comp
L Device:R R10
U 1 1 6040A127
P 7780 10046
F 0 "R10" V 7780 10096 50  0000 R CNN
F 1 "625" V 7664 10046 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7710 10046 50  0001 C CNN
F 3 "~" H 7780 10046 50  0001 C CNN
	1    7780 10046
	1    0    0    -1  
$EndComp
Wire Wire Line
	7780 10254 7780 10196
Wire Wire Line
	7780 10554 7780 10601
$Comp
L power:GNDREF #PWR0123
U 1 1 5ECF7657
P 7780 10601
F 0 "#PWR0123" H 7780 10351 50  0001 C CNN
F 1 "GNDREF" H 7785 10428 50  0000 C CNN
F 2 "" H 7780 10601 50  0001 C CNN
F 3 "" H 7780 10601 50  0001 C CNN
	1    7780 10601
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 4350 9400 4350
Wire Wire Line
	9400 4350 9400 5800
Wire Wire Line
	6750 4650 9300 4650
Wire Wire Line
	9300 4650 9300 5900
Wire Wire Line
	2250 3579 2250 6400
Wire Wire Line
	2250 3579 10400 3579
Wire Wire Line
	10400 2800 10400 3579
$EndSCHEMATC
