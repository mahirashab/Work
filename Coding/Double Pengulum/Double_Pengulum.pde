float r1 = 170;
float r2 = 170;

float m1 = random(10, 20);
float m2 = random(10, 20);

float a1 = random(PI, TWO_PI - 0.0001);
float a2 = random(PI, TWO_PI - 0.0001);

float a1_v = 0;
float a2_v = 0;

float a1_a = 0;
float a2_a = 0;

float x1 = r1 * sin(a1);
float y1 = r1 * cos(a1);

float x2 = x1 + r2 * sin(a2);
float y2 = y1 + r2 * cos(a2);

float px2 = -1;
float py2 = -1;

float g = 1;

PGraphics canvas;

void setup() {
  size(800, 600);
  stroke(0);
  strokeWeight(2);
  fill(0);

  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
}


void draw() {
  background(255);

  image(canvas, 0, 0);

  translate(width / 2, 0);

  float num1 = -g * (2 * m1 + m2) * sin(a1);
  float num2 = -m2 * g * sin(a1-2*a2);
  float num3 = -2*sin(a1-a2)*m2;
  float num4 = a2_v*a2_v*r2+a1_v*a1_v*r1*cos(a1-a2);
  float den = r1 * (2*m1+m2-m2*cos(2*a1-2*a2));
  a1_a = (num1 + num2 + num3*num4) / den;

  num1 = 2 * sin(a1-a2);
  num2 = (a1_v*a1_v*r1*(m1+m2));
  num3 = g * (m1 + m2) * cos(a1);
  num4 = a2_v*a2_v*r2*m2*cos(a1-a2);
  den = r2 * (2*m1+m2-m2*cos(2*a1-2*a2));
  a2_a = (num1*(num2+num3+num4)) / den;

  x1 = r1 * sin(a1);
  y1 = r1 * cos(a1);

  x2 = x1 + r2 * sin(a2);
  y2 = y1 + r2 * cos(a2);

  stroke(0);
  line(0, 0, x1, y1);
  fill(0);
  ellipse(x1, y1, m1, m1);

  stroke(0);
  line(x1, y1, x2, y2);
  fill(0);
  ellipse(x2, y2, m2, m2);

  a1_v += a1_a;
  a2_v += a2_a;
  a1 += a1_v;
  a2 += a2_v;



  canvas.beginDraw();
  canvas.translate(width/2, 0);
  canvas.strokeWeight(2);
  canvas.stroke(0);
  if (px2 != -1) {
    canvas.line(px2, py2, x2, y2);
  }
  canvas.endDraw();

  px2 = x2;
  py2 = y2;
}

void mousePressed() {
  a1 = random(PI, TWO_PI - 0.0001);
  a2 = random(PI, TWO_PI - 0.0001);

  x2 = mouseX;
  y2 = mouseY;

  px2 = -1;
  py2 = -1;

  m1 = random(10, 20);
  m2 = random(10, 20);

  canvas.clear();
  background(255);
}
