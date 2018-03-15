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
