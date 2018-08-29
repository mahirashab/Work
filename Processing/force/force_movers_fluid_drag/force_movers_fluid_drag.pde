Mover[] movers = new Mover[10];
PVector gravity;
PVector wind;
int boxY;

void setup() {
  size(600, 400);
  boxY = height - 200;
  noStroke();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}

void draw() {
  background(150);
  fill(75, 100);
  rect(0, boxY, width, height - boxY);


  for (int i = 0; i < movers.length; i++) {
    gravity = new PVector(0, 0.3);
    gravity.mult(movers[i].mass);
    movers[i].applyForce(gravity);


    //wind = new PVector(0.1, 0);
    //movers[i].applyForce(wind);


    //PVector fiction = movers[i].volocity.get();
    //fiction.normalize();
    //fiction.mult(-1);
    //float mu = 0.01;
    //fiction.mult(mu);
    //movers[i].applyForce(fiction);
    

    if (movers[i].location.y > boxY) {
      PVector drag = movers[i].volocity.get();
      drag.normalize();
      drag.mult(-1);

      float speed = movers[i].volocity.mag();
      float c = 0.1;

      drag.mult(c * speed * speed);
      movers[i].applyForce(drag);
    }
    
    
    movers[i].update();
    movers[i].display();
    movers[i].checkEdge();
  }
}