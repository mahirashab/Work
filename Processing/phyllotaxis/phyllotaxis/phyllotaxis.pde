int n = 0;
float c = 4;
color col;
float ang = 137.5;
String info;

void setup() {
  size(300, 300);
  colorMode(HSB);
  background(30);
}


void draw() {
  float a = n * ang;
  float r = c * sqrt(n);
  float x = r * cos(a) + width/2;
  float y = r * sin(a) + height/2;
  fill(n - r, y - r, 255);
  noStroke();
  ellipse(x, y, 5, 5);
  n++;
  if (x > width - 20 || mousePressed) {
    c = int(random(5, 10));
    ang = random(137, 139);
    n = 0;
    background(30);
  }
  
  info = "c = " + c + " ; " + "ang = " + ang + " ;";
  textSize(16);
  fill(255);
  //text(info, 10, 20);
}

void keyPressed() {
  if (keyPressed) {
    if (key == 's') {
      noLoop();
    } else if (key == 'r') {
      loop();
    }
  }
}