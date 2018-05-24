
ArrayList<Vehicle> vehicles = new ArrayList<Vehicle>();

void setup() {
  size(600, 400);
  for (int i = 0; i < 100; i++) {
    float x = random(width);
    float y = random(height);
    vehicles.add(new Vehicle(x, y));
    println(x, y);
  }
}

void draw() {
  background(255);
  
  //println(vehicles.size());
  
  if(mousePressed) {
    vehicles.add(new Vehicle(mouseX, mouseY));
  }

  for (int i = 0; i < vehicles.size(); i++) {
    Vehicle v = vehicles.get(i);
    
    v.applyBehaviour(vehicles);
    v.run();
    //v.display();
    //println(i);
    
  }
}
