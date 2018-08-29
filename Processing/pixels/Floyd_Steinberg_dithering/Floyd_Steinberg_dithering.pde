PImage img;

int factor = 3;

int errFactor1 = 7;
int errFactor2 = 3;
int errFactor3 = 5;
int errFactor4 = 1;

float errfactors = (errFactor1 + errFactor2 + errFactor3 + errFactor4);


void setup() {
  size(1100, 412);
  img = loadImage("s.jpg");
  image(img, 0, 0, 550, 412);
  img.filter(GRAY);
}



void draw() {
  img.loadPixels();
  for (int y = 0; y < img.height - 1; y++) {
    for (int x = 1; x < img.width - 1; x++) {

      int index = index(x, y);
      color pix = img.pixels[index];

      float oldR = red(pix);
      float oldG = green(pix);
      float oldB = blue(pix);
      float oldBright = brightness(pix);

      int newR = round(factor * oldR/ 255) * (255/factor);
      int newG = round(factor * oldG/ 255) * (255/factor);
      int newB = round(factor * oldB/ 255) * (255/factor);
      int newBright = round(factor * oldBright/ 255) * (255/factor);

      //println(red(img.pixels[index]));

      //img.pixels[index] = color(newBright);
      img.pixels[index] = color(newR, newG, newB);

      //println(red(img.pixels[index]));

      float errR = oldR - newR;
      float errG = oldG - newG;
      float errB = oldB - newB;
      float errBri = oldBright - newBright;

      int indexNew = index(x + 1, y    );
      color c = img.pixels[indexNew];
      float r = red(c);
      float g = green(c);
      float b = blue(c);
      float bri = brightness(c);
      r = r + errR * ((errFactor1/errfactors));
      g = g + errG * ((errFactor1/errfactors));
      b = b + errB * ((errFactor1/errfactors));
      bri = bri + errBri * ((errFactor1/errfactors));
      img.pixels[indexNew] = color(r, g, b);
      //img.pixels[indexNew] = color(bri);


      indexNew = index(x - 1, y + 1);
      c = img.pixels[indexNew];
      r = red(c);
      g = green(c);
      b = blue(c);
      bri = brightness(c);
      r = r + errR * ((errFactor2/errfactors));
      g = g + errG * ((errFactor2/errfactors));
      b = b + errB * ((errFactor2/errfactors));
      bri = bri + errBri * ((errFactor2/errfactors));
      img.pixels[indexNew] = color(r, g, b);
      //img.pixels[indexNew] = color(bri);

      indexNew = index(x, y + 1);
      c = img.pixels[indexNew];
      r = red(c);
      g = green(c);
      b = blue(c);
      bri = brightness(c);
      r = r + errR * ((errFactor3/errfactors));
      g = g + errG * ((errFactor3/errfactors));
      b = b + errB * ((errFactor3/errfactors));
      bri = bri + errBri * ((errFactor3/errfactors));
      img.pixels[indexNew] = color(r, g, b);
      //img.pixels[indexNew] = color(bri);

      indexNew = index(x + 1, y + 1);
      c = img.pixels[indexNew];
      r = red(c);
      g = green(c);
      b = blue(c);
      bri = brightness(c);
      r = r + errR * ((errFactor4/errfactors));
      g = g + errG * ((errFactor4/errfactors));
      b = b + errB * ((errFactor4/errfactors));
      bri = bri + errBri * ((errFactor4/errfactors));
      img.pixels[indexNew] = color(r, g, b);
      //img.pixels[indexNew] = color(bri);
    }
  }
  img.updatePixels();
  image(img, 550, 0, 550, 412);
  //noLoop();
}


int index(int x, int y) {
  return x + y * img.width;
}
