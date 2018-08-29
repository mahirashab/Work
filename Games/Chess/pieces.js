class Piece {

    constructor(i_, j_, w_, h_, kind_) {
        this.i = i_
        this.j = j_

        this.h = h_
        this.w = w_

        this.kind = kind_
        this.image = undefined

        this.color = 0

        this.neighbours = []

        this.colLetter = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
    }

    show(color) {
        strokeWeight(1)
        stroke(0)
        if ((this.i + this.j + 1) % 2 == 0) {
            fill(237, 245, 225)
        } else {
            fill(177, 162, 150)
        }

        // noStroke()
        rect(this.i * this.w, this.j * this.h, this.w, this.h)

        if (this.image) {
            image(this.image, this.i * this.w, this.j * this.h, this.w, this.h)
        }

        if (color) {
            strokeWeight(3)
            stroke(color)
            noFill()
            rect(this.i * this.w + 1, this.j * this.h + 1, this.w - 1, this.h - 1)
        }

        if (this.neighbours.length > 0) {
            strokeWeight(3)
            stroke(51, 102, 255)
            noFill()
            for (let i = 0; i < this.neighbours.length; i++) {
                let item = this.neighbours[i]
                if (item.color != 0 && this.color != item.color) {
                    stroke(255, 26, 26)
                } else {
                    stroke(51, 102, 255)
                }
                rect(item.i * item.w + 1, item.j * item.h + 1, item.w - 1, item.h - 1)
            }
        }
    }

    calculatePlace() {
        let colLet = this.colLetter[this.i]
        let rowNum = 8 - this.j

        return ` ~ ${colLet}${rowNum}`
    }

    getNeighbours(grid) {
        this.neighbours = []

        if (this.kind == 'White Pawn') {
            let itemInPath = false
            for (let i = 1; i < 2; i++) {
                if (!itemInPath) {
                    let place = grid[this.i][this.j - i]
                    if (place) {
                        if (place.kind == undefined && place.j > -1) {
                            this.neighbours.push(place)
                        } else if (place.kind != undefined && this.color != place.color) {
                            this.neighbours.push(place)
                            itemInPath = true
                        } else {
                            itemInPath = true
                        }
                    }

                }
            }

            if (this.i < cols - 1 && this.j > -1) {
                let place = grid[this.i + 1][this.j - 1]
                if (place.kind != undefined && this.color != place.color) {
                    console.log(1)
                    this.neighbours.push(place)
                }
            }

            if (this.i > 0 && this.j > -1) {
                let place = grid[this.i - 1][this.j - 1]
                if (place.kind != undefined && this.color != place.color) {
                    console.log(1)
                    this.neighbours.push(place)
                }
            }
        }


        if (this.kind == 'Black Pawn') {
            let itemInPath = false
            for (let i = 1; i < 2; i++) {
                if (!itemInPath) {
                    let place = grid[this.i][this.j + i]
                    if (place != undefined && place.kind == undefined && place.j < rows) {
                        this.neighbours.push(place)
                    } else if (place != undefined && place.j < rows && this.color != place.color) {
                        this.neighbours.push(place)
                        itemInPath = true
                    } else {
                        itemInPath = true
                    }
                }
            }
            if (this.i < cols - 1 && this.j < rows) {
                let place = grid[this.i + 1][this.j + 1]
                if (place.kind != undefined && this.color != place.color) {
                    console.log(1)
                    this.neighbours.push(place)
                }
            }

            if (this.i > 0 && this.j < rows) {
                let place = grid[this.i - 1][this.j + 1]
                if (place.kind != undefined && this.color != place.color) {
                    this.neighbours.push(place)
                }
            }

        }

        if (this.kind == 'White Rook' || this.kind == 'Black Rook') {
            let itemInPathTop = false
            let itemInPathRight = false
            let itemInPathBottom = false
            let itemInPathLeft = false

            for (let i = 1; i < 10; i++) {
                if (!itemInPathTop) {
                    let place = grid[this.i][this.j - i]
                    if (place != undefined && place.kind == undefined) {
                        this.neighbours.push(place)
                    } else if (place != undefined && this.color != place.color) {
                        this.neighbours.push(place)
                        itemInPathTop = true
                    } else {
                        itemInPathTop = true
                    }
                }
            }

            for (let i = 1; i < 10; i++) {

                if (!itemInPathRight) {
                    if (this.i + i < cols) {
                        let place = grid[this.i + i][this.j]
                        if (place != undefined && place.kind == undefined) {
                            this.neighbours.push(place)
                        } else if (place != undefined && this.color != place.color) {
                            this.neighbours.push(place)
                            itemInPathRight = true
                        } else {
                            itemInPathRight = true
                        }
                    }
                }
            }

            for (let i = 1; i < 10; i++) {
                if (!itemInPathBottom) {
                    let place = grid[this.i][this.j + i]
                    if (place != undefined && place.kind == undefined) {
                        this.neighbours.push(place)
                    } else if (place != undefined && this.color != place.color) {
                        this.neighbours.push(place)
                        itemInPathBottom = true
                    } else {
                        itemInPathBottom = true
                    }
                }
            }

            for (let i = 1; i < 10; i++) {

                if (!itemInPathLeft) {
                    if (this.i - i > -1) {
                        let place = grid[this.i - i][this.j]
                        if (place != undefined && place.kind == undefined) {
                            this.neighbours.push(place)
                        } else if (place != undefined && this.color != place.color) {
                            this.neighbours.push(place)
                            itemInPathLeft = true
                        } else {
                            itemInPathLeft = true
                        }
                    }
                }
            }
        }

        if (this.kind == 'White Bishop' || this.kind == 'Black Bishop') {
            let itemInTopLeft = false
            let itemInTopRight = false
            let itemInBottomLeft = false
            let itemInBottomRight = false

            for (let i = 1; i < 10; i++) {
                if (!itemInTopLeft) {
                    if (this.i - i > -1 && this.j - i > -1) {
                        let place = grid[this.i - i][this.j - i]
                        if (place != undefined && place.kind == undefined) {
                            this.neighbours.push(place)
                        } else if (place != undefined && this.color != place.color) {
                            this.neighbours.push(place)
                            itemInTopLeft = true
                        } else {
                            itemInTopLeft = true
                        }
                    }
                }
            }

            for (let i = 1; i < 10; i++) {
                if (!itemInTopRight) {
                    if (this.i + i < cols && this.j - i > -1) {
                        let place = grid[this.i + i][this.j - i]
                        if (place != undefined && place.kind == undefined) {
                            this.neighbours.push(place)
                        } else if (place != undefined && this.color != place.color) {
                            this.neighbours.push(place)
                            itemInTopRight = true
                        } else {
                            itemInTopRight = true
                        }
                    }
                }
            }

            for (let i = 1; i < 10; i++) {
                if (!itemInBottomLeft) {
                    if (this.i - i > -1 && this.j + i < rows) {
                        let place = grid[this.i - i][this.j + i]
                        if (place != undefined && place.kind == undefined) {
                            this.neighbours.push(place)
                        } else if (place != undefined && this.color != place.color) {
                            this.neighbours.push(place)
                            itemInBottomLeft = true
                        } else {
                            itemInBottomLeft = true
                        }
                    }
                }
            }

            for (let i = 1; i < 10; i++) {
                if (!itemInBottomRight) {
                    if (this.i + i < cols && this.j + i < rows) {
                        let place = grid[this.i + i][this.j + i]
                        if (place != undefined && place.kind == undefined) {
                            this.neighbours.push(place)
                        } else if (place != undefined && this.color != place.color) {
                            this.neighbours.push(place)
                            itemInBottomRight = true
                        } else {
                            itemInBottomRight = true
                        }
                    }
                }
            }
        }


        if (this.kind == 'White Queen' || this.kind == 'Black Queen') {
            let itemInPathTop = false
            let itemInPathRight = false
            let itemInPathBottom = false
            let itemInPathLeft = false

            for (let i = 1; i < 10; i++) {
                if (!itemInPathTop) {
                    let place = grid[this.i][this.j - i]
                    if (place != undefined && place.kind == undefined && place.j > -1) {
                        this.neighbours.push(place)
                    } else if (place != undefined && place.j > -1 && this.color != place.color) {
                        this.neighbours.push(place)
                        itemInPathTop = true
                    } else {
                        itemInPathTop = true
                    }
                }
            }

            for (let i = 1; i < 10; i++) {

                if (!itemInPathRight) {
                    if (this.i + i < cols) {
                        let place = grid[this.i + i][this.j]
                        if (place != undefined && place.kind == undefined && place.i < cols) {
                            this.neighbours.push(place)
                        } else if (place != undefined && place.i < cols && this.color != place.color) {
                            this.neighbours.push(place)
                            itemInPathRight = true
                        } else {
                            itemInPathRight = true
                        }
                    }
                }
            }

            for (let i = 1; i < 10; i++) {
                if (!itemInPathBottom) {
                    let place = grid[this.i][this.j + i]
                    if (place != undefined && place.kind == undefined && place.j < rows) {
                        this.neighbours.push(place)
                    } else if (place != undefined && place.j < rows && this.color != place.color) {
                        this.neighbours.push(place)
                        itemInPathBottom = true
                    } else {
                        itemInPathBottom = true
                    }
                }
            }

            for (let i = 1; i < 10; i++) {

                if (!itemInPathLeft) {
                    if (this.i - i > -1) {
                        let place = grid[this.i - i][this.j]
                        if (place != undefined && place.kind == undefined && place.i > -1) {
                            this.neighbours.push(place)
                        } else if (place != undefined && place.i > -1 && this.color != place.color) {
                            this.neighbours.push(place)
                            itemInPathLeft = true
                        } else {
                            itemInPathLeft = true
                        }
                    }
                }
            }

            let itemInTopLeft = false
            let itemInTopRight = false
            let itemInBottomLeft = false
            let itemInBottomRight = false

            for (let i = 1; i < 10; i++) {
                if (!itemInTopLeft) {
                    if (this.i - i > -1 && this.j - i > -1) {
                        let place = grid[this.i - i][this.j - i]
                        if (place != undefined && place.kind == undefined) {
                            this.neighbours.push(place)
                        } else if (place != undefined && this.color != place.color) {
                            this.neighbours.push(place)
                            itemInTopLeft = true
                        } else {
                            itemInTopLeft = true
                        }
                    }
                }
            }

            for (let i = 1; i < 10; i++) {
                if (!itemInTopRight) {
                    if (this.i + i < cols && this.j - i > -1) {
                        let place = grid[this.i + i][this.j - i]
                        if (place != undefined && place.kind == undefined) {
                            this.neighbours.push(place)
                        } else if (place != undefined && this.color != place.color) {
                            this.neighbours.push(place)
                            itemInTopRight = true
                        } else {
                            itemInTopRight = true
                        }
                    }
                }
            }

            for (let i = 1; i < 10; i++) {
                if (!itemInBottomLeft) {
                    if (this.i - i > -1 && this.j + i < rows) {
                        let place = grid[this.i - i][this.j + i]
                        if (place != undefined && place.kind == undefined) {
                            this.neighbours.push(place)
                        } else if (place != undefined && this.color != place.color) {
                            this.neighbours.push(place)
                            itemInBottomLeft = true
                        } else {
                            itemInBottomLeft = true
                        }
                    }
                }
            }

            for (let i = 1; i < 10; i++) {
                if (!itemInBottomRight) {
                    if (this.i + i < cols && this.j + i < rows) {
                        let place = grid[this.i + i][this.j + i]
                        if (place != undefined && place.kind == undefined) {
                            this.neighbours.push(place)
                        } else if (place != undefined && this.color != place.color) {
                            this.neighbours.push(place)
                            itemInBottomRight = true
                        } else {
                            itemInBottomRight = true
                        }
                    }
                }
            }
        }

        if (this.kind == 'White King' || this.kind == 'Black King') {
            for (let i = -1; i < 2; i++) {
                for (let j = -1; j < 2; j++) {

                    let x = this.i + i
                    let y = this.j + j

                    if (x > -1 && x < cols && y > -1 && y < rows) {
                        let place = grid[this.i + i][this.j + j]

                        if (place != undefined && place.kind == undefined) {
                            this.neighbours.push(place)
                        } else if (place != undefined && this.color != place.color) {
                            this.neighbours.push(place)
                        }
                    }
                }
            }
        }

        if (this.kind == 'White Knight' || this.kind == 'Black Knight') {
            let x = this.i
            let y = this.j

            let topRight, bottomRight, topLeft, bottomLeft, rightTop, rightBottom, leftTop, leftBottom

            if (x + 1 < cols) {
                topRight = grid[x + 1][y - 2]
                bottomRight = grid[x + 1][y + 2]
            }

            if (x - 1 > -1) {
                topLeft = grid[x - 1][y - 2]
                bottomLeft = grid[x - 1][y + 2]
            }

            if (x + 2 < cols) {
                rightTop = grid[x + 2][y - 1]
                rightBottom = grid[x + 2][y + 1]
            }

            if (x - 2 > -1) {
                leftTop = grid[x - 2][y - 1]
                leftBottom = grid[x - 2][y + 1]
            }


            let place = topRight

            if (place != undefined && place.kind == undefined) {
                this.neighbours.push(place)
            } else if (place != undefined && this.color != place.color) {
                this.neighbours.push(place)
            }

            place = topLeft

            if (place != undefined && place.kind == undefined) {
                this.neighbours.push(place)
            } else if (place != undefined && this.color != place.color) {
                this.neighbours.push(place)
            }

            place = rightTop

            if (place != undefined && place.kind == undefined) {
                this.neighbours.push(place)
            } else if (place != undefined && this.color != place.color) {
                this.neighbours.push(place)
            }

            place = rightBottom

            if (place != undefined && place.kind == undefined) {
                this.neighbours.push(place)
            } else if (place != undefined && this.color != place.color) {
                this.neighbours.push(place)
            }

            place = bottomRight

            if (place != undefined && place.kind == undefined) {
                this.neighbours.push(place)
            } else if (place != undefined && this.color != place.color) {
                this.neighbours.push(place)
            }

            place = bottomLeft

            if (place != undefined && place.kind == undefined) {
                this.neighbours.push(place)
            } else if (place != undefined && this.color != place.color) {
                this.neighbours.push(place)
            }

            place = leftTop

            if (place != undefined && place.kind == undefined) {
                this.neighbours.push(place)
            } else if (place != undefined && this.color != place.color) {
                this.neighbours.push(place)
            }

            place = leftBottom

            if (place != undefined && place.kind == undefined) {
                this.neighbours.push(place)
            } else if (place != undefined && this.color != place.color) {
                this.neighbours.push(place)
            }
        }
    }
}