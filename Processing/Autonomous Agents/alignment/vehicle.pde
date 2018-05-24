

class Vehicle {

  PVector loc;
  PVector velocity;
  PVector acc;

  float r;

  float maxSpeed;
  float maxForce;

  Vehicle(float x, float y) {
    loc = new PVector(x, y);
    velocity = PVector.random2D();
    velocity.mult(random(1,4));
    acc = new PVector(0, 0);

    r = 4;

    maxSpeed = 3;
    maxForce = 0.5;
  }

  void run() {
    borders();
    update();
    display();
  }

  void display() {
    pushMatrix();
    strokeWeight(1);
    stroke(20);
    fill(100, 100);

    translate(loc.x, loc.y);

    float a = velocity.heading2D() + PI/2;
    rotate(a);

    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);

    popMatrix();
  }

  void update() {
    velocity.add(acc);
    loc.add(velocity);
    acc.mult(0);
  }

  void align(ArrayList<Vehicle> vehicles) {

    float lookDis = 50;
    PVector sum = new PVector(0, 0);
    float count = 0;

    for (int i = 0; i < vehicles.size(); i++) {
      Vehicle v = vehicles.get(i);
      float dist = PVector.dist(loc, v.loc);
      if (dist > 0 && dist < lookDis) {
        sum.add(v.velocity);
        count++;
        //println(count);
      }
    }

    if (count > 0) {

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
