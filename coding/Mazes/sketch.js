let cols, rows
let w

let mazeName = 'eller'

let generate = true

let recursive

function setup() {
    createCanvas(600, 600)
    background(255)

    // frameRate(2)

    w = 60
    cols = int(width / w)
    rows = int(height / w)

    if (mazeName == 'recursive') {
        recursive = new RecursiveMaze(cols, rows, w)
        recursive.createGrid()
    }

    if (mazeName == 'eller') {
        eller = new EllerMaze(cols, rows, w)
        eller.createGrid()
    }
}

function draw() {
    background(255)

    if (mazeName == 'recursive') {
        recursive.showGrid()
        recursive.createMaze()
        recursive.solveMaze()
    }

    if (mazeName == 'eller') {
        eller.showGrid()
        eller.solveMaze()
    }

    stroke(0)
    line(0, 0, width, 0)

    line(0, 0, 0, height)

    line(0, height - 1, width, height - 1)

    line(width - 1, 1, width - 1, height - 1)
}