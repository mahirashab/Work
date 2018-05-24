

class ParticleSystem {

  ArrayList<Particle> particles;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

  void intersection() {
    for (Particle p : particles) {
      p.intersects(particles);
    }
  }
  
  void display() {
    for (Particle p : particles) {
      p.display();
    }
  }
  
  void update() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
       if (p.life <= 0) {
        particles.remove(i);
      }
    }
  }

  void run() {
    //PVector gravity = new PVector(0, -0.05);
    particles.add(new Particle(mouseX, mouseY));
  }
}
