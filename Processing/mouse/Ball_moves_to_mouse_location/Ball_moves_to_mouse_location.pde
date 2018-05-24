Walker w;

void setup() {
  size(500, 500);
  background(100);
  w = new Walker();
}

void draw() {
  w.step(mouseX, mouseY);
  w.display();
}

class Walker {
  float x;
  float y;
  float mX;
  float mY;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void step(float mouX, float mouY) {

    if (mouX < x) {
      mX = -1;
    } else if (mouX > x) {
      mX = 1;
    }

    if (mouY < y) {
      mY = -1;
    } else if (mouY > y) {
      mY = 1;
    }

    float xS = random(-1, 1); 
    float yS = random(-1, 1); 

    float pro = random(1);

    if (pro < 0.3) {
      x += mX;
      y += mY;
    } else if (pro > 0.5) {
      x += xS;
      y += yS;
    }
  }

  void display() {
    stroke(0);
    ellipse(x, y, 10, 10);
  }
}