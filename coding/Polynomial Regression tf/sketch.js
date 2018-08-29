let x_vals = [];
let y_vals = [];

let a, b, c;

let curveX = [];


const power = 100;


const learningRate = 0.1;
// const optimizer = tf.train.sgd(learningRate);
const optimizer = tf.train.adam(learningRate);

function setup() {
    createCanvas(600, 400);


    a = tf.variable(tf.scalar(random(1)));
    b = tf.variable(tf.scalar(random(1)));
    c = tf.variable(tf.scalar(random(1)));


    for (let x = -1; x < 1.1; x += 0.01) {
        curveX.push(x);
    }
}

function mousePressed() {
    if (mouseX < width && mouseX > 0 && mouseY < height && mouseY > 0) {
        let x = map(mouseX, 0, width, -1, 1);
        let y = map(mouseY, 0, height, 1, -1);
        x_vals.push(x);
        y_vals.push(y);
    }
}

function draw() {

    for (let i = 0; i < 1; i++) {
        tf.tidy(() => {
            if (x_vals.length > 0) {
                const ys = tf.tensor1d(y_vals);
                optimizer.minimize(() => loss(predict(x_vals), ys));
            }
        });
    }

    background(51);

    stroke(255);
    strokeWeight(8);
    for (let i = 0; i < x_vals.length; i++) {
        let px = map(x_vals[i], -1, 1, 0, width);
        let py = map(y_vals[i], -1, 1, height, 0);
        point(px, py);
    }


    const ys = tf.tidy(() => predict(curveX));
    const curveY = ys.dataSync();
    ys.dispose();

    beginShape();
    strokeWeight(2);
    noFill();
    for (let i = 0; i < curveX.length; i++) {
        let x = map(curveX[i], -1, 1, 0, width);
        let y = map(curveY[i], -1, 1, height, 0);
        vertex(x, y);
    }
    endShape();


    //noLoop();
}

function loss(pred, labels) {
    return pred.sub(labels).square().mean();
}

function predict(x) {
    const xs = tf.tensor1d(x);

    // const ys = xs.mul(m).add(b);

    const ys = xs.square().mul(a).add(xs.mul(b)).add(c);

    return ys;
}