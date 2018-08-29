

class Bar {

  float x;
  float y;
  float w;
  float h;
  float yChange;

  Bar(float x_, float y_) {
    x = x_;
    y = y_;
    w = 10;
    h = 100;
  }

  void display() {
    fill(211, 165, 151);
    rect(x, y, w, h);
  }

  void edges() {
    y += yChange;
    y = constrain(y, h/2, height - h/2);
  }

  void setChange(float c) {
    yChange = c;
  }
}
