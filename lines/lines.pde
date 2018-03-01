int wid = 20;

void setup() {
   size(600, 600);
   frameRate(20);
   background(255);
}

void draw() {
   for(int x = 0; x < width; x += wid) {
      for(int y = 0; y < height; y += wid) {
         line(x, y, x + height, y);
         line(x, y, x, y + width);
          line(x, y, x + height, y + width);
          line(x + wid, y , x, y + wid);
      }
   }  
}