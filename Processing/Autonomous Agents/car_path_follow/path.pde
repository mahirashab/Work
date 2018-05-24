

class Path {

  PVector start;
  PVector end;
  float r;

  Path() {
    start = new PVector(0, random(100, height - 100));
    end = new PVector(width, random(100, height - 100));
    r = 10;
  }

  void display() {

    strokeWeight(r*2);
    stroke(100, 100);
    line(start.x, start.y, end.x, end.y);

    strokeWeight(1.5);
    line(start.x, start.y, end.x, end.y);
  }
}
