function Snake() {
    this.x = 0;
    this.y = 0;
    this.w = scl;

    this.xSpeed = 1;
    this.ySpeed = 0;

    this.total = 0;
    this.tail = [];

    this.show = function() {
        fill(255);
        for (var i = 0; i < this.tail.length; i++) {
            rect(this.tail[i].x, this.tail[i].y, scl, scl);
        }
        rect(this.x, this.y, this.w, this.w);
    }

    this.update = function() {
        for (var i = 0; i < this.tail.length - 1; i++) {
            this.tail[i] = this.tail[i + 1];
        }
        if (this.total >= 1) {
            this.tail[this.total - 1] = createVector(this.x, this.y);
        }

        this.x += this.xSpeed * this.w;
        this.y += this.ySpeed * this.w;
    }

    this.setDir = function(x_, y_) {
        this.xSpeed = x_;
        this.ySpeed = y_;
    }

    this.edges = function() {
        if (this.x > width) {
            this.x = 0;
        } else if (this.x < 0) {
            this.x = width;
        }

        if (this.y > height) {
            this.y = 0;
        } else if (this.y < 0) {
            this.y = height;
        }
    }

    this.eatFood = function(food) {
        if (this.x == food.x && this.y == food.y) {
            this.total++;
            return true;
        } else {
            return false;
        }
    }

}
