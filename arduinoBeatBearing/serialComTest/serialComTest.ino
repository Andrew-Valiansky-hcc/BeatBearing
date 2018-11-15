//says "Goodnight moon!" over and over again
//putty and arduino serial monitor can not be listening simultaneously

#include <SoftwareSerial.h>

SoftwareSerial mySerial(10, 11); // RX, TX

void setup() {
  // Open serial communications and wait for port to open:
  Serial.begin(9600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }

  Serial.println("Goodnight moon!");
}

void loop() { // run over and over
  Serial.println("Goodnight moon!");
}
