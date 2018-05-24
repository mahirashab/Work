
ArrayList<ParticleSystem> ps = new ArrayList<ParticleSystem>();
Attractor attractor; 

void setup() {
  size(600, 400);
  ps.add(new ParticleSystem());
  attractor = new Attractor();
}

void draw() {
  background(200);
  //noStroke();
  //fill(200, 2);
  //rect(0, 0, width, height);

  attractor.display();

  for (int i = 0; i < ps.size(); i++) {

    ParticleSystem p = ps.get(i);
    p.run();
  }
}
