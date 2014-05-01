class Sample 
{
  // Declare variables
  PVector position;
  PVector velocity = new PVector(0, 0); // Initial velocity.
  PVector acceleration = new PVector(0, 0); // Initial acceleration.
  float radius;
  float maxforce;
  float maxspeed; // Sets maximum speed
  boolean draggable;
  Effectbar effectbar;
  FlowField flowfield;
  SampleSystem samplesystem;

  Sample(PVector _position, float _radius, SampleSystem _samplesystem)
  {
    // Initialise variables
    position = _position; // Position can be set by an argument.
    radius = _radius;  // Radius can be set by an argument.
    samplesystem = _samplesystem; // Take the sample system as an argument
    maxforce = 0.5; // The maximum force that will be applied to change the direction of the sample
    maxspeed = 1; // The maximum speed at which the sample will move
    // A unique effectbar lets the user customize the effect per sample
    // A unique flowfield lets every sample flow in a different way.
    effectbar = new Effectbar(); // Create a unique effectbar for this sample
    flowfield = new FlowField(new PVector(0, 0), new PVector(0.8*width, 0.7*height), 30); // Create a unique flowfield for this sample
  }

  void run()
  {
    update(); // Update position
    display(); // Display
    effectbar.display(); // Display the effectbar

/// For debugging
//    if (key == 'f')
//    {
//      flowfield.display();
//    }
  }

  void update()
  {
    checkEdges(); // Check if the sample has reached any edges
    applyForce(follow(flowfield)); // Let the sample follow it's flowfield
    velocity.add(acceleration);  // Change the velocity by the amount of acceleration.
    velocity.limit(maxspeed);  // Limit the velocity.
    position.add(velocity); // Change the position by the amount of velocity.
    acceleration.mult(0); // Reset the acceleration at the end of a cycle.
    mouseDrag(); // Make the sample draggable by mouse
  }

  void display()
  {
    //////// ******GUYS HAVE A LOOK HERE, NEEDS TO BE LINKED UP TO MAX*****/////
    
    float t = millis()/50; // This has to be replaced with the time of the sample
    float sin = 40*sin(t); // This has to be replaced with the sine wave of the sample
    pushMatrix();
    translate(position.x, position.y); // Translate to position
    stroke(255);
    fill(255); // Fills the main circle
    strokeWeight(1);
    ellipse(0, 0, radius, radius); // Draws a circle with the given radius
    ///// Audio visualisation
    noFill(); // Doesnt fill the outer circle
    strokeWeight(radius/10); // Sets the thickness of the outer circle
    ellipse(0, 0, radius+sin, radius+sin); // Draws a circle around the main circle, with the same centrepoint as the main cirlce.
    popMatrix();
    noStroke();
  }

  // Apply a force
  void applyForce(PVector force)
  {
    PVector f = force.get(); // Copy the force
    acceleration.add(f); // Add copy to acceleration
  }

  PVector follow (FlowField flowfield) { // Takes a flowfield as an argument
    PVector desired = flowfield.lookup(position);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    return steer;
  }

  void checkEdges()
  {

    // Check if the sample has flown off the left side of the main section
    if (position.x < samplesystem.position.x) {
      position.x = samplesystem.dimensions.x;
    } 
    else if (position.x-radius > samplesystem.dimensions.x && position.x-radius < samplesystem.dimensions.x+5)
    {
      position.x = samplesystem.position.x;
    }
    // Check if the sample has flown off the right side of the main
    if (position.y < 0) {
      position.y = samplesystem.dimensions.y;
    } 
    else if (position.y > samplesystem.dimensions.y)
    {
      position.y = samplesystem.position.y;
    }
  }

  
  void mouseDrag()
  {
    if(mouseX > position.x-radius && mouseX < position.x+radius && mouseY > position.y-radius && mouseY < position.y+radius && mousePressed)
    {
      draggable = true;
    } else if(mousePressed == false)
    {
      draggable = false;
    }
    
    if (draggable)
    {
      position = new PVector(mouseX, mouseY);
    }
  }
}

