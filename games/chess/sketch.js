let w, h

let cols = 8
let rows = 8

let grid = new Array(cols)

let places = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i']

let blackPawn, whitePawn, blackRook, whiteRook, blackKnight, whiteKnight, blackBishop, whiteBishop, blackQueen, whiteQueen, blackKing, whiteKing

let currentlySelected = []

let lastMove = 0

let moved = 0

let movesList = []

let kingEatten = false

function setup() {
    createCanvas(620, 620)
    background(255)

    w = (width - 20) / cols
    h = (height - 20) / rows

    for (let i = 0; i < cols; i++) {
        grid[i] = new Array(rows)
    }

    for (let i = 0; i < cols; i++) {
        for (let j = 0; j < rows; j++) {
            grid[i][j] = new Piece(i, j, w, h)
        }
    }

    LoadAllImg()

    placePieces()

    movesList.push(new MoveObject())


}

function draw() {
    background(255)
    for (let i = 0; i < cols; i++) {
        for (let j = 0; j < rows; j++) {
            grid[i][j].show()
        }
    }

    highlight()

    strokeWeight(1)
    stroke(0)
    noFill()
    rect(0, 0, width - 1, height - 1)
    let num = 9
    for (let i = 0; i < rows + 1; i++) {
        textSize(16)
        noStroke()
        fill(0)
        text(num, cols * w + 6, i * h - (h - 30))
        num--
    }

    for (let i = 0; i < cols + 1; i++) {
        textSize(16)
        noStroke()
        fill(0)
        text(places[i], i * w + w / 2, rows * h + 15)
    }

    if (kingEatten) {
        if (lastMove == 'white') {
            move = 'White ate Black\'king. White has Won!!!!!!'
        } else if (lastMove = 'black') {
            move = 'Black ate White\'king. White has Won!!!!!!'
        }
        console.log(move)
        noLoop()
    }

}




function mousePressed() {
    let i = floor(mouseX / w)
    let j = floor(mouseY / h)

    if (i > -1 && i < cols && j > -1 && j < rows && !(kingEatten)) {

        if (currentlySelected.length == 0 && grid[i][j].kind) {

            currentlySelected.push(grid[i][j])
            grid[i][j].getNeighbours(grid)

        } else if (currentlySelected.length > 0 && grid[i][j].kind) {

            if (currentlySelected[0].neighbours.includes(grid[i][j])) {

                if (lastMove != currentlySelected[0].color) {

                    currentlySelected[0].neighbours = []
                    lastMove = currentlySelected[0].color
                    let temp = currentlySelected[0]

                    if (moved <= 2) {
                        if (currentlySelected[0].color == 'white') {
                            movesList[movesList.length - 1].white = currentlySelected[0].kind + currentlySelected[0].calculatePlace() + grid[i][j].calculatePlace()
                        } else if (currentlySelected[0].color == 'black') {
                            movesList[movesList.length - 1].black = currentlySelected[0].kind + currentlySelected[0].calculatePlace() + grid[i][j].calculatePlace()
                        }
                        moved++
                    } else {
                        movesList.push(new MoveObject())
                        if (currentlySelected[0].color == 'white') {
                            movesList[movesList.length - 1].white = currentlySelected[0].kind + currentlySelected[0].calculatePlace() + grid[i][j].calculatePlace()
                        } else if (currentlySelected[0].color == 'black') {
                            movesList[movesList.length - 1].black = currentlySelected[0].kind + currentlySelected[0].calculatePlace() + grid[i][j].calculatePlace()
                        }
                        moved = 1
                    }


                    showMoves()


                    if (grid[i][j].kind == 'blackKing' || grid[i][j].kind == 'whiteKing') {
                        kingEatten = true
                    }


                    grid[temp.i][temp.j] = new Piece(temp.i, temp.j, w, h)

                    grid[i][j].kind = temp.kind
                    grid[i][j].image = temp.image
                    grid[i][j].color = temp.color

                    currentlySelected.splice(0, 1)
                } else {
                    currentlySelected[0].neighbours = []
                    currentlySelected.splice(0, 1)
                    let move
                    if (lastMove == 'white') {
                        move = 'Black\'s Move!!!!!'
                    } else if (lastMove = 'black') {
                        move = 'White\'s Move!!!!!'
                    }
                }

            } else {
                currentlySelected[0].neighbours = []
                currentlySelected[0] = grid[i][j]
                grid[i][j].getNeighbours(grid)
            }

        } else {

            if (currentlySelected.length > 0) {

                if (currentlySelected[0].neighbours.includes(grid[i][j]) && !(grid[i][j].kind)) {

                    if (lastMove != currentlySelected[0].color) {
                        currentlySelected[0].neighbours = []
                        lastMove = currentlySelected[0].color
                        let temp = currentlySelected[0]

                        if (moved < 2) {
                            if (currentlySelected[0].color == 'white') {
                                movesList[movesList.length - 1].white = currentlySelected[0].kind + currentlySelected[0].calculatePlace() + grid[i][j].calculatePlace()
                            } else if (currentlySelected[0].color == 'black') {
                                movesList[movesList.length - 1].black = currentlySelected[0].kind + currentlySelected[0].calculatePlace() + grid[i][j].calculatePlace()
                            }
                            moved++
                        } else {
                            movesList.push(new MoveObject())
                            if (currentlySelected[0].color == 'white') {
                                movesList[movesList.length - 1].white = currentlySelected[0].kind + currentlySelected[0].calculatePlace() + grid[i][j].calculatePlace()
                            } else if (currentlySelected[0].color == 'black') {
                                movesList[movesList.length - 1].black = currentlySelected[0].kind + currentlySelected[0].calculatePlace() + grid[i][j].calculatePlace()
                            }
                            moved = 1
                        }

                        showMoves()


                        if (grid[i][j].kind == 'blackKing') {
                            kingEatten = true
                        }

                        if (grid[i][j].kind == 'whiteKing') {
                            kingEatten = true
                        }

                        grid[temp.i][temp.j] = new Piece(temp.i, temp.j, w, h)

                        grid[i][j].kind = temp.kind
                        grid[i][j].image = temp.image
                        grid[i][j].color = temp.color
                    } else {
                        currentlySelected[0].neighbours = []
                        currentlySelected.splice(0, 1)

                        let move
                        if (lastMove == 'white') {
                            move = 'Black\'s Move!!!!!'
                        } else if (lastMove = 'black') {
                            move = 'White\'s Move!!!!!'
                        }
                        console.log(move)
                    }

                } else {
                    currentlySelected[0].neighbours = []
                }
            }
            currentlySelected.splice(0, 1)

        }
    }
}


