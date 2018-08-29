

class Car {

  PVector loc;
  PVector velocity;
  PVector acc;

  float r;

  float maxSpeed;
  float maxForce;

  Car(float x, float y) {
    loc = new PVector(x, y);
    velocity = new PVector(0, 0);
    acc = new PVector(0, 0);

    r = 12;

    maxSpeed = random(2, 3);
    maxForce = random(0.05, 0.08);
  }

  void run() {
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

  void followPath(Path path, boolean dis) {

    PVector predictVelocity = velocity.get();
    predictVelocity.setMag(50);
    PVector predictLoc = PVector.add(loc, predictVelocity);


    PVector normal = null;
    PVector target = null;
    float worldRecord = 10000;


    for (int i = 0; i < path.points.size(); i++) {

      PVector a = path.points.get(i);
      PVector b = path.points.get((i + 1 ) % path.points.size());

      PVector dir = PVector.sub(b, a);

      PVector normalT = scalarProjection(predictLoc, a, b);

      if (normalT.x < min(a.x, b.x) || normalT.x > max(a.x, b.x) || normalT.y < min(a.y, b.y) || normalT.y > max(a.y, b.y)) {
        normalT = b.get();
        a = path.points.get((i + 1) % path.points.size());
        b = path.points.get((i + 2)% path.points.size());
        //dir = PVector.sub(b, a);
      }

      float dist = PVector.dist(predictLoc, normalT);

      if (dist < worldRecord) {
        worldRecord = dist;
        normal = normalT;   

        dir = PVector.sub(b, a);
        dir.normalize();
        dir.mult(10);
        target = normalT.get();
        target.add(dir);
      }
    }

    if (worldRecord > r) {
      seek(target);
    }

    if (dis == true ) {
      strokeWeight(2);
      stroke(100, 100);
      fill(0);
      line(loc.x, loc.y, predictLoc.x, predictLoc.y);
      ellipse(predictLoc.x, predictLoc.y, 4, 4);

      line(predictLoc.x, predictLoc.y, normal.x, normal.y);
      ellipse(normal.x, normal.y, 4, 4);

      if (worldRecord > r) {
        fill(150, 0, 0);
      }

      ellipse(target.x, target.y, 8, 8);
    }
  }



  PVector scalarProjection(PVector l, PVector a, PVector b) {

    PVector ab = PVector.sub(b, a);
    float limit = ab.mag();
    PVector la = PVector.sub(l, a);

    ab.normalize();
    ab.setMag(la.dot(ab));

    PVector result = PVector.add(a, ab);

    return result;
  }

  void seperation(ArrayList<Car> cars) {
    PVector sum = new PVector();
    float count = 0;
    float sepDist = r*2;
    for ( Car c : cars) {
      float dist = PVector.dist(loc, c.loc);
      if (dist > 0 && dist < sepDist) {
        PVector d = PVector.sub(loc, c.loc);
        d.normalize();
        d.div(dist);
        //d.mult(-1);
        sum.add(d);
        count++;
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

  void borders(Path p) {
    if (loc.x < -r) loc.x = width+r;
    //if (position.y < -r) position.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    //if (position.y > height+r) position.y = -r;
  }
}
