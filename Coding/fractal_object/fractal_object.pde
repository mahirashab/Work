ArrayList<Branch> tree = new ArrayList<Branch>();
PVector a;
PVector b;

void setup() {
  size(600, 500);
  stroke(51);
  a = new PVector(width/2, height);
  b = new PVector(width/2, height - 150);
  tree.add(new Branch(a, b));
}

void draw() {
  background(230);

  for (Branch b : tree) {
    b.display();
  }
}

void mousePressed() {
  for (int i = tree.size() - 1; i >= 0; i--) {
    Branch b = tree.get(i);
    if (b.last) {
      tree.add(b.newBranchA());
      tree.add(b.newBranchB());
    }
  }
}
