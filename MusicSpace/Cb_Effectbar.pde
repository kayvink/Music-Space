class Effectbar extends Controlbar
{
  /// Declare variables
  PVector position;
  PVector dimensions;
  Trackpad effectpad;
  
  Effectbar()
  {
    // Initialise variables
    dimensions = new PVector(width, 0.3*height); // Set dimension of effectbar
    position = new PVector(0, height-dimensions.y); // Set position of top left corner of the controlbar
    // Creates a new trackpad within the control bar
    effectpad = new Trackpad(new PVector(position.x+0.1*dimensions.x, position.y+(0.1*dimensions.y)), new PVector(0.8*dimensions.x, 0.8*dimensions.y)); 

  }
  
  void display()
  {
    fill(150); // Set colour
    rect(position.x, position.y, dimensions.x, dimensions.y); // Draw rectangle 
    effectpad.run(); // Run the trackpad
  }
}
