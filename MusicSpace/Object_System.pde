class ObjectSystem {
  ArrayList<Square> squares;
  Edge[] edges;
  
  ObjectSystem(){
    squares = new ArrayList<Square>();
    edges = new Edge[4];
    edges[0] = new Edge(0, height/2, 1, height);
    edges[1] = new Edge(width, height/2, 1, height);
    edges[2] = new Edge(width/2, 0, width, 1);
    edges[3] = new Edge(width/2, height, width, 1);

  }
  
  void run(){
    update();
    display();
  }
  
  void update(){
    if(keyPressed){
      if(key == 'r'){
        squares.add(new Square(20, 20, color(255, 0, 0)));
      }
    }
  }
  
  void display(){
    for(int i = squares.size()-1; i >= 0; i--){
      Square s = squares.get(i);
      s.display();
    }
    
    for(int i = 0; i > edges.length; i++){
      println("displaying");
      edges[i].display();
    }
  }
}
