

class Particle {

  PVector loc;
  PVector velocity;
  PVector acc;
  float life;
  float r;
  boolean highlight;

  Particle(float mX, float mY) {
    loc = new PVector(mX, mY);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acc = new PVector(0, 0);
    life = 255;
    r = 5;
    highlight = false;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acc);
    loc.add(velocity);
    acc.mult(0);
    life += -2;
  }

  void display() {
    strokeWeight(2);
    stroke(10, life);
    fill(150, life);
    if (highlight) {
     fill(150, 0, 0); 
    }
    ellipse(loc.x, loc.y, r*2, r*2);
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    acc.add(f);
  }


  void intersects(ArrayList<Particle> particles) {
    highlight = false;
    for (Particle other : particles) {
      if (other != this) {
        PVector dir = PVector.sub(loc, other.loc);
        if (dir.mag() < r*2) {
          dir.setMag(0.5); 
          applyForce(dir);
        }
      }
    }
  }
}
