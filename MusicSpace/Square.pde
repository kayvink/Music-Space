class Square {
  Body body;
  float w;
  float h;
  color c;

  Square(float _w, float _h, color _c) {
    BodyDef bd = new BodyDef();
    w = _w;
    h = _h;
    c = _c;
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(mouseX, mouseY));
    body = box2d.createBody(bd);

    PolygonShape ps = new PolygonShape();
    // Box2D considers the w and h to be the distance from the center
    // to the edge.
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW, box2dH);

    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    body.createFixture(fd);
  }

  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    rectMode(CENTER);
    fill(c);
    rect(0, 0, w, h);
    popMatrix();
  }

  void killBody() {
    box2d.destroyBody(body);
  }
}

