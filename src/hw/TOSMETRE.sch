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
$Comp
L power:GNDREF #PWR03
U 1 1 5A3C3EAC
P 12250 5800
F 0 "#PWR03" H 12250 5550 50  0001 C CNN
F 1 "GNDREF" H 12250 5650 50  0000 C CNN
F 2 "" H 12250 5800 50  0001 C CNN
F 3 "" H 12250 5800 50  0001 C CNN
	1    12250 5800
	1    0    0    -1  
$EndComp
Text Notes 7650 3750 2    60   ~ 0
Signal réfléchi
$Comp
L power:GNDREF #PWR010
U 1 1 5B1453B6
P 13200 3200
F 0 "#PWR010" H 13200 2950 50  0001 C CNN
F 1 "GNDREF" V 13200 3050 50  0000 R CNN
F 2 "" H 13200 3200 50  0001 C CNN
F 3 "" H 13200 3200 50  0001 C CNN
	1    13200 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	12350 5750 12250 5750
Wire Wire Line
	12250 5750 12250 5800
Text Notes 14650 1450 1    39   ~ 0
vss
$Comp
L Connector:Conn_01x08_Male J4
U 1 1 5CF65409
P 14300 1500
F 0 "J4" V 14000 1450 50  0000 C CNN
F 1 "LCD 4x20" V 14100 1450 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 14300 1500 50  0001 C CNN
F 3 "~" H 14300 1500 50  0001 C CNN
	1    14300 1500
	0    1    1    0   
$EndComp
Text Notes 14550 1450 1    39   ~ 0
D7
Text Notes 14450 1450 1    39   ~ 0
D6
Text Notes 14350 1450 1    39   ~ 0
D5
Text Notes 14200 1450 1    39   ~ 0
D4
Text Notes 14100 1450 1    39   ~ 0
RS
Text Notes 14000 1450 1    39   ~ 0
E
Text Notes 13900 1450 1    39   ~ 0
VDD
Wire Wire Line
	13350 3200 13200 3200
$Comp
L Connector:Conn_01x04_Male J3
U 1 1 5CFBE9AE
P 13550 3100
F 0 "J3" H 13522 2982 50  0000 R CNN
F 1 "PRG PIC" H 13522 3073 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 13550 3100 50  0001 C CNN
F 3 "~" H 13550 3100 50  0001 C CNN
	1    13550 3100
	-1   0    0    1   
$EndComp
Wire Wire Line
	12250 1700 13900 1700
Connection ~ 12250 1700
Wire Wire Line
	14850 1700 14600 1700
$Comp
L power:GNDREF #PWR02
U 1 1 5A343C5D
P 14850 1700
F 0 "#PWR02" H 14850 1450 50  0001 C CNN
F 1 "GNDREF" V 14773 1486 50  0000 L BNN
F 2 "" H 14850 1700 50  0001 C CNN
F 3 "" H 14850 1700 50  0001 C CNN
	1    14850 1700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	12450 5700 14500 5700
Wire Wire Line
	14500 5700 14500 1700
Wire Wire Line
	11950 2000 11850 2000
Wire Wire Line
	12150 2000 12250 2000
$Comp
L Device:CP_Small C5
U 1 1 5AA53058
P 12050 2000
F 0 "C5" H 12060 2070 50  0000 L CNN
F 1 "CP_Small" H 12060 1920 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 12050 2000 50  0001 C CNN
F 3 "" H 12050 2000 50  0001 C CNN
	1    12050 2000
	0    1    1    0   
$EndComp
$Comp
L power:GNDREF #PWR01
U 1 1 5A343ADA
P 11850 2000
F 0 "#PWR01" H 11850 1750 50  0001 C CNN
F 1 "GNDREF" V 11850 1850 50  0000 R CNN
F 2 "" H 11850 2000 50  0001 C CNN
F 3 "" H 11850 2000 50  0001 C CNN
	1    11850 2000
	0    1    1    0   
$EndComp
Text Notes 6450 1850 0    50   ~ 0
+5V
Connection ~ 12250 2000
$Comp
L Connector:Conn_Coaxial J5
U 1 1 5EA8C71B
P 7650 3850
F 0 "J5" H 7750 3732 50  0000 L CNN
F 1 "Conn_Coaxial" H 7750 3823 50  0000 L CNN
F 2 "Connector_Coaxial:SMA_Amphenol_132203-12_Horizontal" H 7650 3850 50  0001 C CNN
F 3 " ~" H 7650 3850 50  0001 C CNN
	1    7650 3850
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5EAF4AC5
P 8350 4150
F 0 "C7" H 8375 4250 50  0000 L CNN
F 1 "47n" H 8375 4050 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8388 4000 50  0001 C CNN
F 3 "" H 8350 4150 50  0001 C CNN
	1    8350 4150
	-1   0    0    1   
