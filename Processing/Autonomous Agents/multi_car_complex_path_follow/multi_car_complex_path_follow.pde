
ArrayList<Car> car = new ArrayList<Car>();
Path path;

float carNum = 5;

void setup() {
  size(1000, 400);
  for (int i = 0; i < carNum; i++) {
    car.add(new Car(random(width), random(height)));
  }
  path = new Path();
}


void draw() {
  background(255);
  fill(100, 100);

  path.display();

  for (int i = 0; i < car.size(); i++) {
    Car c = car.get(i);
    c.followPath(path);
    c.borders(path);
    c.run();
  }
}

void keyPressed() {
  if (key == 'r') {
    if (car.size() > 0) {
      car.remove(0);
    }
  }
}

void mousePressed() {
  path = new Path();
}

void mouseDragged() {
  car.add(new Car(mouseX, mouseY));
}
