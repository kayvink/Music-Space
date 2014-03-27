class Sample 
{
  PVector position;
  PVector velocity = new PVector(0, 0); // Initial velocity.
  PVector acceleration = new PVector(0, 0); // Initial acceleration.
  float radius;
  float maxforce;
  float maxspeed; // Sets maximum speed
  Effectbar effectbar;
  FlowField flowfield;
  SampleSystem s;

  Sample(PVector _position, float _radius, SampleSystem _s)
  {
    position = _position; // Position can be set by an argument.
    radius = _radius;  // Radius can be set by an argument.
    s = _s;
    maxforce = 0.5;
    maxspeed = 1;
    effectbar = new Effectbar();
    flowfield = new FlowField(new PVector(0, 0), new PVector(0.8*width, 0.7*height), 30);
  }

  void run()
  {
    update();
    display();
    effectbar.display();
  }

  void update()
  {
    checkEdges();
    applyForces();
    applyForce(follow(flowfield));
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
    ellipse(0, 0, radius, radius); // Draws a circle with the given radius
    ///// Audio visualisation
    noFill(); // Doesnt fill the outer circle
    strokeWeight(radius/10); // Sets the thickness of the outer circle
    ellipse(0, 0, radius+sin, radius+sin); // Draws a circle around the main circle, with the same
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
    steer.limit(maxforce);
    return steer;
  }

  PVector follow (FlowField flowfield) {
    PVector desired = flowfield.lookup(position);
    desired.mult(maxspeed);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    return steer;
  }

  void checkEdges()
  {
    if (position.x+radius < 0) {
      position.x = s.dimensions.x;
    } else if (position.x-radius > s.dimensions.x)
    {
      position.x = s.position.x;
    }
    
    if (position.y+radius < 0) {
      position.y = s.dimensions.y;
    } else if (position.y-radius > s.dimensions.y)
    {
      position.y = s.position.y;
    }
  }

  // Apply all forces
  void applyForces()
  {
  }
}

