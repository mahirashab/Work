
int[] randoms;
int index;

void setup() {
  size(600, 400);
  background(200);
  randoms = new int[20];
}

void draw() {
  index = int(random(randoms.length));
  randoms[index]++;

  int w = width/randoms.length;
  for (int x = 0; x < randoms.length; x++) {
    stroke(0);
    fill(randoms[x] % 195); 
    rect(x * w, height - randoms[x], w -1, randoms[x]);

    if (randoms[x] > height) {
      randoms = new int[20];
      background(200);
    }
  }
}