$EndComp
$Comp
L librairie_projet:BAT54XV2 D2
U 1 1 5EAF4ABA
P 8100 3850
F 0 "D2" H 8100 4067 50  0000 C CNN
F 1 "BAT54XV2" H 8100 3976 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 8100 3675 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30396.pdf" H 8100 3850 50  0001 C CNN
	1    8100 3850
	-1   0    0    1   
$EndComp
$Comp
L librairie_projet:LT1818 U3
U 1 1 5EBDDABC
P 2350 3650
F 0 "U3" H 2650 3992 50  0000 C CNN
F 1 "LT1818" H 2650 3901 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-5" H 2650 3975 50  0001 C CIN
F 3 "http://www.st.com/internet/com/TECHNICAL_RESOURCES/TECHNICAL_LITERATURE/DATASHEET/CD00003395.pdf" H 2650 3700 50  0001 C CNN
	1    2350 3650
	1    0    0    -1  
$EndComp
$Comp
L librairie_projet:AD5175 U4
U 1 1 5EBDF7FE
P 4250 3850
F 0 "U4" H 4250 4317 50  0000 C CNN
F 1 "AD5175" H 4250 4226 50  0000 C CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" H 4350 4350 50  0001 C CNN
F 3 "" H 4250 3850 50  0001 C CNN
	1    4250 3850
	1    0    0    -1  
$EndComp
$Comp
L librairie_projet:LT1818 U6
U 1 1 5EBDCDD4
P 8650 3750
F 0 "U6" H 8950 4092 50  0000 C CNN
F 1 "LT1818" H 8950 4001 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-5" H 8950 4075 50  0001 C CIN
F 3 "http://www.st.com/internet/com/TECHNICAL_RESOURCES/TECHNICAL_LITERATURE/DATASHEET/CD00003395.pdf" H 8950 3800 50  0001 C CNN
	1    8650 3750
	1    0    0    -1  
$EndComp
Text Notes 1450 3650 2    60   ~ 0
Signal transmis
$Comp
L Connector:Conn_Coaxial J2
U 1 1 5EA8D686
P 1350 3750
F 0 "J2" H 1450 3632 50  0000 L CNN
F 1 "Conn_Coaxial" H 1450 3723 50  0000 L CNN
F 2 "Connector_Coaxial:SMA_Amphenol_132203-12_Horizontal" H 1350 3750 50  0001 C CNN
F 3 " ~" H 1350 3750 50  0001 C CNN
	1    1350 3750
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0109
U 1 1 5EAA45E2
P 1350 4200
F 0 "#PWR0109" H 1350 3950 50  0001 C CNN
F 1 "GNDREF" H 1355 4027 50  0000 C CNN
F 2 "" H 1350 4200 50  0001 C CNN
F 3 "" H 1350 4200 50  0001 C CNN
	1    1350 4200
	1    0    0    -1  
$EndComp
$Comp
L librairie_projet:BAT54XV2 D3
U 1 1 5EAD20A2
P 1750 3750
F 0 "D3" H 1750 3967 50  0000 C CNN
F 1 "BAT54XV2" H 1750 3876 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 1750 3575 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30396.pdf" H 1750 3750 50  0001 C CNN
	1    1750 3750
	-1   0    0    1   
$EndComp
$Comp
L Device:C C8
U 1 1 5EAEBEF7
P 2050 4000
F 0 "C8" H 2075 4100 50  0000 L CNN
F 1 "47n" H 2075 3900 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2088 3850 50  0001 C CNN
F 3 "" H 2050 4000 50  0001 C CNN
	1    2050 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0101
U 1 1 5EC348CB
P 3350 3250
F 0 "#PWR0101" H 3350 3000 50  0001 C CNN
F 1 "GNDREF" H 3355 3077 50  0000 C CNN
F 2 "" H 3350 3250 50  0001 C CNN
F 3 "" H 3350 3250 50  0001 C CNN
	1    3350 3250
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR0102
U 1 1 5EC35FE3
P 9350 4300
F 0 "#PWR0102" H 9350 4050 50  0001 C CNN
F 1 "GNDREF" H 9355 4127 50  0000 C CNN
F 2 "" H 9350 4300 50  0001 C CNN
F 3 "" H 9350 4300 50  0001 C CNN
	1    9350 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5EC4CAE6
P 4300 4700
F 0 "R2" V 4093 4700 50  0000 C CNN
F 1 "50" V 4184 4700 50  0000 C CNN
F 2 "" V 4230 4700 50  0001 C CNN
F 3 "~" H 4300 4700 50  0001 C CNN
	1    4300 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 4700 4600 4700
$Comp
L Device:R R4
U 1 1 5EC4DB73
P 9350 4000
F 0 "R4" V 9143 4000 50  0000 C CNN
F 1 "510" V 9234 4000 50  0000 C CNN
F 2 "" V 9280 4000 50  0001 C CNN
F 3 "~" H 9350 4000 50  0001 C CNN
	1    9350 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5EC4E9B5
