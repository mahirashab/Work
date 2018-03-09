
void setup() {
    size(600, 400);
    background(100);
}

void draw() {
  line(pmouseX, pmouseY, mouseX, mouseY);  
}

void mousePressed() {
   background(100); 
}

void keyPressed() {
   background(random(0, 255)); 
}