
Mover[] movers = new Mover[100];

void setup() {
  size(800, 600);
  for (int i = 0; i < movers.length; i++) {
    movers[i] =  new Mover();
  }
}


void draw() {
  background(255);
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].display();
  }
}

class Mover {
  PVector location;
  PVector volocity;
  PVector mouse;
  PVector acceleration;
  float t;

  Mover() {
    location = new PVector(random(width), random(height));
    volocity = new PVector(0, 0);
    t = 0.01;
  }

  void update() {
    mouse = new PVector(mouseX, mouseY);
    acceleration = PVector.sub(mouse, location);
    acceleration.normalize();
    acceleration.mult(noise(t));
    volocity.add(acceleration);
    volocity.limit(10);
    location.add(volocity);
    t += 0.1;
  }

  void display() {
    noStroke();
    fill(100);
    ellipse(location.x, location.y, 20, 20);
  }
}