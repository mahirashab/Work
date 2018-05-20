var a = 1;
var b = 1;
var n1 = 1;
var n2 = 1;
var n3 = 1;
var m = 0;
var radious = 100;

var mS;
var nS;

function setup() {
    createCanvas(600, 400);
    mS = createSlider(0, 25, 2, 0.01);
    nS = createSlider(0, 25, 1, 0.01);
    // background(51);
}

function draw() {
    background(51);
    translate(width / 2, height / 2);

    m = mS.value();

    n1 = nS.value();
    n2 = n1;
    n3 = n2;

    stroke(255);
    noFill();

    var num = 1000;
    var inc = TWO_PI / num;

    beginShape();
    for (var angle = 0; angle < TWO_PI; angle += inc) {

        var r = superShape(angle);
        var x = radious * r * cos(angle);
        var y = radious * r * sin(angle);

        vertex(x, y);
        point(x, y);
    }
    endShape(CLOSE);

}

function superShape(t) {
    var r = 1;

    var part1 = pow(abs((1 / a) * cos(t * m / 4)), n2);

    var part2 = pow(abs((1 / b) * sin(t * m / 4)), n3);

    var part3 = pow((part1 + part2), (1 / n1));

    if (part3 === 0) {
        return 0;
    }

    r = 1 / part3;

    return r;
}
