
void serialSetup() 
{
  // print out available serial inputs
  printArray(Serial.list());
  
  // set the serial input
  // run this program once, and then copy and paste from the list printed out
  myPort = new Serial(this, "COM11", 19200);
  
  // buffer 6 bytes at a time
  myPort.buffer(6);

  // serial is now set up
  serialIsSetup = true;
}

void serialLoop()
{

  // Print out the six input bytes in binary.
  // Only uncomment if needed for debugging
  /*
   print(binary(inBuffer[0]) + " " + binary(inBuffer[1]) + " " 
   + binary(inBuffer[2]) + " " + binary(inBuffer[3]) + " "
   + binary(inBuffer[4]) + " " + binary(inBuffer[5]) + " "
   + "\n");
   */


  // Now decode the input bytes and put into the inputArray
  // first byte
  inputArray[0] = inBuffer[0] & 1;
  inputArray[1] = (inBuffer[0] >> 1) & 1;
  inputArray[2] = (inBuffer[0] >> 2) & 1;
  inputArray[3] = (inBuffer[0] >> 3) & 1;
  inputArray[4] = (inBuffer[0] >> 4) & 1;
  inputArray[5] = (inBuffer[0] >> 5) & 1;
  inputArray[6] = (inBuffer[0] >> 6) & 1;  
  // second byte
  inputArray[7] = inBuffer[1] & 1;
  inputArray[8] = (inBuffer[1] >> 1) & 1;
  inputArray[9] = (inBuffer[1] >> 2) & 1;
  inputArray[10] = (inBuffer[1] >> 3) & 1;
  inputArray[11] = (inBuffer[1] >> 4) & 1;
  inputArray[12] = (inBuffer[1] >> 5) & 1;
  inputArray[13] = (inBuffer[1] >> 6) & 1;
  // third byte
  inputArray[14] = inBuffer[2] & 1;
  inputArray[15] = (inBuffer[2] >> 1) & 1;
  inputArray[16] = (inBuffer[2] >> 2) & 1;
  inputArray[17] = (inBuffer[2] >> 3) & 1;
  inputArray[18] = (inBuffer[2] >> 4) & 1;
  inputArray[19] = (inBuffer[2] >> 5) & 1;
  inputArray[20] = (inBuffer[2] >> 6) & 1;
  // fourth byte
  inputArray[21] = inBuffer[3] & 1;
  inputArray[22] = (inBuffer[3] >> 1) & 1;
  inputArray[23] = (inBuffer[3] >> 2) & 1;
  inputArray[24] = (inBuffer[3] >> 3) & 1;
  inputArray[25] = (inBuffer[3] >> 4) & 1;
  inputArray[26] = (inBuffer[3] >> 5) & 1;
  inputArray[27] = (inBuffer[3] >> 6) & 1;
  // fifth byte
  inputArray[28] = inBuffer[4] & 1;
  inputArray[29] = (inBuffer[4] >> 1) & 1;
  inputArray[30] = (inBuffer[4] >> 2) & 1;
  inputArray[31] = (inBuffer[4] >> 3) & 1;


  // Print out the inputArray to check that it's working
  // uncomment to use
  println(inputArray);


  // Mapping between serial input and ball position
  // 
  // By not tracking the order of wiring up the multiplexers you've saved some time,
  //   but now you're going to have to put the balls in the right order.
  //
  // Start by placing a single ball on your grid, and see what position it turns up on the virtual grid.
  // Then adjust the number in inputArray[x] so that the physical and virtual balls align
  // This may take some trial and error!
  
  // 1st row (starting from top left)
  bArray[0].on = boolean(inputArray[1]); 
  bArray[1].on = boolean(inputArray[5]); 
  bArray[2].on = boolean(inputArray[13]); 
  bArray[3].on = boolean(inputArray[11]); 
  bArray[4].on = boolean(inputArray[2]); 
  bArray[5].on = boolean(inputArray[6]); 
  bArray[6].on = boolean(inputArray[4]); 
  bArray[7].on = boolean(inputArray[14]); 
  // 2nd row
  bArray[8].on = boolean(inputArray[7]); 
  bArray[9].on = boolean(inputArray[9]); 
  bArray[10].on = boolean(inputArray[15]); 
  bArray[11].on = boolean(inputArray[3]); 
  bArray[12].on = boolean(inputArray[0]); 
  bArray[13].on = boolean(inputArray[8]); 
  bArray[14].on = boolean(inputArray[12]); 
  bArray[15].on = boolean(inputArray[10]); 
  // 3rd row
  bArray[16].on = boolean(inputArray[20]);
  bArray[17].on = boolean(inputArray[24]);
  bArray[18].on = boolean(inputArray[18]);
  bArray[19].on = boolean(inputArray[22]);
  bArray[20].on = boolean(inputArray[23]);
  bArray[21].on = boolean(inputArray[19]);
  bArray[22].on = boolean(inputArray[29]);
  bArray[23].on = boolean(inputArray[25]);
  // 4th row
  bArray[24].on = boolean(inputArray[28]);
  bArray[25].on = boolean(inputArray[30]);
  bArray[26].on = boolean(inputArray[16]);
  bArray[27].on = boolean(inputArray[26]);
  bArray[28].on = boolean(inputArray[17]);
  bArray[29].on = boolean(inputArray[21]);
  bArray[30].on = boolean(inputArray[31]);
  bArray[31].on = boolean(inputArray[27]);


  //------TEST BEAT 1------
  // plays one beat in each row
  // uncomment to test
  /*
  // cowbell
   bArray[6].on = true;
   // hihat
   bArray[12].on = true;
   // snare
   bArray[18].on = true;
   // kick
   bArray[24].on = true;
  */


  //------TEST BEAT 2------
  // plays a simple beat
  // uncomment to test
  /*
  // cowbell
   bArray[5].on = true;
   bArray[6].on = true;
   
   // hihat
   bArray[9].on = true;
   bArray[11].on = true;
   bArray[13].on = true;
   bArray[15].on = true;
   
   // snare
   bArray[18].on = true;
   bArray[22].on = true;
   
   // kick 
   bArray[24].on = true;
   bArray[26].on = true;
   bArray[28].on = true;
   bArray[30].on = true;
   */
}


void serialEvent(Serial p) {
  // this function is called when a byte is recieved
  // read bytes into correct position using the 'full-stop' byte
 
  inByte = myPort.readBytes();

  int stopPos = 0;

  for (int n = 0; n < 6; n++) {
    if (inByte[n] == -1) {
      stopPos = n;
    } 
  }
  inBuffer[0] = inByte[(stopPos+1)%6];
  inBuffer[1] = inByte[(stopPos+2)%6];
  inBuffer[2] = inByte[(stopPos+3)%6];
  inBuffer[3] = inByte[(stopPos+4)%6];
  inBuffer[4] = inByte[(stopPos+5)%6];

  // print out the input byte if needed for debugging
  //println(inByte);
  
}

//this will only execute if arduinoTest=True
//see top level module .. simulates serial port

void listenArduino() {
  
  /* creating range of values that simulate what is coming from the arduino and
and put them in the variable time.current */

  time.current = time.current + 0.01; //change the incrementing value change line speed
  if (((time.current) > (maxCurrent))){
    time.current=0.0;
    float randomBarray;
  
    for (int n = 0; n < bArray.length; n++) {
      randomBarray = random(-1,1);
      if (randomBarray>0) {
          bArray[n].on = true;
      } else {
          bArray[n].on = false;
      }
  
    }
  }    
}