class Sidebar extends Controlbar
{

  PVector position;
  PVector dimensions;
  PVector[][] storage;


  Sidebar()
  {
    dimensions = new PVector(0.2*width, 0.7*height);
    position = new PVector(width-dimensions.x, 0);
    storage = new PVector[2][4];
    for (int j = 0; j < 4; j ++)
    {
      for (int i = 0; i < 2; i++)
      {
        storage[i][j] = new PVector(position.x+dimensions.x/4+dimensions.x/2*i, position.y+dimensions.y/5+dimensions.y/5*j );
        }
      }
    }

    void display()
    {
      fill(175);
      rect(position.x, position.y, dimensions.x, dimensions.y); 
      }
  }

