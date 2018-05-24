FlowField flowfield;
Vehicle vehicle;

void setup() {
  size(600, 400);
  vehicle = new Vehicle();
  flowfield = new FlowField(20);
}

void draw() {
  background(200);
  
  flowfield.run();
  
  vehicle.follow(flowfield);
  vehicle.run();
  
}
