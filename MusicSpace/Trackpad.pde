class Trackpad
{
  PVector position;
  PVector dimensions;
  PVector output;
  

  float r;
  float g;
  float b;
  int selectorLen = 10; // selector length
  boolean draggable = false;

  Trackpad(PVector _position, PVector _dimensions)
  {
    position = _position;
    dimensions = _dimensions;
    output = new PVector(position.x+(dimensions.x/2),position.y+(dimensions.y/2)); // Set initial position
  }

  void run()
  {
    selector();
    display();
  }


  void display()
  {

    
    r = map(output.x, position.x, position.x+output.x, 100, 255);
    g = map(output.y, position.y, position.y+output.y, 50, 255);
    b = map(position.x+dimensions.x-output.x, position.x, position.x+output.x, 0, 200);
    
    fill(r, g, b); // Colours trackpad
    rect(position.x, position.y, dimensions.x, dimensions.y); // Draws trackpad rectangle

    // Selector
    stroke(150); 
    strokeWeight(2);
    line(output.x-selectorLen, output.y, output.x+selectorLen, output.y); // Draw lines of selector
    line(output.x, output.y-selectorLen, output.x, output.y+selectorLen);
  }

  void selector()
  {
    if (mouseX >= output.x - selectorLen && mouseX <= output.x + selectorLen && mouseY >= output.y - selectorLen && mouseY <= output.y + selectorLen && mousePressed)
    {
      draggable = true;
    } else if(mousePressed == false)
    {
      draggable = false;
    }
    
    if(draggable){
      output.x = mouseX;
      output.y = mouseY; 
      if (output.x <= position.x) // Check for horizontal edges
      {
        output.x = position.x;  
      }else if (output.x >= position.x+dimensions.x)
      {
        output.x = position.x+dimensions.x;
      }
      
      if (output.y <= position.y)  // Check for vertical edges
      {
        output.y = position.y;  
      }else if (output.y >= position.y+dimensions.y)
      {
        output.y = position.y+dimensions.y;
      }
    }
  }
}

