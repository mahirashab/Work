

class Symbol {
  float x;
  float y;
  float speed;
  int interval;
  String value;
  int fontSize;
  boolean first;


  Symbol(float x_, float y_, float speed_, int fontSize_, boolean first_) {
    x = x_;
    y = y_;
    interval = round(random(5, 10));
    speed = speed_;
    fontSize = fontSize_;
    value = str(round(random(0, 10)));
    first = first_;
  }

  void setValue() {
    if (frameCount % interval == 0) {
      value = str(round(random(0, 10)));
    }
  }

  void display(float blur, float white) {
    if (first) {
      fill(180, 205, white);
    } else {
      fill(0, 255, 30, blur);
    }
    text(value, x, y);
    rain();
    setValue();
  }

  void rain() {
    y += speed;
    //if (y > height) {
    //  y = 0;
    //}
  }
}
