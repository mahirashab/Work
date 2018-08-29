

class Vehicle {

  PVector loc;
  PVector velocity;
  PVector acc;

  float r;
  float radious;
  float theta;

  float maxSpeed;
  float maxForce;

  Vehicle() {
    loc = new PVector(random(width), random(width));
    velocity = new PVector(0, 0);
    acc = new PVector(0, 0);

    r = 5;
    radious = 100;
    theta = 0;

    maxSpeed = 3;
    maxForce = 0.3;
  }

  void run() {
    seek();
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

  void seek() {
    PVector center = new PVector(width/2, height/2);
    noFill();
    point(center.x, center.y);
    ellipse(center.x, center.y, radious*2, radious*2);
    float x = radious * cos(theta);
    float y = radious * sin(theta);
    theta += 0.04;
    PVector mover = new PVector(x, y);

    PVector target = PVector.add(center, mover);
    ellipse(target.x, target.y, 10, 10);

    PVector desire = PVector.sub(target, loc);

    desire.setMag(maxSpeed);

    PVector force = PVector.sub(desire, velocity);
    force.limit(maxForce);

    applyForce(force);
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    acc.add(f);
  }
}
