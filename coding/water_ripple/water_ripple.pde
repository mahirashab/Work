float[][] current;
float[][] previous;
float damping = 0.98;

void setup() {
  size(600, 400);
  
  current = new float[width][height];
  previous = new float[width][height];
  
  //for (int i = 1; i < width - 1; i++) {
  //  for (int j = 1; j < height - 1; j++) {
  //    current[i][j] = 255;
  //    previous[i][j] = 255;
  //  }
  //}
  
  background(51);
}

void mousePressed() {
 previous[mouseX][mouseY] = 1000; 
}

void mouseDragged() {
 previous[mouseX][mouseY] = 1000; 
}


void draw() {
  
  loadPixels();
  for (int i = 1; i < width - 1; i++) {
    for (int j = 1; j < height - 1; j++) {
      current[i][j] = (
        previous[i - 1][j   ] +
        previous[i + 1][j   ] +
        previous[i    ][j - 1] +
        previous[i    ][j + 1]) / 2 - (current[i][j]);
        current[i][j] = current[i][j] * damping;

      int index = i + j * width;
      pixels[index] = color(current[i][j]);
    }
  }
  updatePixels();


  float[][] temp = previous;
  previous = current;
  current = temp;
}
