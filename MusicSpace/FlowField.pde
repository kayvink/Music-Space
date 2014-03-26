// The flowfield algorithm is based on the algorithm explained in Daniel Shiffman - The Nature of Code
// chapter 6.6.

class FlowField
{
  PVector [][] field; // Two dimentional array to store all vectors.
  PVector origin;
  PVector dimensions;
  int columns;  // The amount of columns in the flowfield.
  int rows;  // The amount of rows in the flowfield.
  int resolution;  // The relation of rows/columns and the width/height.
  float count;
  
  FlowField(PVector _origin, PVector _dimensions, int _resolution)
  {
    resolution = _resolution;
    origin = _origin;
    dimensions = _dimensions;
    columns = int(dimensions.x/resolution);
    rows = int(dimensions.y/resolution);
    field = new PVector[columns][rows];
    initialise();
  }
  
  void initialise()
  {
    for(int x = 0; x < columns; x ++)
    {
      count += 1;
      for(int y = 0; y < rows; y ++)
      {
        field[x][y] = new PVector(1, 0); // Create a new random PVector
                                                         // for every place in field[][]
      }
    }
  }
  
  void display()
  {
    for(int x = 0; x < columns; x ++)
    {
      for(int y = 0; y < rows; y ++)
      {
        displayVector(field[x][y], x*resolution, y*resolution, resolution-2);

      }
    }
  }
  
  void displayVector(PVector vec, float vecX, float vecY, float scale)
  {
    pushMatrix();
    float arrowSize = resolution/2;
    translate(vecX,vecY);
    stroke(0);
    rotate(vec.heading());
    float arrowLength = vec.mag()*scale;
    println(arrowLength);
    line(0,0,arrowLength,0);
    line(arrowLength,0,arrowLength-arrowSize,+arrowSize/2);
    line(arrowLength,0,arrowLength-arrowSize,-arrowSize/2);
    popMatrix();
  }

}
