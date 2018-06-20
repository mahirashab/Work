PImage buffer1;
PImage buffer2;
PImage cooling;

float ystart = 0.0;

void setup() {
  size(600, 400);
  buffer1 = createImage(width, height, RGB);
  buffer2 = createImage(width, height, RGB);
  cooling = createImage(width, height, RGB);

  buffer1.loadPixels();
  for (int x = 0; x < width; x++) {
    int index = x + (height - 1) * width;
    buffer1.pixels[index] = color(255);
  }
  buffer1.updatePixels();
}


void draw() {
  
  cool();

  buffer1.loadPixels();
  buffer1.loadPixels();
  for (int i = 1; i < width-1; i++) {
    for (int j = 1; j < height-1; j++) {
      int index0 = (i) + (j-1) * width;

      int index1 = (i+1) + (j) * width;
      int index2 = (i-1) + (j) * width;
      int index3 = (i)   + (j+1) * width;
      int index4 = (i)   + (j-1) * width;

      color c1 = buffer1.pixels[index1];
      color c2 = buffer1.pixels[index2];
      color c3 = buffer1.pixels[index3];
      color c4 = buffer1.pixels[index4];

      color c5 = cooling.pixels[index0];
      float newC = brightness(c1) + brightness(c2)+ brightness(c3) + brightness(c4);
      newC = newC * 0.25 - brightness(c5);
      
      buffer2.pixels[index0] = color(newC);
    }
  }
  buffer2.updatePixels();

  fire(10);

  PImage temp = buffer1;
  buffer1 = buffer2;
  buffer2 = temp;

  image(buffer2, 0, 0);
  //image(cooling, 0, 0);
}

void fire(int rows) {
  buffer2.loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < rows; j++) {
      int y = height - (j + 1);
      int index = i + y * width; 
      buffer2.pixels[index] = color(255);
    }
  }
  buffer2.updatePixels();
}


void cool() {
  cooling.loadPixels();
  float xoff = 0.0; 
  float increment = 0.1;
  for (int x = 0; x < width; x++) {
    xoff += increment; 
    float yoff = ystart; 
    for (int y = 0; y < height; y++) {
      yoff += increment; 

      float n = noise(xoff, yoff);     
      float bright = pow(n, 3) * 255;

   
      cooling.pixels[x+y*width] = color(bright);
    }
  }

  cooling.updatePixels();
  ystart += increment;
}
