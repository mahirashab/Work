float theta = 0.0;
float tSpeed = 0.07;
float sinT;
float x = 0;
float xSpeed = 1;
float xOff = 0;


void setup() {
  size(500, 500);  
  background(100);
}


void draw() {
  translate(0, 200);
  println(frameCount);
  sinT = sin(theta);
  sinT = map(sinT, -1, 1, 0, 255);
  noStroke();
  fill(200);
  ellipse(x, sinT, 4, 4);
  x += xSpeed;
  theta += tSpeed;
}