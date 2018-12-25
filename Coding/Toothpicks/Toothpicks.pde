
ArrayList<Toothpick> picks;

int minX;
int maxX;

void setup() {
  size(600, 600);
  minX = -width/2;
  maxX = width/2;
  picks = new ArrayList<Toothpick>();
  picks.add(new Toothpick(0, 0, 1));
  //noLoop();
}

//void mousePressed() {
//  redraw();
//}

void draw() {
  background(221);
  translate(width/2, height/2);
  
  float s = float(width) / (maxX - minX);
  scale(s);

  for (Toothpick t : picks) {
    t.show();
    minX = min(t.ax, minX);
    maxX = max(t.ax, maxX);
  }

  ArrayList<Toothpick> next = new ArrayList<Toothpick>();
  for (Toothpick t : picks) {
    if (t.newPick) {
      Toothpick nextA = t.createA(picks);
      Toothpick nextB = t.createB(picks);
      if (nextA != null) {
        next.add(nextA);
      }
      if (nextB != null) {
        next.add(nextB);
      }
    }
    t.newPick = false;
  }
  picks.addAll(next);
}
