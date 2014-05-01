// The flowfield algorithm is based on the algorithm explained in Daniel Shiffman - The Nature of Code
// chapter 6.6.

class FlowField
{
  // Declare variables
  PVector [][] field; // Two dimentional array to store all vectors.
  PVector position;
  PVector dimensions;
  int columns;  // The amount of columns in the flowfield.
  int rows;  // The amount of rows in the flowfield.
  int resolution;  // The relation of rows/columns and the width/height.
  float count;
  
  FlowField(PVector _position, PVector _dimensions, int _resolution)
  {
    // Initialise variables
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
    // Loop through two dimensional array
    for(int x = 0; x < columns; x ++)
    {
      for(int y = 0; y < rows; y ++)
      {
        displayVector(field[x][y], x*resolution, y*resolution, resolution-2); // Display every vector

      }
    }
  }
  
  void displayVector(PVector vec, float vecX, float vecY, float scale)
  {
    pushMatrix();
    translate(vecX,vecY); // Translate to position
    stroke(255);
    strokeWeight(1);
    rotate(vec.heading()); // Rotate in direction of vector
    float lineLength = vec.mag()*scale; //Multiply the unit vector by the scale variable 
    line(0,0,lineLength,0); // Draw a line displaying the vector
    popMatrix();
  }
  
  PVector lookup(PVector lookedup) // Look up the vector in the flowfield for an input position
  {
    int column = int(lookedup.x/resolution); // The x of of the position being checked / by the resolution gives the number of the right column.
    int row = int(lookedup.y/resolution); // The y of of the position being checked / by the resolution gives the number of the right row.
//    We have to check whether the sample is within the flowfield, on the edge of the flowfield or outside of the flowfield. 
    

    if (column == columns) 
    {
      //////////////// THIS TEXT HAS TO BE DELETED BEFORE HANDING ANYTHING IN!!!!////////////////
      
      // THE "return field[column-1][row].get();" method doesn't work because the sample goes outside of the reach of the flowfield. What we want is for the sample to check the previous
      // vector in the flowfield, not the one it is at now. If it there would be a vector at the position outside of the flowfield it wouldnt be possible to have samples standing still 
      // outside of the flowscreen. The -1, -1 is just a way of returning something in stead of nil which crashes the program.
      
      return new PVector(-1,-1); // So this is basically cheating and bad form
//      println("column:" + column);
//      return field[column-1][row].get();
    }else if (row == rows)
    {
        return new PVector(-1,1); // This is cheating too
//      return field[column][row-1].get();
    }else if (row > rows || column > columns)
    {
      return new PVector(0,0);  // When outiside of the flowfield, no forces should apply.
    }
    else
    {
    return field[column][row].get(); // When iside the flowfield the corresponding force should apply. 
    }
  }

}
