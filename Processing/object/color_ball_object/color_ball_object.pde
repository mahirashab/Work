
Ball[] balls = new Ball[400];

void setup() {
  size(400, 400);
  colorMode(HSB);
  for (int i = 0; i < 99; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  background(200);
  for (int i = 0; i < 99; i++) {
    balls[i].drawn();
    balls[i].move();
    balls[i].check();
  }
}

class Ball {

  float ballX;
  float ballY;
  float ballSpeed;

  Ball() {
    ballX = random(0, width);
    ballY = random(0, height);
    ballSpeed = random(3, 6);
  }

  void move() {
    ballX += ballSpeed;
  }

  void drawn() {
    color col;
    float c = map(ballX, 0, width, 0, 255);
    col = color(c, 200, 200);
    fill(col);
    ellipse(ballX, ballY, 10, 10);
  }

  void check() {
    if (ballX < 0 || ballX > width) {
      ballSpeed *= -1;
    }
  }
}