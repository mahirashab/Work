
int[][] cells;

int antX;
int antY;

int antUP = 0;
int antRIGHT = 1;
int antDOWN = 2;
int antLEFT = 3;

int dir;

void setup() {
  size(600, 400);
  //fullScreen();

  cells = new int[width][height];

  background(255);

  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      cells[i][j] = 0;
    }
  }

  antX = width/2;
  antY = height/2;

  cells[antX][antY] = 1;

  dir = antUP;
}


void draw() {

  for (int a = 0; a < 100; a++) {
    int state = cells[antX][antY];
    if (state == 0) {
      turnRight();
      cells[antX][antY] = 1;
      forward();
    } else if (state == 1) {
      turnLeft();
      cells[antX][antY] = 0;
      forward();
    }
  }

  loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      int index = i + j * width;
      if (cells[i][j] == 0) {
        pixels[index] = color(255);
      } else if (cells[i][j] == 1) {
        pixels[index] = color(0);
      }
      pixels[antX + antY * width] = color(255, 0, 0);
    }
  }
  updatePixels();
}

void turnRight() {
  dir++;
  if (dir > antLEFT) {
    dir = antUP;
  }
}

void turnLeft() {
  dir--;
  if (dir < antUP) {
    dir = antLEFT;
  }
}

void forward() {
  if (dir == antUP) {
    antY--;
  } else if (dir == antRIGHT) {
    antX++;
  } else if (dir == antDOWN) {
    antY++;
  } else if (dir == antLEFT) {
    antX--;
  }

  if (antX > width - 1) {
    antX = 0;
  } else if (antX < 0) {
    antX = width - 1;
  }

  if (antY < 0) {
    antY = height - 1;
  } else if (antY > height - 1) {
    antY = 0;
  }
}
