class Spot {

    constructor(i, j, w) {
        this.i = i
        this.j = j
        this.w = w

        this.f = 0
        this.g = 0
        this.h = 0

        this.neighbors = []
        this.previous = undefined
        this.wall = (random(1) < 0.25)
    }

    show(col) {
        if (this.wall) {
            fill(0);
            noStroke();
            ellipse(this.i * w + w / 2, this.j * w + w / 2, w / 2, w / 2);
        } else if (col) {
            fill(col);
            rect(this.i * w, this.j * w, w, w);
        }

    }

    addNeighbors() {
        var i = this.i;
        var j = this.j;
        if (i < cols - 1) {
            this.neighbors.push(grid[i + 1][j]);
        }
        if (i > 0) {
            this.neighbors.push(grid[i - 1][j]);
        }
        if (j < rows - 1) {
            this.neighbors.push(grid[i][j + 1]);
        }
        if (j > 0) {
            this.neighbors.push(grid[i][j - 1]);
        }
        if (i > 0 && j > 0) {
            this.neighbors.push(grid[i - 1][j - 1]);
        }
        if (i < cols - 1 && j > 0) {
            this.neighbors.push(grid[i + 1][j - 1]);
        }
        if (i > 0 && j < rows - 1) {
            this.neighbors.push(grid[i - 1][j + 1]);
        }
        if (i < cols - 1 && j < rows - 1) {
            this.neighbors.push(grid[i + 1][j + 1]);
        }
    }
}