PVector mouse;
PVector center;
float mag;


void setup() {
  size(600, 400);
}

void draw() {
  background(255);
  mouse = new PVector(mouseX, mouseY);
  center = new PVector(width/2, height/2);
  
  mouse.sub(center);
  
  mag = mouse.mag();
  fill(0);
  rect(0, 0, mag*2, 10);
  
  translate(width/2, height/2);
  line(0, 0, mouse.x, mouse.y);
}