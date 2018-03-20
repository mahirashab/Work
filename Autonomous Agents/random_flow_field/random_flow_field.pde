
Vehicle vehicle;

void setup() {
  size(600, 400);
  vehicle = new Vehicle();
}


void draw() {
  background(200);
  fill(100, 100);
  ellipse(mouseX, mouseY, 15, 15);
  
  vehicle.run();
  
}
