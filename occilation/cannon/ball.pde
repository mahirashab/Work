

class Ball {
  PVector location;
  PVector velocity;
  PVector acc;
  float angle;
  boolean shot;
  
  Ball() {
   location = new PVector(50, 350);
   velocity = new PVector(0, 0);
   acc = new PVector(0, 0);
   angle = 0 - 45;
   shot = false;
  }
  
  
  void update() {
    velocity.add(acc);
    location.add(velocity);
    velocity.mult(.991);
    acc.mult(0);
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    acc.add(f);
  }
  
  void shoot() {
    PVector force = new PVector(cos(angle), sin(angle));
    force.normalize();
    force.mult(1);
    applyForce(force);
    shot = true;
    println(1);
  }
  
  void display() {
   fill(100);
   noStroke();
   ellipse(location.x, location.y, 15, 15);
  }
}