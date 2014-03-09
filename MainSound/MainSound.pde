
// main trial 
MaxAddOn max;

void setup()
{
  size(200,200);
  max = new MaxAddOn();
}

void draw()
{
  max.createMessage("MyName");
  max.addStringMessage("MyName", "Aral");
  max.addIntMessage("MyName", 23);
}

void keyPressed()
{
}
