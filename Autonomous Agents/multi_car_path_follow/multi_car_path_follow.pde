
ArrayList<Car> car = new ArrayList<Car>();
Path path;

void setup() {
  size(600, 400);
  for (int i = 0; i < 4; i++) {
    car.add(new Car());
  }
  path = new Path();
}


void draw() {
  background(255);
  fill(100, 100);

  path.display();

  for (int i = 0; i < 4; i++) {
    Car c = car.get(i);
    c.followPath(path);
    c.borders(path);
    c.run();
  }
}

void mousePressed() {
  path = new Path();
}
