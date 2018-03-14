

class Mover {
  PVector location;
  PVector volocity;
  PVector acceleration;
  float mass;

  Mover() {
    location = new PVector(random(width), random(height));
    volocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = random (2, 3);
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
    fill(75);
    ellipse(location.x, location.y, mass * 10, mass * 10);
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
    }
  }
}