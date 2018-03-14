Mover[] movers = new Mover[15];


void setup() {
  size(600, 400);
  for (int i = 0; i < movers.length; i++) { 
    movers[i] = new Mover();
  }
}

void draw() {
  background(250);

  for (int i = 0; i < movers.length; i++) { 

    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector f = movers[i].attract(movers[j]);
        movers[i].applyForce(f);
      }
    }

    movers[i].update();
    movers[i].display();
    movers[i].checkEdge();
  }
}