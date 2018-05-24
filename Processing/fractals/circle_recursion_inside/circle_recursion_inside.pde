
void setup() {
   size(500, 500);
   background(100);
}

void draw() {
  
  drawCircle(width/2, height/2, width, 200);
  
}

void drawCircle(float x, float y, float r, float c) {
  if (c < 1) {
   c = 1; 
  }
  stroke(c);
  fill(c);
  ellipse(x, y, r, r);
  if(r > 4) {
   drawCircle(x, y, r - 20, c - 5); 
  }
}