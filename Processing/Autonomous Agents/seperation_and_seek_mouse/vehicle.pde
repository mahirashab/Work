

class Vehicle {

  PVector loc;
  PVector velocity;
  PVector acc;

  float r;

  float maxSpeed;
  float maxForce;

  Vehicle(float x, float y) {
    loc = new PVector(x, y);
    velocity = new PVector(0, 0);
    acc = new PVector(0, 0);

    r = 12;

    maxSpeed = 3;
    maxForce = 0.2;
  }

  void run() {
    borders();
    update();
    display();
  }

  void display() {
    strokeWeight(1);
    stroke(20);
    fill(100);

    ellipse(loc.x, loc.y, r, r);
  }

  void update() {
    velocity.add(acc);
    loc.add(velocity);
    acc.mult(0);
  }

  PVector seperate(ArrayList<Vehicle> vehicles) {

    float ds = r*2;
    PVector sum = new PVector(0, 0);
    float count = 0;

    for (int i = 0; i < vehicles.size(); i++) {
      Vehicle v = vehicles.get(i);
      float dist = PVector.dist(loc, v.loc);
      if (dist > 0 &&  dist < ds) {
        PVector diff = PVector.sub(loc, v.loc);
        diff.normalize();
        diff.div(dist);
        sum.add(diff);
        count++;
        //println(count);
        println(diff.x);
      }
    }

    if (count > 0 ) {

      PVector average = sum.div(count);


      PVector desire = average.get();

      desire.setMag(maxSpeed);

      PVector force = PVector.sub(desire, velocity);
      force.limit(maxForce);

      return force;
    } else {
      return new PVector();
    }
  }

  PVector seek(float x, float y) {
    PVector s = new PVector(x, y);


    PVector desire = PVector.sub(s, loc);

    desire.setMag(maxSpeed);

    PVector force = PVector.sub(desire, velocity);
    force.limit(maxForce);

    return force;
  }

  void applyBehaviour(ArrayList<Vehicle> v) {
    PVector sep = seperate(v);
    PVector seek = seek(mouseX, mouseY);
    sep.mult(3);
    seek.mult(1);
    
    applyForce(sep);
    applyForce(seek);
  }

  void borders() {
    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r;
  }


  void applyForce(PVector force) {
    PVector f = force.get();
    acc.add(f);
  }
}
