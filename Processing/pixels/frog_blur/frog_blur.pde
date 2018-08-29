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
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      int loc = i  + j * width;
      float r = 0;
      float g = 0;
      float b = 0;
      float br = 0;

      int range = 1;

      for (int x = -range; x < range + 1; x++) {
        for (int y = -range; y < range + 1; y++) {
          int locTem = ((i + x + width) % width) + ((j + y + height) % height) * width;
          r += red(frog.pixels[locTem]);
          g += green(frog.pixels[locTem]);
          b += blue(frog.pixels[locTem]);
          br += brightness(frog.pixels[locTem]);
        }
      }


      float div = ((range * 2 + 1) * (range * 2 + 1));


      if (i > mouseX - 30 && i < mouseX + 30 && j > mouseY - 30 && j < mouseY + 30) {
        pixels[loc] = color(r/div, g /div, b/div);
      } else {
        pixels[loc] = color(frog.pixels[loc]);
      }

      noFill();
      rectMode(CENTER);
      rect(i, j, 30, 30);
    }
  }
  updatePixels();
}
