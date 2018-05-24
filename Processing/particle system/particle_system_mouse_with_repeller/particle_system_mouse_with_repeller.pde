
ArrayList<ParticleSystem> ps = new ArrayList<ParticleSystem>();
Repeller repeller; 

void setup() {
  size(600, 400);
  repeller = new Repeller();
}

void draw() {
  background(200);
  //noStroke();
  //fill(200, 2);
  //rect(0, 0, width, height);

  if (mousePressed) {
    ps.add(new ParticleSystem(mouseX, mouseY));
  }
  
   repeller.display();

  for (int i = 0; i < ps.size(); i++) {

    ParticleSystem p = ps.get(i);
    p.run();
  }
}
