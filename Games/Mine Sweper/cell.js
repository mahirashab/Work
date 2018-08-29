function Cell(x_, y_, scl_) {
    this.x = x_;
    this.y = y_;
    this.scl = scl_;
    this.view = 1;
    this.neighbor = 0;
    // this.mine = floor(random(7)) == 1;
    this.mine = false;
    this.revealed = false;

    this.display = function() {
        stroke(100);
        fill(150);
        rect(this.x * this.scl, this.y * this.scl, this.scl, this.scl);

        if (this.revealed) {
            fill(200);
            rect(this.x * this.scl, this.y * this.scl, this.scl, this.scl);
            if (this.mine) {
                stroke(0);
                fill(70);
                ellipse((this.x * this.scl) + this.scl / 2, (this.y * this.scl) + this.scl / 2, this.scl * 0.55, this.scl * 0.55)
            } else if (this.neighbor != 0) {
                fill(0);
                textAlign(CENTER);
                text(this.neighbor, this.x * this.scl + this.scl * 0.5, this.y * this.scl + this.scl - 5)
            }
        }
    }

    this.count = function(grid) {

        if (this.mine) {
            return -1;
        }

        var total = 0;
        for (var i = -this.view; i < this.view + 1; i++) {
            for (var j = -this.view; j < this.view + 1; j++) {
                var x = this.x + i;
                var y = this.y + j;
                if (x > -1 && x < cols && y > -1 && y < rows) {
                    if (grid[x][y].mine) {
                        total++;
                    }
                }
            }
        }
        this.neighbor = total;
    }

    this.reveal = function() {
        for (var i = -this.view; i < this.view + 1; i++) {
            for (var j = -this.view; j < this.view + 1; j++) {
                var x = this.x + i;
                var y = this.y + j;
                if (x > -1 && x < cols && y > -1 && y < rows) {
                    if (grid[x][y].mine == false && grid[x][y].revealed == false) {
                        grid[x][y].revealed = true;
                        if (grid[x][y].neighbor == 0) {
                            grid[x][y].reveal();
                        }
                    }
                }
            }
        }
    }
}
