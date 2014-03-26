class Sample 
{
  PVector position;
  PVector velocity = new PVector(0,0); // Initial velocity.
  PVector acceleration = new PVector(0, 0); // Initial acceleration.
  float radius;
  float maxspeed; // Sets maximum speed
  
  Sample(PVector _position, float _radius)
  {
    position = _position; // Position can be set by an argument.
    radius = _radius;  // Radius can be set by an argument.
    maxspeed = 3;
  }
  
  void run()
  {
    update();
    display();
  }
  
  void update()
  {
    applyForces();
    velocity.add(acceleration);  // Change the velocity by the amount of acceleration.
    velocity.limit(maxspeed);  // Limit the velocity.
    position.add(velocity); // Change the position by the amount of velocity.
    acceleration.mult(0); // Reset the acceleration at the end of a cycle.
  }
  
  void display()
  {
    float t = millis()/50; // This has to be replaced with the time of the sample
    float sin = 40*sin(t); // This has to be replaced with the sine wave of the sample
    pushMatrix();
    translate(position.x, position.y);
    stroke(255);
    fill(255); // Fills the main circle
    strokeWeight(1);
    ellipse(0,0,radius,radius); // Draws a circle with the given radius
    ///// Audio visualisation
    noFill(); // Doesnt fill the outer circle
    strokeWeight(radius/10); // Sets the thickness of the outer circle
    ellipse(0,0,radius+sin, radius+sin); // Draws a circle around the main circle, with the same
                                         // centrepoint as the main cirlce.
    popMatrix();
    noStroke();
  }
  
  // Apply a force
  void applyForce(PVector force)
  {
    PVector f = force.get();
    acceleration.add(f);
  }
  
  // Steer towards a target
  PVector seek(PVector target)
  {
    PVector desired = PVector.sub(target, position);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    return steer;
  }
  
  // Apply all forces
  void applyForces()
  {
  }
  

}
