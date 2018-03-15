

class ParticleSystem {

  ArrayList<Particle> particles;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

  void run() {
    PVector gravity = new PVector(0, 0.05);

    particles.add(new Particle(mouseX, mouseY));

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
