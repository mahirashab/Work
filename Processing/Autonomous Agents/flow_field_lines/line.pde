

class Line {

  PVector loc;
  PVector pre;
  PVector velocity;
  PVector acc;

  float r;

  float maxSpeed;
  float maxForce;

  Line() {
    loc = new PVector(random(width), random(height));
    pre = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
    acc = new PVector(0, 0);

    r = 5;

    maxSpeed = random(1, 4);
    maxForce = random(0.2, 0.5);
  }

  void run() {
    update();
    borders();
    updatePre();
    display();
  }

  void display() {
    //strokeWeight(2);
    colorMode(RGB, width, height, 255);
    stroke(loc.x, loc.y, 120);
    line(loc.x, loc.y, pre.x, pre.y);
    updatePre();
  }

  void update() {
    velocity.add(acc);
    loc.add(velocity);
    acc.mult(0);
  }


  void updatePre() {
    pre.x = loc.x;
    pre.y = loc.y;
  }



  void follow(FlowField flow) {
    PVector desire = flow.lookUp(loc);

    desire.setMag(maxSpeed);

    PVector force = PVector.sub(desire, velocity);
    force.limit(maxForce);

    applyForce(force);
  }

  void borders() {
    if (loc.x < 0) {
      loc.x = width;
      updatePre();
    }
    if (loc.y < 0) { 
      loc.y = height;
      updatePre();
    }
    if (loc.x > width) {
      loc.x = 0;
      updatePre();
    }
    if (loc.y > height) {
      loc.y = 0;
      updatePre();
    }
  }


  void applyForce(PVector force) {
    PVector f = force.get();
    acc.add(f);
  }
}
