
GOL gol;

boolean start = false;

void setup() {
  size(700, 500);
  //fullScreen();
  gol = new GOL();
}

void draw() {
  background(255);

  println(frameRate);

  if (start) {
    gol.generate();
  }
  gol.display();
}

void keyPressed() {
  if (key == ' ') {
    start = true;
  }
  if (key == 'r') {
    start = false;
    gol = new GOL();
  }
}

void mousePressed() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    int x = int(mouseX/gol.w);
    int y = int(mouseY/gol.w);
    if (gol.cells[x][y].state == 1) gol.cells[x][y].state = 0;
    else if (gol.cells[x][y].state == 0) gol.cells[x][y].state = 1;
  }
}

void mouseDragged() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    int x = int(mouseX/gol.w);
    int y = int(mouseY/gol.w);
    gol.cells[x][y].state = 1;
  }
}
