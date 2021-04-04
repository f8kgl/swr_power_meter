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
L librairie_projet:18F1320 U2
U 1 1 60439842
P 5450 5930
F 0 "U2" H 5450 5163 50  0000 C CNN
F 1 "18F1320" H 5450 5254 50  0000 C CNN
F 2 "Package_SO:HTSSOP-20-1EP_4.4x6.5mm_P0.65mm_EP2.85x4mm" H 4000 5630 50  0001 L CNN
F 3 "" H 5250 5330 50  0001 C CNN
	1    5450 5930
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x08_Male J3
U 1 1 604422C7
P 2780 4540
F 0 "J3" H 2888 5021 50  0000 C CNN
F 1 "Conn_01x08_Male" H 2888 4930 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical_SMD_Pin1Right" H 2780 4540 50  0001 C CNN
F 3 "~" H 2780 4540 50  0001 C CNN
	1    2780 4540
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J5
U 1 1 60442C11
P 5190 4300
F 0 "J5" V 5252 4012 50  0000 R CNN
F 1 "Conn_01x05_Male" V 5130 4570 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical_SMD_Pin1Left" H 5190 4300 50  0001 C CNN
F 3 "~" H 5190 4300 50  0001 C CNN
	1    5190 4300
	0    -1   1    0   
$EndComp
Wire Wire Line
	4950 5630 3410 5630
Wire Wire Line
	3410 5630 3410 4740
Wire Wire Line
	3410 4740 2980 4740
Wire Wire Line
	4950 5530 3500 5530
Wire Wire Line
	3500 5530 3500 4640
Wire Wire Line
	3500 4640 2980 4640
Wire Wire Line
	4950 5730 3320 5730
Wire Wire Line
	3320 5730 3320 4840
Wire Wire Line
	3320 4840 2980 4840
Wire Wire Line
	4950 5430 3590 5430
Wire Wire Line
	3590 5430 3590 4540
Wire Wire Line
	3590 4540 2980 4540
Wire Wire Line
	4950 5730 5290 5730
Wire Wire Line
	5290 5730 5290 4500
Connection ~ 4950 5730
Wire Wire Line
	4950 5630 5190 5630
Wire Wire Line
	5190 5630 5190 4500
Connection ~ 4950 5630
Wire Wire Line
	5410 4900 5690 4900
Wire Wire Line
	5690 4900 5690 4090
Wire Wire Line
	5690 4090 4810 4090
Wire Wire Line
	4810 4090 4810 4670
Wire Wire Line
	4810 4670 4990 4670
Wire Wire Line
	4990 4670 4990 4500
$Comp
L power:GNDREF #PWR09
U 1 1 6044F285
P 5440 4640
F 0 "#PWR09" H 5440 4390 50  0001 C CNN
F 1 "GNDREF" V 5340 4730 50  0000 R CNN
F 2 "" H 5440 4640 50  0001 C CNN
F 3 "" H 5440 4640 50  0001 C CNN
	1    5440 4640
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5390 4500 5390 4640
Wire Wire Line
	5390 4640 5440 4640
Wire Wire Line
	5950 5430 6250 5430
Wire Wire Line
	3590 4440 2980 4440
$Comp
L power:GNDREF #PWR02
U 1 1 60453BC3
P 3320 3880
F 0 "#PWR02" H 3320 3630 50  0001 C CNN
F 1 "GNDREF" H 3325 3707 50  0000 C CNN
F 2 "" H 3320 3880 50  0001 C CNN
F 3 "" H 3320 3880 50  0001 C CNN
	1    3320 3880
	-1   0    0    1   
$EndComp
Wire Wire Line
	2980 4240 3320 4240
Wire Wire Line
	3320 4240 3320 3880
Wire Wire Line
	4950 5930 5410 5930
Wire Wire Line
	5410 5930 5410 4900
$Comp
L power:GNDREF #PWR011
U 1 1 60456E33
P 6370 5830
F 0 "#PWR011" H 6370 5580 50  0001 C CNN
F 1 "GNDREF" V 6375 5702 50  0000 R CNN
F 2 "" H 6370 5830 50  0001 C CNN
F 3 "" H 6370 5830 50  0001 C CNN
	1    6370 5830
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR012
U 1 1 604588B3
P 6370 5930
F 0 "#PWR012" H 6370 5680 50  0001 C CNN
F 1 "GNDREF" V 6375 5802 50  0000 R CNN
F 2 "" H 6370 5930 50  0001 C CNN
F 3 "" H 6370 5930 50  0001 C CNN
	1    6370 5930
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5950 5830 6370 5830
Wire Wire Line
	5950 5930 6370 5930
Wire Wire Line
	3710 5930 3710 5830
Connection ~ 4950 5930
NoConn ~ 4950 6330
NoConn ~ 4950 6230
NoConn ~ 4950 6130
NoConn ~ 4950 6030
Wire Wire Line
	3230 5930 3230 4940
Wire Wire Line
	3230 4940 2980 4940
Wire Wire Line
	2010 5930 3230 5930
Connection ~ 3230 5930
$Comp
L librairie_projet:LTC2305 U4
U 1 1 604B2F63
P 9540 4450
F 0 "U4" H 9550 4830 50  0000 C CNN
F 1 "LTC2305" H 9540 4960 50  0000 C CNN
F 2 "Package_SO:MSOP-12_3x4mm_P0.65mm" H 8590 4100 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/MAX31826.pdf" H 9340 4300 50  0001 C CNN
	1    9540 4450
	-1   0    0    1   
$EndComp
$Comp
L Device:R R16
U 1 1 604B4270
P 11140 4200
F 0 "R16" V 11140 4210 50  0000 C CNN
F 1 "50" V 11024 4200 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 11070 4200 50  0001 C CNN
F 3 "~" H 11140 4200 50  0001 C CNN
	1    11140 4200
	0    1    1    0   
$EndComp
$Comp
L Device:C C15
U 1 1 604BE284
P 10860 3840
F 0 "C15" H 10880 3930 50  0000 L CNN
F 1 "2nF" H 10890 3740 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 10898 3690 50  0001 C CNN
F 3 "~" H 10860 3840 50  0001 C CNN
	1    10860 3840
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR031
U 1 1 604BFABF
P 10860 3490
F 0 "#PWR031" H 10860 3240 50  0001 C CNN
F 1 "GNDREF" H 10865 3317 50  0000 C CNN
F 2 "" H 10860 3490 50  0001 C CNN
F 3 "" H 10860 3490 50  0001 C CNN
	1    10860 3490
	-1   0    0    1   
