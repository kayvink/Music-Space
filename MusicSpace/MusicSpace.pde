SampleSystem sampleSystem;
Sidebar sidebar;
Sample sample;

void setup()
{
  size(720, 480);
  frameRate(30);
  sidebar = new Sidebar();
  sampleSystem = new SampleSystem(sidebar);
  sample = new Sample(new PVector(width/2,height/2), 20, sampleSystem);

  
}

void draw()
{
  background(150);
  noStroke();
  sidebar.display();
  sampleSystem.run();
  //  sample.run();
  
}

void keyPressed() {
  // Check if mouse is within the main sample system field
  if (key == ' ' && mouseX >= sampleSystem.position.x && mouseX <= sampleSystem.position.x+sampleSystem.dimensions.x 
    && mouseY >= sampleSystem.position.y && mouseY <= sampleSystem.position.y+sampleSystem.dimensions.y)
  {
    sampleSystem.addSample(new Sample(new PVector(mouseX, mouseY), 20, sampleSystem)); // Add a new sample
  }


}

