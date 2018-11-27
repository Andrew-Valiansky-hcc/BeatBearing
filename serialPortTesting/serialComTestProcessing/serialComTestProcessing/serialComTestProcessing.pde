import processing.serial.*;

Serial myPort;
String val;

void setup()
{
  //String portName = Serial.list()[0]; //uncomment to see list of serial ports
  myPort = new Serial(this, "COM11", 19200);
}

void draw()
{
  if ( myPort.available() > 0)  { 
  val = myPort.readStringUntil('\n');  // read it and store it in val
  val = trim(val); //trim white space including strip carriage return and line feed
  } 
  println(val); //print it out in the console
}