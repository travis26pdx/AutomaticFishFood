#include <Servo.h> 
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels

// Declaration for an SSD1306 display connected to I2C (SDA, SCL pins)
// The pins for I2C are defined by the Wire-library. 
// On an arduino UNO/Nano:       A4(SDA), A5(SCL)
// On an arduino MEGA 2560: 20(SDA), 21(SCL)
#define OLED_RESET     4 // Reset pin # (or -1 if sharing Arduino reset pin)
#define SCREEN_ADDRESS 0x3C ///< See datasheet for Address; 0x3D for 128x64, 0x3C for 128x32
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

Servo myservo;  // create servo object to control a servo 
                // a maximum of eight servo objects can be created 

int pos = 0;    // variable to store the servo position 

long FEEDERDELAY = 43200000; // 12 hours between feeding
long endtime; 
long now;
long remaining;
long hours;
long minutes;
long seconds;

char CLKString[20];

void setup() { 

  Serial.begin(9600);

  // SSD1306_SWITCHCAPVCC = generate display voltage from 3.3V internally
  if(!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS)) {
    Serial.println(F("SSD1306 allocation failed"));
    for(;;); // Don't proceed, loop forever
  }

  myservo.attach(9);  // attaches the servo on pin 9 to the servo object 
  myservo.write(0);

  // Show initial display buffer contents on the screen --
  // the library initializes this with an Adafruit splash screen.
  display.display();
  delay(2000); // Pause for 2 seconds

}
 
void loop() { 

  now = millis();
  endtime = now + FEEDERDELAY;
  
  while(now < endtime) {
    
    now = millis();
    remaining = (endtime - now) / 1000;
  
    hours = remaining / 3600;
    minutes = (remaining - (hours * 3600)) / 60;
    seconds = (remaining - (hours * 3600)) - (minutes * 60);

    display.clearDisplay();
    display.setTextSize(2);
    display.setTextColor(WHITE);
    display.setCursor( 0 , 0 );
    display.print( "Next Feed:" );
    
    sprintf( CLKString, "%02d:%02d:%02d", hours, minutes, seconds);        
    display.setCursor( 0 , 30 );
    display.print( CLKString );
        
    display.display();

    
    delay(1000);
  }
  
  for(int i = 0; i <=4; i++)            // Repeats auger 5 times
  {
    for(pos = 0; pos < 180; pos += 2)   // goes from 0 degrees to 180 degrees 
    {                                   // in steps of 2 degrees
      myservo.write(pos);               // tell servo to go to position in variable 'pos' 
      delay(8);                         // waits 8ms for the servo to reach the position 
    } 
    for(pos = 180; pos>=1; pos-=2)      // goes from 180 degrees to 0 degrees 
    {                                
      myservo.write(pos);               // tell servo to go to position in variable 'pos' 
      delay(8);                         // waits 8ms for the servo to reach the position 
    }
  }
}
