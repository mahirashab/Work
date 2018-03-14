
class Pocket {
  PVector location;
  float wid;
  int dir;
  float mu;

  Pocket() {
    location = new PVector(random(width), random(100, height - 150));
    wid = random(50, 100);
    dir = int(random(-1, 1));
    mu = random(0.01, 0.04);
  }
  
  
  void display() {
   noFill();
   stroke(0);
   ellipse(location.x, location.y, wid, wid);
  }

  boolean inside(Mover m) {
    float dis = m.mass * 10 + wid;
    PVector d = PVector.sub(m.location, location);
    float dMag = d.mag();
    if (dMag <= dis) {
      println(1);
      return true;
    } else {
      println(0);
      return false;
    }
  }
}