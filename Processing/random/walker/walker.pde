Walker w;

void setup() {
  size(500, 500);
  background(100);
  w = new Walker();
}

void draw() {
  w.step();
  w.display();
}

class Walker {
  float x;
  float y;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void step() {
    float xS = random(-1, 1); 
    float yS = random(-1, 1); 
    x += xS;
    y += yS;
  }

  void display() {
    stroke(0);
    ellipse(x, y, 10, 10);
  }
}