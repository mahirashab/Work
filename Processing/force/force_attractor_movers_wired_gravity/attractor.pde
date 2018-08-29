class Attractor {
 PVector location;
 float mass;
 float g;
  
  Attractor() {
    location = new PVector(width/2, height/2);
    mass = 10;
    g = 0.01;
  }
  
  void display() {
   fill(75);
   ellipse(location.x, location.y, mass*5, mass*5);
  }
  
  PVector attract(Mover mover) {
    PVector dist = PVector.sub(location, mover.location);
    float mag = dist.mag();
    int d = ceil(mag);
    float s = map(d, (sqrt(width/2 * width/2 + height/2 * height/2)), 0, 4, 0);
    mag = constrain(mag, 5.0, 25.0);
    dist.normalize();
    float m = (g * mass * mover.mass) / mag * mag;
    dist.mult(m * s);
    println(s);
    return dist;
  }
  
}