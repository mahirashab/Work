class Cell {
    constructor(x_, y_, w_) {
        this.x = x_
        this.y = y_
        this.w = w_
        this.path = true
        this.col = 221
    }

    show() {
        fill(this.col)
        // noStroke()
        stroke(0)
        rect(this.x * this.w, this.y * this.w, this.w, this.w)
    }
}
