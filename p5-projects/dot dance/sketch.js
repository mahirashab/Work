let x, y;
let angle = 0.0;
let scalar = 40;
let speed = .2;
let speedIncrease = 0.01;
let offsetX;
let offsetY;
let points = [];

function setup() {
	createCanvas(600, 400);
	background(225);
	// frameRate(1);
	x = width / 2;
	y = height / 2;
	offsetX = width / 2;
	offsetY = height / 2;
}

function draw() {
	background(225);

	for (let i = 0; i < 250; i++) {
		x = offsetX + cos(angle) * scalar;
		y = offsetY + sin(angle) * scalar;
		angle += speed;
		scalar += speed;


		if(scalar > 200) {
			speed *= -1;
		}else if (scalar < 0) {
			speed *= -1;
		}

		speed += speedIncrease;

		if (speed > 0.9) {
			speedIncrease = -0.01;
		}else if (speed < 0.2) {
			speedIncrease = 0.01;
		}


		points[i] = new Dots(x, y);
		console.log(angle, scalar);
	}

	for (let j = 0; j < points.length; j++) {
		points[j].draw();
	}
}

function Dots(x, y) {
	this.x = x;
	this.y = y;

	this.draw = function() {
		noStroke();
		fill(25);
		ellipse(this.x, this.y, 5, 5);
	}
}
