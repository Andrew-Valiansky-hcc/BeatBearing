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
}

void loop() { // run over and over
  int i;
  randNumber = random(0,47483647);
  irandNumber = (int)randNumber;
  b1 = (byte)irandNumber;
  randNumber = random(0,47483647);
  irandNumber = (int)randNumber;
  b2 = (byte)irandNumber;
  randNumber = random(0,47483647);
  irandNumber = (int)randNumber;
  b3 = (byte)irandNumber;
  randNumber = random(0,47483647);
  irandNumber = (int)randNumber;
  b4 = (byte)irandNumber;
  Serial.print(b1);
  Serial.print("-");
  Serial.print(b2);
  Serial.print("-");
  Serial.print(b3);
  Serial.print("-");
  Serial.print(b4);
  Serial.println();  
}
