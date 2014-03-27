class Sidebar extends Controlbar
{

  PVector position;
  PVector dimensions;
  PVector[][] storage;
  SampleSystem s;

  Sidebar(SampleSystem _s)
  {
    s = _s;
    dimensions = new PVector(0.2*width, 0.7*height);
    position = new PVector(width-dimensions.x, 0);
    storage = new PVector[2][4];
    for (int j = 0; j < 4; j ++)
    {
      for (int i = 0; i < 2; i++)
      {
        storage[i][j] = new PVector(s.dimensions.x+dimensions.x/4+dimensions.x/2*i, position.y+dimensions.y/5+dimensions.y/5*j );
        }
      }
    }

    void display()
    {
      fill(175);
      rect(position.x, position.y, dimensions.x, dimensions.y); 

      for (int j = 0; j < 4; j ++)
      {
        for (int i = 0; i < 2; i++)
        {
          stroke(0);
          strokeWeight(1);
          rect(storage[i][j].x, storage[i][j].y, 20, 20);
          println(storage[i][j].x);
          }
        }
      }
  }

