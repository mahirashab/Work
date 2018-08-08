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
        }

        this.current = this.grid[0][0]
    }





    solveMaze() {
        if (this.j == 0) {

            this.i += this.iSpeed
        } else {

            this.i += this.iSpeed
        }

        if (this.i > this.topI) {
            this.iSpeed = -1
            this.i += this.iSpeed
            this.j += 1
        }

        if (this.i < 0) {
            this.iSpeed = 1
            this.i += this.iSpeed
        }

        if (this.i == this.topI && this.j == this.topJ && this.iSpeed == 1) {
            console.log("Maze Solved!!!")
            this.current = this.grid[this.cols - 1][this.rows - 1]
            noLoop()
        }

        this.current = this.grid[this.i][this.j]
    }





    showGrid() {
        for (let i = 0; i < this.cols; i++) {
            for (let j = 0; j < this.rows; j++) {
                this.grid[i][j].show(color(252, 235, 182))
            }
        }

        this.current.show(color(240, 120, 24))
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