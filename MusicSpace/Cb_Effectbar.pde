class Effectbar extends Controlbar
{
  PVector position;
  PVector dimensions;
  Trackpad effectpad;
  
//  Sample sample; // You can't use the positional sample objects from the main screen to display this
//  // sample in the effectbar because to display it on this location you would have to change the
//  // positional coordinates (when using objects you reference them, you can't copy them).
  
  Effectbar()
  {
    dimensions = new PVector(width, 0.3*height);
    position = new PVector(0, height-dimensions.y);
    effectpad = new Trackpad(new PVector(position.x+0.1*dimensions.x, position.y+(0.1*dimensions.y)), new PVector(0.8*dimensions.x, 0.8*dimensions.y));
    
    
//    sample = new Sample(PVector.add(position, new PVector(75, 75)), 30); // So this sample has to
//    // be independently linked with max to create the sound visualisation.
  }
  
  void display()
  {
    fill(150);
    rect(position.x, position.y, dimensions.x, dimensions.y); 
//    sample.display();
    effectpad.run();
  }
}
