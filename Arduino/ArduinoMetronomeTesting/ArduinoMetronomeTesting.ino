#include <SoftwareSerial.h>
SoftwareSerial mySerial(10, 11); // RX, TX

long randNumber;
int irandNumber;
byte b1;
byte b2;
byte b3;
byte b4;
byte b5;
int metronone;
int maxMetronome = 50; //must match maxMetronome in processing and python
bool noBeatBearingBoard = true;


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
  metronone++;
  if (metronone>(maxMetronome-1)) metronone=0;
  b5 = (byte)metronone;
  
  if (noBeatBearingBoard) { //test data that changes ball locations so processing will run without beatBearingBoard
    //this if command only changes the beat bearing simulation (at random) three times per pass on the board
    if ((metronone==0) or (metronone == maxMetronome/3) or (metronone == maxMetronome*2/3)) {
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
    }
  } else {

    //put normal ball bearing code here
    
  }
  Serial.print(b1);
  Serial.print("-");
  Serial.print(b2);
  Serial.print("-");
  Serial.print(b3);
  Serial.print("-");
  Serial.print(b4);
  Serial.print("-");
  Serial.print(b5);
  Serial.println();
  delay(10); //has to be a least 1, leaving it a zero causes processing to start dropping data
    
}
