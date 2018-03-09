Mover[] movers = new Mover[10];
PVector gravity;
PVector wind;

void setup() {
  size(600, 400);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  background(150);
  
  for (int i = 0; i < movers.length; i++) {
    gravity = new PVector(0, 0.2);
    //gravity.mult(movers[i].mass);
    movers[i].applyForce(gravity);
    
    
    //wind = new PVector(0.1, 0);
    //movers[i].applyForce(wind);
    
    
    PVector fiction = movers[i].volocity.get();
    fiction.normalize();
    fiction.mult(-1);
    float mu = 0.01;
    fiction.mult(mu);
    movers[i].applyForce(fiction);
    
    
    movers[i].update();
    movers[i].display();
    movers[i].checkEdge();
  }
}