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
L MCU_Module:Arduino_Nano_Every A1
U 1 1 6175DD1B
P 5250 2900
F 0 "A1" H 5250 1811 50  0000 C CNN
F 1 "Arduino_Nano" H 5250 1720 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5250 2900 50  0001 C CIN
F 3 "https://content.arduino.cc/assets/NANOEveryV3.0_sch.pdf" H 5250 2900 50  0001 C CNN
	1    5250 2900
	1    0    0    -1  
$EndComp
$Comp
L ssd1306:SSD1306 U1
U 1 1 6175E1D9
P 6550 4000
F 0 "U1" H 6980 4103 50  0000 L CNN
F 1 "SSD1306" H 6980 4012 50  0000 L CNN
F 2 "Display:SSD1306" H 6050 3450 50  0001 C CNN
F 3 "http://www.lcd-module.de/pdf/doma/t123-i2c.pdf" H 6400 4500 50  0001 C CNN
	1    6550 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 3400 6600 3400
Wire Wire Line
	6600 3400 6600 3500
Wire Wire Line
	6700 3500 6700 3300
Wire Wire Line
	6700 3300 5750 3300
Wire Wire Line
	6400 3500 6050 3500
Wire Wire Line
	6050 3500 6050 3900
Wire Wire Line
	6050 3900 5250 3900
Wire Wire Line
	6500 3500 6500 2550
Wire Wire Line
	6500 1800 5450 1800
Wire Wire Line
	5450 1800 5450 1900
$Comp
L Motor:Motor_Servo M1
U 1 1 6175F85B
P 7250 2550
F 0 "M1" H 7582 2615 50  0000 L CNN
F 1 "Motor_Servo" H 7582 2524 50  0000 L CNN
F 2 "" H 7250 2360 50  0001 C CNN
F 3 "http://forums.parallax.com/uploads/attachments/46831/74481.png" H 7250 2360 50  0001 C CNN
	1    7250 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 2650 6050 2650
Wire Wire Line
	6050 2650 6050 3500
Connection ~ 6050 3500
Wire Wire Line
	6950 2550 6500 2550
Connection ~ 6500 2550
Wire Wire Line
	6500 2550 6500 1800
Wire Wire Line
	4550 3100 4750 3100
Wire Wire Line
	6950 2450 6600 2450
Wire Wire Line
	6600 2450 6600 1700
Wire Wire Line
	6600 1700 4550 1700
Wire Wire Line
	4550 1700 4550 3100
$EndSCHEMATC
