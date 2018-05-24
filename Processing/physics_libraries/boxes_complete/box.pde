


class Box {

  float x;
  float y;
  float w;

  Body body;

  Box(float x_, float y_) {

    x = x_;
    y = y_;
    w = random(5, 15);

   BodyDef bd = new BodyDef();
   bd.type = BodyType.DYNAMIC;
   bd.position.set(box2d.coordPixelsToWorld(x, y));
   body = box2d.createBody(bd);
   
   PolygonShape ps = new PolygonShape();
   float psW = box2d.scalarPixelsToWorld(w/2);
   float psH = box2d.scalarPixelsToWorld(w/2);
   ps.setAsBox(psW, psH);
   
   FixtureDef fd = new FixtureDef();
   fd.shape = ps;
   fd.density = random(2, 5);
   fd.friction = 0.3;
   fd.restitution = 2;
   
   body.createFixture(fd);
   
   
 }


  void display() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();

    pushMatrix();
    translate(pos.x,pos.y);    // Using the Vec2 position and float angle to
    rotate(-a);              // translate and rotate the rectangle
    fill(127);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,w,w);
    popMatrix();
  }
}
