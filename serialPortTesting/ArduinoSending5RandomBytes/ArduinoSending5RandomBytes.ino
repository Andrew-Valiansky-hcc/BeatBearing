#include <SoftwareSerial.h>
SoftwareSerial mySerial(10, 11); // RX, TX

long randNumber;
int irandNumber;
byte b1;
byte b2;
byte b3;
byte b4;

void setup() {
  
  // Open serial communications and wait for port to open:
  Serial.begin(19200);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
  randomSeed(analogRead(0));


  
  pinStateL = B01000000;
  bitSet(pinStateL, 2); //pinState = B01000100 which is 68 decimal
 
  pinStateH = B11111111;
  bitClear(pinStateH, 2); //pinState = B11111011 which is 251 decimal

}

void loop() { // run over and over
  int i;
  randNumber = random(0,47483647);
  irandNumber = (int)randNumber;
  b = (byte)irandNumber;
  Serial.print(pinStateH);
  Serial.print("-");
  Serial.print(pinStateL);
  Serial.print("-");
  Serial.print(randNumber);
  Serial.print("-");
  Serial.print(b);
  Serial.println();  
  delay(500);
}
