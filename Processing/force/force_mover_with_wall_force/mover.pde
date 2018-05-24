

class Mover {
  PVector location;
  PVector volocity;
  PVector acceleration;
  float mass;

  Mover() {
    location = new PVector(random(100), 25);
    volocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = 2;
  }

  void applyForce(PVector f) {
    PVector force = PVector.div(f, mass);
    acceleration.add(force);
  }

  void update() {
    volocity.add(acceleration);
    //volocity.limit(10);
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

  PVector rightWallForce() {
    PVector wallLoc = new PVector(width, location.y);
    PVector dist = PVector.sub(location, wallLoc);
    dist.normalize();
    float mag = map((width - location.x), 0, width, 0, random(0, 0.4));
    dist.mult(mag);
    return dist;
  }
}