P 4600 4850
F 0 "C10" H 4625 4950 50  0000 L CNN
F 1 "2nF" H 4625 4750 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4638 4700 50  0001 C CNN
F 3 "" H 4600 4850 50  0001 C CNN
	1    4600 4850
	1    0    0    -1  
$EndComp
Connection ~ 4600 4700
$Comp
L power:GNDREF #PWR0104
U 1 1 5EC56397
P 4600 5100
F 0 "#PWR0104" H 4600 4850 50  0001 C CNN
F 1 "GNDREF" H 4605 4927 50  0000 C CNN
F 2 "" H 4600 5100 50  0001 C CNN
F 3 "" H 4600 5100 50  0001 C CNN
	1    4600 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 5100 4600 5000
Wire Wire Line
	3850 3650 3650 3650
Wire Wire Line
	3650 3650 3650 2950
Wire Wire Line
	4950 1700 4950 2950
$Comp
L librairie_projet:AD5175 U7
U 1 1 5EB81854
P 10450 3950
F 0 "U7" H 10450 4417 50  0000 C CNN
F 1 "AD5175" H 10450 4326 50  0000 C CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" H 10550 4450 50  0001 C CNN
F 3 "" H 10450 3950 50  0001 C CNN
	1    10450 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 3750 9950 3750
Wire Wire Line
	9250 3850 9350 3850
Wire Wire Line
	9350 4150 9350 4300
Wire Wire Line
	3650 2950 4300 2950
Wire Wire Line
	9950 1700 12250 1700
$Comp
L Device:C C3
U 1 1 5EC4D6FA
P 3850 4300
F 0 "C3" H 3875 4400 50  0000 L CNN
F 1 "1µF" H 3875 4200 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3888 4150 50  0001 C CNN
F 3 "" H 3850 4300 50  0001 C CNN
	1    3850 4300
	-1   0    0    1   
$EndComp
$Comp
L Device:C C18
U 1 1 5EC51F71
P 10050 4400
F 0 "C18" H 10075 4500 50  0000 L CNN
F 1 "1µF" H 10075 4300 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 10088 4250 50  0001 C CNN
F 3 "" H 10050 4400 50  0001 C CNN
	1    10050 4400
	-1   0    0    1   
$EndComp
Wire Wire Line
	10050 4150 10050 4250
Wire Wire Line
	3850 4150 3850 4050
$Comp
L power:GNDREF #PWR0105
U 1 1 5EC597E9
P 10050 4650
F 0 "#PWR0105" H 10050 4400 50  0001 C CNN
F 1 "GNDREF" H 10055 4477 50  0000 C CNN
F 2 "" H 10050 4650 50  0001 C CNN
F 3 "" H 10050 4650 50  0001 C CNN
	1    10050 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0106
U 1 1 5EC5A302
P 3950 4550
F 0 "#PWR0106" H 3950 4300 50  0001 C CNN
F 1 "GNDREF" H 3955 4377 50  0000 C CNN
F 2 "" H 3950 4550 50  0001 C CNN
F 3 "" H 3950 4550 50  0001 C CNN
	1    3950 4550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3850 4450 3850 4550
Wire Wire Line
	3850 4550 3950 4550
Wire Wire Line
	10050 4550 10050 4650
$Comp
L Device:C C11
U 1 1 5EC7D875
P 4700 2800
F 0 "C11" H 4725 2900 50  0000 L CNN
F 1 "10µF" H 4725 2700 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4738 2650 50  0001 C CNN
F 3 "" H 4700 2800 50  0001 C CNN
	1    4700 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5EC80826
P 4300 2800
F 0 "C6" H 4325 2900 50  0000 L CNN
F 1 "100nF" H 4325 2700 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4338 2650 50  0001 C CNN
F 3 "" H 4300 2800 50  0001 C CNN
	1    4300 2800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C17
U 1 1 5EC8384E
P 10100 2900
F 0 "C17" H 10125 3000 50  0000 L CNN
F 1 "100nF" H 10125 2800 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 10138 2750 50  0001 C CNN
F 3 "" H 10100 2900 50  0001 C CNN
	1    10100 2900
	0    1    1    0   
$EndComp
$Comp
L Device:C C16
U 1 1 5EC86622
P 10100 3300
F 0 "C16" H 10125 3400 50  0000 L CNN
F 1 "10µF" H 10125 3200 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 10138 3150 50  0001 C CNN
F 3 "" H 10100 3300 50  0001 C CNN
	1    10100 3300
	0    1    1    0   
$EndComp
Connection ~ 4700 2950
Wire Wire Line
	4700 2950 4950 2950
Connection ~ 4300 2950
Wire Wire Line
	4300 2950 4700 2950
