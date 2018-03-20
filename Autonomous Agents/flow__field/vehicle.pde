

class Vehicle {

  PVector loc;
  PVector velocity;
  PVector acc;

  float r;

  float maxSpeed;
  float maxForce;

  Vehicle() {
    loc = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acc = new PVector(0, 0);

    r = 5;

    maxSpeed = 3;
    maxForce = 0.5;
  }
  
  void run() {
    borders();
    update();
   display(); 
  }

  void display() {
    pushMatrix();
    strokeWeight(2);
    stroke(20);
    fill(100);

    translate(loc.x, loc.y);

    float a = velocity.heading2D() + PI/2;
    rotate(a);

    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);

    popMatrix();
  }

  void update() {
    velocity.add(acc);
    loc.add(velocity);
    acc.mult(0);
  }

  void follow(FlowField flow) {
    PVector desire = flow.lookUp(loc);

    desire.setMag(maxSpeed);

    PVector force = PVector.sub(desire, velocity);
    force.limit(maxForce);

    applyForce(force);
  }
  
   void borders() {
    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r;
  }
  

  void applyForce(PVector force) {
    PVector f = force.get();
    acc.add(f);
  }
}
