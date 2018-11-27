#include <SoftwareSerial.h>
SoftwareSerial mySerial(10, 11); // RX, TX
byte pinStateL;
byte pinStateH;

void setup() {
  
  // Open serial communications and wait for port to open:
  Serial.begin(19200);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  pinStateL = B01000000;
  bitSet(pinStateL, 2); //pinState = B01000100 which is 68 decimal
 
  pinStateH = B11111111;
  bitClear(pinStateH, 2); //pinState = B11111011 which is 251 decimal

}

void loop() { // run over and over
  int i;
  Serial.print(pinStateH);
  Serial.print("-");
  Serial.print(pinStateL);
  Serial.println();  
  delay(500);
}
