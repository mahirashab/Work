

class Cell {
 
  int x, y;
  int w;
  
  int state;
  int nextState;
  
  Cell(int x_, int y_, int w_) {
    x = x_;
    y = y_;
    
    w = w_;
    
    state = int(random(2));
    nextState = 0;
  }
  
  void update() {
   state = nextState; 
  }
  
  void display() {
   if(state == 1) fill(0);
   else fill(255);
   rect(x, y, w, w);
  }
  
  
  
  
}
