const res = 15
let cols, rows

let grid = []

function setup() {
    createCanvas(600, 400)

    cols = floor(width / res)
    rows = floor(height / res)

    createGrid()
}

function draw() {
    background(255)

    for (let i = 0; i < cols; i++) {
        for (let j = 0; j < rows; j++) {
            grid[i][j].show()
        }
    }
}

function createGrid() {
    for (let i = 0; i < cols; i++) {
        grid[i] = new Array(rows)
    }

    for (let i = 0; i < cols; i++) {
        for (let j = 0; j < rows; j++) {
            grid[i][j] = new Cell(i, j, res)
        }
    }
}

function mouseDragged() {
    let x_ = mouseX
    let y_ = mouseY

    let iLoc = floor(x_ / res)
    let jLoc = floor(y_ / res)

    if (iLoc < cols && jLoc < rows) {
        if (grid[iLoc][jLoc].col == 221) {
            grid[iLoc][jLoc].col = 21
            grid[iLoc][jLoc].path = false
        }
    }
}

function mousePressed() {
    let x_ = mouseX
    let y_ = mouseY

    let iLoc = floor(x_ / res)
    let jLoc = floor(y_ / res)

    if (iLoc < cols && jLoc < rows) {
        if (grid[iLoc][jLoc].col == 21) {
            grid[iLoc][jLoc].col = 221
            grid[iLoc][jLoc].path = true
        } else {
            grid[iLoc][jLoc].col = 21
            grid[iLoc][jLoc].path = false
        }
    }
}
