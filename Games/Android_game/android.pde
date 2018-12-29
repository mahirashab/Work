

class Android {
  int x, y, w;
  boolean falling;

  Android() {
    x = floor(random(100, width - 100));
    y = 350;
    w = 50;
    falling = false;
  }

  void checkGround(Tile tiles[]) {
    for (Tile t : tiles) {
      if (x + 19 > t.x * t.w && x + w - 19 < (t.x * t.w) + t.w && !t.exist) {
        y += 10;
        falling = true;
      }
    }
  }

  void checkFruit(ArrayList<Fruit> infruits) {
    for (int i = infruits.size() - 1; i >= 0; i--) {
      Fruit f = infruits.get(i);
      if (f.x > x && f.x < x + w && f.y > y) {
        score++;


        if (f.type == "regular") {
          fruits.remove(i);
        } else if (f.type == "repair") {
          fruits.remove(i);
          for (int j = 0; j < tiles.length; j++) {
            tiles[j] = new Tile(j);
          }
        } else if (f.type == "golden") {
          fruits.remove(i);
          lives += floor(random(4));
          return;
        } else if (f.type == "appocalypse") {
          fruits.remove(i);
          fruits = new ArrayList<Fruit>();
          println(fruits.size());
          return;
        }

        return;
      }
    }
  }

  void show() {
    image(android, x, y, w, w);
    fill(0);
  }

  void wrap() {
    if (x < 0) {
      x = 0;
    } else if (x > width - w) {
      x = width - w +5;
    }

    if (y + w > height - 100) {
      y += 10;
    }

    if (y > height - w/2) {
      a = new Android();
      fruits = new ArrayList<Fruit>();
      for (int i = 0; i < tiles.length; i++) {
        tiles[i] = new Tile(i);
      }
      score = 0;
      lives--;
    }
  }

  void left() {
    if (!falling) {
      x -= 10;
    }
  }

  void right() {
    if (!falling) {
      x += 10;
    }
  }
}
