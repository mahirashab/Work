
Ball ball;

void setup() {
  size(1000, 400); 
  ball = new Ball();
}

void draw() {
  if (keyPressed) {
    if (key == CODED && keyCode == RIGHT) {
      ball.angle += 0.1;
    } else if (key == CODED && keyCode == LEFT) {
      ball.angle -= 0.1;
    } else if (key == ' ') {
      ball.shoot();
    }
  }

  background(200);
  pushMatrix();
  translate(50, 350);
  rotate(ball.angle);
  stroke(1);
  noFill();
  rect(0, -5, 45, 10);
  popMatrix();

  if (ball.shot) {
    PVector gravity = new PVector(0, 0.1);
    ball.applyForce(gravity);
  }
  
  if (ball.location.y > width) {
   ball = new Ball(); 
  }
  
  
  ball.update();
  ball.display();
}