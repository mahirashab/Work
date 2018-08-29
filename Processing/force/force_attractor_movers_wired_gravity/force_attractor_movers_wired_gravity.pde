Mover[] movers = new Mover[15];
Attractor attractor;

void setup() {
  size(600, 400);
  for (int i = 0; i < movers.length; i++) { 
    movers[i] = new Mover();
  }
  attractor = new Attractor();
}

void draw() {
  background(250);

  for (int i = 0; i < movers.length; i++) { 

    attractor.display();
    PVector f = attractor.attract(movers[i]);

    movers[i].applyForce(f);
    movers[i].update();
    movers[i].display();
    movers[i].checkEdge();
  }
}