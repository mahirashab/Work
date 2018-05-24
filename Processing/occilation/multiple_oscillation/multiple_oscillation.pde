float angle1, angle2;
float aV1, aV2;
float aM1, aM2;
float x;


void setup() {
  size(600, 400);
  fill(100, 100);
  angle1 = 0.0;
  angle2 = 0.0;
  aV1 = 0.01;
  aV2 = 0.2;
  aM1 = 300;
  aM2 = 10;
}

void draw() {
  background(200);
  x = 0;
  x += aM1 * sin(angle1);
  x += aM2 * sin(angle2);
  translate(width/2, height/2);
  line(0, 0, x, 0);
  ellipse(x, 0, 15, 15);
  angle1 += aV1;
  angle2 += aV2;
}