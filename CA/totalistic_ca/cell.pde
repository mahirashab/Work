

class Cell {
  int[] cells;
  int[] ruleSet = new int[8];

  int w;
  int generation;

  Cell(int w_) {
    w = w_;
    generation = 0;

    cells = new int[width/w];

    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }

    for (int i = 0; i < ruleSet.length; i++) {
      ruleSet[i] = int(random(3));
    }

    cells[cells.length/2] = 2;
  }

  void generate() {

    int[] nextGen = new int[cells.length];
    for (int i = 1; i < cells.length - 1; i++) {
      int left = cells[i - 1];
      int mid = cells[i];
      int right = cells[i + 1];
      nextGen[i] = ruleSet[left + mid + right];
      println(ruleSet[left + mid + right]);
    }
    cells = nextGen;
    generation++;
  }

  void display() {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) fill(100);
      else if (cells[i] == 2) fill(0);
      else fill(255);
      rect(i*w, generation*w, w, w);
    }
  }

  void check() {
    if (generation * w > height + 100) {
      background(255);
      generation = 0;

      for (int i = 0; i < ruleSet.length; i++) {
        ruleSet[i] = int(random(3));
      }

      //println(frameCount);
      for (int i = 0; i < cells.length; i++) {
        cells[i] = 0;
      }
      cells[cells.length/2] = 1;
    }
  }
}
