
float angle = PI/4;

void setup() {
  size(600, 400);
  stroke(51);
}

void draw() {
  background(230);
  translate(width/2, height);
  angle = map(mouseX, 0, width, 0, PI);
  branch(125);
}


void branch(float len) {
  line(0, 0, 0, -len);
  translate(0, -len);

  if (len > 1) {
    pushMatrix();
    rotate(angle + PI/8);
    branch(len * 0.67);
    popMatrix();
    pushMatrix();
    rotate(-angle + PI/8);
    branch(len * 0.67);
    popMatrix();
  }
}
