class Mover {

  PVector location;
  PVector volocity;
  PVector mouse;
  PVector acceleration;
  float mass;
  float g;

  Mover() {
    location = new PVector(random(width), random(height));
    volocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random (2, 3);
    g = 4;
  }

  void update() {
    mouse = new PVector(mouseX, mouseY);
    acceleration = PVector.sub(mouse, location);
    acceleration.normalize();
    acceleration.mult(0.5);
    volocity.add(acceleration);
    //volocity.limit(10);
    location.add(volocity);
    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(100);
    float theta = volocity.heading2D();
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    rectMode(CENTER);
    rect(0, 0, 25, 10);
    triangle(20.5, 0, 12, -5, 12, 5);
    popMatrix();
  }

  void applyForce(PVector f) {
    PVector force = PVector.div(f, mass);
    acceleration.add(force);
  }

  PVector attract(Mover mover) {
    PVector dist = PVector.sub(location, mover.location);
    float mag = dist.mag();
    mag = constrain(mag, 2, 10);
    dist.normalize();
    float m = (g * mass * mover.mass) / (mag * mag);
    dist.mult(-m);
    println(2);
    return dist;
  }
}