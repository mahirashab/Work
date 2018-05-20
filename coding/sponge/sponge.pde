float a = 0;

Box b; 
ArrayList<Box> sponge = new ArrayList<Box>();

void setup() {
  size(600, 400, P3D);
  b = new Box(0, 0, 0, 200);
  sponge.add(b);
}

void draw() {
  background(51);
  lights();

  translate(width/2, height/2);
  rotateX(a);
  rotateY(a * 0.2);
  rotateZ(a * 0.1);

  for (Box b : sponge) {
    b.display();
  }

  a += 0.01;
}


void mousePressed() {
  ArrayList<Box> next = new ArrayList<Box>();
  for (Box b : sponge) {
    ArrayList<Box> nextGen = b.generate();
    next.addAll(nextGen);
  }
  sponge = next;
}
