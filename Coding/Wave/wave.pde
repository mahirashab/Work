float inc = 0.04;
float xoff;
float yoff;
float zoff = 5000;

int scl = 10;
int cols, rows;

Particle[] particles = new Particle[1000];
PVector[][] flowField;


void setup() {
  size(1000, 400);
  background(255);
  cols = int(width/scl);
  rows = int(height/scl);
  flowField = new PVector[cols][rows];
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(random(width), random(height));
  }
}

void draw() {
  //background(255);
  yoff = 10000;
  for (int x = 0; x < cols; x++) {
    xoff = 0;
    for (int y = 0; y < rows; y++) {
      float a = map(noise(xoff, yoff, zoff), 0, 1, 0, TWO_PI*4);
      PVector v = PVector.fromAngle(a);
      v.setMag(0.1);
      flowField[x][y] = v;
      //pushMatrix();
      //translate(x*scl, y*scl);
      //rotate(v.heading());
      //stroke(255);
      //line(0, 0, scl, 0);
      //popMatrix();
      xoff += inc;
    }
    yoff += inc;
  }
  zoff += 0.004;

  for (int i = 0; i < particles.length; i++) {
    particles[i].follow(flowField);
    particles[i].update();
    particles[i].edges();
    particles[i].display();
  }
}
