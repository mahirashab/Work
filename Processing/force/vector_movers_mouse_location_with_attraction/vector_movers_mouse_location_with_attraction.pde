
Mover[] movers = new Mover[20];

void setup() {
  size(800, 600);
  for (int i = 0; i < movers.length; i++) {
    movers[i] =  new Mover();
  }
}


void draw() {
  background(255);
  for (int i = 0; i < movers.length; i++) {

    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector f1 = movers[i].attract(movers[j]);
        movers[i].applyForce(f1);
      }
    }

    movers[i].update();
    movers[i].display();
  }
}