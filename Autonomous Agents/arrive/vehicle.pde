

class Vehicle {

  PVector loc;
  PVector velocity;
  PVector acc;

  float r;
  float view;

  float maxSpeed;
  float maxForce;

  Vehicle() {
    loc = new PVector(random(width), random(width));
    velocity = new PVector(0, 0);
    acc = new PVector(0, 0);

    r = 5;
    view = 150;

    maxSpeed = 4;
    maxForce = 0.07;
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
    PVector mouse = new PVector(mouseX, mouseY);
    PVector desire = PVector.sub(mouse, loc);

    float d = desire.mag();
    if (d < view) {
      float m = map(d, 0, view, 0, maxSpeed);
      desire.setMag(m);
    } else {
      desire.setMag(maxSpeed);
    }

    println(d);


    PVector force = PVector.sub(desire, velocity);
    force.limit(maxForce);

    applyForce(force);
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    acc.add(f);
  }
}
