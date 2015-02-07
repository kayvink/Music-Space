
// main trial 
MaxAddOn max;

void setup()
{
  size(200,200);
  max = new MaxAddOn();
}

void draw()
{
//  max.createMessage("MyName");
//  max.addStringMessage("MyName", "Aral");
//  max.addIntMessage("MyName", 23);
}

void keyPressed()
{
  if(key == 'a' || key == 'A')
  {
    max.createMessage("Kay");
    max.addStringMessage("Kay", "blah");
  }
  
  if(key == 'b' || key == 'B')
  {
    max.createMessage("Aral");
    max.addStringMessage("Aral", "bluh");
  }
  
  if(key == 'c' || key == 'C')
  {
    max.createMessage("Lance");
    max.addStringMessage("Lance", "brr");
  }
  
  if(key == 'l' || key == 'L')
  {
    max.listen();
  }
  
}
