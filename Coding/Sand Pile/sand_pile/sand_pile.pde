
int[][] pile;
int w = 2;
int cols;
int rows;

void setup() {
  size(600, 400);
  noStroke();
  cols = width/w;
  rows = height/w;
  pile = new int[cols][rows];
  pile[cols/2][rows/2] = 1000000000;
}

void render() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int num = pile[i][j];
      color col = color(255, 0, 0);
      if (num == 0) {
        col = color(255, 255, 0);
      } else if (num == 1) {
        col = color(0, 185, 63);
      } else if (num == 2) {
        col = color(0, 104, 255);
      } else if (num == 3) {
        col = color(122, 0, 229);
      }
      fill(col);
      rect(i*w, j*w, w, w);
    }
  }
}

void topple() {
  int[][] next = new int[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int num = pile[i][j];
      if (num < 4) {
        next[i][j] = num;
      } 
    }
  }
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int num = pile[i][j];
      if (num >= 4) {
        next[i][j] += num - 4;
        next[i+1][j]++;
        next[i-1][j]++; 
        next[i][j+1]++; 
        next[i][j-1]++;
      } 
    }
  }
  pile = next;
}


void draw() {
  render();
  for(int i = 0; i < 100; i++) {
    topple();
  }
}
