float x = 0.01;
float y = 0.2;
float z = 0.1;

float a = random(2, 20);
float b = random(20, 40);
float c = 8.0 / 3.0;

float r= 0.0;
int len = 2000;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {
  size(800, 600, P3D);
  colorMode(HSB);
}


void draw() {
  background(0);
  float dt = 0.012;

  //x += 0.1;
  //y -= 0.09;
  //z -= 0.09;

  float dx = (a * (y - x)) * dt;
  float dy = (x * (b - z) - y) * dt;
  float dz = (x * y - c * z) * dt;

  x += dx;
  y += dy;
  z += dz;

  points.add(new PVector(x, y, z));

  //translate(0, 0, -80);
  translate(width/2, height/2, -80);
  rotate(r);

  r += 0.002;
  scale(5);

  stroke(255);
  noFill();

  float hu = 0;
  beginShape();
  for (PVector p : points) {
    stroke(hu, 230, 255);
    vertex(p.x, p.y, p.z);
    hu += 0.1;
    if (hu > 255) {
      hu = 0;
    }
  }
  endShape();

  if (points.size() > len) {
    points.remove(0);
  }
}

void mousePressed() {
  x = 0.01;
  y = 0.2;
  z = 0.1;

  a = random(2, 20);
  b = random(20, 40);
  
  points = new ArrayList<PVector>();
}
