//------------------------------------
// TTime class
//------------------------------------

class TTime {
  
  // current time between 0 and 1
  float current;
  
  // current position in pixels
  float pos;

  // previous time value between 0 and 1
  float last;

  TTime () {
  } 

  void update() {
    // last time becomes current time
    last = current;

    // calculate the current position in pixels
    pos = x1 - (xGap/2) + (current * (xSize + xGap));
  }

  void drawLine() {
    // thickness of the line
    strokeWeight(8);
    
    // set line colour to red
    stroke(255, 0, 0);
    
    // draw the line
    line(pos, 0, pos, height);
  }
}
 
  