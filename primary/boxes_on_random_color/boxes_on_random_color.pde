int wid = 10;

void setup() {
  size(400, 400);
  background(100);
}

void draw() {
  for(int x = 0; x < width; x += wid) {
     for(int y = 0; y < height; y += wid) {
        fill(random(100, 200));
        rect(x, y , wid, wid);
     }
  }
}