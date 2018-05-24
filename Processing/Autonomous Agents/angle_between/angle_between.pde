

void setup() {
  size(600, 400);
}


void draw() {
  background(250);
  
  PVector mouse =  new PVector(mouseX, mouseY);
  PVector center = new PVector(width/2, height/2);
  
  PVector mouLoc = PVector.sub(mouse, center);
  mouLoc.setMag(150);
  PVector xAxis = new PVector(150, 0);
  translate(width/2, height/2);
  line(0, 0, mouLoc.x, mouLoc.y);
  line(0, 0, xAxis.x, xAxis.y);
  
  float dot = xAxis.dot(mouLoc);
  float theta = acos(dot / (xAxis.mag() * mouLoc.mag()));
  
  textSize(20);
  fill(0);
  text(int(degrees(theta)) + " degrees\n" + theta + " radians", 10, 160);  
}
