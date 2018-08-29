

void setup() {
  size(800, 100);
  background(255);
}

void draw() {
  lines(10, 0, width - 20);
}

void lines(float x, float y, float w) {
  println(w);
  if(w >= 1) {
    line(x, y, x + w, y);
    y += 10;
    lines(x, y, w/3);
    lines(x + w*2/3, y, w/3);
  }
}
