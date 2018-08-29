

class GOL {

  int cols;
  int rows;

  int w = 7;

  Cell[][] cells;

  GOL() {
    cols = width/w; 
    rows = height/w;

    cells = new Cell[cols][rows];

    for (int x = 0; x < cols; x++) {
      for (int y = 0; y < rows; y++) {
        cells[x][y] = new Cell(x*w, y*w, w);
      }
    }
  }

  void generate() {

    for (int x = 0; x < cols; x++) {
      for (int y = 0; y < rows; y++) {
        
        //println(cells[x][y].state);

        if (cells[x][y].state == 1 && state(x, y) < 2) {
          cells[x][y].nextState = 0;
        } else if (cells[x][y].state == 1 && (state(x, y) == 2 || state(x, y) == 3)) {
          cells[x][y].nextState = 1;
        } else if (cells[x][y].state == 1 && state(x, y) > 3) {
          cells[x][y].nextState = 0;
        } else if (cells[x][y].state == 0 && state(x, y) == 3) {
          cells[x][y].nextState = 1;
        }
      }
    }

    for (int x = 1; x < cols - 1; x++) {
      for (int y = 1; y < rows - 1; y++) {
        cells[x][y].update();
      }
    }
  }


  int state(int x, int y) {
    int count = 0;
    int x_ = x;
    int y_ = y;

    for (int i = -1; i < 2; i++) {
      for (int j = -1; j < 2; j++) { 
        count += cells[(x_ + i + cols) % cols][(y_ + j + rows) % rows].state;
      }
    }

    count -= cells[x][y].state;
    return count;
  }

  void display() {
    for (int x = 1; x < cols - 1; x++) {
      for (int y = 1; y < rows - 1; y++) {
        cells[x][y].display();
      }
    }
  }
}
