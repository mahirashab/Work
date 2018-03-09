var x = 0;
var y = 0;
var space = 10;
var li;

function setup() {
	createCanvas(600, 400);
	background(25);
	li = width / space;
}

function draw() {
	stroke(250);
	if (random(1) < 0.5) {
		line(x, y, x + space, y + space);
	} else {
		line(x, y + space, x + space, y);
	}

	x += space;
	if (x > width) {
		x = 0;
		y += space;
	}
	if (y > height) {
		x = 0;
		y = 0;
	}


//For fast draw;

	// for (var i = 0; i < li; i++) {
	// 	if (random(1) < 0.5) {
	// 		line(x, y, x + space, y + space);
	// 	} else {
	// 		line(x, y + space, x + space, y);
	// 	}

	// 	x += space;
	// 	if (x > width) {
	// 		x = 0;
	// 		y += space;
	// 	}
	// 	//if (y > height) {
	// 	//	x = 0;
	// 	//	y = 0;
	// 	//}
	// }

}