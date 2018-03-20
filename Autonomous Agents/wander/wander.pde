
Vehicle vehicle;

void setup() {
  size(600, 400);
  vehicle = new Vehicle();
}


void draw() {
  background(200);
  fill(100, 100);

  //stroke(175);
  //noFill();
  //rectMode(CENTER);
  //rect(width/2, height/2, width-vehicle.wallD*2, height-vehicle.wallD*2);

  vehicle.run();
}

void mousePressed() {
  vehicle = new Vehicle();
}
