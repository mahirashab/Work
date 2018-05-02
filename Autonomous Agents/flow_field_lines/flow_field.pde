

class FlowField {

  PVector[][] field;
  int cols, rows;
  int resolution;
  float zoff;


  FlowField(int f) {

    resolution = f;
    cols = width/resolution;
    rows = height/resolution;
    field = new PVector[cols][rows];
    zoff = random(1000, 10000);
    init();
  }

  void run() {
    display();
  }

  void init() {
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff, yoff, zoff), 0, 1, 0, TWO_PI*8);
        field[i][j] = PVector.fromAngle(theta);
        //field[i][j] = new PVector(cos(theta), sin(theta));
        yoff += 4;
      }
      xoff += 4;
    }
    zoff += 0.03;
  }

  void update() {
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff, yoff, zoff), 0, 1, 0, TWO_PI*8);
        field[i][j] = PVector.fromAngle(theta);
        //field[i][j] = new PVector(cos(theta), sin(theta));
        yoff += 4;
      }
      xoff += 4;
    }
    zoff += 0.03;
  }

  PVector lookUp(PVector loc) {
    int row = int(constrain(loc.x/resolution, 0, rows-1));
    int col = int(constrain(loc.y/resolution, 0, cols-1));
    PVector way = field[col][row].get();
    return way;
  }

  void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawLine(field[i][j], i*resolution-(resolution/2), j*resolution-(resolution/2));
      }
    }
  }

  void drawLine(PVector v, float x, float y) {
    pushMatrix();

    float angle = v.heading2D();
    translate(x, y);
    rotate(angle);


    float len = resolution;
    strokeWeight(1);
    stroke(10, 100);
    line(0, 0, len, 0);
    popMatrix();
  }
}
