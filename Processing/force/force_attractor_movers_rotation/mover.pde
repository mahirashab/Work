

class Mover {
  PVector location;
  PVector volocity;
  PVector acceleration;
  float mass;
  float thetaX;
  float angle;
  float aVelocity;
  float aAcc;

  Mover() {
    location = new PVector(random(width), random(height));
    volocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random (2, 3);
    angle = 0.0;
    aVelocity = 0.0;
    aAcc = 0.0;
  }

  void applyForce(PVector f) {
    PVector force = PVector.div(f, mass);
    acceleration.add(force);
  }

  void update() {
    volocity.add(acceleration);
    //volocity.limit(20);
    println(volocity.y);
    location.add(volocity);
    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(100);
    pushMatrix();
    aAcc = map(location.x, 0, width, -0.01, 0.01);
    aVelocity += aAcc;
    angle += aVelocity;
    translate(location.x, location.y);
    rotate(angle);
    rectMode(CENTER);
    rect(0, 0, mass*10, mass*10);
    popMatrix();
  }

  void checkEdge() {
    if (location.x > width) {
      location.x = width;
      volocity.x *= -1;
    } else if (location.x < 0) {
      volocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      volocity.y *= -1;
      location.y = height;
    } else if (location.y < 0) {
      volocity.y *= -1;
    }
  }
}