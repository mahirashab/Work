var x = 0;
var y = 0;
var space = 64;
var end = 0;

function setup() {
	createCanvas(600, 500);
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
		
		for (var i = 0; i < 1; i++) {
			// console.log ('for');
			if (end === 0 || end === 1) {
				end += 1;
				console.log(end);
				break;
			}

			if (end % 2 === 1) {
				end += 1;
			}

			if (end % 2 === 0) {
				space = Math.floor(space /= 2);
				console.log(end);
				end += 1;
			}
			
		}
		
	}

}