

class Cell {
  int[] cells;
  int[] ruleSet = {0, 1, 0, 1, 1, 0, 1, 0};

  int w;
  int generation;

  Cell(int w_) {
    w = w_;
    generation = 0;

    cells = new int[width/w];

    for (int i = 0; i < cells.length; i++) {
      cells[i] = 0;
    }

    cells[cells.length/2] = 1;
  }

  void generate() {

    int[] nextGen = new int[cells.length];
    for (int i = 1; i < cells.length - 1; i++) {
      int left = cells[i - 1];
      int mid = cells[i];
      int right = cells[i + 1];
      nextGen[i] = rules(left, mid, right);
    }
    cells = nextGen;
    generation++;
  }

  int rules(int a, int b, int c) {
    String s = "" + a + b + c;
    int index = Integer.parseInt(s, 2);
    return ruleSet[index];
  }

  void display() {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) fill(0);
      else fill(255);
      rect(i*w, generation*w, w, w);
    }
  }

  void check() {
    if (generation * w > height) {
      background(255);
      generation = 0;

      //println(frameCount);
      for (int i = 0; i < cells.length; i++) {
        cells[i] = 0;
      }
      cells[cells.length/2] = 1;

      for (int i = 0; i < ruleSet.length; i++) {
        float tem = random(1);
        if (tem < 0.5) {
          ruleSet[i] = 1;
        } else {
          ruleSet[i] = 0;
        }
        println(ruleSet[i]);
      }
    }
  }
}
