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
  wind = new PVector(random(0, 0.4), 0);
  PVector wallForce = mover.rightWallForce();
  mover.applyForce(wallForce);
  mover.applyForce(gravity);
  mover.applyForce(wind);
  mover.update();
  mover.display();
  mover.checkEdge();
}