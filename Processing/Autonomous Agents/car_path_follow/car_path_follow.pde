
Car car;
Path path;

void setup() {
  size(600, 400);
  car = new Car();
  path = new Path();
}


void draw() {
  background(255);
  fill(100, 100);

  path.display();
  
  car.followPath(path);
  car.run();
  
}

void mousePressed() {
  path = new Path();
}
