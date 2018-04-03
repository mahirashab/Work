

void setup() {
  size(600, 400);
  background(255);
}


void draw() {
  lines(width/2, height/2, width/6);
  noLoop();
}


void lines(float x, float y, float w) {
  if(w >= 4) {
   line(x - w, y, x + w, y);
   line(x - w, y + w, x - w, y - w);
   line(x + w, y - w, x + w, y + w);
   println(w);
   lines(x - w, y + w, w/2);
   lines(x - w, y - w, w/2);
   lines(x + w, y + w, w/2);
   lines(x + w, y - w, w/2);
  }
}
