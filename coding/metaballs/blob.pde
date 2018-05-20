

class Blob {
  PVector pos;
  PVector vel;
  float r;

  Blob(float x, float y) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
    vel.mult(random(2, 4));
    r = 40;
  }

  void show() {
    noFill(); 
    stroke(0);
    ellipse(pos.x, pos.y, r*2, r*2);
  }

  void update() {
    pos.add(vel);

    if (pos.x < 0 || pos.x > width) {
      vel.x *= -1;
    }

    if (pos.y < 0 || pos.y > height) {
      vel.y *= -1;
    }
  }
}