$EndComp
Wire Wire Line
	10860 3990 10860 4200
Wire Wire Line
	10860 3690 10860 3490
$Comp
L Device:C C11
U 1 1 604C4912
P 8870 3840
F 0 "C11" H 8890 3940 50  0000 L CNN
F 1 "2.2µF" H 8890 3750 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8908 3690 50  0001 C CNN
F 3 "~" H 8870 3840 50  0001 C CNN
	1    8870 3840
	1    0    0    -1  
$EndComp
Wire Wire Line
	9140 4200 8870 4200
Wire Wire Line
	8870 4200 8870 3990
$Comp
L power:GNDREF #PWR021
U 1 1 604CB0EC
P 8870 3500
F 0 "#PWR021" H 8870 3250 50  0001 C CNN
F 1 "GNDREF" H 8875 3327 50  0000 C CNN
F 2 "" H 8870 3500 50  0001 C CNN
F 3 "" H 8870 3500 50  0001 C CNN
	1    8870 3500
	-1   0    0    1   
$EndComp
Wire Wire Line
	8870 3690 8870 3500
$Comp
L Device:C C9
U 1 1 604D24C8
P 8500 3830
F 0 "C9" H 8520 3920 50  0000 L CNN
F 1 "10µF" H 8520 3740 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8538 3680 50  0001 C CNN
F 3 "~" H 8500 3830 50  0001 C CNN
	1    8500 3830
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 604D2575
P 8180 3830
F 0 "C8" H 8190 3920 50  0000 L CNN
F 1 "100nF" H 8190 3740 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8218 3680 50  0001 C CNN
F 3 "~" H 8180 3830 50  0001 C CNN
	1    8180 3830
	1    0    0    -1  
$EndComp
Wire Wire Line
	9140 4300 8500 4300
Wire Wire Line
	8500 4300 8500 3980
Wire Wire Line
	8500 4300 8180 4300
Wire Wire Line
	8180 4300 8180 3980
Connection ~ 8500 4300
$Comp
L power:GNDREF #PWR018
U 1 1 604D7A0E
P 8500 3500
F 0 "#PWR018" H 8500 3250 50  0001 C CNN
F 1 "GNDREF" H 8505 3327 50  0000 C CNN
F 2 "" H 8500 3500 50  0001 C CNN
F 3 "" H 8500 3500 50  0001 C CNN
	1    8500 3500
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR017
U 1 1 604D7FE2
P 8180 3500
F 0 "#PWR017" H 8180 3250 50  0001 C CNN
F 1 "GNDREF" H 8185 3327 50  0000 C CNN
F 2 "" H 8180 3500 50  0001 C CNN
F 3 "" H 8180 3500 50  0001 C CNN
	1    8180 3500
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR015
U 1 1 604D899C
P 7840 3500
F 0 "#PWR015" H 7840 3250 50  0001 C CNN
F 1 "GNDREF" H 7845 3327 50  0000 C CNN
F 2 "" H 7840 3500 50  0001 C CNN
F 3 "" H 7840 3500 50  0001 C CNN
	1    7840 3500
	-1   0    0    1   
$EndComp
Wire Wire Line
	8500 3500 8500 3680
Wire Wire Line
	8180 3500 8180 3680
Wire Wire Line
	7840 3500 7840 4400
Wire Wire Line
	7840 4400 9140 4400
Wire Wire Line
	9940 4500 9620 4500
Wire Wire Line
	9620 4500 9620 3010
Wire Wire Line
	9620 3010 6850 3010
Wire Wire Line
	6850 3010 6850 5730
Wire Wire Line
	6850 5730 5950 5730
Wire Wire Line
	5950 5530 6360 5530
Wire Wire Line
	3480 4340 2980 4340
$Comp
L Device:C C7
U 1 1 604FB6DE
P 8140 4730
F 0 "C7" H 8030 4640 50  0000 L CNN
F 1 "10µF" H 7930 4830 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8178 4580 50  0001 C CNN
F 3 "~" H 8140 4730 50  0001 C CNN
	1    8140 4730
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR016
U 1 1 604FB6E4
P 8140 5070
F 0 "#PWR016" H 8140 4820 50  0001 C CNN
F 1 "GNDREF" H 8145 4897 50  0000 C CNN
F 2 "" H 8140 5070 50  0001 C CNN
F 3 "" H 8140 5070 50  0001 C CNN
	1    8140 5070
	1    0    0    -1  
$EndComp
Wire Wire Line
	8140 4880 8140 5070
$Comp
L Device:C C10
U 1 1 604FB6EB
P 8510 4740
F 0 "C10" H 8350 4660 50  0000 L CNN
F 1 "100nF" H 8250 4840 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 8548 4590 50  0001 C CNN
F 3 "~" H 8510 4740 50  0001 C CNN
	1    8510 4740
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR019
U 1 1 604FB6F1
P 8510 5070
F 0 "#PWR019" H 8510 4820 50  0001 C CNN
F 1 "GNDREF" H 8515 4897 50  0000 C CNN
F 2 "" H 8510 5070 50  0001 C CNN
F 3 "" H 8510 5070 50  0001 C CNN
	1    8510 5070
	1    0    0    -1  
$EndComp
Wire Wire Line
	8510 5070 8510 4890
Wire Wire Line
	9140 4500 8510 4500
Wire Wire Line
	8510 4500 8510 4590
Wire Wire Line
	8510 4500 8140 4500
Wire Wire Line
	8140 4500 8140 4580
Connection ~ 8510 4500
$Comp
L power:GNDREF #PWR029
U 1 1 60509F6D
P 10280 4400
F 0 "#PWR029" H 10280 4150 50  0001 C CNN
F 1 "GNDREF" V 10285 4272 50  0000 R CNN
F 2 "" H 10280 4400 50  0001 C CNN
F 3 "" H 10280 4400 50  0001 C CNN
	1    10280 4400
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR030
U 1 1 6050A9EB
P 10280 4700
F 0 "#PWR030" H 10280 4450 50  0001 C CNN
F 1 "GNDREF" V 10285 4572 50  0000 R CNN
F 2 "" H 10280 4700 50  0001 C CNN
F 3 "" H 10280 4700 50  0001 C CNN
	1    10280 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9940 4400 10280 4400
Wire Wire Line
	9940 4700 10280 4700
