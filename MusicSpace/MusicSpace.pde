//////***** TO DO'S ***** /////
// 1. If a sample is clicked it a boolean selected goes one, only the effectpad for the selected sample is shown.
// 2. If a sample is selected all other samples are not selected.
// 3. Link sound effects/parameters to variables in the sketch available variables are:
//        - x/y sample // x/y-trackpad
// 4. What now is a sample sine function to resize the pulsating circle around every sample should be link to the sinewave of the music
// 5. Comments should be finished (I'll comment everything I did) - Can you guys please properly comment everything you make?
// 6. Find a way to fix the flowfield out of bounds problem in a prettier way (maybe ask someone for help if there is someone in the lab or something?)
// 7. Website has to be made.

// I have made this whole thing now, and from what I hear you are expecting me to make the website too so I hope you'll manage to go through this list and
// finish everything on it?

// Let me know if there are any questions.



SampleSystem sampleSystem;
Sidebar sidebar;

void setup()
{
  size(720, 480);
  frameRate(30);
  sidebar = new Sidebar();
  sampleSystem = new SampleSystem(sidebar  );

  
}

void draw()
{
  background(150);
  noStroke();
  sidebar.display(); // Displays the sidebar
  sampleSystem.run(); // Runs the sample system
  
}

void keyPressed() {
  // Check if mouse is within the main sample system field
  if (key == ' ' && mouseX >= sampleSystem.position.x && mouseX <= sampleSystem.position.x+sampleSystem.dimensions.x 
    && mouseY >= sampleSystem.position.y && mouseY <= sampleSystem.position.y+sampleSystem.dimensions.y)
  {
    sampleSystem.addSample(new Sample(new PVector(mouseX, mouseY), 20, sampleSystem)); // Add a new sample
  }
}

