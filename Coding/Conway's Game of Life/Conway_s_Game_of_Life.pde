
GOL gol;

void setup() {
  size(700, 500);
  //fullScreen();
  gol = new GOL();
}

void draw() {
  background(255);

  println(frameRate);

  gol.generate();
  gol.display();
}

//void mousePressed() {
//  gol = new GOL();
//}

void mouseDragged() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    int x = int(mouseX/gol.w);
    int y = int(mouseY/gol.w);
    gol.cells[x][y].state = 1;
  }
}
