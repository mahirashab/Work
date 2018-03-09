var img;

function preload() {
	img = loadImage("lunar.jpg");
}
function setup() {
  createCanvas(600,400);
}

function draw() {
  image(img, 0, 0);
}