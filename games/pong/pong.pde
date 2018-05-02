Bar leftBar;
Bar rightBar;
Ball ball;

int leftScore = 0;
int rightScore = 0;

void setup() {
  size(600, 400);
  rectMode(CENTER);
  ball = new Ball(width/2, height/2);
  leftBar = new Bar(20, height/2);
  rightBar = new Bar(width - 20, height/2);
}


void draw() {
  background(51);

  ball.display();
  ball.update();
  ball.edges();
  ball.CheckBarRight(rightBar);
  ball.CheckBarLeft(leftBar);

  leftBar.display();
  leftBar.edges();

  rightBar.display();
  rightBar.edges();

  fill(255);
  textSize(15);
  text(leftScore, 12, 20);
  text(rightScore, width - 20, 20);
}

void keyReleased() {
  leftBar.setChange(0);
  rightBar.setChange(0);
}

void keyPressed() {
  if (key == 'r') {
    background(51);
    ball = new Ball(width/2, height/2);
    leftBar = new Bar(20, height/2);
    rightBar = new Bar(width - 20, height/2);
    leftScore = 0;
    rightScore = 0;
  }

  if (key == 'w') {
    leftBar.setChange(-10);
  } else if (key == 's') {
    leftBar.setChange(10);
  }

  if (key == 'o') {
    rightBar.setChange(-10);
  } else if (key == 'l') {
    rightBar.setChange(10);
  }
}
