

class Vehicle {

  PVector loc;
  PVector velocity;
  PVector acc;

  float r;
  float t;

  float maxSpeed;
  float maxForce;

  Vehicle(float x, float y) {
    loc = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acc = new PVector(0, 0);

    r = 3;

    maxSpeed = random(3, 4);
    maxForce = random(0.02, 0.05);
  }

  void run() {
    borders();
    update();
    display();
  }

  void display() {
    pushMatrix();
    stroke(20);
    fill(200, 100);

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
    velocity.limit(maxSpeed);
    loc.add(velocity);
    acc.mult(0);
  }

  PVector seperate(ArrayList<Vehicle> vehicles) {

    float ds = 25.0f;
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
      }
    }

    if (count > 0) {
      sum.div((float)count);
    }

    // As long as the vector is greater than 0
    if (sum.mag() > 0) {
      // Implement Reynolds: Steering = Desired - Velocity
      sum.normalize();
      sum.mult(maxSpeed);
      sum.sub(velocity);
      sum.limit(maxForce);
    }
    return sum;
  }



  PVector align(ArrayList<Vehicle> vehicles) {

    float da = 50;
    PVector sum = new PVector(0, 0);
    float count = 0;

    for (int i = 0; i < vehicles.size(); i++) {
      Vehicle v = vehicles.get(i);
      float dist = PVector.dist(loc, v.loc);
      if (dist > 0 &&  dist < da) {
        sum.add(v.velocity);
        count++;
      }
    }

    if (count > 0 ) {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxSpeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxForce);
      return steer;
    } else {
      return new PVector();
    }
  }


  PVector cohesion(ArrayList<Vehicle> vehicles) {

    float da = 50;
    PVector sum = new PVector(0, 0);
    float count = 0;

    for (int i = 0; i < vehicles.size(); i++) {
      Vehicle v = vehicles.get(i);
      float dist = PVector.dist(loc, v.loc);
      if (dist > 0 &&  dist < da) {
        sum.add(v.loc);
        count++;
      }
    }

    if (count > 0) {
      sum.div(count);
      return seek(sum);
    } else {
      return new PVector(0, 0);
    }
  }

  void applyBehaviour(ArrayList<Vehicle> v) {
    PVector sep = seperate(v);
    PVector align = align(v);
    PVector cohesion = cohesion(v);
    
    
    sep.mult(1.5);
    //align.mult(1.0);
    //cohesion.mult(1.0);
    
    
    //sep.mult(map(noise(t), 0, 1, 1, 1.5));
    align.mult(map(noise(t), 0, 1, 0.5, 1.0));
    cohesion.mult(map(noise(t), 0, 1, 0.5, 1.0));
    
    t += 0.1;



    applyForce(sep);
    applyForce(align);
    applyForce(cohesion);
  }

  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, loc);

    desired.normalize();
    desired.mult(maxSpeed);

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    return steer;
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
