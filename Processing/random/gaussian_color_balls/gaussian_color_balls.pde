
import java.util.Random;
Random x, y;
float xMean, yMean;
float xD = 100;
float yD = 100;
float xCor, yCor;

void setup() {
  size(600, 600);
  background(0);
  noStroke();
  x = new Random();
  y = new Random();
  xMean = width/2;
  yMean = height/2;
}

void draw() {
  xCor = (((float) x.nextGaussian() * xD) + xMean);
  println(xCor);
  yCor = (((float) y.nextGaussian() * yD) + yMean);
  println(yCor);
  //yCor =10;
  fill(random(255), random(255), random(255), random(100, 200));
  float d = random(30);
  ellipse(xCor, yCor, d, d);
}

void keyPressed() {
 if(key == 'r') {
   background(0);
 }else if (key == 's') {
  noLoop(); 
 }else if(key == ' ') {
  loop(); 
 }
}