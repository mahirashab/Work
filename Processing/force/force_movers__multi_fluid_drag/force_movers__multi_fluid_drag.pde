Mover[] movers = new Mover[10];
PVector gravity;
PVector wind;
int boxY;

int n = 200;

int fluidLen = 150;

int[] fluid = new int[100];

void setup() {
  size(600, 700);
  boxY = height - 200;
  noStroke();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }

  for (int i = 0; i <= height/n; i++) {
    fluid[i] = i * n;
    //println(fluid[i]);
  }
}

void draw() {
  background(150);

  for (int k = 0; k <= height/n; k++) {
    stroke(50);
    fill(100, 220);
    if (fluid[k] > 100) {
      rect(0, fluid[k], width, fluidLen);
    }
  }

  for (int i = 0; i < movers.length; i++) {
    gravity = new PVector(0, 0.5);
    gravity.mult(movers[i].mass);
    movers[i].applyForce(gravity);


    //wind = new PVector(0.1, 0);
    //movers[i].applyForce(wind);


    //PVector fiction = movers[i].volocity.get();
    //fiction.normalize();
    //fiction.mult(-1);
    //float mu = 0.01;
    //fiction.mult(mu);
    //movers[i].applyForce(fiction);

    for (int j = 0; j <= height/n; j++) {
      println(fluid[j]);

      if (fluid[j] > 100 && movers[i].location.y > fluid[j] && movers[i].location.y < fluid[j] + fluidLen) {
        PVector drag = movers[i].volocity.get();
        drag.normalize();
        drag.mult(-1);

        float speed = movers[i].volocity.mag();
        float c = 0.1;

        drag.mult(c * speed * speed);
        movers[i].applyForce(drag);
      }
    }

    movers[i].update();
    movers[i].display();
    movers[i].checkEdge();
  }
}

void mousePressed() {
  reset();
}


void reset() {
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
}