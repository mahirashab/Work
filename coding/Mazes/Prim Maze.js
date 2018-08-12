class PrimMaze {

    constructor(cols_, rows_, w_) {
        this.cols = cols_
        this.rows = rows_
        this.w = w_

        this.grid = new Array(this.cols)
        this.current = undefined

        this.frontire = []

    }

    createGrid() {
        for (let i = 0; i < this.cols; i++) {
            this.grid[i] = new Array(this.rows)
        }
        for (let i = 0; i < this.cols; i++) {
            for (let j = 0; j < this.rows; j++) {
                this.grid[i][j] = new PrimCell(i, j, this.w)
            }
        }

        this.current = this.grid[floor(random(this.cols - 1))][floor(random(this.rows - 1))]
        this.current.opened = true
        this.addNeighbor(this.current)
    }

    showGrid() {
        for (let i = 0; i < this.cols; i++) {
            for (let j = 0; j < this.rows; j++) {

                this.grid[i][j].show(color(128, 183, 214))

                if ((this.grid[i][j].opened)) {
                    this.grid[i][j].show(color(251, 238, 193))
                }

            }
        }

        for (let i = 0; i < this.frontire.length; i++) {
            this.frontire[i].show(color(216, 178, 145))
        }
    }

    addNeighbor(current) {

        let top = undefined;
        let right = undefined;
        let bottom = undefined;
        let left = undefined;

        if (current.j != 0) {
            top = this.grid[current.i][current.j - 1];
        }

        if (current.i != cols - 1) {
            right = this.grid[current.i + 1][current.j];
        }

        if (current.j != rows - 1) {
            bottom = this.grid[current.i][current.j + 1];
        }

        if (current.i != 0) {
            left = this.grid[current.i - 1][current.j];
        }

        if (top != undefined && !top.opened && !(this.frontire.includes(top))) {
            this.frontire.push(top);
        }

        if (right != undefined && !right.opened && !(this.frontire.includes(right))) {
            this.frontire.push(right);
        }

        if (bottom != undefined && !bottom.opened && !(this.frontire.includes(bottom))) {
            this.frontire.push(bottom);
        }

        if (left != undefined && !left.opened && !(this.frontire.includes(left))) {
            this.frontire.push(left);
        }
    }

    removingCheck(current) {

        let returnable = []

        let top = undefined;
        let right = undefined;
        let bottom = undefined;
        let left = undefined;

        if (current.j != 0) {
            top = this.grid[current.i][current.j - 1];
        }

        if (current.i != cols - 1) {
            right = this.grid[current.i + 1][current.j];
        }

        if (current.j != rows - 1) {
            bottom = this.grid[current.i][current.j + 1];
        }

        if (current.i != 0) {
            left = this.grid[current.i - 1][current.j];
        }

        if (top != undefined && top.opened && !(this.frontire.includes(top))) {
            returnable.push(top);
        }

        if (right != undefined && right.opened && !(this.frontire.includes(right))) {
            returnable.push(right);
        }

        if (bottom != undefined && bottom.opened && !(this.frontire.includes(bottom))) {
            returnable.push(bottom);
        }

        if (left != undefined && left.opened && !(this.frontire.includes(left))) {
            returnable.push(left);
        }

        return returnable
    }

    removeWall(current, neighbour) {
        let x = current.i - neighbour.i
        let y = current.j - neighbour.j

        if (x == 1) {
            current.left = !(current.left)
            neighbour.right = !(neighbour.right)
        } else if (x == -1) {
            current.right = !(current.right)
            neighbour.left = !(neighbour.left)
        } else if (y == 1) {
            current.top = !(current.top)
            neighbour.bottom = !(neighbour.bottom)
        } else if (y == -1) {
            current.bottom = !(current.bottom)
            neighbour.top = !(neighbour.top)
        }
    }

    removeFromArray(arr, elt) {
        for (var i = arr.length - 1; i >= 0; i--) {
            if (arr[i] == elt) {
                arr.splice(i, 1);
            }
        }
    }


    solveMaze() {
        let index = floor(random(this.frontire.length))

        this.current = this.frontire[index]

        if (this.current == undefined) {
            console.log('Maze Creation Complete!!!')
            noLoop()
        }

        if (this.current != undefined) {
            this.current.opened = true
            this.removeFromArray(this.frontire, this.current)

            let neighbors = this.removingCheck(this.current)
            let neighbor = neighbors[floor(random(neighbors.length))]
            this.removeWall(this.current, neighbor)
            this.addNeighbor(this.current)
        }
    }
}


class PrimCell {

    constructor(i_, j_, w_) {
        this.i = i_
        this.j = j_
        this.w = w_

        this.top = true
        this.right = true
        this.bottom = true
        this.left = true

        this.opened = false
    }

    show(col) {
        let i = this.i
        let j = this.j
        let w = this.w

        fill(col)
        strokeWeight(1);
        noStroke()
        rect(i * w, j * w, w, w)

        if (this.top) {
            stroke(0)
            line(i * w, j * w, (i * w) + w, j * w)
        }

        if (this.right) {
            stroke(0)
            line((i * w) + w - 1, (j * w) - 1, (i * w) + w - 1, (j * w) + w - 1)
        }

        if (this.bottom) {
            stroke(0)
            line((i * w) - 1, (j * w) + w - 1, (i * w) + w - 1, (j * w) + w - 1)
        }

        if (this.left) {
            stroke(0)
            line(i * w, j * w, i * w, (j * w) + w)
        }
    }
}