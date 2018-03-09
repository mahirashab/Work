function Ball() {
	this.x = random(0, width);
	this.y = random(0, height);
	this.r = random(20, 50);
	this.alp = 2;
	this.alpSpeed = 3;
	this.white = 75;
	this.whiteSpeed = 3;

	this.drawing = function() {
		stroke(125);
		fill(this.white, this.alp);
		ellipse(this.x, this.y, this.r);
	}

	this.update = function() {
		this.x += random(-5, 5);
		this.y += random(-5, 5);
		this.alp += this.alpSpeed;
		this.white += this.whiteSpeed;

	}

	this.newBall = function() {
		this.x = random(0, width);
		this.y = random(0, height);
	}

	this.clicked = function(px, py) {
		var d = dist(px, py, this.x, this.y);
		if (d < this.r / 2) {
			console.log('yes |' + ' framecount ' + frameCount + ' | number' + this.n);
			balls.splice(this.n, 1);
		}
	}

	this.colCheck = function() {
		if (this.alp > 255) {
			this.alpSpeed *= -1;
		} else if (this.alp < 1) {
			this.alpSpeed *= -1;
		}

		if (this.white > 225) {
			this.whiteSpeed *= -1;
		} else if (this.white < 75) {
			this.whiteSpeed *= -1;
		}
	}
}