var balls = [];
var ballNum;
var currentNum;
var para;
var slide;
var button;
var corX;
var corY;

function setup() {
	createCanvas(600, 400);
	ballNum = 40;
	para = createP('Number of balls is | ' + ballNum);
	slide = createSlider(1, 250, 40);
	button = createButton("Reset");
	button.mousePressed(hardReset);
	for (var i = 0; i < ballNum; i++) {
		balls[i] = new Ball();
	}
}

function draw() {
	background(155);
	if (ballNum != slide.value()) {
		ballNum = slide.value();
		para.html('Number of balls is | ' + ballNum);
		balls = [];
		for (var j = 0; j < ballNum; j++) {
			balls[j] = new Ball();
		}
	}
	for (var i = 0; i < balls.length; i++) {
		balls[i].drawing();
		balls[i].update();
		balls[i].colCheck();

		if (balls[i].x < 0) {
			balls[i].newBall();
			balls[i].drawing();
		} else if (balls[i].x > width) {
			balls[i].newBall();
			balls[i].drawing();
		} else if (balls[i].y < 0) {
			balls[i].newBall();
			balls[i].drawing();
		} else if (balls[i].y > height) {
			balls[i].newBall();
			balls[i].drawing();
		}

	}
}


function mousePressed() {
	for (var i = 0; i < balls.length; i++) {
		balls[i].n = i;
		balls[i].clicked(mouseX, mouseY);
	}
}


function hardReset() {
	ballNum = 0;
	slide.value(40);
}