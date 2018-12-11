import processing.serial.*;

Serial myPort;
String val;
int bytes=0;

void setup() {
  //String portName = Serial.list()[0]; //uncomment to see list of serial ports
  myPort = new Serial(this, "COM11", 19200);
}

void draw() {
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

    int[] nums = int(split(val, '-')); // now have numbers inbetween the '-' seperator sent by the arduino
    if (nums.length==4){
      String ba1 = binary(nums[0]).substring(24); // turning the numbers into 101101 etc.
      String ba2 = binary(nums[1]).substring(24);
      String ba3 = binary(nums[2]).substring(24);
      String ba4 = binary(nums[3]).substring(24);
      String ba = ba1+ba2+ba3+ba4; //now have text string of all the balls that can print
      bytes=ba.length(); // starting loop to convert the string characters into boolean
      boolean barray;
      String iarray;
      for (int n = 0; n < bytes; n++) { //stepping through 32 balls, creating boolean array
        iarray = ba.substring(n,n+1);
        if (iarray.equals("0")) {barray=false;} 
        else {barray=true;}
        print(barray);
      }
      println();
      println(val);
      println(ba);
    }
  }
}