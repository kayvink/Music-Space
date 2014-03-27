SampleSystem sampleSystem;
Sidebar sidebar;
Sample sample;

void setup()
{
  size(720, 480);
//  sample = new Sample(new PVector(width/2, height/2), 20);
  sampleSystem = new SampleSystem();
  sidebar = new Sidebar(sampleSystem);
  
}

void draw()
{
  noStroke();
  sampleSystem.run();
  sidebar.display();
  
}

void keyPressed() {
  // Check if mouse is within the main sample system field
  if (key == ' ' && mouseX >= sampleSystem.position.x && mouseX <= sampleSystem.position.x+sampleSystem.dimensions.x 
    && mouseY >= sampleSystem.position.y && mouseY <= sampleSystem.position.y+sampleSystem.dimensions.y)
  {
    sampleSystem.addSample(new Sample(new PVector(mouseX, mouseY), 20, sampleSystem)); // Add a new sample
  }


}

