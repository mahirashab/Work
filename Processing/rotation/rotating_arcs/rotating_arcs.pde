float angle = 0;

void setup() {
 size(600, 600);
 noStroke();
 //stroke(200);
 //strokeWeight(3);
 smooth();
}

void draw() {
  translate(width/2, height/2);
  background(100);
  fill(angle % 255);
  for(int r = 10; r < 250; r += 20) {
   rotate(radians(angle)); 
   for(int d = 30; d < 300; d += 1) {
    float x_1 = r * cos(radians(d)); 
    float y_1 = r * sin(radians(d)); 
    float x_2 = r * cos(radians(d + 3)); 
    float y_2 = r * sin(radians(d + 3));
    //line(x_1, y_1, x_2, y_2);
    ellipse(x_1, y_1, 4, 4);
    ellipse(x_2, y_2, 4, 4);
   }
  }
  angle += 0.4;
}