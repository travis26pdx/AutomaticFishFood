EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Automatic Fish Feeder"
Date "2021-10-27"
Rev "0.1"
Comp "Mohammed Aladwani, Travis Johnson, Trueman Singleton, Zak Smith, "
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Motor:Motor_Servo M1
U 1 1 6175F85B
P 7600 2550
F 0 "M1" H 7932 2615 50  0000 L CNN
F 1 "Motor_Servo" H 7932 2524 50  0000 L CNN
F 2 "" H 7600 2360 50  0001 C CNN
F 3 "http://forums.parallax.com/uploads/attachments/46831/74481.png" H 7600 2360 50  0001 C CNN
	1    7600 2550
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_B_Mini J1
U 1 1 6179D155
P 1350 2550
F 0 "J1" H 1407 3017 50  0000 C CNN
F 1 "USB_B_Mini" H 1407 2926 50  0000 C CNN
F 2 "" H 1500 2500 50  0001 C CNN
F 3 "~" H 1500 2500 50  0001 C CNN
	1    1350 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6179D8D8
P 1350 3200
F 0 "#PWR?" H 1350 2950 50  0001 C CNN
F 1 "GND" H 1355 3027 50  0000 C CNN
F 2 "" H 1350 3200 50  0001 C CNN
F 3 "" H 1350 3200 50  0001 C CNN
	1    1350 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 3200 1350 2950
$Comp
L Device:R R1
U 1 1 6179E3DF
P 2200 2600
F 0 "R1" V 1993 2600 50  0000 C CNN
F 1 "220" V 2084 2600 50  0000 C CNN
F 2 "" V 2130 2600 50  0001 C CNN
F 3 "~" H 2200 2600 50  0001 C CNN
	1    2200 2600
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D1
U 1 1 6179EEE8
P 2200 3000
F 0 "D1" H 2193 2745 50  0000 C CNN
F 1 "RED" H 2193 2836 50  0000 C CNN
F 2 "" H 2200 3000 50  0001 C CNN
F 3 "~" H 2200 3000 50  0001 C CNN
	1    2200 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2200 2850 2200 2750
$Comp
L MCU_Microchip_ATmega:ATmega328P-PU U1
U 1 1 6179F916
P 4450 3100
F 0 "U1" H 3806 3146 50  0000 R CNN
F 1 "ATmega328P-PU" H 3806 3055 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 4450 3100 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 4450 3100 50  0001 C CNN
	1    4450 3100
	1    0    0    -1  
$EndComp
$Comp
L ssd1306:SSD1306 U2
U 1 1 617A1C55
P 7300 4300
F 0 "U2" H 7730 4403 50  0000 L CNN
F 1 "SSD1306" H 7730 4312 50  0000 L CNN
F 2 "Display:SSD1306" H 6800 3750 50  0001 C CNN
F 3 "" H 7150 4800 50  0001 C CNN
	1    7300 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 617A25F0
P 6750 3800
F 0 "#PWR?" H 6750 3550 50  0001 C CNN
F 1 "GND" H 6755 3627 50  0000 C CNN
F 2 "" H 6750 3800 50  0001 C CNN
F 3 "" H 6750 3800 50  0001 C CNN
	1    6750 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 3800 6750 3700
Wire Wire Line
	6750 3700 7150 3700
Wire Wire Line
	7150 3700 7150 3800
$Comp
L power:+5V #PWR?
U 1 1 617A2FE9
P 7250 3600
F 0 "#PWR?" H 7250 3450 50  0001 C CNN
F 1 "+5V" H 7265 3773 50  0000 C CNN
F 2 "" H 7250 3600 50  0001 C CNN
F 3 "" H 7250 3600 50  0001 C CNN
	1    7250 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 3600 7250 3800
$Comp
L power:+5V #PWR?
U 1 1 617A38C4
P 7150 2200
F 0 "#PWR?" H 7150 2050 50  0001 C CNN
F 1 "+5V" H 7165 2373 50  0000 C CNN
F 2 "" H 7150 2200 50  0001 C CNN
F 3 "" H 7150 2200 50  0001 C CNN
	1    7150 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 2200 7150 2550
Wire Wire Line
	7150 2550 7300 2550
$Comp
L power:GND #PWR?
U 1 1 617A3FCF
P 7150 2900
F 0 "#PWR?" H 7150 2650 50  0001 C CNN
F 1 "GND" H 7155 2727 50  0000 C CNN
F 2 "" H 7150 2900 50  0001 C CNN
F 3 "" H 7150 2900 50  0001 C CNN
	1    7150 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 2650 7150 2650
