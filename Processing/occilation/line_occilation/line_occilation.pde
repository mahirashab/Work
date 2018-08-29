float theta = 0.0;
float tSpeed = 0.1;
float sinT;
float x = 0;
float xSpeed = 1;


void setup() {
  size(500, 500); 
  background(100);
}


void draw() {
  background(100);
  translate(0, 150);
  sinT = sin(theta);
  sinT = map(sinT, -1, 1, 0, 255);
  stroke(0);
  line(width/2, -150, x, sinT);
  println(x);
  noStroke();
  fill(200);
  ellipse(x, sinT, 8, 8);
  x += xSpeed;
  theta += tSpeed;
}