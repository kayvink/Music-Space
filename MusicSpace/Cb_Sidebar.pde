class Sidebar extends Controlbar
{

  PVector origin;
  PVector dimensions;
  
  Sidebar()
  {
    dimensions = new PVector(0.2*width, 0.7*height);
    origin = new PVector(width-dimensions.x, 0);
  
  }
  
  void display()
  {
    fill(255);
    rect(origin.x, origin.y, dimensions.x, dimensions.y); 
  }
}
