Catcher hand;
float preMil;
boolean yes = false;
int elapse = 2000;
int index = 0;
float timeSec = 0;
Rain[] rains = new Rain[50];

void setup() {
  size(600, 400);
  rectMode(CENTER);
  hand = new Catcher();
}

void draw() {
  background(200);
  hand.cDraw(mouseX);
  if (index >= rains.length) {
    index =0;
  }

  println(index);

  if (millis() > timeSec + elapse) {
    rains[index] = new Rain();
    index++;
    timeSec += elapse;
  }

  for (int j = 0; j < index; j++) {
    rains[j].rDraw();
    rains[j].rUpdate();
    if (hand.cY < (rains[j].rY + 2.5)) {
      rains[j].rX = random(10, width - 10);
      rains[j].rY = 0;
      rains[j].rSpeed = 1;
      
      //rains.remove(j);
    }
  }
}



class Catcher {

  float cX;
  float cY;
  int cWidth;
  int cHeight;

  Catcher() {
    cX = width/2;
    cY = height - 20;
    cWidth = 35;
    cHeight = 5;
  }

  void cDraw(float x) {
    fill(100);
    noStroke();
    rect(x, cY, cWidth, cHeight);
  }
}

class Rain {
  float rX;
  float rY;
  float rSpeed;
  float rAcceleration;
  int rDia;

  Rain() {
    rX = random(10, width - 10);
    rY = 0;
    rSpeed = 1;
    rAcceleration = 0.01;
    rDia = 4;
  }

  void rDraw() {

    noStroke();
    fill(100, 100, 50);
    ellipse(rX, rY, rDia, rDia);
  }

  void rUpdate() {
    rY += rSpeed; 
    rSpeed += rAcceleration;
    //if (hand.cY < (rY + 2.5)) {
    //  rX = random(10, width - 10);
    //  rY = 0;
    //  rSpeed = 1;
    //}
  }
  
  //boolean touched() {
  //  if (rY > height || hand.cY < (rY + 2.5)) {
  //    return true; 
  //  }else (){
      
  //  }
  //  //return true;
    
  //}
}