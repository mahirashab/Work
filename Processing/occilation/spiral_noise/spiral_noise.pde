float angle = 0.0;
float r = 25;
float t = 0.0;


void setup() {
  size(600, 400);
  background(200);
}

void draw() {
  //background(200);

  float xN = map(noise(t), 0, 1, -8, 8);
  float yN = map(noise(t + 10000), 0, 1, -8, 8);

  translate(width/2, height/2);
  float x = r * cos(angle) + xN;
  float y = r * sin(angle) + yN;
  fill(100, 100);
  //strokeWeight(2);
  point(x, y);
  //ellipse(x, y, 2, 2);

  angle += 0.005;
  r += 0.01;
  t +=0.04;
}