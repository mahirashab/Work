float x = 0;
float y = 0;
float space = 64;
float end = 0;

void setup() {
  size(800, 600);
  background(25);
  stroke(250);
}

void draw() {
  if (random(1) < 0.5) {
    line(x, y, x + space, y + space);
  } else {
    line(x, y + space, x + space, y);
  }

  x += space;

  if (x > width) {
    x = 0;
    y += space;
  }
  if (y > height) {
    x = 0;
    y = 0;

    for (int i = 0; i < 1; i++) {
      // console.log ('for');
      if (end == 0 || end == 1) {
        end += 1;
        break;
      }

      if (end % 2 == 1) {
        end += 1;
      }

      if (end % 2 == 0) {
        space = floor(space /= 2);
        end += 1;
      }
    }
  }
  if (space < 8) {
    noLoop();
  }
  println(space);
}

void keyPressed() {
  if (key == ' ') {
    loop();
    background(25);
    x = 0;
    y = 0;
    space = 64;
    end = 0;
  }
}