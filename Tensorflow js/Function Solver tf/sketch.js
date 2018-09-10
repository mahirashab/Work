let model

let xs = []
let ys = []

let tf2dxs = []

let tempys

let pointNum
let iter = 1000

let maxY, minY

function setup() {
    createCanvas(600, 400)
    background(51)

    frameRate(1)

    a = random(25)
    b = random(25)
    c = random(25)
    d = random(25)
    e = random(25)

    for (let i = -1; i < 1.001; i += 0.001) {
        let y = problem(i)
        xs.push(i)
        ys.push(y)
    }

    minY = problem(-1)
    maxY = problem(1)

    for (let i = 0; i < xs.length; i++) {
        tf2dxs.push([xs[i]])
    }

    let mappedys = []

    for (let i = 0; i < xs.length; i++) {
        let y = map(ys[i], minY, maxY, -1, 1)
        mappedys.push(y)
    }

    model = tf.sequential()

    model.add(tf.layers.dense({
        units: 6,
        activation: 'sigmoid',
        inputDim: 1
    }))

    model.add(tf.layers.dense({
        units: 6,
        activation: 'sigmoid',
    }))

    model.add(tf.layers.dense({
        units: 6,
        activation: 'sigmoid',
    }))

    model.add(tf.layers.dense({
        units: 1,
        activation: 'tanh',
    }))

    model.compile({
        optimizer: tf.train.sgd(0.1),
        loss: 'meanSquaredError'
    })

    const xsTensor = tf.tensor1d(xs)
    const ysTensor = tf.tensor1d(mappedys)

    model.fit(xsTensor, ysTensor, {
        batchSize: 32,
        epochs: 5000,
        callbacks: {
            onEpochEnd: (num, log) => {
                console.log('Epoch: ' + num + ' Loss: ' + log.loss)
                // model.evaluate(xsTensor, ysTensor).print()
            }
        }
    })
}

function draw() {
    background(51)

    strokeWeight(3)

    beginShape()
    stroke(255)
    noFill()
    for (let i = 0; i < xs.length; i++) {
        let x = map(xs[i], -1, 1, 0, width)
        let y = map(ys[i], minY, maxY, height / 2, 0)
        vertex(x, y)
    }
    endShape()


    let result = model.predict(tf.tensor2d(tf2dxs))
    tempys = result.dataSync()

    let miy = model.predict(tf.tensor2d([
        [-1]
    ]))

    let may = model.predict(tf.tensor2d([
        [1]
    ]))

    miy = miy.dataSync()
    may = may.dataSync()

    beginShape()
    stroke(255, 25, 25)
    noFill()
    for (let i = 0; i < xs.length; i++) {
        let x = map(xs[i], -1, 1, 0, width)
        let y = map(tempys[i], miy[0], may[0], height / 2, 0)
        vertex(x, y)
    }
    endShape()

    // noLoop()
}



function problem(x) {
    let y = Math.pow(x, 4) * a +
        Math.pow(x, 3) * b +
        Math.pow(x, 2) * c + x * d + e
    return y
}