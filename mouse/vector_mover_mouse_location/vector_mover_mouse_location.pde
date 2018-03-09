
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

  Mover() {
    location = new PVector(random(width), random(height));
    volocity = new PVector(0, 0);
  }

  void update() {
    mouse = new PVector(mouseX, mouseY);
    acceleration = PVector.sub(mouse, location);
    acceleration.normalize();
    acceleration.mult(0.5);
    volocity.add(acceleration);
    volocity.limit(10);
    location.add(volocity);
  }

  void display() {
    noStroke();
    fill(100);
    ellipse(location.x, location.y, 20, 20);
  }
}