$Comp
L power:GNDREF #PWR0107
U 1 1 5EC97236
P 10400 2900
F 0 "#PWR0107" H 10400 2650 50  0001 C CNN
F 1 "GNDREF" V 10405 2727 50  0000 R CNN
F 2 "" H 10400 2900 50  0001 C CNN
F 3 "" H 10400 2900 50  0001 C CNN
	1    10400 2900
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0108
U 1 1 5EC975AD
P 10400 3300
F 0 "#PWR0108" H 10400 3050 50  0001 C CNN
F 1 "GNDREF" V 10405 3127 50  0000 R CNN
F 2 "" H 10400 3300 50  0001 C CNN
F 3 "" H 10400 3300 50  0001 C CNN
	1    10400 3300
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0110
U 1 1 5EC9F2E9
P 4300 2500
F 0 "#PWR0110" H 4300 2250 50  0001 C CNN
F 1 "GNDREF" H 4305 2327 50  0000 C CNN
F 2 "" H 4300 2500 50  0001 C CNN
F 3 "" H 4300 2500 50  0001 C CNN
	1    4300 2500
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR0112
U 1 1 5EC9F2EF
P 4700 2500
F 0 "#PWR0112" H 4700 2250 50  0001 C CNN
F 1 "GNDREF" H 4705 2327 50  0000 C CNN
F 2 "" H 4700 2500 50  0001 C CNN
F 3 "" H 4700 2500 50  0001 C CNN
	1    4700 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	10400 3300 10250 3300
Wire Wire Line
	10250 2900 10400 2900
Wire Wire Line
	4300 2500 4300 2650
Wire Wire Line
	4700 2500 4700 2650
Wire Wire Line
	4650 3950 4950 3950
Wire Wire Line
	4950 3950 4950 2950
Connection ~ 4950 2950
Wire Wire Line
	10850 4050 11600 4050
Wire Wire Line
	11600 2200 9950 2200
$Comp
L power:GNDREF #PWR0113
U 1 1 5ECBD33E
P 8450 3750
F 0 "#PWR0113" H 8450 3500 50  0001 C CNN
F 1 "GNDREF" V 8455 3622 50  0000 R CNN
F 2 "" H 8450 3750 50  0001 C CNN
F 3 "" H 8450 3750 50  0001 C CNN
	1    8450 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	8450 3750 8650 3750
$Comp
L power:GNDREF #PWR0114
U 1 1 5ECDE620
P 2200 3650
F 0 "#PWR0114" H 2200 3400 50  0001 C CNN
F 1 "GNDREF" V 2205 3522 50  0000 R CNN
F 2 "" H 2200 3650 50  0001 C CNN
F 3 "" H 2200 3650 50  0001 C CNN
	1    2200 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 3650 2200 3650
$Comp
L power:GNDREF #PWR0115
U 1 1 5ECEA303
P 4750 3300
F 0 "#PWR0115" H 4750 3050 50  0001 C CNN
F 1 "GNDREF" H 4755 3127 50  0000 C CNN
F 2 "" H 4750 3300 50  0001 C CNN
F 3 "" H 4750 3300 50  0001 C CNN
	1    4750 3300
	-1   0    0    1   
$EndComp
Wire Wire Line
	4650 3650 4750 3650
Wire Wire Line
	4750 3650 4750 3300
$Comp
L Device:C C13
U 1 1 5ECF2838
P 5000 9000
F 0 "C13" H 5025 9100 50  0000 L CNN
F 1 "100nF" H 5025 8900 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5038 8850 50  0001 C CNN
F 3 "" H 5000 9000 50  0001 C CNN
	1    5000 9000
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0116
U 1 1 5ECF284C
P 4700 9000
F 0 "#PWR0116" H 4700 8750 50  0001 C CNN
F 1 "GNDREF" H 4705 8827 50  0000 C CNN
F 2 "" H 4700 9000 50  0001 C CNN
F 3 "" H 4700 9000 50  0001 C CNN
	1    4700 9000
	0    1    1    0   
$EndComp
$Comp
L power:GNDREF #PWR0117
U 1 1 5ECF2856
P 4700 8600
F 0 "#PWR0117" H 4700 8350 50  0001 C CNN
F 1 "GNDREF" H 4705 8427 50  0000 C CNN
F 2 "" H 4700 8600 50  0001 C CNN
F 3 "" H 4700 8600 50  0001 C CNN
	1    4700 8600
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 9000 4700 9000
$Comp
L librairie_projet:LTC2305 U5
U 1 1 5EBEB456
P 5400 7450
F 0 "U5" H 5400 7917 50  0000 C CNN
F 1 "LTC2305" H 5400 7826 50  0000 C CNN
F 2 "Package_SO:MSOP-8_3x3mm_P0.65mm" H 4450 7100 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/MAX31826.pdf" H 5200 7300 50  0001 C CNN
	1    5400 7450
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 8600 4850 8600
$Comp
L Device:C C14
U 1 1 5ECF2842
P 5000 8600
F 0 "C14" H 5025 8700 50  0000 L CNN
F 1 "10µF" H 5025 8500 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5038 8450 50  0001 C CNN
F 3 "" H 5000 8600 50  0001 C CNN
	1    5000 8600
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0118
U 1 1 5ED1B749
P 4700 8250
F 0 "#PWR0118" H 4700 8000 50  0001 C CNN
F 1 "GNDREF" H 4705 8077 50  0000 C CNN
F 2 "" H 4700 8250 50  0001 C CNN
F 3 "" H 4700 8250 50  0001 C CNN
	1    4700 8250
	0    1    1    0   
