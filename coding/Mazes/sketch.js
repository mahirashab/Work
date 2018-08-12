let cols, rows
let w

let mazeNames = ['recursive', 'eller', 'prim']
let mazeNumber = 2

let generate = true

let recursive

function setup() {
    createCanvas(600, 600)
    background(255)

    // frameRate(1)

    w = 20
    cols = int(width / w)
    rows = int(height / w)

    if (mazeNumber == 0) {
        recursive = new RecursiveMaze(cols, rows, w)
        recursive.createGrid()
    }

    if (mazeNumber == 1) {
        eller = new EllerMaze(cols, rows, w)
        eller.createGrid()
    }

    if (mazeNumber == 2) {
        prim = new PrimMaze(cols, rows, w)
        prim.createGrid()
    }
}

function draw() {
    background(255)

    if (mazeNumber == 0) {
        recursive.showGrid()
        recursive.createMaze()
        recursive.solveMaze()
    }

    if (mazeNumber == 1) {
        eller.showGrid()
        eller.solveMaze()
    }

    if (mazeNumber == 2) {
        prim.showGrid()
        prim.solveMaze()
    }

    // if (frameCount > 10) {
    //     noLoop()
    // }

    stroke(0)
    line(0, 0, width, 0)

    line(0, 0, 0, height)

    line(0, height - 1, width, height - 1)

    line(width - 1, 1, width - 1, height - 1)
}