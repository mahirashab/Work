PImage img;

int resolution;
int cols;
int rows;

int maxW = 3;



void setup() {
  size(550, 412);
  background(255);
  img = loadImage("img1.jpg");
  resolution = maxW + 2;
  cols = img.width/resolution;
  rows = img.height/resolution;
}

void draw() {
  for(int i = 0; i < cols; i++) {
    for(int j = 0; j < rows; j++) {
      color c = img.get(i*resolution, j * resolution);
      float b = brightness(c);
      b = map(b, 255, 0, 1, maxW);
      strokeWeight(b);
      point(i*resolution, j * resolution);
    }
  }
  noLoop();
}
