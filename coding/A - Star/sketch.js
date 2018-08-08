let grid

let cols, rows
let w = 10

let openSet = []
let closedSet = []

let start, end

let current

let path

function setup() {
    createCanvas(601, 401)
    background(255)
    console.log('A*')

    cols = int(width / w)
    rows = int(height / w)

    grid = new Array(cols)

    for (let i = 0; i < cols; i++) {
        grid[i] = new Array(rows)
    }

    for (let i = 0; i < cols; i++) {
        for (let j = 0; j < rows; j++) {
            grid[i][j] = new Spot(i, j, w)
        }
    }

    for (let i = 0; i < cols; i++) {
        for (let j = 0; j < rows; j++) {
            grid[i][j].addNeighbors()
        }
    }

    start = grid[0][0]
    end = grid[cols - 1][rows - 1]
    end = grid[int(random(cols))][int(random(rows))]

    start.wall = false
    end.wall = false

    openSet.push(start)

}

function draw() {
    background(255)

    if (openSet.length > 0) {

        let winner = 0
        for (let i = 0; i < openSet.length; i++) {
            if (openSet[i].f < openSet[winner].f) {
                winner = i
            }
        }

        current = openSet[winner]

        if (current == end) {
            console.log('Done')
            noLoop()
        }

        closedSet.push(current)
        removeFromArray(openSet, current)

        let neighbors = current.neighbors

        for (let i = 0; i < neighbors.length; i++) {
            let neighbor = neighbors[i]

            if (!closedSet.includes(neighbor) && !neighbor.wall) {
                let tempG = current.g + 1

                let newPath = false
                if (openSet.includes(neighbor)) {

                    if (tempG < neighbor.g) {
                        neighbor.g = tempG
                        newPath = true
                    }

                } else {
                    neighbor.g = tempG
                    openSet.push(neighbor)
                    newPath = true
                }
                if (newPath) {
                    neighbor.h = heuristic(neighbor, end)
                    neighbor.f = neighbor.g + neighbor.h
                    neighbor.previous = current
                }

            }
        }


    } else {
        console.log('No Solution!!!')
    }

    path = []
    let temp = current
    while (temp.previous) {
        path.push(temp)
        temp = temp.previous
    }

    for (let i = 0; i < cols; i++) {
        for (let j = 0; j < rows; j++) {
            grid[i][j].show(color(255, 255, 255))
        }
    }

    // for (let i = 0; i < openSet.length; i++) {
    //     openSet[i].show(color(65, 244, 116))
    // }

    // for (let i = 0; i < closedSet.length; i++) {
    //     closedSet[i].show(color(66, 134, 244))
    // }

    noFill();
    stroke(255, 0, 200);
    strokeWeight(w / 2);
    beginShape();
    for (var i = 0; i < path.length; i++) {
        vertex(path[i].i * w + w / 2, path[i].j * w + w / 2);
    }
    endShape();
}

function removeFromArray(arr, elt) {
    for (var i = arr.length - 1; i >= 0; i--) {
        if (arr[i] == elt) {
            arr.splice(i, 1);
        }
    }
}

function heuristic(a, b) {
    // var d = dist(a.i, a.j, b.i, b.j);
    var d = abs(a.i - b.i) + abs(a.j - b.j);
    return d;
}