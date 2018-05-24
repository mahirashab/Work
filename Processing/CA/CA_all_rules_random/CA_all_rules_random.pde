Cell ca;

void setup() {
  size(1000, 400);
  background(255);
  noStroke();
  ca = new Cell(2);
}


void draw() {

  ca.display();
  ca.generate();
  ca.check();
  
}
