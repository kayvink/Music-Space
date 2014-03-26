class SampleSystem 
{
  ArrayList<Sample> samples;
  PVector origin;
  PVector dimensions;
  FlowField flowfield;


  SampleSystem() 
  {
    samples = new ArrayList<Sample>();
//    for (int i = 0; i < 1 ; i++){
//      samples.add(new Sample(new PVector()))
//    }
    origin = new PVector(0, 0);
    dimensions = new PVector(0.8*width, 0.7*height);
    flowfield = new FlowField(origin, dimensions, 30);
  }

  void run()
  {
    display();
    for (int i = samples.size()-1; i >= 0; i--)
    {
      Sample s = samples.get(i);
      s.run();
    }

    if (key == 'f')
    {
      flowfield.display();
    }
  }

  void display()
  {
    fill(#272727);
    rect(origin.x, origin.y, dimensions.x, dimensions.y);
  }

  void addSample(Sample s)
  {
    samples.add(s);
  }
}

