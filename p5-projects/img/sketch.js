var img;

function preload() {
	img = loadImage("clouds.png");
}

function setup() {
	createCanvas(430, 509);
}

function draw() {
	background(255);
	image(img, 0, 0);
	console.log(mouseX);
	console.log(mouseY);
}