$EndComp
Wire Wire Line
	5150 8250 5150 7850
Wire Wire Line
	4700 8250 4850 8250
$Comp
L Device:C C15
U 1 1 5ED1B751
P 5000 8250
F 0 "C15" H 5025 8350 50  0000 L CNN
F 1 "2.2µF" H 5025 8150 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5038 8100 50  0001 C CNN
F 3 "" H 5000 8250 50  0001 C CNN
	1    5000 8250
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C9
U 1 1 5ED2AB54
P 6300 6600
F 0 "C9" H 6325 6700 50  0000 L CNN
F 1 "100nF" H 6325 6500 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6338 6450 50  0001 C CNN
F 3 "" H 6300 6600 50  0001 C CNN
	1    6300 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0119
U 1 1 5ED2AB5A
P 6300 6300
F 0 "#PWR0119" H 6300 6050 50  0001 C CNN
F 1 "GNDREF" H 6305 6127 50  0000 C CNN
F 2 "" H 6300 6300 50  0001 C CNN
F 3 "" H 6300 6300 50  0001 C CNN
	1    6300 6300
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR0120
U 1 1 5ED2AB60
P 6700 6300
F 0 "#PWR0120" H 6700 6050 50  0001 C CNN
F 1 "GNDREF" H 6705 6127 50  0000 C CNN
F 2 "" H 6700 6300 50  0001 C CNN
F 3 "" H 6700 6300 50  0001 C CNN
	1    6700 6300
	-1   0    0    1   
$EndComp
Wire Wire Line
	6300 6450 6300 6300
Wire Wire Line
	5650 6750 6300 6750
Connection ~ 6300 6750
Wire Wire Line
	6300 6750 6700 6750
Wire Wire Line
	6700 6300 6700 6450
$Comp
L Device:C C4
U 1 1 5ED2AB6B
P 6700 6600
F 0 "C4" H 6725 6700 50  0000 L CNN
F 1 "10µF" H 6725 6500 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6738 6450 50  0001 C CNN
F 3 "" H 6700 6600 50  0001 C CNN
	1    6700 6600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0122
U 1 1 5ED35516
P 4700 9300
F 0 "#PWR0122" H 4700 9050 50  0001 C CNN
F 1 "GNDREF" H 4705 9127 50  0000 C CNN
F 2 "" H 4700 9300 50  0001 C CNN
F 3 "" H 4700 9300 50  0001 C CNN
	1    4700 9300
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 9000 5250 8600
Wire Wire Line
	5150 8600 5250 8600
Connection ~ 5250 8600
Wire Wire Line
	5250 8600 5250 7850
Wire Wire Line
	5250 9000 5150 9000
Wire Wire Line
	5350 9300 5350 7850
Wire Wire Line
	5350 9300 4700 9300
Wire Wire Line
	11600 2200 11600 4050
Wire Wire Line
	2350 2100 2350 2250
Wire Wire Line
	1900 2000 1900 2250
Wire Wire Line
	1450 2100 1450 2250
Wire Wire Line
	1050 1800 1050 2250
Wire Wire Line
	900  1800 1050 1800
Wire Wire Line
	900  1700 1050 1700
Wire Wire Line
	1450 1700 1600 1700
Connection ~ 1450 1700
Wire Wire Line
	1350 1700 1450 1700
Wire Wire Line
	2350 1700 2200 1700
Connection ~ 2350 1700
$Comp
L Device:D D1
U 1 1 5A324E39
P 1200 1700
F 0 "D1" H 1200 1800 50  0000 C CNN
F 1 "D" H 1200 1600 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1200 1700 50  0001 C CNN
F 3 "" H 1200 1700 50  0001 C CNN
	1    1200 1700
	-1   0    0    1   
$EndComp
$Comp
L TOSMETRE-rescue:L7805-TOSMETRE-rescue-TOSMETRE-rescue U2
U 1 1 5A33E692
P 1900 1700
F 0 "U2" H 1750 1825 50  0000 C CNN
F 1 "L7805" H 1900 1825 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 1925 1550 50  0001 L CIN
F 3 "" H 1900 1650 50  0001 C CNN
	1    1900 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5A3C3936
P 1450 1950
F 0 "C1" H 1475 2050 50  0000 L CNN
F 1 "C" H 1475 1850 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1488 1800 50  0001 C CNN
F 3 "" H 1450 1950 50  0001 C CNN
	1    1450 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR04
