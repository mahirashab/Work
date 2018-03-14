
Rocket rocket;

void setup() {
  size(600, 400);
  rocket = new Rocket();
}

void draw() {
  background(200);
  if (keyPressed) {
    if (key == CODED && keyCode == RIGHT) {
      rocket.theta += 0.1;
    } else if (key == CODED && keyCode == LEFT) {
      rocket.theta -= 0.1;
    } else if (key == ' ') {
      rocket.thrust();
    }
  }

  rocket.update();
  rocket.checkEdges();
  rocket.display();
}