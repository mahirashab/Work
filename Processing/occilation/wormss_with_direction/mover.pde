class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float thetaX;
  float r;
  float t1;
  float t2;

  Mover() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    topspeed = 3;
    thetaX = 0.0;
    r = 30;
    t1 = 0.0;
    t2 = 10000;
  }

  void update() {
    acceleration = new PVector(noise(t1), noise(t2));
    acceleration.mult(random(2));
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    float theta = velocity.heading2D();
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    float x = map(cos(thetaX), -1, 1, -r/2, r/2);
    fill(100, 100);
    ellipse(0, 0, r, r);
    fill(100);
    ellipse(x + r/2, 0, 10, 10);
    thetaX += 0.2;
    t1 += 0.1;
    t2 += 0.3;
    println(x);
    popMatrix();
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}