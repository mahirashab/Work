float x = 25;
float y = 25;
float xSpeed = 1;
float ySpeed = 0;

void setup() {
   size(400, 400);   
}

void draw() {
    background(100);
    if (x == 25 && y == 25) {
        xSpeed = 1;
        ySpeed = 0;
    }
    
    if (x == width - 25 && y == 25) {
        xSpeed = 0;
        ySpeed = 1;
    }
    
    if (x == width - 25 && y == height - 25) {
        xSpeed = -1;
        ySpeed = 0;
    }
    
    if (x == 25 && y == height - 25) {
        xSpeed = 0;
        ySpeed = -1;
    }
    
    rectMode(CENTER);
    rect(x, y, 10, 10);
    x += xSpeed;
    y += ySpeed;
}