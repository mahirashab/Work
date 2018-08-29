float angle = 0.0;
float aSpeed = 0.2;
float rAngle = 0.0;
float rASpeed = 0.5;
float r = 0;
float rSpeed = 0.2;
float x, y;
float pX, pY;

void setup() {
  size(400, 400);
  background(100);
  pX = 0;
  pY = 0;
}

void draw() {
  translate(width/2, height/2);
  rotate(rAngle);
  rAngle += rASpeed;
  x = r * cos(angle);
  y = r * sin(angle);
  stroke(255);
  line(pX, pY, x, y);
  pX = x;
  pY = y;
  r += rSpeed;
  angle += aSpeed;
  if (mousePressed || x > width/2) {
    aSpeed = random(0.1, 0.7);
    rASpeed = random(0.1, 0.7);
    rSpeed = random(0.1, 0.7);
    pX = 0;
    pY = 0;
    angle = 0.0;
    rAngle = 0.0;
    r = 0;
    background(100);
  }
}

void keyPressed() {
  if ( key == 's') {
    noLoop();
  } else if (key == 'r') {
    loop();
  }
}