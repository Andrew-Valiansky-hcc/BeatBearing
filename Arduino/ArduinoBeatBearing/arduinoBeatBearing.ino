//Howard Community College fall 2018
// Original source www.beatbearing.co.uk 2009
#include <SoftwareSerial.h>
SoftwareSerial mySerial(10, 11); // RX, TX

//these variables are associated with the muxes ... can not use 32 wires ... using 10 instead
int A0_1 = 2;  // declare output pins
int A1_1 = 3;
int A2_1 = 4;
int A3_1 = 5;
int A0_2 = 6;
int A1_2 = 7;
int A2_2 = 8;
int A3_2 = 9;

int Z_1 = 0;  // declare input pins
int Z_2 = 1;

//these variables are associated with the beat bearing board
//it is complicated because needs to handle the balls bouncing

int thresholdLow = 3000;
int thresholdHigh = 7000;

int stateMatrix[32][8] = { // stores all of the values.
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0};           

int averages[32] = { // stores all of the values.
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0};           


boolean bState[32] = {
  B0, B0, B0, B0, B0, B0, B0, B0,
  B0, B0, B0, B0, B0, B0, B0, B0,
  B0, B0, B0, B0, B0, B0, B0, B0,
  B0, B0, B0, B0, B0, B0, B0, B0};

//these variables are associated with sending ball location serially
long randNumber;
int irandNumber;
byte b1;
byte b2;
byte b3;
byte b4;
byte b5;
int metronone;
int maxMetronome = 48; //must match maxMetronome in processing and python
bool noBeatBearingBoard = true; //use this to generate random numbers if the beatbearingboard is not attached

void setup() 
{ 
  // Open serial communications and wait for port to open:
  Serial.begin(19200);
  while (!Serial) 
  {
    ; // wait for serial port to connect. Needed for native USB port only
  }
  randomSeed(analogRead(0));

  pinMode(A0_1, OUTPUT);  // set outputs      
  pinMode(A1_1, OUTPUT);
  pinMode(A2_1, OUTPUT);
  pinMode(A3_1, OUTPUT);

  pinMode(A0_2, OUTPUT);      
  pinMode(A1_2, OUTPUT);
  pinMode(A2_2, OUTPUT);
  pinMode(A3_2, OUTPUT);
}

void loop() 
{ // run over and over
  int i;
  metronone++;
  if (metronone>(maxMetronome-1)) metronone=0;
  b5 = (byte)metronone;
  
    if (noBeatBearingBoard) { //test data that changes ball locations so processing will run without beatBearingBoard
      //this if command only changes the beat bearing simulation (at random) three times per pass on the board
      
      if ((metronone==0) or (metronone == maxMetronome/3) or (metronone == maxMetronome*2/3)) 
      {
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
    } 
    else //this actually looks for balls on the beatbearingboard and computes b1,b2,b3 and b4 without random numbers
    {
      // stateMatrix stores last 8 positions of each ball 
      // begin by moving ball value from 7<=6, now 6 is in 7 and 6, old 7 is lost
      // then move ball value from 6<=5 now, old 6 is in 7, old 5 is in 6  and 5 ....
      // continues until 1<=0, old 0 is put in 1, and now 0 is ready to be overwritten
      // by new look at the balls
      
      for (int a = 0; a < 32; a++) {                                
        for (int b = 7; b > 0; b--) {
         stateMatrix[a][b] = stateMatrix[a][b-1];
        }
      }
      
      // now get all 32 ball states from the mux   
      for (long count = 0; count < 16; count++) 
        { 
          digitalWrite(A0_1, (count >> 3) & 1);
          digitalWrite(A1_1, (count >> 2) & 1);
          digitalWrite(A2_1, (count >> 1) & 1);
          digitalWrite(A3_1, (count >> 0) & 1);
      
          digitalWrite(A0_2, (count >> 3) & 1);
          digitalWrite(A1_2, (count >> 2) & 1);
          digitalWrite(A2_2, (count >> 1) & 1);
          digitalWrite(A3_2, (count >> 0) & 1);
          // now have information to put ball information into position 0 of the "ball" history
          stateMatrix[count][0] = analogRead(Z_1);  // and insert new values at position 0
          stateMatrix[count + 16][0] = analogRead(Z_2);
        }
 
        // now calculate averages by adding up all the ball histories
        for (int a = 0; a < 32; a++) 
        { 
          averages[a] = 0;
          for (int b = 0; b < 8; b++) 
          {
            averages[a] += stateMatrix[a][b];
          }
        }
        
        // determine binary state using thresholds 3000 and 7000
        // if ball was located in each of 8 historys, then 1023*8 = 8184
        // so this is active low .. meaning 1 if ball is not present, 0 if is present
        
        for (int n = 0; n < 32; n++) 
        {
          if ((bState[n] == B0) && (averages[n] < (thresholdLow))) {  // last sure value was 0 AND below low threshold
            bState[n] = B1;                                           // then set to 1;
          } 
          else if ((bState[n] == B1) && (averages[n] > (thresholdHigh))){  // last sure value was 1 AND over high threshold
            bState[n] = B0;                                                // set to 0;
          }
        }

        // now assemble the output bytes
        int stateCount = 0;
      
        // first byte
        for (int n = 0; n < 8; n++) {
          if (bState[stateCount] == B1) {
            b1 |= (1 << n); // then set to 1;
          } else {
            b1 &= ~(1 << n); // set to 0;
          }
          stateCount++;
        }
      
        // second byte
        for (int n = 0; n < 8; n++) {
          if (bState[stateCount] == B1) {
            b2 |= (1 << n);  // then set to 1;
          } else {
            b2 &= ~(1 << n); // set to 0;
          }
          stateCount++;
        }
      
        // third byte
        for (int n = 0; n < 8; n++) {
          if (bState[stateCount] == B1) 
          {
            b3 |= (1 << n); // then set to 1;
          } else {
            b3 &= ~(1 << n); // set to 0;
          }
          stateCount++;
        }
      
        // fourth byte
        for (int n = 0; n < 8; n++) {
          if (bState[stateCount] == B1) {
            b4 |= (1 << n);   // then set to 1;
          } else {
            b4 &= ~(1 << n);  // set to 0;
          }
          stateCount++;
        }    
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
