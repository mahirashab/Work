
void setup() {
  size(400, 400);
  background(0);
  noStroke();
  boxes();
}

void draw() {
}


void boxes() {
  for (int i = 0; i < width; i += width/4) {
    for (int j = 0; j < height; j += random(3, 40)) {
      fill(random(50, 255), random(50, 255), random(50, 255), random(200));
      if (j == 0) {
        rect(i, j, width/4, random(3, 40));
      }
      rect(i, j, width/4, j);
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    boxes();
  }
}