class Event implements OscEventListener
{
  String id;

  Event(String id)
  {
    this.id = id;
  }

  void oscStatus(OscStatus theStatus)
  {
  }
  
  void oscEvent(OscMessage theOscMessage)
  {
    println("received message @ "+ id);

    if (theOscMessage.checkAddrPattern("/" + id) == true) {
      println("success @ ;" + id);
    }

  }
}

