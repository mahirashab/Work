var snake;
var food;

var scl = 10;
var foodPresent = false;

function setup() {
    createCanvas(700, 600);
    frameRate(10);
    generateFood();
    snake = new Snake()
}

function draw() {
    background(51);

    snake.show();
    snake.update();
    snake.edges();

    if (snake.eatFood(food)) {
        generateFood();
    }

    fill(200, 0, 0);
    rect(food.x, food.y, scl, scl);
}

function keyPressed() {
    if (keyCode === UP_ARROW) {
        snake.setDir(0, -1);
    } else if (keyCode === DOWN_ARROW) {
        snake.setDir(0, 1);
    } else if (keyCode === LEFT_ARROW) {
        snake.setDir(-1, 0);
    } else if (keyCode === RIGHT_ARROW) {
        snake.setDir(1, 0);
    }
}

function generateFood() {
    var cols = floor(width / scl);
    var rows = floor(height / scl);
    food = createVector(floor(random(cols)), floor(random(rows)));
    food.mult(scl);
}
