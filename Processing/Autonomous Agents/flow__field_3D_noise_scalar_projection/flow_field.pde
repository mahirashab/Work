

class FlowField {

  PVector[][] field;
  int cols, rows;
  int resolution;
  float zoff;


  FlowField(int f) {

    resolution = f;
    zoff = 0.0;
    cols = width/resolution;
    rows = height/resolution;
    field = new PVector[cols][rows];
    init();
  }

  void run() {
    display();
    update();
  }

  void init() {
    noiseSeed((int)random(10000));
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff, yoff), 0, 1, 0, PI/2);
        field[i][j] = new PVector(cos(theta), sin(theta));
        yoff += 0.1;
      }
      xoff += 0.1;
    }
  }

  void update() {
    float xoff = 0;
    for (int i = 0; i < cols; i++) {
      float yoff = 0;
      for (int j = 0; j < rows; j++) {
        float theta = map(noise(xoff, yoff, zoff), 0, 1, 0, TWO_PI);
        field[i][j] = PVector.fromAngle(theta);
        yoff += 0.1;
      }
      xoff += 0.1;
    }
    zoff += 0.01;
  }

  PVector lookUp(PVector loc) {
    int col = int(constrain(loc.x/resolution, 0, cols-1));
    int row = int(constrain(loc.y/resolution, 0, rows-1));
    return field[col][row].get();
  }

  void display() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        drawLine(field[i][j], i*resolution, j*resolution);
      }
    }
  }

  void drawLine(PVector v, float x, float y) {
    pushMatrix();

    float angle = v.heading2D() - PI;
    translate(x, y);
    rotate(angle);

    float len = resolution;
    strokeWeight(1);
    stroke(10, 100);
    line(0, 0, len, 0);

    popMatrix();
  }
}
