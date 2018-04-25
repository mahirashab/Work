Steam[] s;

PFont katakana;

int maxFontSize = 20;

void setup() {
  fullScreen();
  //size(800, 600);

  s = new Steam[width/maxFontSize];

  katakana = createFont("katakana.ttf", maxFontSize);
  textFont(katakana);

  float x = 0;
  for (int i = 0; i < s.length; i++) {
    s[i] = new Steam(x, random(-1000, -50));
    x += maxFontSize;
    if (x > width) {
      break;
    }
  }
}

void draw() {
  background(0, 10);

  for (int i = 0; i < s.length; i++) {
    s[i].display();
    float off = maxFontSize * s[i].count;
    if (s[i].symbols[0].y - off > height) {
      s[i] = new Steam(s[i].x, random(-100, -50));
    }
  }
}