$Comp
L Device:C C2
U 1 1 60521AB6
P 4320 6160
F 0 "C2" H 4210 6070 50  0000 L CNN
F 1 "10µF" H 4110 6260 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4358 6010 50  0001 C CNN
F 3 "~" H 4320 6160 50  0001 C CNN
	1    4320 6160
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR04
U 1 1 60521ABC
P 4320 6500
F 0 "#PWR04" H 4320 6250 50  0001 C CNN
F 1 "GNDREF" H 4325 6327 50  0000 C CNN
F 2 "" H 4320 6500 50  0001 C CNN
F 3 "" H 4320 6500 50  0001 C CNN
	1    4320 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4320 6310 4320 6500
$Comp
L Device:C C3
U 1 1 60521AC3
P 4620 6170
F 0 "C3" H 4500 6090 50  0000 L CNN
F 1 "100nF" H 4370 6270 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4658 6020 50  0001 C CNN
F 3 "~" H 4620 6170 50  0001 C CNN
	1    4620 6170
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR06
U 1 1 60521AC9
P 4620 6500
F 0 "#PWR06" H 4620 6250 50  0001 C CNN
F 1 "GNDREF" H 4625 6327 50  0000 C CNN
F 2 "" H 4620 6500 50  0001 C CNN
F 3 "" H 4620 6500 50  0001 C CNN
	1    4620 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4620 6500 4620 6320
Wire Wire Line
	4620 5930 4620 6020
Wire Wire Line
	4320 5930 4320 6010
Connection ~ 3710 5930
Wire Wire Line
	3710 5930 3230 5930
Wire Wire Line
	3710 5930 4320 5930
Wire Wire Line
	3710 5830 4950 5830
Connection ~ 4620 5930
Wire Wire Line
	4620 5930 4950 5930
Connection ~ 4320 5930
Wire Wire Line
	4320 5930 4620 5930
Wire Wire Line
	5090 4500 5090 4800
Wire Wire Line
	5090 4800 4670 4800
Wire Wire Line
	4670 4800 4670 3960
Wire Wire Line
	4670 3960 5830 3960
Wire Wire Line
	5830 3960 5830 5080
Wire Wire Line
	5830 5080 5520 5080
Wire Wire Line
	5520 5080 5520 6030
Wire Wire Line
	5520 6030 5950 6030
Wire Wire Line
	6250 3880 3590 3880
Wire Wire Line
	6250 3880 6250 5430
Wire Wire Line
	3590 3880 3590 4440
Wire Wire Line
	3480 3800 6360 3800
Wire Wire Line
	6360 3800 6360 5530
Wire Wire Line
	3480 3800 3480 4340
Wire Wire Line
	9480 4600 9480 3150
Wire Wire Line
	9480 3150 7640 3150
Wire Wire Line
	5600 5630 5950 5630
Wire Wire Line
	9480 4600 9940 4600
$Comp
L Device:R R3
U 1 1 6055FB09
P 5610 6580
F 0 "R3" V 5610 6580 50  0000 C CNN
F 1 "10K" V 5520 6580 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5540 6580 50  0001 C CNN
F 3 "~" H 5610 6580 50  0001 C CNN
	1    5610 6580
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5950 6130 6080 6130
Wire Wire Line
	6080 6130 6080 6580
Wire Wire Line
	5410 6580 5410 5930
Connection ~ 5410 5930
Wire Wire Line
	5410 6580 5460 6580
Wire Wire Line
	6080 6580 5760 6580
$Comp
L Device:C C6
U 1 1 605A51F3
P 6380 6380
F 0 "C6" H 6390 6460 50  0000 L CNN
F 1 "10nF" H 6380 6300 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6418 6230 50  0001 C CNN
F 3 "~" H 6380 6380 50  0001 C CNN
	1    6380 6380
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR013
U 1 1 605B5CF5
P 6380 6690
F 0 "#PWR013" H 6380 6440 50  0001 C CNN
F 1 "GNDREF" H 6385 6517 50  0000 C CNN
F 2 "" H 6380 6690 50  0001 C CNN
F 3 "" H 6380 6690 50  0001 C CNN
	1    6380 6690
	1    0    0    -1  
$EndComp
Wire Wire Line
	6080 6130 6380 6130
Wire Wire Line
	6380 6130 6380 6230
Connection ~ 6080 6130
Wire Wire Line
	6380 6530 6380 6580
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 605D26E6
P 6830 6130
F 0 "J6" H 6802 6104 50  0000 R CNN
F 1 "Conn_01x02_Male" H 6802 6013 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6830 6130 50  0001 C CNN
F 3 "~" H 6830 6130 50  0001 C CNN
	1    6830 6130
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6630 6130 6380 6130
Connection ~ 6380 6130
Wire Wire Line
	6630 6230 6600 6230
Wire Wire Line
	6600 6230 6600 6580
Wire Wire Line
	6600 6580 6380 6580
Connection ~ 6380 6580
Wire Wire Line
	6380 6580 6380 6690
$Comp
L Device:R R2
U 1 1 605E647C
P 5600 7500
F 0 "R2" H 5670 7546 50  0000 L CNN
F 1 "R" H 5670 7455 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5530 7500 50  0001 C CNN
F 3 "~" H 5600 7500 50  0001 C CNN
	1    5600 7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3710 5930 3710 7770
Wire Wire Line
	3710 7770 5600 7770
Wire Wire Line
	5600 7770 5600 7650
Wire Wire Line
	5600 5630 5600 7280
Connection ~ 5600 7280
Wire Wire Line
	5600 7280 5600 7350
$Comp
L Device:R R5
U 1 1 606016D5
P 7360 7300
F 0 "R5" H 7430 7346 50  0000 L CNN
F 1 "R" H 7430 7255 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7290 7300 50  0001 C CNN
F 3 "~" H 7360 7300 50  0001 C CNN
	1    7360 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 7280 7640 7280
Wire Wire Line
	7640 3150 7640 7280
Wire Wire Line
	5600 7770 7360 7770
Wire Wire Line
	7360 7770 7360 7450
Connection ~ 5600 7770
Wire Wire Line
	7360 7150 7360 5730
Wire Wire Line
	7360 5730 6850 5730
Connection ~ 6850 5730
$Comp
L librairie_projet:LT1818 U5
U 1 1 60639A0D
P 12220 6040
F 0 "U5" H 12520 6382 50  0000 C CNN
F 1 "LT1818" H 12520 6291 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-5" H 12520 6365 50  0001 C CIN
F 3 "http://www.st.com/internet/com/TECHNICAL_RESOURCES/TECHNICAL_LITERATURE/DATASHEET/CD00003395.pdf" H 12520 6090 50  0001 C CNN
	1    12220 6040
	0    -1   1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 60639A14
