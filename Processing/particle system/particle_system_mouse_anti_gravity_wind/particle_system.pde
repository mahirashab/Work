

class ParticleSystem {

  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(float mX, float mY) {
    particles = new ArrayList<Particle>();
    origin = new PVector(mX, mY);
  }

  void run() {
    PVector gravity = new PVector(0, -0.05);

    particles.add(new Particle(origin.x, origin.y));

    float w = map(mouseX, 0, width, -0.1, 0.1);
    PVector wind = new PVector(w, 0);

    for (int i = particles.size() - 1; i > 0; i--) {

      Particle p = particles.get(i);
      p.applyForce(gravity);
      p.applyForce(wind);

      p.run();

      if (p.life <= 0) {
        particles.remove(i);
      }
    }
  }
}
