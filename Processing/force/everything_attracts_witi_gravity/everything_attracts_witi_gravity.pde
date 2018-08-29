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

    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector f1 = movers[i].attract(movers[j]);
        movers[i].applyForce(f1);
      }
    }

    attractor.display();
    PVector f2 = attractor.attract(movers[i]);
    movers[i].applyForce(f2);
    movers[i].update();
    movers[i].display();
    movers[i].checkEdge();
  }
}