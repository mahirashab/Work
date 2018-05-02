

class Ball {

  float x;
  float y;
  float w;
  float xSpeed;
  float ySpeed;

  Ball(float x_, float y_) {
    x = x_;
    y = y_;
    w = 15;
    float a = random(TWO_PI);
    xSpeed = cos(a) * 5;
    ySpeed = sin(a) * 5;
  }

  void update() {
    x += xSpeed;
    y += ySpeed;
  }

  void edges() {

    if (y < 0 || y > height) {
      ySpeed = -ySpeed;
    }
    
    if (x < 0) {
      x = width/2;
      y = height/2;
      rightScore += 1;
      float a = random(TWO_PI);
      xSpeed = cos(a) * 5;
      ySpeed = sin(a) * 5;
    }
    
    if (x > width) {
      x = width/2;
      y = height/2;
      leftScore += 1;
      float a = random(TWO_PI);
      xSpeed = cos(a) * 5;
      ySpeed = sin(a) * 5;
    }
  }

  void CheckBarLeft(Bar p) {
    if (y < p.y + p.h/2 && y > p.y - p.h/2 && x - w/2 < p.x + p.w/2) {
      xSpeed *= -1;
    }
  }

  void CheckBarRight(Bar p) { 
    if (y < p.y + p.h/2 && y > p.y - p.h/2 && x + w/2 > p.x - p.w/2) {
      xSpeed *= -1;
    }
  }

  void display() {
    noStroke();
    fill(111, 142, 97);
    ellipse(x, y, w, w);
  }
}
