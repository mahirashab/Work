PImage frog;

void setup() {
  size(400, 349);
  frog = loadImage("frog.jpg");
}


void draw() {
  background(250);
  //image(frog, 0, 0);
  loadPixels();
  frog.loadPixels();
  for(int i = 0; i < width; i++) {
      for(int j = 0; j < height; j++) {
       int loc = i + j * width;
       float r = red(frog.pixels[loc]);
       float g = green(frog.pixels[loc]);
       float b = blue(frog.pixels[loc]);
       float br = brightness(frog.pixels[loc]);
       pixels[loc] = color(br);
      }

  }
  updatePixels();
}
