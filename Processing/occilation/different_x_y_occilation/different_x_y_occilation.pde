float thetaX = 0.0;
float thetaY = 0.0;
float x;
float y;
float ampX;
float ampY;

void setup() {
  size(600, 400);
  ampX = width/2;
  ampY = height/2;
}


void draw() {
  background(250);
  x = ampX * sin(thetaX);
  y = ampY * sin(thetaY);
  translate(width/2, height/2);
  line(0, 0, x, y);
  fill(100, 100);
  ellipse(x, y, 25, 25);
  thetaX += 0.03;
  thetaY += 0.04;
}