Wire Wire Line
	7150 2650 7150 2900
Wire Wire Line
	5400 3600 5050 3600
Wire Wire Line
	5400 3700 5050 3700
Wire Wire Line
	7300 2450 7050 2450
$Comp
L Device:Crystal Y1
U 1 1 617A7A0B
P 5800 2500
F 0 "Y1" V 5754 2631 50  0000 L CNN
F 1 "16MHz" V 5845 2631 50  0000 L CNN
F 2 "" H 5800 2500 50  0001 C CNN
F 3 "~" H 5800 2500 50  0001 C CNN
	1    5800 2500
	0    1    1    0   
$EndComp
$Comp
L Device:C C1
U 1 1 617A7E8D
P 6250 2350
F 0 "C1" V 5998 2350 50  0000 C CNN
F 1 "22p" V 6089 2350 50  0000 C CNN
F 2 "" H 6288 2200 50  0001 C CNN
F 3 "~" H 6250 2350 50  0001 C CNN
	1    6250 2350
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 617A7EFD
P 6250 2650
F 0 "C2" V 5998 2650 50  0000 C CNN
F 1 "22p" V 6089 2650 50  0000 C CNN
F 2 "" H 6288 2500 50  0001 C CNN
F 3 "~" H 6250 2650 50  0001 C CNN
	1    6250 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	5050 2600 5200 2600
Wire Wire Line
	5200 2600 5200 2650
Wire Wire Line
	5800 2650 6100 2650
Connection ~ 5800 2650
Wire Wire Line
	5050 2500 5200 2500
Wire Wire Line
	5200 2500 5200 2350
Wire Wire Line
	5800 2350 6100 2350
Connection ~ 5800 2350
$Comp
L power:GND #PWR?
U 1 1 617AACD8
P 6750 2550
F 0 "#PWR?" H 6750 2300 50  0001 C CNN
F 1 "GND" H 6755 2377 50  0000 C CNN
F 2 "" H 6750 2550 50  0001 C CNN
F 3 "" H 6750 2550 50  0001 C CNN
	1    6750 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2650 6550 2650
Wire Wire Line
	6550 2650 6550 2500
Wire Wire Line
	6550 2500 6750 2500
Wire Wire Line
	6750 2500 6750 2550
Wire Wire Line
	6400 2350 6550 2350
Wire Wire Line
	6550 2350 6550 2500
Connection ~ 6550 2500
$Comp
L power:+5V #PWR?
U 1 1 617AD9E8
P 4450 1350
F 0 "#PWR?" H 4450 1200 50  0001 C CNN
F 1 "+5V" H 4465 1523 50  0000 C CNN
F 2 "" H 4450 1350 50  0001 C CNN
F 3 "" H 4450 1350 50  0001 C CNN
	1    4450 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 1350 4450 1450
Wire Wire Line
	4550 1600 4550 1450
Wire Wire Line
	4550 1450 4450 1450
Connection ~ 4450 1450
Wire Wire Line
	4450 1450 4450 1600
$Comp
L power:GND #PWR?
U 1 1 617B093D
P 4450 4800
F 0 "#PWR?" H 4450 4550 50  0001 C CNN
F 1 "GND" H 4455 4627 50  0000 C CNN
F 2 "" H 4450 4800 50  0001 C CNN
F 3 "" H 4450 4800 50  0001 C CNN
	1    4450 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4800 4450 4600
$Comp
L Device:R R3
U 1 1 617B6ED4
P 5850 3650
F 0 "R3" H 5920 3696 50  0000 L CNN
F 1 "10k" H 5920 3605 50  0000 L CNN
F 2 "" V 5780 3650 50  0001 C CNN
F 3 "~" H 5850 3650 50  0001 C CNN
	1    5850 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 617B7433
P 6150 3800
F 0 "#PWR?" H 6150 3650 50  0001 C CNN
F 1 "+5V" H 6165 3973 50  0000 C CNN
F 2 "" H 6150 3800 50  0001 C CNN
F 3 "" H 6150 3800 50  0001 C CNN
	1    6150 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3400 5850 3400
Wire Wire Line
	5850 3800 5850 3850
Wire Wire Line
	6150 3850 6150 3800
Wire Wire Line
	5850 3500 5850 3400
Connection ~ 5850 3400
Wire Wire Line
	5850 3400 5950 3400
Wire Wire Line
	5050 3800 5350 3800
Wire Wire Line
	5350 3800 5350 4200
Wire Wire Line
	5350 4200 5450 4200
