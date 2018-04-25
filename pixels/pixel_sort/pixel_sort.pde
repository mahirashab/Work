PImage flower;
PImage sorted;

void setup() {
  size(1100, 412);
  flower = loadImage("cat.jpg");
  sorted = createImage(flower.width, flower.height, RGB);
  flower.loadPixels();
  sorted.loadPixels();
  for (int i = 0; i < flower.pixels.length; i++) {
    sorted.pixels[i] = flower.pixels[i];
  }
  updatePixels();

  flower.loadPixels();
  sorted.loadPixels();
  for (int i = 0; i < sorted.width; i++) {
    for (int j = 0; j < sorted.height; j++) {
      float record = 0;
      int select = j;
      for (int k = j; k < sorted.height; k++) {
        int index =  i + k * sorted.width;
        color c = sorted.pixels[index];
        float check = blue(c);
        if (check > record) {
          record = check;
          select = k;
        }
      }
      color temp = sorted.pixels[i + j * flower.width];
      sorted.pixels[i + j * flower.width] = sorted.pixels[i + select * flower.width]; 
      sorted.pixels[i + select * flower.width] = temp;
    }
  }
  updatePixels();
}


void draw() {
  image(flower, 0, 0, 550, 412);
  image(sorted, 550, 0, 550, 412);
}
