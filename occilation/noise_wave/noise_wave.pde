
float angle = 0.0;
float offset = 0.07;
float pX = 0;
float pY = 0;

void setup() {
  size(1000, 400);
  fill(200);
}


void draw() {
  background(200);
  float theta = angle;
  beginShape();
  for(int x = 0; x < width; x += 5) {
     float y = map(noise(theta), -1, 1, 50, height - 50);
     vertex(x, y);
     theta += offset;
  }
  endShape();
  angle += 0.02;
}