float angle = 0.0;
float velocity = 0.0;
float acceleration = 0.00001;


void setup() {
  size(300, 300);
  background(200);
}

void draw() {
  background(200);
  noStroke();
  fill(200, 8);
  rect(0, 0, width, height);

  pushMatrix();
  translate(width/2, height/2);
  rotate(angle);
  stroke(0);
  fill(150, 100);
  line(0, 0, 70, 0);
  line(0, 0, -70, 0);
  line(0, 0, 0, 70);
  line(0, 0, 0, -70);
  ellipse(0, 70, 20, 20);
  ellipse(0, -70, 20, 20);
  ellipse(70, 0, 20, 20);
  ellipse(-70, 0, 20, 20);
  popMatrix();

  angle += velocity;
  velocity += acceleration;
}