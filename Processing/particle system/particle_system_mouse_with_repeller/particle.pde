

class Particle {
 
  PVector loc;
  PVector velocity;
  PVector acc;
  float life;
  float mass; 
  
  Particle(float mX, float mY) {
   loc = new PVector(mX, mY);
   velocity = new PVector(random(-1, 1), random(-1, 1));
   acc = new PVector(0, 0);
   life = 255;
   mass = 1;
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
    ellipse(loc.x, loc.y, 10, 10);
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    acc.add(f);
  }
  
  
  
}
