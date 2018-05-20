

class Box {
  PVector pos;
  float r;
  float red;
  float green;
  float blue;
  

  Box(float x, float y, float z, float r_) {
    pos = new PVector(x, y, z);
    r = r_;
    red = random(150);
    green = random(150);
    blue = random(150);
  }

  ArrayList generate() {
    ArrayList<Box> boxes = new ArrayList<Box>();
    for (int x = -1; x < 2; x++) {
      for (int y = -1; y < 2; y++) {
        for (int z = -1; z < 2; z++) {
          int sum = abs(x) + abs(y) + abs(z); 
          float newR = r/3;
          if (sum > 1) {
            Box b = new Box(pos.x + x * newR, pos.y + y * newR, pos.z + z * newR, newR);
            boxes.add(b);
          }
        }
      }
    }
    return boxes;
  }

  void display() {
    ambient(red, green, blue);
    //fill(red, green, blue);
    //fill(107, 88, 183);
    //ambient(107, 88, 183);
    noStroke();
    //stroke(255);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    box(r);
    popMatrix();
  }
}
