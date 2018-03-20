Catcher hand;
ArrayList<Rain> rain = new ArrayList<Rain>();

int sec = 100;
float acc = 0.01;

int life = 5;
int score = 0;


void setup() {
  size(600, 400);
  hand = new Catcher();
}

void draw() {
  background(230);
  hand.cDraw(mouseX);

  if (frameCount%sec == 0) {
    rain.add(new Rain(acc));
    acc += 0.0025;
  }


  for (int i = rain.size() - 1; i >= 0; i--) {
    Rain r = rain.get(i);
    r.display();
    r.update();

    if (r.touched(hand)) {
      score++;
      rain.remove(i);
    }
    if (r.ground()) {
      life--;
      println(1);
      rain.remove(i);
    }
  }

  textSize(14);
  String s = "Score : ";
  text(s + score, 10, 15);

  String l = "Life : ";
  text(l + life, width - 70, 15);

  if (life <= 0) {
    background(20);
    textSize(25);
    textAlign(CENTER);
    String t = "Game Over";
    String r = "Press _r_ to Restart";
    text(t, width/2, height/2);
    textSize(18);
    text(r, width/2, height/2 + 50);
    for (int i = rain.size() - 1; i >= 0; i--) {
      rain.remove(i);
    }
    noLoop();
  }
  println(rain.size());
}

void keyPressed() {
  if (key == 'r') {
    life = 5;
    score = 0;
    rain = new ArrayList<Rain>();
    loop();
  }
}
