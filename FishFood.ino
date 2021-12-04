# Automatic Fish Feeder
# This is code for an automatic fish feeder that rotates a servo motor at timed intervals that can be incremented when pressing a button.
# PSU Team 6 - Zak Smith, Travis Johnson, Trueman Singleton and Mohammad Aladwani
# Dec 2021


#include <Servo.h>
#include <Wire.h>

#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>


#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels

#define BUTTONPIN 5 // Push button input pin // pin 11
#define LEDPIN 6
long lastRemaining = 0;

// Declaration for an SSD1306 display connected to I2C (SDA, SCL pins)
// The pins for I2C are defined by the Wire-library.
// On an arduino UNO/Nano:       A4(SDA), A5(SCL)
// On an arduino MEGA 2560: 20(SDA), 21(SCL)

#define OLED_RESET     4 // Reset pin # (or -1 if sharing Arduino reset pin)
#define SCREEN_ADDRESS 0x3C ///< See datasheet for Address; 0x3D for 128x64, 0x3C for 128x32
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

// Servo variables
Servo myservo;  // create servo object to control a servo
// a maximum of eight servo objects can be created

int pos = 0;    // variable to store the servo position

// Timing Variables
//long feederDelay = 6000; // 1 minute between feeding
long feederDelay = 43200000; // 12 hours between feeding
long feederDelayIncrement = feederDelay; // Increment feederDelay
long feederDelayMax = feederDelay * 6; // delay cannot exceed 6 times initial value: 3 days

long endtime;
long now;
long remaining;
long hours;
long minutes;
long seconds;
long hour = 3600; // 3600000 milliseconds in an hour
long minute = 60; // 60000 milliseconds in a minute
long second =  1; // 1000 milliseconds in a second

// Button Variables
boolean buttonState = LOW;
boolean lastButtonState = LOW;
int holdEventOccur = 0;
unsigned long offTime = millis(); // Time when button is released (off)
unsigned long onTime = millis();  // Time when button is pressed (on)
unsigned long holdTime = millis(); // Time button is held down
int debounce = 20; // Time to eliminate bounce signals
int holdEventTime = 1000; // Time in ms that button to be held to produce hold event

boolean ledState = LOW;

///////////////////////
// *** Functions *** //
///////////////////////

void setup() {

  Serial.begin(9600);

  // SSD1306_SWITCHCAPVCC = generate display voltage from 3.3V internally
  
  if (!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS)) {
    Serial.println(F("SSD1306 allocation failed"));
    for (;;); // Don't proceed, loop forever
  }
  
  myservo.attach(9);  // attaches the servo on pin 9 to the servo object
  myservo.write(0);
  

  pinMode(BUTTONPIN,INPUT); // initialize button
  digitalWrite(BUTTONPIN,LOW); // Set button pin state to low

  pinMode(LEDPIN,OUTPUT);
  digitalWrite(LEDPIN,ledState);

  // Show initial display buffer contents on the screen --
  // the library initializes this with an Adafruit splash screen.
  
  display.display();
  delay(2000); // Pause for 2 seconds
  

  initTimer();
}

int getButtonEvent() {
  // default return 
  int buttonEvent = 0;

  // get button state
  buttonState = digitalRead(BUTTONPIN);
  
  // get button press/release status
  if (buttonState == HIGH && lastButtonState == LOW && (millis() - offTime) > debounce) {
    // button is pressed
    onTime = millis();
    Serial.println("Button Pressed");
    
  } else if (buttonState == HIGH && lastButtonState == HIGH && (millis() - offTime) > debounce ) {
    // button is being held down
    holdTime = millis();
    if (holdTime - onTime >= holdEventTime && holdEventOccur == 0) {
      // hold click event
      holdEventOccur = 1; // hold event flag so hold event occurs once per hold
      buttonEvent = 2; 
    }
  } else if (buttonState == LOW && lastButtonState == HIGH && (millis() - onTime) > debounce) {
    // button is released
    offTime = millis();
    holdEventOccur = 0; // reset hold event flag upon release
    Serial.println("Button Released");
    
    if (offTime - onTime < holdEventTime) {
      // single click event
      buttonEvent = 1; 
    } 
  }
  
  lastButtonState = buttonState;

  return buttonEvent;
}

void clickEvent() {
  Serial.println("Click Event: Increase time.");
  // Increment Delay Interval by 12 hours
  feederDelay = feederDelay + feederDelayIncrement;
  if (feederDelay > feederDelayMax) {
    feederDelay = feederDelayIncrement;
  }
  initTimer();
  delay(20);
}

void holdEvent() {
  Serial.println("Hold Event: Dispense Food");
  // Dispense Food
  dispenseFood();
  initTimer();
  delay(20);
}


void dispenseFood() {
  for (int i = 0; i <= 4; i++)          // Repeats auger 5 times
  {
    for (pos = 0; pos < 180; pos += 2)  // goes from 0 degrees to 180 degrees
    { // in steps of 2 degrees
      myservo.write(pos);               // tell servo to go to position in variable 'pos'
      delay(8);                         // waits 8ms for the servo to reach the position
    }
    for (pos = 180; pos >= 1; pos -= 2) // goes from 180 degrees to 0 degrees
    {
      myservo.write(pos);               // tell servo to go to position in variable 'pos'
      delay(8);                         // waits 8ms for the servo to reach the position
    }
  }
}


void initTimer() {
  Serial.println("Reset Timer");
  now = millis();
  endtime = now + feederDelay; 
}

void loop() {

  // get button event
  int b = getButtonEvent();
  if (b == 1) { clickEvent(); }
  if (b == 2) { holdEvent(); }

  if (now < endtime) {

    now = millis();
    remaining = (endtime - now) / 1000;

    hours = remaining / hour;
    minutes = (remaining % hour) / minute;
    seconds = ((remaining % hour) % minute) / second;

    // display time. limit the display to once per second.
    if (remaining != lastRemaining) {
      Serial.println(seconds);
      lastRemaining = remaining;
          
      display.clearDisplay();
      display.setTextSize(2);
      display.setTextColor(WHITE);
      
      display.setCursor( 0 , 0 );
      display.print( "Next Feed:" );
  
      display.setCursor( 0 , 30 );
      display.print(hours); display.print(":"); display.print(minutes); display.print(":"); display.print(seconds);
  
      display.display();
      
    }
    
  } else {
    holdEvent();
  }

}
