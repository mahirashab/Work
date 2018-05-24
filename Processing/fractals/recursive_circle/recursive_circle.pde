
void setup() {
  size(500, 500);
  rectMode(CENTER);
  noFill();
}

void draw() {
  background(100);
  drawCircle(width/2, height/2, width/2);
}

void drawCircle(float x, float y, float r) {
  ellipse(x, y, r, r); 
  if (r > 8) {
    drawCircle(x - r/2, y, r/2);
    drawCircle(x + r/2, y, r/2);
    drawCircle(x, y - r/2, r/2);
    drawCircle(x, y + r/2, r/2);
  }
}