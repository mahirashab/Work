float time = 1;
float mult = 2;
float r = 200;

float col = 0;


void setup() {
  size(600, 400);
  colorMode(HSB);
}

void draw() {
  background(255);
  translate(width/2, height/2);
  
  for(int i = 0; i < 200; i++) {
    float angle1 = map(i, 0, 200, 0, TWO_PI);
    float x1 = r * cos(angle1);
    float y1 = r * sin(angle1);
    
    float angle2 = map(i*time, 0 , 200*time, 0, time*TWO_PI);
    float x2 = r * cos(angle2);
    float y2 = r * sin(angle2);
    
    stroke(col%255, 255, 255);
    //strokeWeight(2);
    line(x1, y1, x2, y2);
  }
  time += 0.04;
  //mult += 0.01;
  
  time = min(time, 200);  
  col += 0.1;
}
