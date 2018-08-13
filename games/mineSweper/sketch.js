var grid;
var cols, rows;
var bombs = 80;
var scl = 20;

function setup() {
    createCanvas(601, 401);
    cols = floor(width / scl);
    rows = floor(height / scl);
    grid = make2DArray(cols, rows);
    for (var i = 0; i < cols; i++) {
        for (var j = 0; j < rows; j++) {
            grid[i][j] = new Cell(i, j, scl);
        }
    }
    for (var n = 0; n < bombs; n++) {
        var i = floor(random(cols));
        var j = floor(random(rows));
        while (grid[i][j].mine == true) {
            var i = floor(random(cols));
            var j = floor(random(rows));
        }
        grid[i][j].mine = true;
    }
    for (var i = 0; i < cols; i++) {
        for (var j = 0; j < rows; j++) {
            grid[i][j].count(grid);
        }
    }
}

function draw() {
    background(200);
    for (var i = 0; i < cols; i++) {
        for (var j = 0; j < rows; j++) {
            grid[i][j].display();
        }
    }
}

function make2DArray(w, h) {
    array = new Array(w)
    for (var i = 0; i < w; i++) {
        array[i] = new Array(h);
    }
    return array;
}

function mousePressed() {
    if (mouseX < width && mouseX > 0 && mouseY < height && mouseY > 0) {
        var x = floor(mouseX / scl);
        var y = floor(mouseY / scl);
        grid[x][y].revealed = true;
        if (grid[x][y].mine) {
            for (var i = 0; i < cols; i++) {
                for (var j = 0; j < rows; j++) {
                    grid[i][j].revealed = true;
                }
            }
            console.log('Game Over');
            noLoop();
        }
        if (grid[x][y].neighbor == 0) {
            grid[x][y].reveal();
        }
    }
}
