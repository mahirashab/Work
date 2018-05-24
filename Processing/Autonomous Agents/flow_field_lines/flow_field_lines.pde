FlowField flowfield;
ArrayList<Line> lines = new ArrayList<Line>();
int off = 10;

void setup() {
  size(600, 400);
  flowfield = new FlowField(20);
  background(255);
}

void draw() {

  //flowfield.display();
  flowfield.update();
  
  if(frameCount % off == 0) {
   lines.add(new Line()); 
  }
  
  if(lines.size() > 100) {
   lines.remove(0); 
  }

  for (int i = 0; i < lines.size(); i++) {
    Line l = lines.get(i);
    l.follow(flowfield);
    l.run();
  }
}

void mousePressed() {
  flowfield = new FlowField(20);
  colorMode(RGB, 255, 255, 255, 255);
  background(255);
}
