float a = 0.0;
float aVelocity = 0.0;
float aAcceleration = 0.0;



void setup() {
  size(600, 400);
  rectMode(CENTER);
  stroke(50);
  fill(75);
}

void draw() {
  background(150);
  translate(width/2, height/2);
  aAcceleration = map(mouseX, 0, width, -0.001, 0.001);
  aVelocity += aAcceleration;
  a += aVelocity;
  rotate(a);
  rect(0, 0, 55, 20);
  //println(a);
}