U 1 1 5AA42E24
P 1900 2250
F 0 "#PWR04" H 1900 2000 50  0001 C CNN
F 1 "GNDREF" H 1900 2100 50  0000 C CNN
F 2 "" H 1900 2250 50  0001 C CNN
F 3 "" H 1900 2250 50  0001 C CNN
	1    1900 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR05
U 1 1 5AA44D09
P 1450 2250
F 0 "#PWR05" H 1450 2000 50  0001 C CNN
F 1 "GNDREF" H 1450 2100 50  0000 C CNN
F 2 "" H 1450 2250 50  0001 C CNN
F 3 "" H 1450 2250 50  0001 C CNN
	1    1450 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR07
U 1 1 5AA93D0C
P 1050 2250
F 0 "#PWR07" H 1050 2000 50  0001 C CNN
F 1 "GNDREF" H 1050 2100 50  0000 C CNN
F 2 "" H 1050 2250 50  0001 C CNN
F 3 "" H 1050 2250 50  0001 C CNN
	1    1050 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5AACE979
P 2350 1950
F 0 "C2" H 2375 2050 50  0000 L CNN
F 1 "C" H 2375 1850 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2388 1800 50  0001 C CNN
F 3 "" H 2350 1950 50  0001 C CNN
	1    2350 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR09
U 1 1 5AAD17B7
P 2350 2250
F 0 "#PWR09" H 2350 2000 50  0001 C CNN
F 1 "GNDREF" H 2350 2100 50  0000 C CNN
F 2 "" H 2350 2250 50  0001 C CNN
F 3 "" H 2350 2250 50  0001 C CNN
	1    2350 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1700 1450 1800
Wire Wire Line
	2350 1800 2350 1700
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5CF5834C
P 700 1700
F 0 "J1" H 617 1658 50  0000 C CNN
F 1 "Alim" H 773 1549 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 700 1700 50  0001 C CNN
F 3 "~" H 700 1700 50  0001 C CNN
	1    700  1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3750 1600 3750
Wire Wire Line
	1900 3750 2050 3750
Wire Wire Line
	2050 3750 2050 3850
$Comp
L power:GNDREF #PWR?
U 1 1 5ECE04D2
P 2050 4200
F 0 "#PWR?" H 2050 3950 50  0001 C CNN
F 1 "GNDREF" H 2055 4027 50  0000 C CNN
F 2 "" H 2050 4200 50  0001 C CNN
F 3 "" H 2050 4200 50  0001 C CNN
	1    2050 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 4150 2050 4200
Wire Wire Line
	7850 3850 7950 3850
Wire Wire Line
	8250 3850 8350 3850
Wire Wire Line
	8350 3850 8350 4000
$Comp
L power:GNDREF #PWR?
U 1 1 5ECF7657
P 8350 4350
F 0 "#PWR?" H 8350 4100 50  0001 C CNN
F 1 "GNDREF" H 8355 4177 50  0000 C CNN
F 2 "" H 8350 4350 50  0001 C CNN
F 3 "" H 8350 4350 50  0001 C CNN
	1    8350 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 3850 8650 3850
Wire Wire Line
	2050 3750 2350 3750
Connection ~ 2050 3750
Wire Wire Line
	2950 3750 3350 3750
Wire Wire Line
	2350 1700 3100 1700
Wire Wire Line
	2950 3550 3100 3550
Wire Wire Line
	3100 3550 3100 3100
$Comp
L power:GNDREF #PWR?
U 1 1 5ED297BE
P 2650 3100
F 0 "#PWR?" H 2650 2850 50  0001 C CNN
F 1 "GNDREF" H 2655 2927 50  0000 C CNN
F 2 "" H 2650 3100 50  0001 C CNN
F 3 "" H 2650 3100 50  0001 C CNN
	1    2650 3100
	0    1    1    0   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5ED297C4
P 2650 2700
F 0 "#PWR?" H 2650 2450 50  0001 C CNN
F 1 "GNDREF" H 2655 2527 50  0000 C CNN
F 2 "" H 2650 2700 50  0001 C CNN
F 3 "" H 2650 2700 50  0001 C CNN
	1    2650 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	9250 3650 9750 3650
Wire Wire Line
	9750 3650 9750 3300
Connection ~ 9750 1700
Wire Wire Line
	9750 1700 9950 1700
$Comp
L Device:C C?
U 1 1 5ED3F822
P 9600 3300
F 0 "C?" H 9625 3400 50  0000 L CNN
F 1 "100nF" H 9625 3200 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 9638 3150 50  0001 C CNN
F 3 "" H 9600 3300 50  0001 C CNN
	1    9600 3300
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5ED3F828
P 9600 2900
F 0 "C?" H 9625 3000 50  0000 L CNN
F 1 "10µF" H 9625 2800 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 9638 2750 50  0001 C CNN
F 3 "" H 9600 2900 50  0001 C CNN
	1    9600 2900
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5ED3F82E
P 9300 3300
F 0 "#PWR?" H 9300 3050 50  0001 C CNN
F 1 "GNDREF" V 9305 3127 50  0000 R CNN
F 2 "" H 9300 3300 50  0001 C CNN
F 3 "" H 9300 3300 50  0001 C CNN
	1    9300 3300
	0    1    1    0   
