
class Rocket {
  PVector location;
  PVector velocity;
  PVector acc;
  float r;
  float theta;
  float heading;

  Rocket() {
    location = new PVector(random(width), random(height));
    velocity = new PVector();
    acc = new PVector();
    r = 16;
    heading = 0.0;
    theta = heading - PI/2;
  }

  void update() {
    velocity.add(acc);
    velocity.mult(.989);
    velocity.limit(5);
    location.add(velocity);
    acc.mult(0);
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    acc.add(f);
  }
  
  void thrust() {
   PVector dir = new PVector(cos(theta - PI/2), sin(theta - PI/2));
   //dir.normalize();
   dir.mult(2);
   applyForce(dir);
  }

  void display() {
    fill(100);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    fill(175);
    if (keyPressed && key == ' ') fill(255, 0, 0);
    // Booster rockets
    rect(-r/2, r, r/3, r/2);
    rect(r/2, r, r/3, r/2);
    fill(175);
    // A triangle
    beginShape();
    vertex(-r, r);
    vertex(0, -r);
    vertex(r, r);
    endShape(CLOSE);
    rectMode(CENTER);
    popMatrix();
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}