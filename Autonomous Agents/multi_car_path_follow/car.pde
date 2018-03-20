

class Car {

  PVector loc;
  PVector velocity;
  PVector acc;

  float r;

  float maxSpeed;
  float maxForce;

  Car() {
    loc = new PVector(random(width), random(width));
    velocity = new PVector(0, 0);
    acc = new PVector(0, 0);

    r = 5;

    maxSpeed = random(3, 5);
    maxForce = random(0.03, 0.05);
  }

  void run() {
    update();
    display();
  }

  void display() {
    pushMatrix();
    strokeWeight(2);
    stroke(20);
    fill(100);

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

  void seek(PVector d) {
    PVector desire = PVector.sub(d, loc);

    desire.setMag(maxSpeed);

    PVector force = PVector.sub(desire, velocity);
    force.limit(maxForce);

    applyForce(force);
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    acc.add(f);
  }

  void followPath(Path path) {

    PVector predictV = velocity.get();
    predictV.setMag(50);
    PVector predictL = PVector.add(loc, predictV);
    strokeWeight(2);
    stroke(100, 100);
    fill(0);
    line(loc.x, loc.y, predictL.x, predictL.y);

    ellipse(predictL.x, predictL.y, 5, 5);

    PVector a = path.start;
    PVector b = path.end;

    PVector normalT = scalarProjection(predictL, a, b);
    line(predictL.x, predictL.y, normalT.x, normalT.y);
    ellipse(normalT.x, normalT.y, 5, 5);

    PVector d = PVector.sub(predictL, normalT);
    float distance = d.mag();

    PVector further = PVector.sub(b, a);
    further.setMag(15);
    PVector target = PVector.add(normalT, further);


    if (distance > r) {
      fill(150, 0, 0);
      seek(target);
    }
    ellipse(target.x, target.y, 8, 8);
  }


  PVector scalarProjection(PVector l, PVector a, PVector b) {

    PVector ab = PVector.sub(b, a);
    PVector la = PVector.sub(l, a);

    ab.normalize();
    ab.setMag(la.dot(ab));

    return PVector.add(a, ab);
  }

  void borders(Path p) {
    if (loc.x > p.end.x + r) {
      loc.x = p.start.x - r;
      loc.y = p.start.y + (loc.y-p.end.y);
    }
  }
}
