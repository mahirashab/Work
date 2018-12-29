Particle p;

ArrayList<Particle> snowflake;

void setup() {
  size(600, 600);
  //fullScreen();
  background(21);

  snowflake = new ArrayList<Particle>();
  p = new Particle(width/2 - 20, random(10));
}

void draw() {
  background(21);
  translate(width/2, height/2);
  rotate(PI/6);




  while (!p.finished() && !p.intersects(snowflake)) {
    p.update();
  }
  snowflake.add(p);
  p = new Particle(width/2 - 20, random(10));

  for (int i = 0; i < 6; i++) {
    rotate(PI/3);
    p.show();
    for (Particle c : snowflake) {
      c.show();
    }

    p.show();
    for (Particle c : snowflake) {
      if (c.pos.x > width/2 - 21) {
          snowflake = new ArrayList<Particle>();
        }
      c.show();
    }

    pushMatrix();
    scale(1, -1);
    p.show();
    for (Particle c : snowflake) {
      c.show();
    }
    popMatrix();
  }
}
