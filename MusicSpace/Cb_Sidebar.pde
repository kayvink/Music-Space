class Sidebar extends Controlbar
{
  // Declare variables
  PVector position;
  PVector dimensions;
  PVector[][] storage; // A two dimensional array to store the samples at the beginning of the sketch


  Sidebar()
  {
    // Initialise variables
    dimensions = new PVector(0.2*width, 0.7*height); // Set dimension
    position = new PVector(width-dimensions.x, 0); // Set position
    storage = new PVector[2][4]; // Set the amount of stored samples at the beginning
    // Loop through all storage spots
    for (int j = 0; j < 4; j ++)
    {
      for (int i = 0; i < 2; i++)
      {
        // Create a new sample on every storage spot
        storage[i][j] = new PVector(position.x+dimensions.x/4+dimensions.x/2*i, position.y+dimensions.y/5+dimensions.y/5*j ); 
        }
      }
    }

    void display()
    {
      fill(175); // Set the colour of the sidebar
      rect(position.x, position.y, dimensions.x, dimensions.y); // Draw the sidebar 
      }
}