$EndComp
$Comp
L power:GNDREF #PWR?
U 1 1 5ED3F834
P 9300 2900
F 0 "#PWR?" H 9300 2650 50  0001 C CNN
F 1 "GNDREF" V 9305 2727 50  0000 R CNN
F 2 "" H 9300 2900 50  0001 C CNN
F 3 "" H 9300 2900 50  0001 C CNN
	1    9300 2900
	0    1    1    0   
$EndComp
Wire Wire Line
	9300 2900 9450 2900
Wire Wire Line
	9450 3300 9300 3300
Wire Wire Line
	1350 3950 1350 4200
Wire Wire Line
	8350 4350 8350 4300
Wire Wire Line
	7650 4050 7650 4350
$Comp
L power:GNDREF #PWR?
U 1 1 5ED90549
P 7650 4350
F 0 "#PWR?" H 7650 4100 50  0001 C CNN
F 1 "GNDREF" H 7655 4177 50  0000 C CNN
F 2 "" H 7650 4350 50  0001 C CNN
F 3 "" H 7650 4350 50  0001 C CNN
	1    7650 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 7050 5650 6750
Wire Wire Line
	600  3550 600  4700
Wire Wire Line
	600  3550 2350 3550
Wire Wire Line
	600  4700 3050 4700
Connection ~ 3100 1700
Wire Wire Line
	3100 1700 4950 1700
Wire Wire Line
	3350 3750 3850 3750
Wire Wire Line
	3350 3450 3350 3250
$Comp
L Device:R R1
U 1 1 5EC33B75
P 3350 3600
F 0 "R1" H 3420 3646 50  0000 L CNN
F 1 "510" H 3420 3555 50  0000 L CNN
F 2 "" V 3280 3600 50  0001 C CNN
F 3 "~" H 3350 3600 50  0001 C CNN
	1    3350 3600
	1    0    0    -1  
$EndComp
Connection ~ 3350 3750
Wire Wire Line
	2650 2700 2800 2700
Wire Wire Line
	2650 3100 2800 3100
$Comp
L Device:C C?
U 1 1 5ED297B8
P 2950 3100
F 0 "C?" H 2975 3200 50  0000 L CNN
F 1 "100nF" H 2975 3000 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2988 2950 50  0001 C CNN
F 3 "" H 2950 3100 50  0001 C CNN
	1    2950 3100
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5ED297B2
P 2950 2700
F 0 "C?" H 2975 2800 50  0000 L CNN
F 1 "10µF" H 2975 2600 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2988 2550 50  0001 C CNN
F 3 "" H 2950 2700 50  0001 C CNN
	1    2950 2700
	0    -1   -1   0   
$EndComp
Connection ~ 3100 2700
Wire Wire Line
	3100 2700 3100 1700
Connection ~ 3100 3100
Wire Wire Line
	3100 3100 3100 2700
Wire Wire Line
	5350 6750 5350 7050
Wire Wire Line
	5250 3650 5250 4050
Wire Wire Line
	4850 4450 4950 4450
$Comp
L power:GNDREF #PWR0103
U 1 1 5EC558FE
P 4850 4450
F 0 "#PWR0103" H 4850 4200 50  0001 C CNN
F 1 "GNDREF" H 4855 4277 50  0000 C CNN
F 2 "" H 4850 4450 50  0001 C CNN
F 3 "" H 4850 4450 50  0001 C CNN
	1    4850 4450
	0    1    1    0   
$EndComp
$Comp
L Device:C C12
U 1 1 5EC5241B
P 5100 4450
F 0 "C12" H 5125 4550 50  0000 L CNN
F 1 "2nF" H 5125 4350 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5138 4300 50  0001 C CNN
F 3 "" H 5100 4450 50  0001 C CNN
	1    5100 4450
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5EC330C0
P 5250 4200
F 0 "R3" H 5320 4246 50  0000 L CNN
F 1 "50" H 5320 4155 50  0000 L CNN
F 2 "" V 5180 4200 50  0001 C CNN
F 3 "~" H 5250 4200 50  0001 C CNN
	1    5250 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 4400 5250 4450
Connection ~ 5250 4450
Wire Wire Line
	5250 4450 5250 7050
Wire Wire Line
	5250 4350 5250 4450
Wire Wire Line
	5150 4700 5150 7050
Wire Wire Line
	4600 4700 5150 4700
Wire Wire Line
	9950 1700 9950 2200
Connection ~ 9950 1700
Connection ~ 9950 2200
Connection ~ 8350 3850
Wire Wire Line
	4950 1700 9750 1700
Connection ~ 4950 1700
Wire Wire Line
	5250 3650 6850 3650
Wire Wire Line
	10850 3750 11000 3750
