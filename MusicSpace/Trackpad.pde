class Trackpad
{
  float x;  // x position
  float y; // y position 
  float w; // width
  float h; // height
  float xOut; // x output
  float yOut; // y output
  float r;
  float g;
  float b;
  int selectorLen = 10; // selector length
  boolean draggable = false;

  Trackpad(float _x, float _y, float _w, float _h)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    xOut = x + (w/2); // set initial position
    yOut = y + (h/2);
  }

  void run()
  {
    selector();
    display();
  }


  void display()
  {

    
    r = map(xOut, x, x+xOut, 100, 255);
    g = map(yOut, y, y+yOut, 50, 255);
    b = map(x+w-xOut, x, x+xOut, 0, 200);
    
    fill(r, g, b); // Colours trackpad
    rect(x, y, w, h); // Draws trackpad rectangle

    // Selector
    stroke(150); 
    strokeWeight(2);
    line(xOut-selectorLen, yOut, xOut+selectorLen, yOut); // Draw lines of selector
    line(xOut, yOut-selectorLen, xOut, yOut+selectorLen);
  }

  void selector()
  {
    if (mouseX >= xOut - selectorLen && mouseX <= xOut + selectorLen && mouseY >= yOut - selectorLen && mouseY <= yOut + selectorLen && mousePressed)
    {
      draggable = true;
    } else if(mousePressed == false)
    {
      draggable = false;
    }
    
    if(draggable){
      xOut = mouseX;
      yOut = mouseY; 
      if (xOut <= x) // Check for horizontal edges
      {
        xOut = x;  
      }else if (xOut >= x+w)
      {
        xOut = x+w;
      }
      
      if (yOut <= y)  // Check for vertical edges
      {
        yOut = y;  
      }else if (yOut >= y+h)
      {
        yOut = y+h;
      }
    }
  }
}

