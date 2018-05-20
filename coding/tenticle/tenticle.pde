Arm first;
Arm current;
Arm next;

float len = 60;
float cut = 0.75;

void setup() {
  size(600, 400);
  
  first = new Arm(width/2, height, len, radians(270));
  current = first;
  len *= cut;
  next = new Arm(current.b.x, current.b.x, len, radians(0));
  next.parent = current;
  current.child = next;
  current = current.child;
  
  
  for(int i = 0; i < 20; i++) {
    len *= cut;
    Arm newArm = new Arm(current.b.x, current.b.y, len, radians(0));
    newArm.parent = current;
    current.child =  newArm;
    current = current.child;
  }
}


void draw() {
  background(51);
  
  
  current = first;
  while (current != null) {
   current.display();
   current.angle();
   current.update();
   current = current.child;
  }
  
}
