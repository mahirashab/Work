var a = 100;
var b = 100;
var n = 4;

var s;

function setup() {
    createCanvas(600, 400);
    s = createSlider(0, 10, 2, 0.01);
    // background(51);
}

function draw() {
    background(51);
    translate(width / 2, height / 2);

    n = s.value();

    stroke(255);
    noFill();

    beginShape();
    for (var angle = 0; angle < TWO_PI; angle += 0.05) {
        // var x = r * cos(a);
        // var y = r * sin(a);

        var x = pow(abs(cos(angle)), (2 / n)) * a * sgn(cos(angle));
        var y = pow(abs(sin(angle)), (2 / n)) * b * sgn(sin(angle));


        vertex(x, y);
        point(x, y);
    }
    endShape(CLOSE);

}

function sgn(v) {
    if (v > 0) {
        return 1;
    } else if (v < 0) {
        return -1;
    } else {
        return 0;
    }
}