Wire Wire Line
	11000 3750 11000 3600
Wire Wire Line
	11000 3600 9950 3600
Wire Wire Line
	3050 4700 4150 4700
Connection ~ 3050 4700
Connection ~ 9350 3850
Wire Wire Line
	6850 4700 6850 3650
Connection ~ 6850 3650
Wire Wire Line
	6850 3650 8650 3650
$Comp
L power:GNDREF #PWR0121
U 1 1 5ED2F594
P 5350 6750
F 0 "#PWR0121" H 5350 6500 50  0001 C CNN
F 1 "GNDREF" V 5355 6577 50  0000 R CNN
F 2 "" H 5350 6750 50  0001 C CNN
F 3 "" H 5350 6750 50  0001 C CNN
	1    5350 6750
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5EC90FB8
P 3500 3850
F 0 "R?" H 3570 3896 50  0000 L CNN
F 1 " " H 3570 3805 50  0000 L CNN
F 2 "" V 3430 3850 50  0001 C CNN
F 3 "~" H 3500 3850 50  0001 C CNN
	1    3500 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	3850 3850 3650 3850
Wire Wire Line
	3350 3850 3350 3750
Wire Wire Line
	3650 3850 3650 3950
Wire Wire Line
	3650 3950 3050 3950
Connection ~ 3650 3850
Wire Wire Line
	3050 3950 3050 4700
Wire Wire Line
	9850 4150 9850 4700
Connection ~ 9850 4150
Wire Wire Line
	9750 4150 9850 4150
$Comp
L Device:R R?
U 1 1 5ECBB13D
P 9750 4000
F 0 "R?" V 9543 4000 50  0000 C CNN
F 1 " " V 9634 4000 50  0000 C CNN
F 2 "" V 9680 4000 50  0001 C CNN
F 3 "~" H 9750 4000 50  0001 C CNN
	1    9750 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 3950 9850 4150
Connection ~ 9750 3850
Wire Wire Line
	9750 3850 10050 3850
Wire Wire Line
	9350 3850 9750 3850
Wire Wire Line
	6850 4700 9850 4700
Wire Wire Line
	9850 3950 10050 3950
Connection ~ 9750 2900
Connection ~ 9750 3300
Wire Wire Line
	9750 1700 9750 2900
Wire Wire Line
	9750 2900 9750 3300
Connection ~ 9950 3600
Wire Wire Line
	9950 3600 9950 3750
Connection ~ 9950 2900
Connection ~ 9950 3300
Wire Wire Line
	9950 3300 9950 3600
Wire Wire Line
	9950 2200 9950 2900
Wire Wire Line
	9950 2900 9950 3300
Connection ~ 12250 5750
Wire Wire Line
	12250 1700 12250 2000
Wire Wire Line
	12250 2000 12250 3700
NoConn ~ 11950 5150
NoConn ~ 12050 5150
NoConn ~ 12150 5150
Wire Wire Line
	12250 3700 12250 4150
Connection ~ 12250 3700
Wire Wire Line
	12350 3700 12250 3700
Wire Wire Line
	12350 4150 12350 3700
Wire Wire Line
	12450 5700 12450 5150
$Comp
L TOSMETRE-rescue:18F1320-16F88 U1
U 1 1 5CF66128
P 12250 4650
F 0 "U1" V 12296 4020 50  0000 R CNN
F 1 "18F1320" V 12205 4020 50  0000 R CNN
F 2 "Package_SO:SSOP-20_4.4x6.5mm_P0.65mm" H 10800 4350 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21919e.pdf" H 12050 4050 50  0001 C CNN
	1    12250 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	12350 5150 12350 5750
Wire Wire Line
	12250 5150 12250 5750
Wire Wire Line
	14400 5600 12550 5600
Wire Wire Line
	12550 5600 12550 5150
Wire Wire Line
	12650 5150 12650 5500
Wire Wire Line
	12650 5500 14300 5500
Wire Wire Line
	12750 5150 12750 5400
Wire Wire Line
	12750 5400 14200 5400
Wire Wire Line
	14400 1700 14400 5600
Wire Wire Line
	12750 4150 12750 4050
Wire Wire Line
	14000 1700 14000 2350
Wire Wire Line
	14300 1700 14300 5500
Wire Wire Line
	14200 1700 14200 5400
Wire Wire Line
	14100 1700 14100 4050
Wire Wire Line
	12750 4050 14100 4050
Wire Wire Line
	12450 2350 14000 2350
Wire Wire Line
	12450 2350 12450 2900
Wire Wire Line
	12650 3100 13350 3100
Wire Wire Line
	12550 3000 13350 3000
Wire Wire Line
	13350 2900 12450 2900
Connection ~ 12450 2900
Wire Wire Line
	12450 2900 12450 4150
Wire Wire Line
	12650 3100 12650 4150
Wire Wire Line
	12550 3000 12550 4150
$EndSCHEMATC
