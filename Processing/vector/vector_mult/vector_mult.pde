PVector mouse;
PVector center;


void setup() {
  size(600, 400);
}

void draw() {
  background(255);
  mouse = new PVector(mouseX, mouseY);
  center = new PVector(width/2, height/2);
  
  mouse.sub(center);
  
  mouse.mult(0.5);
  
  translate(width/2, height/2);
  line(0, 0, mouse.x, mouse.y);
}