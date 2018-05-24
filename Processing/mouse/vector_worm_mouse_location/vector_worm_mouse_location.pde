
Mover mover;

void setup() {
  size(800, 600);
  mover = new Mover();
}


void draw() {
  background(255);
  mover.update();
  mover.display();
}

class Mover {

  PVector location;
  PVector volocity;
  PVector mouse;
  PVector acceleration;
  float thetaX;
  float r;

  Mover() {
    location = new PVector(random(width), random(height));
    volocity = new PVector(0, 0);
    r = 30;
  }

  void update() {
    mouse = new PVector(mouseX, mouseY);
    acceleration = PVector.sub(mouse, location);
    acceleration.normalize();
    acceleration.mult(0.5);
    volocity.add(acceleration);
    volocity.limit(4);
    location.add(volocity);
  }

  void display() {
    noStroke();
    fill(100);
    float theta = volocity.heading2D();
    pushMatrix();
    translate(location.x, location.y);
    float x = map(cos(thetaX), -1, 1, -r/2, r/2);
    rotate(theta);
    fill(200, 100);
    ellipse(0, 0, r, r);
    line(0, 0, x, 0);
    fill(100);
    ellipse(x + r/2, 0, 10, 10);
    thetaX += 0.1;
    popMatrix();
  }
}