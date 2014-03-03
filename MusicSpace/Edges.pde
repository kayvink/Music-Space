class Edge{
  Body body;
  float w;
  float h;
  float x;
  float y;
  
  Edge(float _x, float _y, float _w, float _h){
    w = _w;
    h = _h;
    x = _x;
    y = _y;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW, box2dH); 
    
    body.createFixture(ps, 1);
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);  
    pushMatrix();
    translate(pos.x, pos.y);
    fill(255);
    rect(0, 0, w, h);
    popMatrix();
  }

}
