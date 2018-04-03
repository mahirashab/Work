

class Cell {
  int[] cells;
  int[] ruleSet = new int[int(pow(2, 5))];

  int w;
  int generation;

  Cell(int w_) {
    w = w_;
    generation = 0;

    cells = new int[width/w];

    for (int i = 0; i < cells.length; i++) {
        cells[i] = int(random(2));
    }

    for (int i = 0; i < ruleSet.length; i++) {
      float tem = random(1);
      if (tem < 0.5) {
        ruleSet[i] = 1;
      } else {
        ruleSet[i] = 0;
      }
    }
  }

  void generate() {

    int[] nextGen = new int[cells.length];
    for (int i = 2; i < cells.length - 2; i++) {
      int left = cells[i - 1];
      int left1 = cells[i - 2];
      int mid = cells[i];
      int right = cells[i + 1];
      int right1 = cells[i + 2];
      nextGen[i] = rules(left, left1, mid, right, right1);
    }
    cells = nextGen;
    generation++;
  }

  int rules(int a, int a1, int b, int c, int c1) {
    String s = "" + a + a1 + b + c + c1;
    int index = Integer.parseInt(s, 2);
    println(index);
    return ruleSet[index];
  }

  void display() {
    for (int i = 0; i < cells.length; i++) {
      if (cells[i] == 1) fill(100);
      else fill(255);
      rect(i*w, generation*w, w, w);
    }
  }

  void check() {
    if (generation * w > height + 125) {
      background(255);
      generation = 0;

      //println(frameCount);
      for (int i = 0; i < cells.length; i++) {
        cells[i] = int(random(2));
      }

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
