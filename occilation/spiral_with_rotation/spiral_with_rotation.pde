float theta = 0.0;
float r = 0;
float x, y, pX, pY;



void setup() {
  size(600, 400);
  background(200);
  noStroke();
  fill(100, 100);
  //pX = 0;
  //pY = 0;
}


void draw() {
  translate(width/2, height/2);
  rotate(frameCount);
  x = r * cos(theta);
  y = r * sin(theta);
  ellipse(x, y, 10, 10);
  theta += 0.01;
  r += 0.04;
  //line(pX, pY, x, y);
  //pX = x;
  //pY = y;
}