P 13420 7080
F 0 "R13" V 13420 7010 50  0000 L CNN
F 1 "4.7k" V 13510 7000 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 13350 7080 50  0001 C CNN
F 3 "~" H 13420 7080 50  0001 C CNN
	1    13420 7080
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 60639A1A
P 13420 6410
F 0 "R12" V 13420 6340 50  0000 L CNN
F 1 "4.7k" V 13520 6330 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 13350 6410 50  0001 C CNN
F 3 "~" H 13420 6410 50  0001 C CNN
	1    13420 6410
	-1   0    0    -1  
$EndComp
Wire Wire Line
	13420 6560 13420 6760
$Comp
L power:GNDREF #PWR026
U 1 1 60639A22
P 13420 5760
F 0 "#PWR026" H 13420 5510 50  0001 C CNN
F 1 "GNDREF" H 13425 5587 50  0000 C CNN
F 2 "" H 13420 5760 50  0001 C CNN
F 3 "" H 13420 5760 50  0001 C CNN
	1    13420 5760
	1    0    0    1   
$EndComp
$Comp
L Device:R R14
U 1 1 60639A28
P 13170 6760
F 0 "R14" V 13170 6760 50  0000 C CNN
F 1 "100" V 13250 6760 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 13100 6760 50  0001 C CNN
F 3 "~" H 13170 6760 50  0001 C CNN
	1    13170 6760
	0    -1   1    0   
$EndComp
$Comp
L Device:R R15
U 1 1 60639A2E
P 12930 6340
F 0 "R15" V 12930 6290 50  0000 L CNN
F 1 "1k" V 13020 6280 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 12860 6340 50  0001 C CNN
F 3 "~" H 12930 6340 50  0001 C CNN
	1    12930 6340
	-1   0    0    -1  
$EndComp
Connection ~ 13420 6760
Wire Wire Line
	13420 6760 13420 6930
Wire Wire Line
	12930 6760 12930 6490
Wire Wire Line
	12320 6760 12320 6640
Wire Wire Line
	12930 6190 12930 5550
Wire Wire Line
	12930 5550 12120 5550
$Comp
L power:GNDREF #PWR032
U 1 1 60639A3F
P 12320 5800
F 0 "#PWR032" H 12320 5550 50  0001 C CNN
F 1 "GNDREF" H 12325 5627 50  0000 C CNN
F 2 "" H 12320 5800 50  0001 C CNN
F 3 "" H 12320 5800 50  0001 C CNN
	1    12320 5800
	1    0    0    1   
$EndComp
Wire Wire Line
	12320 6040 12320 5900
Wire Wire Line
	12320 5900 12220 5900
Wire Wire Line
	12220 5900 12220 6040
Connection ~ 12320 5900
Wire Wire Line
	12320 5900 12320 5800
$Comp
L Device:C C16
U 1 1 60639A4A
P 11590 6760
F 0 "C16" V 11540 6880 50  0000 C CNN
F 1 "100nF" V 11640 6920 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 11628 6610 50  0001 C CNN
F 3 "~" H 11590 6760 50  0001 C CNN
	1    11590 6760
	0    -1   1    0   
$EndComp
$Comp
L Device:C C17
U 1 1 60639A50
P 11580 7060
F 0 "C17" V 11540 7180 50  0000 C CNN
F 1 "10µF" V 11640 7210 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 11618 6910 50  0001 C CNN
F 3 "~" H 11580 7060 50  0001 C CNN
	1    11580 7060
	0    -1   1    0   
$EndComp
$Comp
L power:GNDREF #PWR033
U 1 1 60639A56
P 11220 6760
F 0 "#PWR033" H 11220 6510 50  0001 C CNN
F 1 "GNDREF" V 11225 6632 50  0000 R CNN
F 2 "" H 11220 6760 50  0001 C CNN
F 3 "" H 11220 6760 50  0001 C CNN
	1    11220 6760
	0    1    -1   0   
$EndComp
$Comp
L power:GNDREF #PWR034
U 1 1 60639A5C
P 11210 7060
F 0 "#PWR034" H 11210 6810 50  0001 C CNN
F 1 "GNDREF" V 11215 6932 50  0000 R CNN
F 2 "" H 11210 7060 50  0001 C CNN
F 3 "" H 11210 7060 50  0001 C CNN
	1    11210 7060
	0    1    -1   0   
$EndComp
Wire Wire Line
	11220 6760 11440 6760
Wire Wire Line
	11210 7060 11430 7060
Wire Wire Line
	11730 7060 12120 7060
Wire Wire Line
	11740 6760 12120 6760
Wire Wire Line
	12120 6640 12120 6760
Connection ~ 12120 6760
Wire Wire Line
	12120 6760 12120 7060
$Comp
L Device:R R11
U 1 1 60639A6A
P 13710 6760
F 0 "R11" V 13710 6760 50  0000 C CNN
F 1 "4.7K" V 13800 6760 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 13640 6760 50  0001 C CNN
F 3 "~" H 13710 6760 50  0001 C CNN
	1    13710 6760
	0    -1   1    0   
$EndComp
$Comp
L power:GNDREF #PWR025
U 1 1 60639A70
P 13990 7280
F 0 "#PWR025" H 13990 7030 50  0001 C CNN
F 1 "GNDREF" H 13995 7107 50  0000 C CNN
F 2 "" H 13990 7280 50  0001 C CNN
F 3 "" H 13990 7280 50  0001 C CNN
	1    13990 7280
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C12
U 1 1 60639A76
P 13990 7030
F 0 "C12" H 14000 7110 50  0000 L CNN
F 1 "47nF" H 14010 6940 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 14028 6880 50  0001 C CNN
F 3 "~" H 13990 7030 50  0001 C CNN
	1    13990 7030
	-1   0    0    -1  
$EndComp
Wire Wire Line
	13420 6760 13560 6760
Wire Wire Line
	13990 6760 13990 6880
Wire Wire Line
	13990 7180 13990 7280
$Comp
L power:GNDREF #PWR023
U 1 1 60639A8E
P 14510 7270
F 0 "#PWR023" H 14510 7020 50  0001 C CNN
F 1 "GNDREF" H 14515 7097 50  0000 C CNN
F 2 "" H 14510 7270 50  0001 C CNN
F 3 "" H 14510 7270 50  0001 C CNN
	1    14510 7270
	-1   0    0    -1  
$EndComp
Wire Wire Line
	14510 6760 14510 6870
Wire Wire Line
	14510 7270 14510 7170
