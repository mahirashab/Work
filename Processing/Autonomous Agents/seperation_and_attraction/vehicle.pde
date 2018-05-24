

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
    fill(120);

    ellipse(loc.x, loc.y, r, r);
  }

  void update() {
    velocity.add(acc);
    loc.add(velocity);
    acc.mult(0);
  }

  void seperate(ArrayList<Vehicle> vehicles) {
    
    float ds = r*2;
    PVector sum = new PVector(0, 0);
    float count = 0;

    for (int i = 0; i < vehicles.size(); i++) {
      Vehicle v = vehicles.get(i);
      float dist = PVector.dist(loc, v.loc);
      if (dist > 0 &&  dist < ds) {
        PVector diff = PVector.sub(loc, v.loc);
        diff.normalize();
        diff.mult(dist);
        sum.add(diff);
        count++;
        //println(count);
        println(diff.x);
      }
      
      if (dist > 0 && dist < r*3 &&  dist < ds) {
        PVector d = PVector.sub(loc, v.loc);
        d.normalize();
        d.div(dist);
        //d.mult(-1);
        sum.add(d);
        count++;
      }
    }

    if (count > 0 ) {

      PVector average = sum.div(count);


      PVector desire = average.get();

      desire.setMag(maxSpeed);

      PVector force = PVector.sub(desire, velocity);
      force.limit(maxForce);

      applyForce(force);
    }
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
