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
  mover.applyForce(gravity);

  //wind = new PVector(0.1, 0);
  //mover.applyForce(wind);

  if (mousePressed) {
    PVector drag = mover.volocity.get();
    drag.normalize();
    drag.mult(-1);
    float speed = mover.volocity.mag();
    float c = 0.1;
    drag.mult(c * speed * speed);
    mover.applyForce(drag);
  }

  mover.update();
  mover.display();
  mover.checkEdge();
}