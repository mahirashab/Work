class RecursiveMaze {

    constructor(cols_, rows_, w_) {
        this.cols = cols_
        this.rows = rows_
        this.w = w_

        this.grid = new Array(this.cols)
        this.current = undefined

        this.stack = []

        this.solve = false

        this.start = undefined
        this.end = undefined

        this.solvingCurrent = undefined

        this.openSet = []
        this.closedSet = []

        this.path = []
    }

    createGrid() {
        for (let i = 0; i < this.cols; i++) {
            this.grid[i] = new Array(this.rows)
        }


        for (let i = 0; i < this.cols; i++) {
            for (let j = 0; j < this.rows; j++) {
                this.grid[i][j] = new RecursiveCell(i, j, this.w)
            }
        }

        for (let i = 0; i < this.cols; i++) {
            for (let j = 0; j < this.rows; j++) {
                this.grid[i][j].addNeighbors(this.grid)
            }
        }

        this.current = this.grid[0][0]

        this.start = this.grid[0][0]
        this.end = this.grid[this.cols - 1][this.rows - 1]

        this.openSet.push(this.start)
    }

    createMaze() {

        let neighbors = []

        let top = undefined;
        let right = undefined;
        let bottom = undefined;
        let left = undefined;

        if (this.current.j != 0) {
            top = this.grid[this.current.i][this.current.j - 1];
        }

        if (this.current.i != cols - 1) {
            right = this.grid[this.current.i + 1][this.current.j];
        }

        if (this.current.j != rows - 1) {
            bottom = this.grid[this.current.i][this.current.j + 1];
        }

        if (this.current.i != 0) {
            left = this.grid[this.current.i - 1][this.current.j];
        }

        if (top != undefined && !top.visited) {
            neighbors.push(top);
        }

        if (right != undefined && !right.visited) {
            neighbors.push(right);
        }

        if (bottom != undefined && !bottom.visited) {
            neighbors.push(bottom);
        }

        if (left != undefined && !left.visited) {
            neighbors.push(left);
        }

        if (neighbors.length > 0) {
            let num = floor(random(neighbors.length));
            let neighbour = neighbors[num];

            this.stack.push(this.current)

            let x = this.current.i - neighbour.i
            let y = this.current.j - neighbour.j

            if (x == 1) {
                this.current.left = !(this.current.left)
                neighbour.right = !(neighbour.right)
            } else if (x == -1) {
                this.current.right = !(this.current.right)
                neighbour.left = !(neighbour.left)
            } else if (y == 1) {
                this.current.top = !(this.current.top)
                neighbour.bottom = !(neighbour.bottom)
            } else if (y == -1) {
                this.current.bottom = !(this.current.bottom)
                neighbour.top = !(neighbour.top)
            }

            neighbour.visited = true
            this.current = neighbour
        } else if (this.stack.length > 0) {
            this.current = this.stack.pop()
        }

        if (this.current == this.grid[0][0] && this.allVisited() == this.cols * this.rows) {
            return true
            // this.solve = true
        }

    }

    solveMaze() {
        if (this.solve) {

            console.log('solving!!!')
            if (this.openSet.length > 0) {

                let winner = 0
                for (let i = 0; i < this.openSet.length; i++) {
                    if (this.openSet[i].f < this.openSet[winner].f) {
                        winner = i
                    }
                }

                let current = this.openSet[winner]

                if (current == this.end) {
                    console.log('Done. Maze Solved!!!')
                    noLoop()
                }

                this.closedSet.push(current)
                this.removeFromArray(this.openSet, current)

                let neighbors = current.neighbors

                for (let i = 0; i < neighbors.length; i++) {
                    let neighbor = neighbors[i]

                    if (!this.closedSet.includes(neighbor) && this.checkWall(current, neighbor)) {
                        let tempG = current.g + 1

                        let newPath = false
                        if (this.openSet.includes(neighbor)) {

                            if (tempG < neighbor.g) {
                                neighbor.g = tempG
                                newPath = true
                            }

                        } else {
                            neighbor.g = tempG
                            this.openSet.push(neighbor)
                            newPath = true
                        }
                        if (newPath) {
                            neighbor.h = this.heuristic(neighbor, this.end)
                            neighbor.f = neighbor.g + neighbor.h
                            this.solvingCurrent = current
                            neighbor.previous = current
                        }

                    }
                }


            } else {
                console.log('No Solution!!!')
                noLoop()
            }

            let path = []
            let temp = this.solvingCurrent
            while (temp.previous) {
                path.push(temp)
                temp = temp.previous
            }

            this.path = path

            noFill();
            stroke(255, 0, 200);
            strokeWeight(2);
            beginShape();
            for (var i = 0; i < path.length; i++) {
                vertex(path[i].i * w + w / 2, path[i].j * w + w / 2);
            }
            endShape();

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
    }

    removeFromArray(arr, elt) {
        for (var i = arr.length - 1; i >= 0; i--) {
            if (arr[i] == elt) {
                arr.splice(i, 1);
            }
        }
    }

    heuristic(a, b) {
        // var d = dist(a.i, a.j, b.i, b.j);
        var d = abs(a.i - b.i) + abs(a.j - b.j);
        return d;
    }

    allVisited() {
        let visited = 0
        for (let i = 0; i < this.cols; i++) {
            for (let j = 0; j < this.rows; j++) {
                if (this.grid[i][j].visited) {
                    visited++
                }
            }
        }
        return visited
    }
}


class RecursiveCell {


    constructor(i_, j_, w_) {
        this.i = i_
        this.j = j_
        this.w = w_

        this.top = true
        this.right = true
        this.bottom = true
        this.left = true

        this.visited = false
        this.previous = undefined

        this.neighbors = []
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

    addNeighbors(grid) {
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