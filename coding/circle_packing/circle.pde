

class Circle {

  float x;
  float y;
  float r;
  float rSpeed;
  boolean grow;
  boolean overLap;

  Circle(float x_, float y_) {
    x = x_;
    y = y_;
    r = 1;
    rSpeed = 0.2; 
    grow = true;
  }

  void display() {
    stroke(255);
    noFill();
    ellipse(x, y, r*2, r*2);
  }

  void grow() {
    if (grow) {
      r += rSpeed;
    }
  }

  void edges() {
    if (x+r+2 > width || x-r+2 < 0 || y+r+2 > height || y-r+2 < 0 ) {
      grow = false;
    }
  }
}
