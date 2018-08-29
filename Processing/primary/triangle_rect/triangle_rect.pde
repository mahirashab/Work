

void setup(){ 
  size(300, 300);
}

void draw() {
  background(200);
  translate(width/2, height/2);
  rectMode(CENTER);
  fill(150);
  noStroke();
  rect(0, 0, 30, 10);
  triangle(-30, 0, -15, -5, -15, 5);
  
}