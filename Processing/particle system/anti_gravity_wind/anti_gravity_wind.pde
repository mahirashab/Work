
ArrayList<Particle> particle = new ArrayList<Particle>();

void setup() {
  size(600, 400);
}

void draw() {
  background(200);
  //noStroke();
  //fill(200, 2);
  //rect(0, 0, width, height);
  
   particle.add(new Particle());

  PVector gravity = new PVector(0, -0.05);
  
  float w = map(mouseX, 0, width, -0.1, 0.1);
  PVector wind = new PVector(w, 0);
  

  for (int i = 0; i < particle.size(); i++) {
    
    Particle p = particle.get(i);
    p.applyForce(gravity);
    p.applyForce(wind);
    p.run();
    
    if (p.life <= 0) {
     particle.remove(i); 
    }
   
  }
  
  if (particle.size() > 150) {
    particle.remove(0);
  }
}
