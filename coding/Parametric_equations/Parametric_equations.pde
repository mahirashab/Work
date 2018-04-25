
float t = 0;

float speed = 0.0001;

float design = 0;
float angle = 0;

float end = 0;

int count = 23;

void setup() {
  size(800, 600);
  background(224, 136, 190);
  //colorMode(HSB);
}

void draw() {
  translate((width/4) * 2, height/2);
  rotate(angle);
  strokeWeight(1.2);
  //stroke(120, 97, 204);
  stroke(255);

  for (int i = 0; i < 300; i++) {
    if (design == 0) {
      float x = 3 * cos(cos((5.44/2) * round(t))) * 1.2 * (1 + cos(5.4 * t));
      float y = 3 * pow(sin(5.4 * t), 2) * sin(5.44 * t);
      x *= 45;
      y *= 45;
      point(x, y);
      t += speed;
      if (t < -2) {
        speed *= -1;
        t = 0;
        angle += PI/2;
        end += 1;
      } else if (t > 2) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 1) {

      float x = 3 * cos(cos((5.56/2) * round(t))) * 1.2 * (1 + cos(4.02 * t));
      float y = 3 * pow(sin(4.02 * t), 2) * sin(5.56 * t);
      x *= 35;
      y *= 35;
      point(x, y);
      t += speed;
      if (t < -2) {
        speed *= -1;
        t = 0;
        angle += PI/2;
        end += 1;
      } else if (t > 2) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 2) {

      float x = 4 * pow(sin(4.32 * t), 2) * sin(sin(6.4 * t));
      float y = 4 * pow(cos(4.32 * t), 2) * cos(round(cos(6.4 * t)));
      x *= 55;
      y *= 55;
      point(x, y);
      t += speed;
      if (t < -3) {
        speed *= -1;
        t = 0;
        angle += PI/2;
        end += 1;
      } else if (t > 3) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 3) {

      float x = 4 * (sin(6.04 * (t/3)) * (0.3 + pow(sin(t), 2)));
      float y = 7 * cos(t) * pow(sin(6.04 * t), 4);
      x *= 35;
      y *= 35;
      point(x, y);
      t += speed;
      if (t < -3) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 3) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 4) {

      float x = 7 * (sin(2.96 * (t/3)) * (0.3 + pow(sin(t), 2)));
      float y = 7 * cos(t) * pow(sin(2.96 * t), 4);
      x *= 25;
      y *= 25;
      point(x, y);
      t += speed;
      if (t < -3) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 3) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 5) {

      float x = 7 * (sin(3.48 * t) * (1 + round(pow(sin(t), 2))));
      float y = 7 * cos(round(t)) * pow(sin(3.48 * t), 4);
      x *= 15;
      y *= 15;
      point(x, y);
      t += speed;
      if (t < -3) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 1;
      } else if (t > 3) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 6) {

      float x = 3 * cos(cos(2.9 * t)) * (1 + pow(cos(3 * t), 6));
      float y = 3 * pow(cos(2.9 * t), 3);
      x *= 45;
      y *= 45;
      point(x, y);
      t += speed;
      if (t < -12) {
        speed *= -1;
        t = 0;
        angle += PI/2;
        end += 1;
      } else if (t > 12) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 7) {

      float x = 4 * pow(cos(1.88 * t), 2.5);
      float y = 3 * sin(sin(4.3 * t)) * pow(cos(1.88 * t), 2);
      x *= 45;
      y *= 45;
      point(x, y);
      t += speed;
      if (t < -4) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 4) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 8) {

      float x = 7 * (sin(3.48 * t) / (1 + round(pow(sin(t), 2))));
      float y = 7 * cos(round(t)) * pow(sin(3.48 * t), 4);
      x *= 25;
      y *= 25;
      point(x, y);
      t += speed;
      if (t < -3) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 3) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 9) {

      float x = 7 * (sin(1.54 * t) / (1 + pow(sin(t), 2)));
      float y = 7 * cos(round(t)) * pow(sin(1.54 * t), 2);
      x *= 25;
      y *= 25;
      point(x, y);
      t += speed;
      if (t < -3) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 3) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 10) {

      float x = 7 * (sin(0.5 * round(t)) / (1 + pow(sin(1.42 * t), 2)));
      float y = 7 * cos(1.42 * t) * pow(sin(0.5 * t), 4);
      x *= 25;
      y *= 25;
      point(x, y);
      t += speed;
      if (t < -8) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 8) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 11) {

      float x = 7 * (sin(1.64 * round(t)) / (1 + pow(sin(1.42 * t), 2)));
      float y = 7 * cos(1.42 * t) * pow(sin(1.64 * t), 4);
      x *= 25;
      y *= 25;
      point(x, y);
      t += speed;
      if (t < -10) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 10) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 12) {

      float x = 7 * (sin(7.24 * t) / (1 + pow(cos(3.56 * t), 2)));
      float y = 7 * cos(3.56 * t) * pow(sin(7.24 * t), 4);
      x *= 25;
      y *= 25;
      point(x, y);
      t += speed;
      if (t < -3) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 3) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 13) {

      float x = 7 * (sin(1.48 * round(t)) / (1 + pow(sin(1.42 * t), 2)));
      float y = 7 * cos(1.42 * t) * pow(sin(1.48 * t), 4);
      x *= 35;
      y *= 35;
      point(x, y);
      t += speed;
      if (t < -6) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 6) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 14) {

      float x = 4 * (sin(7.24 * (t / 3)) / (0.3 + pow(sin(t), 2)));
      float y = 7 * cos(t) * pow(sin(7.24 * t), 4);
      x *= 25;
      y *= 25;
      point(x, y);
      t += speed;
      if (t < -3) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 3) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 15) {

      float x = 7 * (sin(1.6 * round(t)) / (1 + pow(sin(1.42 * t), 2)));
      float y = 7 * cos(1.42 * t) * pow(sin(1.6 * t), 4);
      x *= 25;
      y *= 25;
      point(x, y);
      t += speed;
      if (t < -8) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 8) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 16) {

      float x = 7 * (sin(4.1 * t) / (1 + pow(cos(6.3 * t), 2)));
      float y = 7 * cos(6.3 * t) * pow(sin(4.1 * t), 4);
      x *= 25;
      y *= 25;
      point(x, y);
      t += speed;
      if (t < -3) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 3) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 17) {

      float x = 7 * (sin(2.12 * round(t)) / (1 + pow(sin(1.42 * t), 2)));
      float y = 7 * cos(1.42 * t) * pow(sin(2.12 * t), 4);
      x *= 25;
      y *= 25;
      point(x, y);
      t += speed;
      if (t < -8) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 8) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 18) {

      float x = 7 * (sin(7.32 * t) / (1 + pow(cos(1.42 * t), 2)));
      float y = 7 * cos(1.42 * t) * pow(sin(7.32 * t), 4);
      x *= 35;
      y *= 35;
      point(x, y);
      t += speed;
      if (t < -3) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 3) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 19) {

      float x = 4 * pow(cos(1.88 * t), 2.5);
      float y = 2 * sin(sin(4.3 * t)) * pow(cos(1.88 * t), 2);
      x *= 35;
      y *= 35;
      point(x, y);
      t += speed;
      if (t < -4) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 4) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 20) {

      float x = 4 * pow(cos(4.96 * t), 2.5);
      float y = 2 * sin(sin(4.3 * t)) * pow(cos(4.96 * t), 2);
      x *= 55;
      y *= 55;
      point(x, y);
      t += speed;
      if (t < -4) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 4) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 21) {

      float x = 3 * sin(sin(3 * t)) * cos(pow(cos(3 * 1.4 * t), 2));
      float y = 1.5 * pow(cos(2 * t), 2) * 3 * sin(t);
      x *= 45;
      y *= 45;
      point(x, y);
      t += speed;
      if (t < -3) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 3) {
        speed *= -1;
        t = 0;
      }
    } else if (design == 22) {

      float x = 7 * (sin(4.84 * t) / (1 + pow(cos(4.66 * t), 2)));
      float y = 7 * cos(4.66 * t) * pow(sin(4.84 * t), 4);
      x *= 35;
      y *= 35;
      point(x, y);
      t += speed;
      if (t < -3) {
        speed *= -1;
        t = 0;
        angle += PI/4;
        end += 0.5;
      } else if (t > 3) {
        speed *= -1;
        t = 0;
      }
    }
  }


  if (end == 4) {
    delay(000);
    reset();
    reset();
    //noLoop();
  }
}

void mousePressed() {
  background(224, 136, 190);
  loop();
  angle = 0;
  end = 0;
  t = 0;
  speed = 0.0001;

  design = (design + 0.5) % count;
  println(design);

  if (design == 3) {
    angle = PI/4;
  }
}

void reset() {
  background(224, 136, 190);
  loop();
  angle = 0;
  end = 0;
  t = 0;
  speed = 0.0001;
  design = (design + 0.5) % count;
  println(design);
}
