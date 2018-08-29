

class Drop {
  float x;
  float y;
  float ySpeed;
  float z;
  float len;
  
  Drop() {
   x = random(width); 
   y = random(-500, -40);
   z = random(20);
   len = map(z, 0, 20, 3, 10);
   ySpeed = map(z, 0, 20, 3, 8);
  }
  
  void display() {
   float thick = map(z, 0, 20, 1, 3);
   noStroke(); 
   fill(138, 43, 226);
   rect(x, y, thick, len);
  }
  
  void update() {
   y += ySpeed; 
   ySpeed += 0.008;
  }
  
  void edges() {
   if(y > height) {
     y = 0; 
     ySpeed = map(z, 0, 20, 3, 8);
   }
  }
  
}
