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
