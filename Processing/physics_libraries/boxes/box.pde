


class Box {

  float x;
  float y;
  float w;
  float h;

  Box(float x_, float y_, float w_, float h_) {

    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }


  void display() {

    stroke(10);
    fill(100);
    rect(x, y, w, h);
  }
}
