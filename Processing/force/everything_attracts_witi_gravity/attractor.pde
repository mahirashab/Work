class Attractor {
 PVector location;
 float mass;
 float g;
  
  Attractor() {
    location = new PVector(width/2, height/2);
    mass = 10;
    g = 0.002;
  }
  
  void display() {
   fill(75);
   ellipse(location.x, location.y, mass*5, mass*5);
  }
  
  PVector attract(Mover mover) {
    PVector dist = PVector.sub(location, mover.location);
    float mag = dist.mag();
    //mag = constrain(mag, 2, 10);
    dist.normalize();
    float m = (g * mass * mover.mass) / mag * mag;
    dist.mult(m);
    return dist;
  }
  
}