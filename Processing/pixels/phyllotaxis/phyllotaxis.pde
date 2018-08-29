
float goldenRatio = ((sqrt(5) + 1 ) / 2);
float px, py, r, degree;
int iter = 0;
float maxWeight = 3;
float spacing = maxWeight+2;
float currWeight;

int current = 0;

PImage img;

void setup() {
  size(500, 500);
  background(230);
  img = loadImage("img" + current + ".jpg");
  px = width/2; 
  py = height/2;
}


void draw() {
  for (int i = 34; i > 0; --i) {
    degree = (iter * goldenRatio) * 360;
    r = sqrt(iter++) * spacing;
    calcPointPos(width/2, height/2, r, (degree % 360));


    color pix = img.get((int)px, (int)py);
    currWeight = map(brightness(pix), 255, 0, 1, maxWeight);
    strokeWeight(currWeight);
    stroke(#523939); 
    //stroke(pix);
    point(px, py);
    if (px-10 <= 0 || px+10 >= width || py-10 <= 0 || py+10 >= height ) { 
      noLoop();
    }
  }
}


void calcPointPos(float x, float y, float r, float graden) {
  px = x + cos(radians(graden))*(r/2);
  py = y + sin(radians(graden))*(r/2);
}

void mousePressed() {
  loop();
  redraw();
  background(230);
  current = ((current + 1) % 5);
  img = loadImage("img" + current + ".jpg");
  px = width/2; 
  py = height/2;
  iter = 0;
}

void keyPressed() {
 saveFrame("save" + random(1000)); 
}
