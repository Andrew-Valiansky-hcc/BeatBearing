//------------------------------------
// Set the grid size and position
//------------------------------------

// NOTES:
// left-click to set top left hand corner of the grid
// right-click to set the bottom right hand corner of the grid

void setGrid() {
  // this function draws the grid
  
  // set the line width to 2 pixels
  strokeWeight(2);

  // set the stroke colour to green
  stroke(0, 200, 0);

  // don't fill in the rectangle
  noFill();

  // draw rectangle from top left corner to bottom right  
  rect(x1, y1, x2-x1, y2-y1);
}



void mousePressed() {
  // this function is called every time the mouse is pressed

    if (mouseButton == LEFT) {
    // if the left mouse button is pressed
    // then change the position and update the array
    x1 = mouseX;
    y1 = mouseY;
    for (int n = 0; n < bArray.length; n++) {
      bArray[n].updateGrid();
    }
    // print out the new coordinates in the debug window
    // make a note of these so that you can change the initial value of x1 and y1
    // so that you don't need to keep changing the size manually
    print("x1 = " + x1 +"   y1 = " + y1);
  } 
  else if (mouseButton == RIGHT) {
    // if the right mouse button is pressed
    // then change the position and update the array
    x2 = mouseX;
    y2 = mouseY;
    for (int n = 0; n < bArray.length; n++) {
      bArray[n].updateGrid();
    }
    // print out the new coordinates in the debug window
    // make a note of these so that you can change the initial value of x2 and y2
    // so that you don't need to keep changing the size manually
    print("x2 = " + x2 +"   y2 = " + y2);
  }
}