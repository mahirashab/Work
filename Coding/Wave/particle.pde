


class Particle {
  PVector loc;
  PVector preLoc;
  PVector vel;
  PVector acc;
  float limit;

  Particle(float x_, float y_) {
    loc = new PVector(x_, y_);
    preLoc = loc.copy();
    vel = PVector.random2D();
    acc = new PVector(0, 0);
    limit = random(1, 3);
  }


  void update() {
    vel.add(acc);
    vel.limit(limit);
    loc.add(vel);
    acc.mult(0);
    updatePre();
  }

  void applyForce(PVector f) {
    acc.add(f);
  }

  void display() {
    stroke(0, 10);
    strokeWeight(1);
    line(loc.x, loc.y, preLoc.x, preLoc.y);
    //point(loc.x, loc.y);
  }

  void follow(PVector[][] flow) {
    int x = int(constrain(loc.x/scl, 0, cols-1));
    int y = int(constrain(loc.y/scl, 0, rows-1));
    PVector force = flow[x][y];
    applyForce(force);
  }

  void updatePre() {
    preLoc.x = loc.x;
    preLoc.y = loc.y;
  }

  void edges() {
    if (loc.x > width) {
      loc.x = 0;
      updatePre();
    }
    if (loc.x < 0) {
      loc.x = width;
      updatePre();
    }
    if (loc.y > height) {
      loc.y = 0;
      updatePre();
    }
    if (loc.y < 0) {
      loc.y = height;
      updatePre();
    }
  }
}
