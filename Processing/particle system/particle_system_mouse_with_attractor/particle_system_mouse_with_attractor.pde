
ArrayList<ParticleSystem> ps = new ArrayList<ParticleSystem>();
Attractor attractor; 

void setup() {
  size(600, 400);
  attractor = new Attractor();
}

void draw() {
  background(200);
  //noStroke();
  //fill(200, 2);
  //rect(0, 0, width, height);

  if (mousePressed) {
    ps.add(new ParticleSystem(mouseX, mouseY));
  }
  
   attractor.display();

  for (int i = 0; i < ps.size(); i++) {

    ParticleSystem p = ps.get(i);
    p.run();
  }
}
