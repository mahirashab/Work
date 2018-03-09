var xCor = 10;
var yCor = 200;
var speed = 3;
var speedY = 3;
var r = 0;
var speedR = 2;

function setup() {
  createCanvas(600,400);
  
}

function draw() {
	var g = map(xCor, 0, 600, 0, 255);
	var b = map(yCor, 0, 400, 0, 255);
	
  	background(r, g, b);
  	noStroke;
  	fill(110, g, 100);
  	
  	ellipse (xCor, yCor, 30, 30);
  	
  	if ((xCor + 15) > width) {
  		speed = random(3, 5) * -1;
  	}else if ((xCor - 15) < 0) {
  		speed = speedY = random(3, 5);
  	}
  	
  	
  	if ((yCor + 15) > height) {
  		speedY = random(3, 5) * -1;
  	}else if ((yCor - 15) < 0) {
  		speedY = random(3, 5);
  	}
  	
  	
  	if (r > 255) {
  		speedR = random(2) * -1;
  	}else if (r < 0) {
  		speedR = random(2);
  	}
  	
  	
  	xCor += speed;
  	yCor += speedY;
  	r += speedR;
}
















