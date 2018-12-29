

class Fruit {
  float x, y;
  int w;
  String type;

  Fruit() {
    x = random(100, width - 100);
    y = -50;
    w = 10;
    
    float rand = random(1);
    
    if(0.7 > rand) {
      type = "regular";
    }else if(0.8 > rand) {
      type = "repair";
    }else if(0.9 > rand) {
      type = "golden";
    }else {
      type = "appocalypse";
    }

  }

  boolean checkTile(Tile tiles[]) {

    for (int i = tiles.length - 1; i >= 0; i--) {
      Tile t = tiles[i];
      if (x > t.x * t.w && x < t.x * t.w + t.w && y + w/2 > t.y) {
        t.exist = false;
        return true;
      }
    }
    
    return false;
  }

  void show() {

    if (type == "regular") {
      fill(200, 0, 0);
    }else if(type == "repair") {
      fill(0, 200, 0);
    }else if(type == "golden") {
      fill(218,165,32);
    }else {
      fill(255,0,255);
    }

    ellipse(x, y, w*2, w*2);
  }

  void update() {
    y += 2.3;
  }
}
