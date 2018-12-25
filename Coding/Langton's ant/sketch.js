var x, y;
var grid;

var direction;

function setup() {
    createCanvas(800, 400);
    background(255);
    x = width / 2;
    y = height / 2;
    grid = new Array(width * height);
    for (var i = 0; i < width; i++) {
        for (var j = 0; j < width; j++) {
            var index = i + j * width;
            grid[index] = 0;
            // console.log(grid[index]);
        }
    }
    grid[(x + y * width)] = 1;
    direction = 0;
}

function draw() {
    loadPixels();
    for (var i = 0; i < 100; i++) {
        var index = (x + y * width) * 4;
        var gridIndex = x + y * width;
        if (grid[gridIndex] == 0) {
            pixels[index] = 0;
            pixels[index + 1] = 0;
            pixels[index + 2] = 0;
            pixels[index + 3] = 255;
            turnRight();
            grid[gridIndex] = 1;
            moveForward();
        } else if (grid[gridIndex] == 1) {
            pixels[index] = 255;
            pixels[index + 1] = 255;
            pixels[index + 2] = 255;
            pixels[index + 3] = 255;
            turnLeft();
            grid[gridIndex] = 0;
            moveForward();
        }
    }
    updatePixels();
}

function turnLeft() {
    direction -= 1;
    if (direction < 0) {
        direction = 3;
    }
}

function turnRight() {
    direction += 1;
    if (direction > 3) {
        direction = 0;
    }
}

function moveForward() {
    if (direction == 0) {
        y -= 1;
    } else if (direction == 1) {
        x += 1;
    } else if (direction == 2) {
        y += 1;
    } else if (direction == 3) {
        x -= 1;
    }

    if (x > width - 1) {
        x = 0;
    }else if (x < 0) {
        x = width - 1;
    }

    if (y > height - 1) {
        y = 0;
    }else if (y < 0) {
        y = height - 1;
    }

}
