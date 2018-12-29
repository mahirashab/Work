
class Tile {
  int x, y, w;
  boolean exist;

  Tile(int x_) {
    x = x_;
    y = height - 100;
    w = 25;
    exist = true;
  }

  void show() {
    if (exist) {
      image(tile, x * w, y, w, w);
    }
  }
}
