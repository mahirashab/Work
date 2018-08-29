float x, y;
float xSpeed = 2;
float ySpeed = 4;
int d = 25;

void setup() {
  size(600, 600);
  x = width/2;
  y = height/2;
}


void draw() {
  background(0);

  if (x + d/2 > width || x - d/2 < 0) {
    xSpeed *= -1;
  }

  if (y + d/2 > height || y-d/2 < 0) {
    ySpeed *= -1;
  }

  noStroke();
  fill(100);
  ellipse(x, y, d, d);
  x += xSpeed;
  y += ySpeed;
  //println(x, y);
}