$Comp
L power:+5V #PWR?
U 1 1 6179DE6E
P 2200 2200
F 0 "#PWR?" H 2200 2050 50  0001 C CNN
F 1 "+5V" H 2215 2373 50  0000 C CNN
F 2 "" H 2200 2200 50  0001 C CNN
F 3 "" H 2200 2200 50  0001 C CNN
	1    2200 2200
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW1
U 1 1 617CAB6D
P 1850 2350
F 0 "SW1" H 1850 2585 50  0000 C CNN
F 1 "SW_SPST" H 1850 2494 50  0000 C CNN
F 2 "" H 1850 2350 50  0001 C CNN
F 3 "~" H 1850 2350 50  0001 C CNN
	1    1850 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3150 2200 3300
Wire Wire Line
	2050 2350 2200 2350
Wire Wire Line
	2200 2350 2200 2200
Wire Wire Line
	6150 4200 6150 3850
Connection ~ 6150 3850
Wire Wire Line
	7350 3300 7350 3800
Wire Wire Line
	5050 3300 7350 3300
Wire Wire Line
	7450 3200 7450 3800
Wire Wire Line
	5050 3200 7450 3200
Text Notes 7800 4500 0    50   ~ 0
OLED DISPLAY
Text Notes 7650 2200 0    50   ~ 0
MOTOR AND AUGER\n
Text Notes 5400 4400 0    50   ~ 0
USER INPUT BUTTON
Text Notes 1250 1900 0    50   ~ 0
POWER INPUT
Wire Wire Line
	2200 2450 2200 2350
Connection ~ 2200 2350
$Comp
L power:GND #PWR?
U 1 1 6182C10F
P 2200 3300
F 0 "#PWR?" H 2200 3050 50  0001 C CNN
F 1 "GND" H 2205 3127 50  0000 C CNN
F 2 "" H 2200 3300 50  0001 C CNN
F 3 "" H 2200 3300 50  0001 C CNN
	1    2200 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x05_Male J1
U 1 1 6182D46F
P 1450 4400
F 0 "J1" H 1558 4781 50  0000 C CNN
F 1 "Conn_01x05_Male" H 1558 4690 50  0000 C CNN
F 2 "" H 1450 4400 50  0001 C CNN
F 3 "~" H 1450 4400 50  0001 C CNN
	1    1450 4400
	1    0    0    -1  
$EndComp
Text Notes 1200 3900 0    50   ~ 0
UNO Programming Connection
Text Label 1950 4300 0    50   ~ 0
UNO_RESET
Text Label 1950 4400 0    50   ~ 0
UNO_RX
Text Label 1950 4500 0    50   ~ 0
UNO_TX
$Comp
L power:GND #PWR?
U 1 1 6182F112
P 1950 4700
F 0 "#PWR?" H 1950 4450 50  0001 C CNN
F 1 "GND" H 1955 4527 50  0000 C CNN
F 2 "" H 1950 4700 50  0001 C CNN
F 3 "" H 1950 4700 50  0001 C CNN
	1    1950 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61830FC9
P 1950 4150
F 0 "#PWR?" H 1950 4000 50  0001 C CNN
F 1 "+5V" H 1965 4323 50  0000 C CNN
F 2 "" H 1950 4150 50  0001 C CNN
F 3 "" H 1950 4150 50  0001 C CNN
	1    1950 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 4150 1950 4200
Wire Wire Line
	1950 4200 1650 4200
Wire Wire Line
	1650 4300 1950 4300
Wire Wire Line
	1950 4400 1650 4400
Wire Wire Line
	1650 4500 1950 4500
Wire Wire Line
	1650 4600 1950 4600
Wire Wire Line
	1950 4600 1950 4700
Text Label 5400 3700 0    50   ~ 0
UNO_TX
Text Label 5400 3600 0    50   ~ 0
UNO_RX
Text Label 5950 3400 0    50   ~ 0
UNO_RESET
Wire Wire Line
	5850 3850 6150 3850
Wire Wire Line
	5850 4200 6150 4200
$Comp
L Switch:SW_Push SW2
U 1 1 6183DA88
P 5650 4200
F 0 "SW2" H 5650 4485 50  0000 C CNN
F 1 "SPST Mom Btn" H 5650 4394 50  0000 C CNN
F 2 "" H 5650 4400 50  0001 C CNN
F 3 "~" H 5650 4400 50  0001 C CNN
	1    5650 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 2450 7050 2000
Wire Wire Line
	7050 2000 5050 2000
Wire Wire Line
	5200 2350 5800 2350
Wire Wire Line
	5200 2650 5800 2650
$EndSCHEMATC
