Cell ca;

void setup() {
  //size(1000, 400);
  fullScreen();
  frameRate(35);
  background(255);
  noStroke();
  ca = new Cell(2);
}


void draw() {

  ca.display();
  ca.generate();
  ca.check();
}

void keyPressed() {
  if (key == 's') {
    noLoop();
  } else if (key == 'r') {
    loop();
  }
}

void mousePressed() {
  background(255);
  ca = new Cell(2);
}
