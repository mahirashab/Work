

class Path {

  ArrayList<PVector> points;
  float r;
  float t;

  float len;

  Path() {
    r = 10;
    t = random(1000, 10000);
    len = 30;
    points = new ArrayList<PVector>();
    create();
  }

  void create() {

    //hard coded path
    points.add(new PVector(55, 65));
    points.add(new PVector(width - 55, 65));
    points.add(new PVector(width - 55, height - 65));
    points.add(new PVector(width/2, height - 108));
    points.add(new PVector(55, height - 65));

    //perlin noise path
    //for (int x = 0; x < width; x += len) {
    //  float y = map(noise(t), 0, 1, 100, height - 100);
    //  PVector p = new PVector(x, y);
    //  points.add(p);
    //  println(x, y);
    //  if (x + len*2 > width) {
    //    float tem = x + (width - x); 
    //    p = new PVector(tem, y);
    //    points.add(p);
    //  }
    //  t += 0.05;
    //}
  }

  void display() {

    strokeWeight(r*2);
    stroke(100, 100);
    noFill();
    beginShape();
    for (PVector p : points) {
      vertex(p.x, p.y);
      //println(p.x, p.y);
    }
    endShape(CLOSE);


    strokeWeight(1.5);
    stroke(70, 100);
    beginShape();
    for (PVector p : points) {
      vertex(p.x, p.y);
    }
    endShape(CLOSE);
  }


  PVector getStart() {
    return points.get(0);
  }

  PVector getEnd() {
    return points.get(points.size()-1);
  }
}
