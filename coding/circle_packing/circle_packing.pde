PImage img;

ArrayList<Circle> circles = new ArrayList<Circle>();
int attempt = 0;

void setup() {
  size(900, 400);
  img = loadImage("2017.png");
}


void draw() {
  background(0);

  for (int i = 0; i < 10; i ++) {
    newCircle();
    attempt++;
  }

  for (Circle c : circles) {
    for (Circle other : circles) {
      float dist = dist(c.x, c.y, other.x, other.y);
      if (dist != 0 && dist-1 < (c.r + other.r)) {
        c.grow = false;
        break;
      }
    }

    c.display();
    c.edges();
    c.grow();
  }

  if (attempt > 10000) {
    noLoop();
    println("finished");
  }
}

void newCircle() {
  float x = random(width);
  float y = random(height);

  boolean valid = true;
  img.loadPixels();
  for (Circle c : circles) {
    float index = x + y * img.width;
    if (index < img.pixels.length) {
      color col = img.pixels[(int)index];
      float b = brightness(col);
      float dist = dist(x, y, c.x, c.y);
      if (dist < c.r && b == 0.0) {
        valid = false;
        break;
      }
    }
  }

  if (valid) {
    circles.add(new Circle(x, y));
  }
}
