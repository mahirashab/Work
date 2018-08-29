class Catcher {

  float cX;
  float cY;
  int cWidth;
  int cHeight;

  Catcher() {
    cX = width/2;
    cY = height - 20;
    cWidth = 45;
    cHeight = 5;
  }

  void cDraw(float x) {
    fill(100);
    noStroke();
    rectMode(CENTER);
    cX = x;
    rect(cX, cY, cWidth, cHeight);
  }
}
