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
