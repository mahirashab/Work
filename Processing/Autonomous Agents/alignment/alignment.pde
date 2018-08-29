
ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();

void setup() {
  size(600, 400);
  for (int i = 0; i < 70; i++) {
    vehicles.add(new Vehicle(random(width), random(height)));
  }
}

void draw() {
  background(255);
  
  println(vehicles.size());
  
  if(mousePressed) {
    vehicles.add(new Vehicle(mouseX, mouseY));
  }

  for (int i = 0; i < vehicles.size(); i++) {
    Vehicle v = vehicles.get(i);
    
    v.align(vehicles);
    v.run();
  }
}
