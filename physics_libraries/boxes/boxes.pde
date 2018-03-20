
ArrayList<Box> boxes = new ArrayList<Box>();


void setup() {
  size(600, 400);
}

void draw() {
  background(250);
  
  if(mousePressed) {
   boxes.add(new Box(mouseX, mouseY, 16, 16)); 
  }
  
  for(Box b:boxes) {
   b.display(); 
  }
}
