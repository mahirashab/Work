Mover mover;
Attractor attractor;

void setup() {
  size(600, 400);
  mover = new Mover();
  attractor = new Attractor();
}

void draw() {
  background(220);
  
  attractor.display();
  PVector f = attractor.attract(mover);
  
  mover.applyForce(f);
  
  mover.update();
  mover.display();
  mover.checkEdge();
}