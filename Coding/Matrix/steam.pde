

class Steam {
  Symbol[] symbols; 
  int count;
  int speed;
  float x;
  float y;
  int fontSize;
  boolean first;

  Steam(float x_, float y_) {
    count = round(random(12, 25));
    symbols = new Symbol[count]; 
    speed = round(random(2, 6));
    first = round(random(3)) == 1;
    x = x_;
    y = y_;
    for (int i = 0; i < count; i++) {
      symbols[i] = new Symbol(x, y, speed, fontSize, first); 
      y -= maxFontSize + 1;
      if (i > 0) {
        first = false;
      }
    }
  }

  void reset() {
    for (int i = 0; i < count; i++) {
      symbols[i] = new Symbol(x, y, speed, fontSize, first); 
      y -= maxFontSize + 1;
      first = false;
    }
  }

  void display() {
    for (int i = 0; i < count; i++) {
      float white = 180; 
      if (i == 0) {
        white = 230;
      } else if (i == 1) {
        white = 180;
      }

      if ((count - i) < 20) {
        float blur = map((count-i), 0, 10, 0, 255);
        symbols[i].display(blur, white);
      } else {
        symbols[i].display(255, white);
      }
    }
  }
}
