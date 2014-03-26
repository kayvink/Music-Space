SampleSystem sampleSystem;
Sidebar sidebar;
Effectbar effectbar;
Trackpad effectpad;
Sample sample;

void setup()
{
  size(720, 480);
  sample = new Sample(new PVector(width/2, height/2), 20);
  sampleSystem = new SampleSystem();
  sidebar = new Sidebar();
  effectbar = new Effectbar();
  effectpad = new Trackpad(150, 360, 550, 100);
}

void draw()
{
  noStroke();
  sampleSystem.run();
  sidebar.display();
  effectbar.display();
  effectpad.run();
}

void keyPressed() {
  // Check if mouse is within the main sample system field
  if (key == ' ' && mouseX >= sampleSystem.origin.x && mouseX <= sampleSystem.origin.x+sampleSystem.dimensions.x 
    && mouseY >= sampleSystem.origin.y && mouseY <= sampleSystem.origin.y+sampleSystem.dimensions.y)
  {
    sampleSystem.addSample(new Sample(new PVector(mouseX, mouseY), 20)); // Add a new sample
  }


}

