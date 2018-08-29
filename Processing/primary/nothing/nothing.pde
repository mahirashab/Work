float x = 0;
float pX = 0;
float xSpeed = 0.5;
float y;
float pY = 0;
float yT;
float ytSpeed = 0.1;

void setup() {
  size(600, 400);
  background(100);
  translate(width/2, height/2);
}

void draw() {
  y = noise(yT);
  yT += ytSpeed;
  stroke(35);
  line(x, (y * 5), pX, pY);
  x += xSpeed;
  pX = x;
  pY = y * height;
  if(x > width) {
   noLoop(); 
  }
}