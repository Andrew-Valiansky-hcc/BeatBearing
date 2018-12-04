
void serialSetup() 
{
  // print out available serial inputs
  // printArray(Serial.list());
  
  // set the serial input
  // run this program once, and then copy and paste from the list printed out
  myPort = new Serial(this, "COM11", 19200);

  // serial is now set up
  serialIsSetup = true;
}

void serialLoop() {
  boolean[] barray = new boolean [32];
  String val="0";
  int bytes=0;
  
  //get characters from serial port and put in a string
  if ( myPort.available() > 0)  { 
  val = myPort.readStringUntil('\n');  // read it and store it in val
  val = trim(val); //trim white space including strip carriage return and line feed
  }
  
  //parce the string into bytes
  if (val==null) {
     //don't do anything if a null
  } else {
    // look for a - between numbers that were transmitted as strings

    int[] nums = int(split(val, '-')); // now numbers inbetween the '-' seperator sent by the arduino are in nums

    if (nums.length==5) {
      String ba1 = binary(nums[0]).substring(24); // turning the numbers into 101101 etc.
      String ba2 = binary(nums[1]).substring(24);
      String ba3 = binary(nums[2]).substring(24);
      String ba4 = binary(nums[3]).substring(24);
      time.current = float(nums[4])/maxMetronome;
   
      String ba = ba1+ba2+ba3+ba4; //now have text string of all the balls that can print
      bytes=ba.length(); // starting loop to convert the string characters into boolean
      String iarray;
      for (int n = 0; n < bytes; n++) {
        iarray = ba.substring(n,n+1);
        if (iarray.equals("0")) {barray[n]=false;} 
        else {barray[n]=true;}
      } 
      println(time.current);
      println(val);
      println(ba);
    }
  }
  
  // Mapping between serial input (barray) and ball position (bArray.on)
  // 
  // By not tracking the order of wiring up the multiplexers you've saved some time,
  //   but now you're going to have to put the balls in the right order.
  //
  // Start by placing a single ball on your grid, and see what position it turns up on the virtual grid.
  // Then adjust the number in inputArray[x] so that the physical and virtual balls align
  // This may take some trial and error!
  
  // 1st row (starting from top left)
  bArray[0].on = barray[1]; 
  bArray[1].on = barray[5]; 
  bArray[2].on = barray[13]; 
  bArray[3].on = barray[11]; 
  bArray[4].on = barray[2]; 
  bArray[5].on = barray[6]; 
  bArray[6].on = barray[4]; 
  bArray[7].on = barray[14]; 
  // 2nd row
  bArray[8].on = barray[7]; 
  bArray[9].on = barray[9]; 
  bArray[10].on = barray[15]; 
  bArray[11].on = barray[3]; 
  bArray[12].on = barray[0]; 
  bArray[13].on = barray[8]; 
  bArray[14].on = barray[12]; 
  bArray[15].on = barray[10]; 
  // 3rd row
  bArray[16].on = barray[20];
  bArray[17].on = barray[24];
  bArray[18].on = barray[18];
  bArray[19].on = barray[22];
  bArray[20].on = barray[23];
  bArray[21].on = barray[19];
  bArray[22].on = barray[29];
  bArray[23].on = barray[25];
  // 4th row
  bArray[24].on = barray[28];
  bArray[25].on = barray[30];
  bArray[26].on = barray[16];
  bArray[27].on = barray[26];
  bArray[28].on = barray[17];
  bArray[29].on = barray[21];
  bArray[30].on = barray[31];
  bArray[31].on = barray[27];

  /*
  //original instruments that are now in python csound code 
  //exact replacement for these instruments has not been found
  // cowbell
   // hihat
   // snare
   // kick
  */
}

void noListenToArduino() {
  
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