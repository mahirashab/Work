
Particle[] particles = new Particle[50];

void setup() {
  size(600, 400);
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
}

void draw() {
  background(200);

  PVector gravity = new PVector(0, 0.05);

  for (int i = 0; i < particles.length; i++) {
    particles[i].applyForce(gravity);
    particles[i].run();

    if (particles[i].life <= 0) {
      particles[i] = new Particle();
    }
  }
}
