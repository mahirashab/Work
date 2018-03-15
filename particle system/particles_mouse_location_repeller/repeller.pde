
class Repeller {
 PVector location;
 float mass;
 float g;
  
  Repeller() {
    location = new PVector(width/2, height/2);
    mass = 10;
    g = 0.005;
  }
  
  void display() {
   fill(75);
   ellipse(location.x, location.y, mass*5, mass*5);
  }
  
  PVector attract(Particle particle) {
    PVector dist = PVector.sub(location, particle.loc);
    float mag = dist.mag();
    //mag = constrain(mag, 2, 10);
    dist.normalize();
    float m = (g * mass * particle.mass) / mag * mag;
    dist.mult(-m);
    return dist;
  }
  
}
