

class Vehicle {

  PVector loc;
  PVector velocity;
  PVector acc;

  float r;
  float radious;
  float theta;

  float wallD;

  float maxSpeed;
  float maxForce;

  Vehicle() {
    loc = new PVector(width/2, height/2);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acc = new PVector(0, 0);

    r = 5;
    radious = 30;
    theta = 0;

    wallD = 30;

    maxSpeed = 2;
    maxForce = 0.15;
  }

  void run() {
    wander();
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

  void wander() {
    strokeWeight(1);
    stroke(1);
    PVector d = velocity.get();
    d.setMag(80);
    d = PVector.add(loc, d);
    line(loc.x, loc.y, d.x, d.y);
    noFill();
    ellipse(d.x, d.y, radious*2, radious*2);

    float change = 3;
    theta += ceil(random(-change, change));
    float x = radious * cos(radians(theta));
    float y = radious * sin(radians(theta));
    PVector dir = new PVector(x, y);
    PVector target = PVector.add(d, dir);
    line(d.x, d.y, target.x, target.y);
    strokeWeight(2);
    point(target.x, target.y);


    PVector desire = PVector.sub(target, loc);
    
    //float turn = maxSpeed - 1;
    //if (loc.x < wallD) {
    //  desire = new PVector(turn, velocity.y);
    //} else if (loc.x > width -wallD) {
    //  desire = new PVector(-turn, velocity.y);
    //} 

    //if (loc.y < wallD) {
    //  desire = new PVector(velocity.x, turn);
    //} else if (loc.y > height-wallD) {
    //  desire = new PVector(velocity.x, -turn);
    //} 

    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r;

    desire.setMag(maxSpeed);

    PVector force = PVector.sub(desire, velocity);
    force.limit(maxForce);

    applyForce(force);
  }

  void applyForce(PVector force) {
    PVector f = force.get();
    acc.add(f);
  }
}
