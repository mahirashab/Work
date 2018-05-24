
class Orbit {

  float x;
  float y;
  float r;
  int n;
  float speed;
  float angle;
  Orbit parent;
  Orbit child;

  Orbit(float x_, float y_, float r_, int n_, Orbit p) {
    x = x_;
    y = y_;
    r = r_;
    angle = -PI/2;
    n = n_;
    speed = (radians(pow(k, (n - 1))))/res;
    parent =  p;
    child = null;
  }

  void show() {
    stroke(255); 
    strokeWeight(1);
    noFill();
    ellipse(x, y, r*2, r*2);
  }

  void update() {
    if (parent != null) {
      float rsum = r + parent.r;
      x = parent.x + rsum * cos(angle);
      y = parent.y + rsum * sin(angle);
      angle += speed;
    }
  }


  Orbit addChild() {
    float newr = r / 3;
    float newx = x + r + newr;
    float newy = y;
    child = new Orbit(newx, newy, newr, n+1, this);
    return child;
  }
}
