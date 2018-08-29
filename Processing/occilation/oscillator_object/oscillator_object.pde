int n = 15;
Oscillator o[] = new Oscillator[n];

void setup() {
  size(600, 400);
  for (int i = 0; i < n; i++) { 
    o[i] = new Oscillator();
  }
}

void draw() {
  background(250);
  for (int i = 0; i < n; i++) { 
    o[i].update();
    o[i].display();
  }
}