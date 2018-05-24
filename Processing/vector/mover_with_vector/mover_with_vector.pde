
Mover mover;

void setup() {
  size(600, 400);
  mover = new Mover();
}

void draw() {
  background(0);
  mover.display();
  mover.update();
  mover.check();
}

class Mover {
  PVector location;
  PVector volocity;

  Mover() {

    location = new PVector(random(width), random(height));
    volocity = new PVector(random(-2, 2), random(-2, 2));
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(location.x, location.y, 20, 20);
  }

  void update() {
    location.add(volocity);
  }

  void check() {
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