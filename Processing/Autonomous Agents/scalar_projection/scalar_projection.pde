


void setup() {
  size(600, 400);
}

void draw() {
  background(250);
  PVector a = new PVector(20, 300);
  PVector b = new PVector(500, 250);
  PVector mouse = new PVector(mouseX, mouseY);

  strokeWeight(2);
  fill(0);
  line(a.x, a.y, b.x, b.y);
  ellipse(a.x, a.y, 8, 8);
  ellipse(b.x, b.y, 8, 8);
  line(a.x, a.y, mouse.x, mouse.y);
  ellipse(mouse.x, mouse.y, 8, 8);
  
  PVector sp = scalarProjection(mouse, a, b);
  strokeWeight(1);
  line(mouse.x, mouse.y, sp.x, sp.y);
  fill(200, 0, 0);
  ellipse(sp.x, sp.y, 16, 16);
  
}

PVector scalarProjection(PVector m, PVector a, PVector b) {
   PVector ab = PVector.sub(b, a);
   PVector am = PVector.sub(m, a);
   
   ab.normalize();
   ab.mult(am.dot(ab));
   PVector sp = PVector.add(a, ab);
   return sp;
}
