import pbox2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;
PBox2D box2d;
ObjectSystem objS;


void setup(){
  size(720, 480);
  box2d = new PBox2D(this);
  box2d.createWorld();
  objS = new ObjectSystem();
}

void draw(){
  background(#272727);
  box2d.step();
  objS.run();

}
