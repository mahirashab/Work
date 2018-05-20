

class Arm {
  PVector a;
  PVector b;
  float len;
  float angle;
  float selfA;
  Arm child;
  Arm parent;
  
  float xoff = random(1000);
  
  Arm(float x, float y, float len_, float angle_) {
    a = new PVector(x, y);
    len = len_;
    angle = angle_;
    selfA = angle;
    parent = null;
    calB();
  }

  void calB() {
    float x = len * cos(angle);
    float y = len * sin(angle);
    b = new PVector(a.x + x, a.y + y);
  }
  
  void angle() {
    //selfA += 0.01;
    float min = -1;;
    float max = 1;
    selfA = map(noise(xoff), 0, 1, min, max);
    xoff += 0.01;
  }
  
  void update() {
    angle = selfA;
    if (child != null) {
      child.a = b.copy(); 
    }
    if (parent != null) {
      angle += parent.angle; 
    }else  {
      angle += -PI/2; 
    }
    calB();
  }

  void display() {
    stroke(255); 
    strokeWeight(2);
    line(a.x, a.y, b.x, b.y);
  }
}
