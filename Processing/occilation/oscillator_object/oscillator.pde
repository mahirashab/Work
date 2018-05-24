

class Oscillator {
   PVector angle;
   PVector velosity;
   PVector amplitude;
   
   Oscillator() {
      angle = new PVector(0.0, 0.0);
      velosity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
      amplitude = new PVector(random(20, width/2), random(100, height/2));
   }
  
    void update() {
      angle.add(velosity);
    }
    
    void display() {
     float x = amplitude.x * cos(angle.x);
     float y = amplitude.y * cos(angle.y); 
     
     pushMatrix();
     translate(width/2, height/2);
     line(0, 0, x, y);
     fill(100, 100);
     ellipse(x, y, 20, 20);
     popMatrix();
    }
    
  
  
}