Mover[] movers = new Mover[30];
Pocket[] pockets = new Pocket[5];
PVector gravity;
PVector wind;

void setup() {
  size(600, 400);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }

  for (int i = 0; i < pockets.length; i++) {
    pockets[i] = new Pocket();
  }
}

void draw() {
  background(150);

  for (int i = 0; i < movers.length; i++) {
    gravity = new PVector(0, 0.2);
    //gravity.mult(movers[i].mass);
    movers[i].applyForce(gravity);

    for (int j = 0; j < pockets.length; j++) {
      pockets[j].display();
      if (pockets[j].inside(movers[i])) {
        PVector fiction = movers[i].volocity.get();
        fiction.normalize();
        fiction.mult(-1);
        fiction.mult(pockets[j].mu);
        movers[i].applyForce(fiction);
      }
    }

    movers[i].update();
    movers[i].display();
    movers[i].checkEdge();
  }
}