$Comp
L Connector:Conn_Coaxial J7
U 1 1 60639A97
P 15380 6760
F 0 "J7" H 15480 6642 50  0000 L CNN
F 1 "Conn_Coaxial" H 15480 6733 50  0000 L CNN
F 2 "Connector_Coaxial:MMCX_Molex_73415-0961_Horizontal_0.8mm-PCB" H 15380 6760 50  0001 C CNN
F 3 " ~" H 15380 6760 50  0001 C CNN
	1    15380 6760
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR020
U 1 1 60639A9F
P 15380 7090
F 0 "#PWR020" H 15380 6840 50  0001 C CNN
F 1 "GNDREF" H 15385 6917 50  0000 C CNN
F 2 "" H 15380 7090 50  0001 C CNN
F 3 "" H 15380 7090 50  0001 C CNN
	1    15380 7090
	1    0    0    -1  
$EndComp
$Comp
L librairie_projet:BAT54XV2 D5
U 1 1 60639AA6
P 13420 5990
F 0 "D5" V 13374 6070 50  0000 L CNN
F 1 "BAT54XV2" V 13465 6070 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-523" H 13420 5815 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30396.pdf" H 13420 5990 50  0001 C CNN
	1    13420 5990
	0    -1   1    0   
$EndComp
Wire Wire Line
	13420 6260 13420 6140
Wire Wire Line
	13420 5840 13420 5760
Connection ~ 12120 5550
Connection ~ 14510 6760
Wire Wire Line
	14510 6760 14600 6760
Wire Wire Line
	14050 6760 13990 6760
Wire Wire Line
	14510 6760 14350 6760
$Comp
L librairie_projet:BAT54XV2 D4
U 1 1 60639A7C
P 14200 6760
F 0 "D4" H 14200 6543 50  0000 C CNN
F 1 "BAT54XV2" H 14200 6634 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 14200 6585 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30396.pdf" H 14200 6760 50  0001 C CNN
	1    14200 6760
	1    0    0    1   
$EndComp
Connection ~ 13990 6760
Wire Wire Line
	13990 6760 13860 6760
Wire Wire Line
	13320 6760 13420 6760
Connection ~ 7360 7770
Wire Wire Line
	13020 6760 12930 6760
Connection ~ 12930 6760
Wire Wire Line
	12930 6760 12320 6760
Wire Wire Line
	9940 4300 10860 4300
Wire Wire Line
	11400 5550 12120 5550
$Comp
L Device:R R17
U 1 1 60713384
P 11140 4300
F 0 "R17" V 11140 4250 50  0000 L CNN
F 1 "50" V 11240 4250 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 11070 4300 50  0001 C CNN
F 3 "~" H 11140 4300 50  0001 C CNN
	1    11140 4300
	0    1    1    0   
$EndComp
$Comp
L Device:C C18
U 1 1 60714031
P 10860 4670
F 0 "C18" V 10800 4790 50  0000 C CNN
F 1 "2nF" V 10910 4800 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 10898 4520 50  0001 C CNN
F 3 "~" H 10860 4670 50  0001 C CNN
	1    10860 4670
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR035
U 1 1 60714D52
P 10860 5100
F 0 "#PWR035" H 10860 4850 50  0001 C CNN
F 1 "GNDREF" H 11010 4920 50  0000 R CNN
F 2 "" H 10860 5100 50  0001 C CNN
F 3 "" H 10860 5100 50  0001 C CNN
	1    10860 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10860 4520 10860 4300
Wire Wire Line
	10860 4820 10860 5100
Wire Wire Line
	8140 4500 7840 4500
Wire Wire Line
	7840 4500 7840 7770
Wire Wire Line
	7360 7770 7840 7770
Connection ~ 8140 4500
$Comp
L power:GNDREF #PWR022
U 1 1 6073A590
P 8960 5070
F 0 "#PWR022" H 8960 4820 50  0001 C CNN
F 1 "GNDREF" H 8965 4897 50  0000 C CNN
F 2 "" H 8960 5070 50  0001 C CNN
F 3 "" H 8960 5070 50  0001 C CNN
	1    8960 5070
	1    0    0    -1  
$EndComp
Wire Wire Line
	8960 5070 8960 4700
Wire Wire Line
	8960 4600 9140 4600
Wire Wire Line
	9140 4700 8960 4700
Connection ~ 8960 4700
Wire Wire Line
	8960 4700 8960 4600
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 607506F7
P 2000 8770
F 0 "J2" H 2108 8951 50  0000 C CNN
F 1 "Conn_01x02_Male" H 2108 8860 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical_SMD_Pin1Left" H 2000 8770 50  0001 C CNN
F 3 "~" H 2000 8770 50  0001 C CNN
	1    2000 8770
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack_Switch J1
U 1 1 60752619
P 1930 9790
F 0 "J1" H 1987 10107 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 1987 10016 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1980 9750 50  0001 C CNN
F 3 "~" H 1980 9750 50  0001 C CNN
	1    1930 9790
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 8870 2660 8870
Wire Wire Line
	2660 9690 2230 9690
$Comp
L power:GNDREF #PWR01
U 1 1 6075EB9A
P 2300 9200
F 0 "#PWR01" H 2300 8950 50  0001 C CNN
F 1 "GNDREF" V 2305 9072 50  0000 R CNN
F 2 "" H 2300 9200 50  0001 C CNN
F 3 "" H 2300 9200 50  0001 C CNN
	1    2300 9200
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 9200 2660 9200
Wire Wire Line
	2660 8870 2660 9200
Connection ~ 2660 9200
Wire Wire Line
	2660 9200 2660 9690
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 6076A86E
P 3070 9220
F 0 "SW1" V 3024 9350 50  0000 L CNN
F 1 "SW_DIP_x01" V 3115 9350 50  0000 L CNN
F 2 "Connector_PinHeader_1.00mm:PinHeader_1x02_P1.00mm_Vertical" H 3070 9220 50  0001 C CNN
F 3 "~" H 3070 9220 50  0001 C CNN
	1    3070 9220
	0    1    1    0   
$EndComp
Wire Wire Line
	2200 8770 3070 8770
Wire Wire Line
	3070 8770 3070 8920
Wire Wire Line
	2230 9790 3070 9790
Wire Wire Line
	3070 9790 3070 9520
$Comp
L Device:D D1
U 1 1 60784737
P 2720 9890
F 0 "D1" H 2720 9990 50  0000 C CNN
F 1 "D" H 2740 10060 50  0000 C CNN
F 2 "Diode_SMD:D_1206_3216Metric" H 2720 9890 50  0001 C CNN
F 3 "~" H 2720 9890 50  0001 C CNN
	1    2720 9890
	-1   0    0    1   
$EndComp
Wire Wire Line
	2230 9890 2570 9890
