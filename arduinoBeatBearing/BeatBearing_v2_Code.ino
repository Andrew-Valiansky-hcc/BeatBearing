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


void setup() {

  Serial.begin(19200);

  pinMode(A0_1, OUTPUT);  // set outputs      
  pinMode(A1_1, OUTPUT);
  pinMode(A2_1, OUTPUT);
  pinMode(A3_1, OUTPUT);

  pinMode(A0_2, OUTPUT);      
  pinMode(A1_2, OUTPUT);
  pinMode(A2_2, OUTPUT);
  pinMode(A3_2, OUTPUT);
}

void loop(){

  byte byteOut1 = B00000000;
  byte byteOut2 = B00000000;
  byte byteOut3 = B00000000;
  byte byteOut4 = B00000000;
  byte byteOut5 = B00000000;
  byte stopByte = B11111111;


  for (int a = 0; a < 32; a++) {  // first shift all old values up
    for (int b = 7; b > 0; b--) {
      stateMatrix[a][b] = stateMatrix[a][b-1];
    }
  }


  for (long count = 0; count < 16; count++) { // now get all the states 0-1024

    digitalWrite(A0_1, (count >> 3) & 1);
    digitalWrite(A1_1, (count >> 2) & 1);
    digitalWrite(A2_1, (count >> 1) & 1);
    digitalWrite(A3_1, (count >> 0) & 1);

    digitalWrite(A0_2, (count >> 3) & 1);
    digitalWrite(A1_2, (count >> 2) & 1);
    digitalWrite(A2_2, (count >> 1) & 1);
    digitalWrite(A3_2, (count >> 0) & 1);

    stateMatrix[count][0] = analogRead(Z_1);  // and insert new values at position 0
    stateMatrix[count + 16][0] = analogRead(Z_2);
  }


  for (int a = 0; a < 32; a++) { // now calculate averages
    averages[a] = 0;
    for (int b = 0; b < 8; b++) {
      averages[a] += stateMatrix[a][b];
    }
  }


  // determine binary state using thresholds
  for (int n = 0; n < 32; n++) {
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
  for (int n = 0; n < 7; n++) {
    if (bState[stateCount] == B1) {
      byteOut1 |= (1 << n); // then set to 1;
    } 
    else {
      byteOut1 &= ~(1 << n); // set to 0;
    }
    stateCount++;
  }

  // second byte
  for (int n = 0; n < 7; n++) {
    if (bState[stateCount] == B1) {
      byteOut2 |= (1 << n);  // then set to 1;
    } 
    else {
      byteOut2 &= ~(1 << n); // set to 0;
    }
    stateCount++;
  }

  // third byte
  for (int n = 0; n < 7; n++) {
    if (bState[stateCount] == B1) {
      byteOut3 |= (1 << n); // then set to 1;
    } 
    else {
      byteOut3 &= ~(1 << n); // set to 0;
    }
    stateCount++;
  }

  // fourth byte
  for (int n = 0; n < 7; n++) {
    if (bState[stateCount] == B1) {
      byteOut4 |= (1 << n);   // then set to 1;
    } 
    else {
      byteOut4 &= ~(1 << n);  // set to 0;
    }
    stateCount++;
  }

  // fifth byte (shorter than others)
  for (int n = 0; n < 4; n++) {
    if (bState[stateCount] == B1) {
      byteOut5 |= (1 << n);   // then set to 1;
    } 
    else {
      byteOut5 &= ~(1 << n);  // set to 0;
    }
    stateCount++;
  }

  // send the values over serial to Processing
 
  Serial.print("a: ");
  Serial.println(byteOut1);
  //delay(2000);
  Serial.print("b: ");
  Serial.println(byteOut2);
  //delay(2000);
  Serial.print("c: ");
  Serial.println(byteOut3);
  //delay(2000);
  Serial.print("d: ");
  Serial.println(byteOut4);
  //delay(2000);
  Serial.print("e: ");
  Serial.println(byteOut5);
  //delay(2000);
  Serial.print("f: ");
  Serial.println(stopByte);
  delay(2000);
  
} 
