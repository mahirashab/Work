FlowField flowfield;
ArrayList<Vehicle> vehicle = new ArrayList<Vehicle>();
boolean dis = false;

void setup() {
  size(600, 400);
  for (int i = 0; i < 100; i++) {
    vehicle.add( new Vehicle(random(width), random(height)));
  }
  flowfield = new FlowField(20);
}

void draw() {
  background(250);

  flowfield.update();
  if (dis) flowfield.display();

  if (mousePressed) {
    vehicle.add(new Vehicle(mouseX, mouseY));
  }

  for (int i = 0; i < vehicle.size(); i++) {
    Vehicle v = vehicle.get(i);
    v.follow(flowfield);
    v.run();
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