$Comp
L Device:C C1
U 1 1 607AA395
P 3530 10160
F 0 "C1" H 3540 10250 50  0000 L CNN
F 1 "1µF" H 3550 10080 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3568 10010 50  0001 C CNN
F 3 "~" H 3530 10160 50  0001 C CNN
	1    3530 10160
	1    0    0    -1  
$EndComp
Wire Wire Line
	3530 9890 2870 9890
Wire Wire Line
	3530 9890 3530 10010
$Comp
L Device:C C4
U 1 1 607B815F
P 4760 10190
F 0 "C4" H 4770 10280 50  0000 L CNN
F 1 "1µF" H 4780 10100 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4798 10040 50  0001 C CNN
F 3 "~" H 4760 10190 50  0001 C CNN
	1    4760 10190
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR07
U 1 1 607B8B35
P 4760 10590
F 0 "#PWR07" H 4760 10340 50  0001 C CNN
F 1 "GNDREF" H 4765 10417 50  0000 C CNN
F 2 "" H 4760 10590 50  0001 C CNN
F 3 "" H 4760 10590 50  0001 C CNN
	1    4760 10590
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR03
U 1 1 607B92B3
P 4160 10600
F 0 "#PWR03" H 4160 10350 50  0001 C CNN
F 1 "GNDREF" H 4165 10427 50  0000 C CNN
F 2 "" H 4160 10600 50  0001 C CNN
F 3 "" H 4160 10600 50  0001 C CNN
	1    4160 10600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4760 10340 4760 10590
Wire Wire Line
	5600 7770 5600 9890
Wire Wire Line
	5600 9890 4760 9890
Wire Wire Line
	4760 9890 4760 10040
$Comp
L Regulator_Linear:TPS72215 U1
U 1 1 607E0DD0
P 4160 9990
F 0 "U1" H 4160 10332 50  0000 C CNN
F 1 "TPS70950DBVT" H 4160 10241 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 4160 10315 50  0001 C CIN
F 3 "http://www.ti.com/lit/ds/symlink/tps722.pdf" H 4160 9990 50  0001 C CNN
	1    4160 9990
	1    0    0    -1  
$EndComp
Wire Wire Line
	4760 9890 4460 9890
Connection ~ 4760 9890
Wire Wire Line
	3530 9890 3860 9890
Connection ~ 3530 9890
Wire Wire Line
	3530 10310 3530 10430
Wire Wire Line
	3530 10430 4160 10430
Wire Wire Line
	4160 10430 4160 10290
Wire Wire Line
	4160 10430 4160 10600
Connection ~ 4160 10430
Connection ~ 10860 4300
Wire Wire Line
	10860 4300 10990 4300
Wire Wire Line
	12120 5550 12120 6040
Connection ~ 10860 4200
Wire Wire Line
	10860 4200 10990 4200
Wire Wire Line
	9940 4200 10860 4200
Wire Wire Line
	11290 4300 11400 4300
Wire Wire Line
	11400 4300 11400 5420
$Comp
L Device:R R20
U 1 1 604A2AC3
P 11740 5420
F 0 "R20" V 11740 5410 50  0000 C CNN
F 1 "R" V 11624 5420 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 11670 5420 50  0001 C CNN
F 3 "~" H 11740 5420 50  0001 C CNN
	1    11740 5420
	0    1    1    0   
$EndComp
$Comp
L Device:R R18
U 1 1 604A406C
P 11130 5420
F 0 "R18" V 11130 5420 50  0000 C CNN
F 1 "R" V 11014 5420 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 11060 5420 50  0001 C CNN
F 3 "~" H 11130 5420 50  0001 C CNN
	1    11130 5420
	0    1    1    0   
$EndComp
$Comp
L Device:R R21
U 1 1 604B33A7
P 11720 3090
F 0 "R21" V 11720 3080 50  0000 C CNN
F 1 "R" V 11604 3090 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 11650 3090 50  0001 C CNN
F 3 "~" H 11720 3090 50  0001 C CNN
	1    11720 3090
	0    1    1    0   
$EndComp
$Comp
L Device:R R19
U 1 1 604B46C1
P 11080 3090
F 0 "R19" V 11080 3090 50  0000 C CNN
F 1 "R" V 10964 3090 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 11010 3090 50  0001 C CNN
F 3 "~" H 11080 3090 50  0001 C CNN
	1    11080 3090
	0    1    1    0   
$EndComp
Wire Wire Line
	11280 5420 11400 5420
$Comp
L power:GNDREF #PWR0101
U 1 1 605798FE
P 11990 5420
F 0 "#PWR0101" H 11990 5170 50  0001 C CNN
F 1 "GNDREF" V 11995 5292 50  0000 R CNN
F 2 "" H 11990 5420 50  0001 C CNN
F 3 "" H 11990 5420 50  0001 C CNN
	1    11990 5420
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0102
U 1 1 6057AB2F
P 10880 5420
F 0 "#PWR0102" H 10880 5170 50  0001 C CNN
F 1 "GNDREF" V 10885 5292 50  0000 R CNN
F 2 "" H 10880 5420 50  0001 C CNN
F 3 "" H 10880 5420 50  0001 C CNN
	1    10880 5420
	0    1    1    0   
$EndComp
Wire Wire Line
	11990 5420 11890 5420
Wire Wire Line
	10980 5420 10880 5420
Wire Wire Line
	11230 3090 11400 3090
$Comp
L power:GNDREF #PWR0103
U 1 1 605C0B84
P 10830 3090
F 0 "#PWR0103" H 10830 2840 50  0001 C CNN
F 1 "GNDREF" V 10835 2962 50  0000 R CNN
F 2 "" H 10830 3090 50  0001 C CNN
F 3 "" H 10830 3090 50  0001 C CNN
	1    10830 3090
	0    1    1    0   
$EndComp
Wire Wire Line
	10830 3090 10930 3090
$Comp
L power:GNDREF #PWR0104
U 1 1 605DEDB3
P 11980 3090
F 0 "#PWR0104" H 11980 2840 50  0001 C CNN
F 1 "GNDREF" V 11985 2962 50  0000 R CNN
F 2 "" H 11980 3090 50  0001 C CNN
F 3 "" H 11980 3090 50  0001 C CNN
	1    11980 3090
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11870 3090 11980 3090
Connection ~ 12120 7060
Wire Wire Line
	12120 7060 12120 7770
Wire Wire Line
	13420 7770 12120 7770
Wire Wire Line
	13420 7230 13420 7770
Wire Wire Line
	7840 7770 12120 7770
