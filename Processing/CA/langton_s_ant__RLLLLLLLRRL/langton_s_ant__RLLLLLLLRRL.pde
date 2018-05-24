
int[][] cells;

int antX;
int antY;

int antUP = 0;
int antRIGHT = 1;
int antDOWN = 2;
int antLEFT = 3;

int dir;

void setup() {
  //size(600, 400);
  fullScreen();

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

  for (int a = 0; a < 1000; a++) {
    int state = cells[antX][antY];
    if (state == 0) {
      turnRight();
      cells[antX][antY] = 1;
      forward();
    } else if (state == 1) {
      turnLeft();
      cells[antX][antY] = 2;
      forward();
    } else if (state == 2) {
      turnLeft();
      cells[antX][antY] = 3;
      forward();
    } else if (state == 3) {
      turnLeft();
      cells[antX][antY] = 4;
      forward();
    } else if (state == 4) {
      turnLeft();
      cells[antX][antY] = 5;
      forward();
    } else if (state == 5) {
      turnLeft();
      cells[antX][antY] = 6;
      forward();
    } else if (state == 6) {
      turnLeft();
      cells[antX][antY] = 7;
      forward();
    } else if (state == 7) {
      turnLeft();
      cells[antX][antY] = 8;
      forward();
    } else if (state == 8) {
      turnRight();
      cells[antX][antY] = 9;
      forward();
    } else if (state == 9) {
      turnRight();
      cells[antX][antY] = 10;
      forward();
    } else if (state == 10) {
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
      } else if (cells[i][j] == 2) {
        pixels[index] = color(100);
      } else if (cells[i][j] == 3) {
        pixels[index] = color(200, 288, 72);
      } else if (cells[i][j] == 4) {
        pixels[index] = color(200, 21, 222);
      } else if (cells[i][j] == 5) {
        pixels[index] = color(20, 145, 222);
      } else if (cells[i][j] == 6) {
        pixels[index] = color(123, 33, 41);
      } else if (cells[i][j] == 7) {
        pixels[index] = color(200, 0, 144);
      } else if (cells[i][j] == 8) {
        pixels[index] = color(200, 46, 222);
      } else if (cells[i][j] == 9) {
        pixels[index] = color(200, 111, 234);
      } else if (cells[i][j] == 10) {
        pixels[index] = color(200, 31, 40);
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
