
ArrayList<PVector> path = new ArrayList<PVector>();

Orbit sun;
Orbit end;

float endx;
float endy;

int res = 500;
float angle = 0; 

int step = 0;
int space = 1000;

int k = -5;

void setup() {
  size(600, 600);
  sun = new Orbit(width/2, height/2, 150, 0, null);
  Orbit next = sun;
  for (int i = 0; i < 10; i++) {
    next = next.addChild();
  }
  end = next;
  endx= end.x;
  endy= end.y;
}


void draw() {
  background(51); 

  for (int i = 0; i < res; i++) {
    Orbit next = sun;
    while (next != null) {
      //next.show();
      next.update();
      next = next.child;
    }
    path.add(new PVector(end.x, end.y));
    step++;
  }
  
  //println(end.angle);
  //if (end.angle > -PI/2 + radians(5)) {
  //  println(1);
  //  noLoop();
  //}

  stroke(255, 0, 255);
  noFill();
  beginShape();
  for (PVector p : path) {
    vertex(p.x, p.y);
  }
  endShape();

  //for (PVector p : path) {
  //  point(p.x, p.y);
  //}
}
