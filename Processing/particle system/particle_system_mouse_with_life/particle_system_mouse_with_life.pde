
ArrayList<ParticleSystem> ps = new ArrayList<ParticleSystem>();

void setup() {
  size(600, 400);
}

void draw() {
  background(200);
  //noStroke();
  //fill(200, 2);
  //rect(0, 0, width, height);

  if (mousePressed) {
    ps.add(new ParticleSystem(mouseX, mouseY));
  }

  for (int i = 0; i < ps.size(); i++) {

    ParticleSystem p = ps.get(i);
    p.run();
    if(p.life < 0) {
     ps.remove(i); 
    }
  }
}
