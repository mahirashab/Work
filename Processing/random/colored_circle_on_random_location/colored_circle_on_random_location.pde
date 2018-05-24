float x;
float y;
float d;
float r;
float g;
float b;
float t;


void setup() {
  size(1500, 600);
  background(0);
  noStroke();
}

void draw() {
  x = random(width);
  y = random(height);
  d = random(1, 30);
  r = random(255);
  g = random(255);
  b = random(255);
  t = random(255);
  fill(r, g, b, t);
  ellipse(x, y, d, d);
}