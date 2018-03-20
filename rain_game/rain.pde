class Rain {
  float rX;
  float rY;
  float rSpeed;
  float rAcceleration;
  int r;

  Rain(float acc) {
    rX = random(10, width - 10);
    rY = 0;
    rSpeed = 1;
    rAcceleration = acc;
    r = 5;
  }

  void display() {
    noStroke();
    fill(100, 100, 50);
    ellipse(rX, rY, r, r);
  }

  void update() {
    rY += rSpeed; 
    rSpeed += rAcceleration;
  }

  boolean touched(Catcher c) {
    if (c.cY < rY && rX >= c.cX - c.cWidth/2 && rX <= c.cX + c.cWidth/2) {
      return true;  
    } else {
      return false;
    }
  }

  boolean ground() {
    if (rY > height) {
      return true;
    } else {
      return false;
    }
  }
}
