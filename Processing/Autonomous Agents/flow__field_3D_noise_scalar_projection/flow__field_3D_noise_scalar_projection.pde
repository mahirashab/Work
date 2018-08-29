FlowField flowfield;
ArrayList<Vehicle> vehicle = new ArrayList<Vehicle>();
boolean dis = false;

void setup() {
  size(600, 400);
  for (int i = 0; i < 10; i++) {
    vehicle.add( new Vehicle(random(width), random(height)));
  }
  flowfield = new FlowField(20);
}

void draw() {
  background(250);

  PVector a = new PVector(0, 300);
  PVector b = new PVector(width, 300);


  flowfield.update();
  if (dis) flowfield.display();

  if (mousePressed) {
    vehicle.add(new Vehicle(mouseX, mouseY));
  }

  for (int i = 0; i < vehicle.size(); i++) {
    Vehicle v = vehicle.get(i);
    v.follow(flowfield);
    v.run();

    PVector sp = scalarProjection(v.loc, a, b);
    strokeWeight(2);
    line(a.x, a.y, b.x, b.y);
    fill(0);
    ellipse(a.x, a.y, 8, 8);
    ellipse(b.x, b.y, 8, 8);
    strokeWeight(1);
    line(v.loc.x, v.loc.y, sp.x, sp.y);
    fill(200, 0, 0);
    ellipse(sp.x, sp.y, 6, 6);
    strokeWeight(1);
  }
}

void keyPressed() {
  if (key == ' ') {
    dis = !dis;
  }

  if (key == 'r' && vehicle.size() > 0) {
    vehicle.remove(0);
  }
}

PVector scalarProjection(PVector m, PVector a, PVector b) {
  PVector ab = PVector.sub(b, a);
  PVector am = PVector.sub(m, a);

  ab.normalize();
  ab.mult(am.dot(ab));
  PVector sp = PVector.add(a, ab);
  return sp;
}
