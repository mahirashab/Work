var cols, rows;
var grid;
var resolution = 10;

function setup() {
    createCanvas(700, 600);
    cols = floor(width / resolution);
    rows = floor(height / resolution);
    grid = new Array(cols * rows);
    for (var i = 0; i < cols; i++) {
        for (var j = 0; j < rows; j++) {
            var index = i + j * cols;
            grid[index] = new Cell(i, j, resolution);
        }
    }
}

function draw() {
    background(130);
    for (var i = 1; i < cols - 1; i++) {
        for (var j = 1; j < rows - 1; j++) {
            var index = i + j * cols;
            grid[index].display();
            grid[index].update(grid);
        }
    }
    for (var i = 1; i < cols - 1; i++) {
        for (var j = 1; j < rows - 1; j++) {
            var index = i + j * cols;
            grid[index].changeState();
        }
    }
}


function Cell(x_, y_, scl_) {
    this.x = x_;
    this.y = y_;
    this.scl = scl_;
    this.view = 1;
    this.state = floor(random(2));
    this.nextState = this.state;

    this.display = function() {
        // stroke(0);
        noStroke();
        if (this.state == 1) {
            fill(0);
        } else {
            fill(255);
        }
        rect(this.x * this.scl, this.y * this.scl, this.scl - 1, this.scl - 1);
    }

    this.update = function(grid) {
        var count = 0;
        for (var i = -this.view; i < this.view + 1; i++) {
            for (var j = -this.view; j < this.view + 1; j++) {
                var x = this.x + i;
                var y = this.y + j;
                var index = x + y * cols;
                count += grid[index].state;
            }
        }

        count -= grid[this.x + this.y * cols].state;

        if (this.state == 1 && count < 2) {
            this.nextState = 0;
        }else if (this.state == 1 && (count == 2 || count == 3)) {
            this.nextState = 1;
        }else if (this.state == 1 && count > 3) {
            this.nextState = 0;
        }else if (this.state == 0 && count == 3) {
            this.nextState = 1;
        }
    }

    this.changeState = function() {
        this.state = this.nextState;
    }
}

function mouseDragged() {
    var x = floor(mouseX / resolution);
    var y = floor(mouseY / resolution);
    var index = x + y * cols;
    grid[index].state = 1;
}
