//------------------------------------
// TBearing class
//------------------------------------

class TBearing {

  // position, size, and position in time of each ball
  float xPos, yPos, diameter, timePos;

  // is the ball on, and has it been triggered so far?
  boolean on, triggered;

  // which sound the ball plays, and column and row position
  int sound, colPos, rowPos;

  // the ringstate controls the fade of the ring around each ball
  float ringState = 255;

  

  TBearing(float x, float y, float t, int s) {
    colPos = int(x);
    rowPos = int(y);

    updateGrid();

    on =  false;
    timePos = t;  
    triggered = false;
  }


  void update() {


    if (!on) {
      // if the ball is not on...
      // then untrigger       
      triggered = false;

    }    

    if (time.current < time.last) {          
      // untrigger when time wraps back round to the beginning     
      triggered = false;
    }    

    // reduce the value of ringstate
    // this causes the fade in the rings
    // adjust the value if needed
    ringState *= 0.94;

   
    
    // if the time line has gone past or is on the ball, 
    // and the note hasn't already been triggered,
    // and the ball is on, 
    // then make a sound, and reset the ringState to full.
    if ((timePos <= (time.current)) && !triggered && on){
      triggered = true;
      ringState = 255;
    }
  }

  void drawOnOff() {
    //this function draws the smaller circle directly under the ball that shows if the ball is on or off
    // draws a circle if bearing is on
    if (on) {
      stroke(255);
      fill(0, 0);
      strokeWeight(1);
      fill(255); 
      ellipse(xPos, yPos, ballSize, ballSize);
    } 
    else { 
      // otherwise there is no ball so show dark grey circle
      strokeWeight(1);
      stroke(50);
      fill(50);
      ellipse(xPos, yPos, ballSize, ballSize);            
    }
  }


  void drawRing() {
    // this function draws the rings around the balls that shows when they have been triggered

    // gamma value is used so that the rings aren't pure green/blue/yellow/red but are slightly washed out
    float gamma = 0;

    // create an 'empty' colour holding variable that is just black
    color ringColour = color(0);
    if (on) {

      // colour depends on the row position
      switch(rowPos) {     
      case 0:
        // red
        ringColour = color(ringState, ringState*gamma, ringState*gamma);
        break;
      case 1:
        // green
        ringColour = color(ringState*gamma, ringState, ringState*gamma);
        break;
      case 2:
        // blue
        ringColour = color(ringState*gamma, ringState*gamma, ringState);
        break;
      case 3:
        // yellow
        ringColour = color(ringState, ringState, ringState*gamma);
        break;  
      }
      // set fill to ring colour
      fill(ringColour);

      // set pen stroke to ring colour
      stroke(ringColour);

      // draw the ring aroung the ball
      ellipse(xPos, yPos, ballSize + ringWidth, ballSize + ringWidth);       
    }
  }


  void updateGrid() {

    // calculate width and height of grid
    xSize = x2 - x1;
    ySize = y2 - y1;

    // calculate the gap between columns
    xGap = xSize / (colTotal - 1);       

    // calculate the gap between rows    
    yGap = ySize / (rowTotal -1);                                                      

    // now use these to work out each balls position
    xPos = colPos*xGap + x1;
    yPos = rowPos*yGap + y1;
  }
}