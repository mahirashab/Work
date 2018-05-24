

void setup() {
  size(800, 200);
  background(255);
  fill(100, 100);
}

void draw() {
  rects(10, 0, width - 20);
}

void rects(float x, float y, float w) {
  println(w);
  if(w >= 1) {
    rect(x, y, w, 10);
    y += 20;
    rects(x, y, w/3);
    rects(x + w*2/3, y, w/3);
  }
}
