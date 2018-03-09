float z = 0.0;

void setup() {
 size(400, 400, OPENGL);
 rectMode(CENTER);
}

void draw() {
  translate(width/2, height/2, z);
  rect(0, 0, 50, 50);
  z += 0.5;
}