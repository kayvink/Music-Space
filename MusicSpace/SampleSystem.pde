class SampleSystem 
{
  ArrayList<Sample> samples;
  PVector position;
  PVector dimensions;
  FlowField flowfield;
  Sidebar sidebar;


  SampleSystem(Sidebar _sidebar) 
  {
    sidebar = _sidebar;
    samples = new ArrayList<Sample>();
    for (int j = 0; j < 4; j ++)
    {
      for (int i = 0; i < 2; i++)
      {
        PVector storeIt = sidebar.storage[i][j].get();
        samples.add(new Sample(storeIt, 20, this));

      }
    }
    position = new PVector(0, 0);
    dimensions = new PVector(0.8*width, 0.7*height);
    flowfield = new FlowField(position, dimensions, 30);
  }

  void run()
  {
    display();
    for (int i = samples.size()-1; i >= 0; i--)
    {
      Sample s = samples.get(i);
      s.run();
    }


  }

  void display()
  {
    fill(#272727);
    rect(position.x, position.y, dimensions.x, dimensions.y);
  }

  void addSample(Sample s)
  {
    samples.add(s);
  }
}

