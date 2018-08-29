Mover mover;
PVector gravity;
PVector wind;

void setup() {
  size(600, 400);
  mover = new Mover();
}

void draw() {
  background(150);
  gravity = new PVector(0, 0.2);
  //gravity.mult(movers[i].mass);
  wind = new PVector(0.1, 0);
  mover.applyForce(gravity);
  mover.applyForce(wind);
  mover.update();
  mover.display();
  mover.checkEdge();
}