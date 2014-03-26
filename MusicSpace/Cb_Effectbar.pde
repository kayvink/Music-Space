class Effectbar extends Controlbar
{
  PVector origin;
  PVector dimensions;
  Sample sample; // You can't use the original sample objects from the main screen to display this
  // sample in the effectbar because to display it on this location you would have to change the
  // original coordinates (when using objects you reference them, you can't copy them).
  
  Effectbar()
  {
    dimensions = new PVector(width, 0.3*height);
    origin = new PVector(0, height-dimensions.y);
    sample = new Sample(PVector.add(origin, new PVector(75, 75)), 30); // So this sample has to
    // be independently linked with max to create the sound visualisation.
  }
  
  void display()
  {
    fill(150);
    rect(origin.x, origin.y, dimensions.x, dimensions.y); 
    sample.display();
  }
}
