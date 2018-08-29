

class Cell {

  int i;
  int j;
  boolean visited;
  boolean[] walls = new boolean[4];


  Cell(int i_, int j_) {
    i = i_;
    j = j_;
    visited = false;
    for (int i = 0; i < 4; i++) {
      walls[i] = true;
    }
  }

  void display() {
    stroke(255);
    noFill();
    int x = i * w;
    int y = j * w;
    if (walls[0]) { 
      line(x, y, x + w, y    );
    }
    if (walls[1]) { 
      line(x + w, y, x + w, y + w);
    }
    if (walls[2]) { 
      line(x + w, y + w, x, y + w);
    }
    if (walls[3]) { 
      line(x, y + w, x, y    );
    }

    if (visited) {
      noStroke();
      fill(255, 0, 255, 100);
      rect(x, y, w, w);
    }
  }
  
  
  void highlight() {
    noStroke();
    fill(255, 0, 0, 100);
    int x = i * w;
    int y = j * w;
    rect(x, y, w, w);
  }

  Cell check() {
    ArrayList<Cell> neighbors = new ArrayList<Cell>();

    Cell top = null;
    Cell right = null; 
    Cell bottom = null; 
    Cell left = null; 

    if (j != 0) {
      println(1);
      top    = cells[i ][j - 1];
    }

    if (i != cols-1) {
      println(1);
      right  = cells[i + 1][j];
    }

    if (j != rows-1) {
      println(1);
      bottom = cells[i][j + 1];
    }

    if (i != 0) {
      println(1);
      left   = cells[i - 1][j];
    }

    if (top != null && !top.visited) {
      neighbors.add(top);
    }

    if (right  != null && !right.visited) {
      neighbors.add(right);
    }

    if (bottom != null && !bottom.visited) {
      neighbors.add(bottom);
    }

    if (left != null && !left.visited) {
      neighbors.add(left);
    }

    if (neighbors.size() > 0) {
      int num = floor(random(neighbors.size()));
      return neighbors.get(num);
    } else {
      return null;
    }
  }
}
