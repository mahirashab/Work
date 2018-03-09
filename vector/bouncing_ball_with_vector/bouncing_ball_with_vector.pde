PVector location;
PVector volocity;
int d = 25;

void setup() {
  size(600, 600);
  noStroke();
  fill(200);
  smooth();
  location = new PVector(width/2, height/2);
  volocity = new PVector(2, 4);
}

void draw() {
  background(0);
  
  if(location.x + d/2 > width || location.x - d/2 < 0) {
    volocity.x *= -1;
  }
  
  if(location.y + d/2 > height || location.y - d/2 < 0) {
    volocity.y *= -1;
  }
  
  location.add(volocity);
  ellipse(location.x, location.y, d, d);
}