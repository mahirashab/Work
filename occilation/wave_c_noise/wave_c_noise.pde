
float angle = 0.0;
float offset = 0.2;


void setup() {
  size(1000, 400);
  fill(100, 100);
}


void draw() {
  background(200);
  float theta = angle;
  for(int x = 0; x < width; x += 10) {
     float y = map(noise(theta), -1, 1, 50, height - 50);
     ellipse(x, y, 10, 10);
     theta += offset;
  }
  angle += 0.03;
}