Connection ~ 7840 7770
Connection ~ 12120 7770
$Comp
L Device:L_Small L2
U 1 1 604CBD47
P 14700 6760
F 0 "L2" V 14885 6760 50  0000 C CNN
F 1 "L_Small" V 14794 6760 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" H 14700 6760 50  0001 C CNN
F 3 "~" H 14700 6760 50  0001 C CNN
	1    14700 6760
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0105
U 1 1 604E8CA6
P 14920 7270
F 0 "#PWR0105" H 14920 7020 50  0001 C CNN
F 1 "GNDREF" H 14925 7097 50  0000 C CNN
F 2 "" H 14920 7270 50  0001 C CNN
F 3 "" H 14920 7270 50  0001 C CNN
	1    14920 7270
	-1   0    0    -1  
$EndComp
Wire Wire Line
	14920 7170 14920 7270
$Comp
L Device:C C21
U 1 1 604F9313
P 14510 7020
F 0 "C21" H 14520 7100 50  0000 L CNN
F 1 "NM" H 14530 6930 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 14548 6870 50  0001 C CNN
F 3 "~" H 14510 7020 50  0001 C CNN
	1    14510 7020
	-1   0    0    -1  
$EndComp
Wire Wire Line
	14800 6760 14920 6760
Wire Wire Line
	14920 6870 14920 6760
Connection ~ 14920 6760
Wire Wire Line
	14920 6760 15180 6760
Wire Wire Line
	15380 6960 15380 7090
Wire Wire Line
	14290 1290 14290 1400
Wire Wire Line
	14410 1400 14290 1400
$Comp
L Device:C C19
U 1 1 6060E8F9
P 14700 1140
F 0 "C19" H 14710 1220 50  0000 L CNN
F 1 "NM" H 14720 1050 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 14738 990 50  0001 C CNN
F 3 "~" H 14700 1140 50  0001 C CNN
	1    14700 1140
	1    0    0    1   
$EndComp
Wire Wire Line
	14290 990  14290 890 
$Comp
L Device:C C20
U 1 1 6060E8EE
P 14290 1140
F 0 "C20" H 14300 1220 50  0000 L CNN
F 1 "NM" H 14310 1050 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 14328 990 50  0001 C CNN
F 3 "~" H 14290 1140 50  0001 C CNN
	1    14290 1140
	1    0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR0107
U 1 1 6060E8E4
P 14290 890
F 0 "#PWR0107" H 14290 640 50  0001 C CNN
F 1 "GNDREF" H 14295 717 50  0000 C CNN
F 2 "" H 14290 890 50  0001 C CNN
F 3 "" H 14290 890 50  0001 C CNN
	1    14290 890 
	1    0    0    1   
$EndComp
$Comp
L Device:L_Small L1
U 1 1 6060E8DA
P 14510 1400
F 0 "L1" V 14695 1400 50  0000 C CNN
F 1 "L_Small" V 14604 1400 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" H 14510 1400 50  0001 C CNN
F 3 "~" H 14510 1400 50  0001 C CNN
	1    14510 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	14700 1400 14610 1400
Connection ~ 14700 1400
Wire Wire Line
	14700 890  14700 990 
Wire Wire Line
	14700 1400 14700 1290
$Comp
L power:GNDREF #PWR0106
U 1 1 6060E8CB
P 14700 890
F 0 "#PWR0106" H 14700 640 50  0001 C CNN
F 1 "GNDREF" H 14705 717 50  0000 C CNN
F 2 "" H 14700 890 50  0001 C CNN
F 3 "" H 14700 890 50  0001 C CNN
	1    14700 890 
	1    0    0    1   
$EndComp
Wire Wire Line
	13010 2320 13010 2400
Wire Wire Line
	13010 1900 13010 2020
$Comp
L librairie_projet:BAT54XV2 D3
U 1 1 604AA9D0
P 13010 2170
F 0 "D3" V 12964 2250 50  0000 L CNN
F 1 "BAT54XV2" V 13055 2250 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-523" H 13010 1995 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30396.pdf" H 13010 2170 50  0001 C CNN
	1    13010 2170
	0    -1   -1   0   
$EndComp
Wire Wire Line
	15130 1200 15130 1050
$Comp
L power:GNDREF #PWR05
U 1 1 604A4803
P 15130 1050
F 0 "#PWR05" H 15130 800 50  0001 C CNN
F 1 "GNDREF" H 15135 877 50  0000 C CNN
F 2 "" H 15130 1050 50  0001 C CNN
F 3 "" H 15130 1050 50  0001 C CNN
	1    15130 1050
	1    0    0    1   
$EndComp
$Comp
L Connector:Conn_Coaxial J4
U 1 1 604A1ADF
P 15130 1400
F 0 "J4" H 15230 1282 50  0000 L CNN
F 1 "Conn_Coaxial" H 15230 1373 50  0000 L CNN
F 2 "Connector_Coaxial:MMCX_Molex_73415-0961_Horizontal_0.8mm-PCB" H 15130 1400 50  0001 C CNN
F 3 " ~" H 15130 1400 50  0001 C CNN
	1    15130 1400
	1    0    0    1   
$EndComp
Wire Wire Line
	13750 980  13750 880 
Wire Wire Line
	13750 1400 13750 1280
$Comp
L librairie_projet:BAT54XV2 D2
U 1 1 6048E230
P 14030 1400
F 0 "D2" H 14030 1183 50  0000 C CNN
F 1 "BAT54XV2" H 14030 1274 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-523" H 14030 1225 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30396.pdf" H 14030 1400 50  0001 C CNN
	1    14030 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 6048D604
P 13750 1130
F 0 "C5" H 13760 1210 50  0000 L CNN
F 1 "47nF" H 13770 1040 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 13788 980 50  0001 C CNN
F 3 "~" H 13750 1130 50  0001 C CNN
	1    13750 1130
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR010
U 1 1 6048CFBF
P 13750 880
F 0 "#PWR010" H 13750 630 50  0001 C CNN
F 1 "GNDREF" H 13755 707 50  0000 C CNN
F 2 "" H 13750 880 50  0001 C CNN
F 3 "" H 13750 880 50  0001 C CNN
	1    13750 880 
	-1   0    0    1   
$EndComp
$Comp
L Device:R R4
U 1 1 6048CBE0
P 13420 1400
F 0 "R4" V 13420 1400 50  0000 C CNN
F 1 "4.7K" V 13510 1400 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 13350 1400 50  0001 C CNN
F 3 "~" H 13420 1400 50  0001 C CNN
	1    13420 1400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	13010 1400 13010 1230
