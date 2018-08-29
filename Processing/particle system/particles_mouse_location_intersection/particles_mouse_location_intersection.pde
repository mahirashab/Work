
ArrayList<ParticleSystem> ps = new ArrayList<ParticleSystem>();

void setup() {
  size(600, 400);
  ps.add(new ParticleSystem());
}

void draw() {
  background(200);
  //noStroke();
  //fill(200, 2);
  //rect(0, 0, width, height);



  for (int i = 0; i < ps.size(); i++) {

    ParticleSystem p = ps.get(i);
    p.run();
    p.update();
    p.intersection();
    p.display();
  }
}
