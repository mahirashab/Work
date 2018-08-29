var x, y;
var angle = 0.0;
var scalar = 20;
var speed = 0.01;
var offsetX;
var offsetY;
var points = [];

function setup() {
    createCanvas(600, 400);
    background(225);
    x = width/2;
    y = height/2;
    offsetX = width/2;
    offsetY = height/2;
    for(var i = 0; i < 25; i++) {
        points[i] = new Dots(x, y);
        x = offsetX + cos(angle) * scalar;
        y = offsetY + sin(angle) * scalar;
        angle += speed;
        scalar += speed;
    }
}

function draw() {
    for(var j = 0; j < points.length; j++) {
        points[j].draw;
    }
}

function Dots(x, y) {
    this.x = x;
    this.y = y;
    
    this.draw = function() {
        ellipse(this.x, this.y, 5, 5);
    }
}