class MoveObject {

    constructor() {
        this.white = undefined
        this.black = undefined
    }
}


function showMoves() {
    document.getElementById('list-objects').innerHTML = ''
    for (let i = movesList.length - 1; i > -1; i--) {
        let main = document.getElementById('list-objects')
        let container = document.createElement('div')
        container.setAttribute('class', 'container')

        main.appendChild(container)


        let no = document.createElement('div')
        no.innerText = (i + 1) + '.'
        no.setAttribute('class', 'no')

        let whitePart
        let blackPart

        if (movesList[i].white) {
            whitePart = document.createElement('div')
            whitePart.innerText = movesList[i].white
            whitePart.setAttribute('class', 'white-move')
        } else {
            whitePart = document.createElement('div')
            whitePart.innerText = '   '
            whitePart.setAttribute('class', 'white-move')
        }

        if (movesList[i].black) {
            blackPart = document.createElement('div')
            blackPart.innerText = movesList[i].black
            blackPart.setAttribute('class', 'black-move')
        } else {
            blackPart = document.createElement('div')
            blackPart.innerText = '  '
            blackPart.setAttribute('class', 'black-move')
        }

        container.appendChild(no)
        container.appendChild(whitePart)
        container.appendChild(blackPart)


    }

    if (movesList.length > 25) {
        movesList.splice(0, 1)
    }

}



function highlight() {
    if (currentlySelected.length > 0) {
        currentlySelected[0].show(color(128, 255, 128))
    }
}


function LoadAllImg() {
    blackPawn = loadImage("img/black_pawn.png")
    blackRook = loadImage("img/black_rook.png")
    blackKnight = loadImage("img/black_knight.png")
    blackBishop = loadImage("img/black_bishop.png")
    blackQueen = loadImage("img/black_queen.png")
    blackKing = loadImage("img/black_king.png")

    whitePawn = loadImage("img/white_pawn.png")
    whiteRook = loadImage("img/white_rook.png")
    whiteKnight = loadImage("img/white_knight.png")
    whiteBishop = loadImage("img/white_bishop.png")
    whiteQueen = loadImage("img/white_queen.png")
    whiteKing = loadImage("img/white_king.png")
}

function placePieces() {
    for (let i = 0; i < cols; i++) {
        grid[i][1].image = blackPawn
        grid[i][1].kind = 'Black Pawn'
        grid[i][1].color = 'black'
    }

    for (let i = 0; i < cols; i++) {
        grid[i][6].image = whitePawn
        grid[i][6].kind = 'White Pawn'
        grid[i][6].color = 'white'
    }

    grid[0][0].image = blackRook
    grid[0][0].kind = 'Black Rook'
    grid[0][0].color = 'black'

    grid[1][0].image = blackKnight
    grid[1][0].kind = 'Black Knight'
    grid[1][0].color = 'black'

    grid[2][0].image = blackBishop
    grid[2][0].kind = 'Black Bishop'
    grid[2][0].color = 'black'

    grid[3][0].image = blackQueen
    grid[3][0].kind = 'Black Queen'
    grid[3][0].color = 'black'

    grid[4][0].image = blackKing
    grid[4][0].kind = 'Black King'
    grid[4][0].color = 'black'

    grid[5][0].image = blackBishop
    grid[5][0].kind = 'Black Bishop'
    grid[5][0].color = 'black'

    grid[6][0].image = blackKnight
    grid[6][0].kind = 'Black Knight'
    grid[6][0].color = 'black'

    grid[7][0].image = blackRook
    grid[7][0].kind = 'Black Rook'
    grid[7][0].color = 'black'



    grid[0][7].image = whiteRook
    grid[0][7].kind = 'White Rook'
    grid[0][7].color = 'white'

    grid[1][7].image = whiteKnight
    grid[1][7].kind = 'White Knight'
    grid[1][7].color = 'white'

    grid[2][7].image = whiteBishop
    grid[2][7].kind = 'White Bishop'
    grid[2][7].color = 'white'

    grid[3][7].image = whiteQueen
    grid[3][7].kind = 'White Queen'
    grid[3][7].color = 'white'

    grid[4][7].image = whiteKing
    grid[4][7].kind = 'White King'
    grid[4][7].color = 'white'

    grid[5][7].image = whiteBishop
    grid[5][7].kind = 'White Bishop'
    grid[5][7].color = 'white'

    grid[6][7].image = whiteKnight
    grid[6][7].kind = 'White Knight'
    grid[6][7].color = 'white'

    grid[7][7].image = whiteRook
    grid[7][7].kind = 'White Rook'
    grid[7][7].color = 'white'
}