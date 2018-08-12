class EllerMaze {

    constructor(cols_, rows_, w_) {
        this.cols = cols_
        this.rows = rows_
        this.w = w_

        this.grid = new Array(this.cols)
        this.current = undefined

        this.i = 0;
        this.topI = this.cols - 1
        this.iSpeed = 1

        this.topSet = 0

        this.j = 0
        this.topJ = this.rows - 1
    }

    createGrid() {
        for (let i = 0; i < this.cols; i++) {
            this.grid[i] = new Array(this.rows)
        }
        for (let i = 0; i < this.cols; i++) {
            for (let j = 0; j < this.rows; j++) {
                this.grid[i][j] = new EllerCell(i, j, this.w)
            }
        }

        for (let i = 0; i < this.cols; i++) {
            this.grid[i][0].set = i + 1
            this.topSet = this.grid[i][0].set
        }

        this.current = this.grid[0][0]
    }





    solveMaze() {
        if (this.j == 0 && this.current.i < this.topI) {

            let num = random(1)

            if (num < 0.5 && this.current.set != this.grid[this.current.i + 1][this.current.j].set) {
                this.removeWall(this.current, this.grid[this.current.i + 1][this.current.j])
                this.grid[this.current.i + 1][this.current.j].set = this.current.set
            }

            this.i += this.iSpeed

            if (this.i == this.topI) {
                this.iSpeed = -1
                this.j += 1
            }

        } else if (this.iSpeed == -1 && this.j > 0) {
            let num = random(1)

            if (num < 0.5) {
                this.removeWall(this.current, this.grid[this.current.i][this.current.j - 1])
                this.current.set = this.grid[this.current.i][this.current.j - 1].set
            } else {
                this.current.set = this.topSet
                this.topSet += 1
            }

            this.i += this.iSpeed
            if (this.i == 0) {
                this.iSpeed = 1
            }

        } else if (this.iSpeed == 1 && this.j > 0) {

            let num = random(1)

            if (num < 0.5 && this.i < this.topI) {
                this.removeWall(this.current, this.grid[this.current.i + 1][this.current.j])
                this.grid[this.current.i + 1][this.current.j].set = this.current.set
            }

            this.i += this.iSpeed
        }



        if (this.i > this.topI) {
            this.iSpeed = -1
            this.i += this.iSpeed
            this.j += 1
        }

        if (this.i == this.topI && this.j == this.topJ && this.iSpeed == 1) {
            console.log("Maze Created!!!")
            noLoop()
        }

        this.current = this.grid[this.i][this.j]
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


    checkWall(current, neighbour) {
        let x = current.i - neighbour.i
        let y = current.j - neighbour.j

        if (x == 1) {
            if (!(current.left) && !(neighbour.right)) {
                return true
            }

        } else if (x == -1) {
            if (!(current.right) && !(neighbour.left)) {
                return true
            }

        } else if (y == 1) {
            if (!(current.top) && !(neighbour.bottom)) {
                return true
            }

        } else if (y == -1) {
            if (!(current.bottom) && !(neighbour.top)) {
                return true
            }
        } else {
            return false
        }
    }



    showGrid() {
        for (let i = 0; i < this.cols; i++) {
            for (let j = 0; j < this.rows; j++) {
                this.grid[i][j].show(color(252, 235, 182))
            }
        }

        this.current.show(color(240, 120, 24))
        this.grid[this.cols - 1][this.rows - 1].show(color(0))
    }
}


class EllerCell {


    constructor(i_, j_, w_) {
        this.i = i_
        this.j = j_
        this.w = w_

        this.top = true
        this.right = true
        this.bottom = true
        this.left = true

        this.set = 0
    }

    show(col) {
        let i = this.i
        let j = this.j
        let w = this.w

        fill(col)
        strokeWeight(1);
        noStroke()
        rect(i * w, j * w, w, w)

        // stroke(0)
        // textSize(20)
        // fill(0)
        // text(this.set, i * w + 15, j * w + w - 10)

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