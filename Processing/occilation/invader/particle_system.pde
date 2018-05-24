

class ParticleSystem {

  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(float mX, float mY) {
    particles = new ArrayList<Particle>();
    origin = new PVector(mX, mY);
  }

  void run() {
    PVector gravity = new PVector(0, 0.05);

    particles.add(new Particle(origin.x, origin.y));

    for (int i = particles.size() - 1; i > 0; i--) {

      Particle p = particles.get(i);
      p.applyForce(gravity);
      p.run();

      if (p.life <= 0) {
        particles.remove(i);
      }
    }
  }
}
