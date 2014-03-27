// The flowfield algorithm is based on the algorithm explained in Daniel Shiffman - The Nature of Code
// chapter 6.6.

class FlowField
{
  PVector [][] field; // Two dimentional array to store all vectors.
  PVector position;
  PVector dimensions;
  int columns;  // The amount of columns in the flowfield.
  int rows;  // The amount of rows in the flowfield.
  int resolution;  // The relation of rows/columns and the width/height.
  float count;
  
  FlowField(PVector _position, PVector _dimensions, int _resolution)
  {
    resolution = _resolution;
    position = _position;
    dimensions = _dimensions;
    columns = int(dimensions.x/resolution);
    rows = int(dimensions.y/resolution);
    field = new PVector[columns][rows];
    initialise();
  }
  
  void initialise()
  {
    noiseSeed(int(random(10000))); // Get a new flowfield every time
    float xCount = 0;
    for(int x = 0; x < columns; x ++)
    {
      float yCount = 0;
      for(int y = 0; y < rows; y ++)
      {
        float theta = map(noise(xCount, yCount), 0,1,0,TWO_PI); // Generates a random noise number related to the xCount and yCount and maps it from 0,1 to 0 to 2PI.
        field[x][y] = new PVector(cos(theta), sin(theta)); // Create a new random PVector
                                                           // for every place in field[][]
        yCount += 0.1;
      }
      xCount += 0.1;
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
    stroke(1);
    rotate(vec.heading());
    float arrowLength = vec.mag()*scale;
    println(arrowLength);
    line(0,0,arrowLength,0);
    line(arrowLength,0,arrowLength-arrowSize,+arrowSize/2);
    line(arrowLength,0,arrowLength-arrowSize,-arrowSize/2);
    popMatrix();
  }
  
  PVector lookup(PVector lookedup) // Look up the vector in the flowfield for an input position
  {
    int column = int(constrain(lookedup.x/resolution, 0, columns-1)); // Constrain to make sure samples off the screen are not checked
    int row = int(constrain(lookedup.y/resolution, 0, rows-1));
    return field[column][row].get();
  }

}
