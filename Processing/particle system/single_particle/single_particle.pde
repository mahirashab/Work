
Particle particle;

void setup() {
  size(600, 400);
  particle = new Particle();
}

void draw() {
  background(200);

  PVector gravity = new PVector(0, 0.05);

  particle.applyForce(gravity);
  particle.run();

  if (particle.life <= 0) {
    particle = new Particle();
  }
}
