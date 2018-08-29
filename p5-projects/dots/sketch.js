var t;

function setup() {
	createCanvas(windowWidth, windowHeight);
	t = -1200;
}

function draw() {
	background(16, 16, 32);
	translate(windowWidth / 2, windowHeight / 2);
	noStroke();
	fill(255);
	for (var theta = 0; theta < 6; theta++) {
		for (var j = 1; j < 16; j++) {
			for (var i = 0; i < j; i++) {
				var x = (i - (j - 1) / 2) * 10;
				var y = j * 8.33;
				var d = dist(x, y, 0, 0);
				push();
				translate(x, y);
				rotate(radians(d + t) * (j + 16) / 24);
				ellipse(x, y, 5, 5);
				pop();
			}
		}
		rotate(PI / 3);
	}
	t++;
}