Connection ~ 13010 1400
$Comp
L Device:R R8
U 1 1 6046F9AE
P 12690 1400
F 0 "R8" V 12690 1400 50  0000 C CNN
F 1 "100" V 12770 1400 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 12620 1400 50  0001 C CNN
F 3 "~" H 12690 1400 50  0001 C CNN
	1    12690 1400
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR014
U 1 1 6046DB59
P 13010 2400
F 0 "#PWR014" H 13010 2150 50  0001 C CNN
F 1 "GNDREF" H 13015 2227 50  0000 C CNN
F 2 "" H 13010 2400 50  0001 C CNN
F 3 "" H 13010 2400 50  0001 C CNN
	1    13010 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	13010 1600 13010 1400
$Comp
L Device:R R6
U 1 1 60469074
P 13010 1750
F 0 "R6" V 13010 1710 50  0000 L CNN
F 1 "4.7k" V 13110 1670 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 12940 1750 50  0001 C CNN
F 3 "~" H 13010 1750 50  0001 C CNN
	1    13010 1750
	-1   0    0    1   
$EndComp
$Comp
L Device:R R7
U 1 1 60468515
P 13010 1080
F 0 "R7" V 13010 1040 50  0000 L CNN
F 1 "4.7k" V 13100 1000 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 12940 1080 50  0001 C CNN
F 3 "~" H 13010 1080 50  0001 C CNN
	1    13010 1080
	-1   0    0    1   
$EndComp
Wire Wire Line
	2010 580  2010 5930
Wire Wire Line
	14930 1400 14700 1400
Wire Wire Line
	13010 1400 13270 1400
Connection ~ 13750 1400
Wire Wire Line
	13750 1400 13880 1400
$Comp
L librairie_projet:LT1818 U3
U 1 1 6043D9B3
P 11500 2120
F 0 "U3" H 11800 2462 50  0000 C CNN
F 1 "LT1818" H 11800 2371 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-5" H 11800 2445 50  0001 C CIN
F 3 "http://www.st.com/internet/com/TECHNICAL_RESOURCES/TECHNICAL_LITERATURE/DATASHEET/CD00003395.pdf" H 11800 2170 50  0001 C CNN
	1    11500 2120
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R9
U 1 1 60470191
P 12210 1820
F 0 "R9" V 12210 1770 50  0000 L CNN
F 1 "1k" V 12300 1760 50  0000 L CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 12140 1820 50  0001 C CNN
F 3 "~" H 12210 1820 50  0001 C CNN
	1    12210 1820
	-1   0    0    1   
$EndComp
Wire Wire Line
	12540 1400 12210 1400
Wire Wire Line
	12210 1400 12210 1670
Wire Wire Line
	12210 1400 11600 1400
Wire Wire Line
	11600 1400 11600 1520
Connection ~ 12210 1400
$Comp
L power:GNDREF #PWR024
U 1 1 604750B4
P 11600 2360
F 0 "#PWR024" H 11600 2110 50  0001 C CNN
F 1 "GNDREF" H 11605 2187 50  0000 C CNN
F 2 "" H 11600 2360 50  0001 C CNN
F 3 "" H 11600 2360 50  0001 C CNN
	1    11600 2360
	1    0    0    -1  
$EndComp
Wire Wire Line
	11600 2120 11600 2260
Wire Wire Line
	11600 2260 11500 2260
Wire Wire Line
	11500 2260 11500 2120
Connection ~ 11600 2260
Wire Wire Line
	11600 2260 11600 2360
$Comp
L Device:C C13
U 1 1 6047A4EC
P 10870 1400
F 0 "C13" V 10810 1530 50  0000 C CNN
F 1 "100nF" V 10920 1580 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 10908 1250 50  0001 C CNN
F 3 "~" H 10870 1400 50  0001 C CNN
	1    10870 1400
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C14
U 1 1 6047AFCC
P 10860 1100
F 0 "C14" V 10810 1240 50  0000 C CNN
F 1 "10µF" V 10930 1270 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 10898 950 50  0001 C CNN
F 3 "~" H 10860 1100 50  0001 C CNN
	1    10860 1100
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR027
U 1 1 604812B2
P 10500 1400
F 0 "#PWR027" H 10500 1150 50  0001 C CNN
F 1 "GNDREF" V 10505 1272 50  0000 R CNN
F 2 "" H 10500 1400 50  0001 C CNN
F 3 "" H 10500 1400 50  0001 C CNN
	1    10500 1400
	0    1    1    0   
$EndComp
$Comp
L power:GNDREF #PWR028
U 1 1 60481998
P 10490 1100
F 0 "#PWR028" H 10490 850 50  0001 C CNN
F 1 "GNDREF" V 10495 972 50  0000 R CNN
F 2 "" H 10490 1100 50  0001 C CNN
F 3 "" H 10490 1100 50  0001 C CNN
	1    10490 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	10500 1400 10720 1400
Wire Wire Line
	10490 1100 10710 1100
Wire Wire Line
	11010 1100 11400 1100
Connection ~ 11400 1100
Wire Wire Line
	11020 1400 11400 1400
Wire Wire Line
	11400 1520 11400 1400
Connection ~ 11400 1400
Wire Wire Line
	11400 1400 11400 1100
Wire Wire Line
	12210 1970 12210 2840
Wire Wire Line
	11400 2120 11400 2840
Wire Wire Line
	12840 1400 13010 1400
Wire Wire Line
	13010 1400 13020 1400
Wire Wire Line
	14180 1400 14290 1400
Connection ~ 14290 1400
Wire Wire Line
	11290 4200 11400 4200
Wire Wire Line
	11400 4200 11400 3090
Connection ~ 11400 2840
Wire Wire Line
	13570 1400 13750 1400
Wire Wire Line
	11400 2840 12210 2840
Wire Wire Line
	11400 570  11400 1100
Wire Wire Line
	2010 570  11400 570 
Wire Wire Line
	11400 570  13010 570 
Wire Wire Line
	13010 570  13010 930 
Connection ~ 11400 570 
$Comp
L Device:C C22
U 1 1 604E8CB0
P 14920 7020
F 0 "C22" H 14930 7100 50  0000 L CNN
F 1 "NM" H 14940 6930 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 14958 6870 50  0001 C CNN
F 3 "~" H 14920 7020 50  0001 C CNN
	1    14920 7020
	-1   0    0    -1  
$EndComp
Connection ~ 11400 3090
Wire Wire Line
	11400 3090 11570 3090
Wire Wire Line
	11400 3090 11400 2840
Connection ~ 11400 5420
Wire Wire Line
	11400 5420 11400 5550
Wire Wire Line
	11400 5420 11590 5420
$EndSCHEMATC
