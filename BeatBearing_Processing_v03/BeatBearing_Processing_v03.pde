//------------------------------------
// BeatBearing - Tangible Rhythm Sequencer
// MAKE vol.17
//------------------------------------
// Peter Bennett
// pete@petecube.com
//
// Homepage:     www.sarc.qub.ac.uk/~pbennett
// Blog:         petes-sonic-art-research.blogspot.com
// BeatBearing:  www.beatbearing.co.uk
//------------------------------------
// Please refer to the Forum at www.beatbearing.co.uk 
// before emailing me with questions!
//
// Please remember that this software was written as a prototype, 
// and may take some tweaking to work with your specific hardware!
//------------------------------------
// FOR TESTING WITHOUT HARDWARE, please uncomment the test beats provided in the 'serial_input' tab
//------------------------------------

// Import libraries. Make sure you have installed OscP5 and ProMIDI

import processing.serial.*;


// Sequencer variables

int endPoint = 1024;
boolean sequencerIsSetup = false;
// bpm runs at half of this speed
float bpm = 200;

// Serial variables 
Serial myPort;                                                                        
byte[] inBuffer = new byte[20];
int[] inputArray = new int[32];
byte[] inByte = new byte[20];
boolean serialIsSetup = false;

// 2nd monitors screen width
int displayWidth = 640;                     
// 2nd monitors screen height
int displayHeight = 480;                                                              

// top left corner
int x1 = 66;
int y1 = 128;
// bottom right corner
int x2 = 593;
int y2 = 334;


//int xOffset = x1;
//int yOffset = y1;
int xSize = x2 - x1;
int ySize = y2 - y1;

float ballSize = 30;
float ringWidth = 30;

// Number of columns 
int colTotal = 8;
// Number or rows
int rowTotal = 4;

// Number of balls
int ballTotal = rowTotal * colTotal;     

// Gap between elements on the grid
float xGap, yGap;

// Create array to hold Bearings class
TBearing[] bArray = new TBearing[ballTotal];
TTime time = new TTime();



//------------------------------------
//              SETUP
//------------------------------------

void setup() {

  // Set size & openGL mode
  size(displayWidth, displayHeight);

  // Set background black
  background(0);

  // Move sketch frame left onto 2nd screen
  // you may need to change the values depending on where your second monitor is
  // the function takes X and Y parameters with top left of primary screen as (0, 0)
  frame.setLocation(-displayWidth, 0);
  
  // For testing move frame to top left of primary screen.
  // comment-out this line when you want to use your secondary screen
  frame.setLocation(0, 0);                                              

  // Turn smoothing on. Comment out this line if the sketch is running slowly.
  smooth();                                                                          

  // Setup the serial connection 
  serialSetup();

  // This for-loop sets up the "Bearing" array
  float colPos = 0;
  float rowPos = 0;
  for (int n = 0; n < bArray.length; n++) {

    // the timePosTemp is used to set at which poiint of the loop each Bearing is in the sequence
    float timePosTemp = (colPos+1) * (1 / float(colTotal)) - ((1 / float(colTotal))/2);               

    // Create a new Bearing object in each element of array
    bArray[n] = new TBearing(colPos, rowPos, timePosTemp, int(rowPos));        

    // increase the column count
    colPos++;

    // if the column count is greater than the number of columns, then reset column count and increment the row count.
    if (colPos >= colTotal) {
      colPos = 0;
      rowPos++; 
    }    
  }
}



//------------------------------------
//            DRAW LOOP
//------------------------------------
void draw() {

  // Clear the background (make it black)
  background(0);

  // Set up the pen
  stroke(0);
  strokeWeight(1);
  fill(0);

  // Only start the main loop if everything is setup
  if(serialIsSetup) {

    serialLoop();

    // Cycle through balls and draw a circle if ON
    for (int n = 0; n < bArray.length; n++) {                                          
      bArray[n].update();
      bArray[n].drawRing();
      bArray[n].drawOnOff();
    }
    
    // update time
    time.update();
    
    // draw the red line
    time.drawLine();

    //green rectangle for helping align the software grid with your hardware grid
    // un-comment to turn  on the grid
    //setGrid(); 

  }
}