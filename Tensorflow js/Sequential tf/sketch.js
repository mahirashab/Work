const model = tf.sequential()

function setup() {
    createCanvas(600, 400)
    background(51)

    model.add(tf.layers.dense({
        units: 4,
        inputShape: [2],
        activation: 'sigmoid'
    }))

    model.add(tf.layers.dense({
        units: 2,
        inputShape: [4],
        activation: 'sigmoid',
    }))

    model.compile({
        optimizer: tf.train.sgd(0.1),
        loss: 'meanSquaredError'
    })

    const xs = tf.tensor2d([
        [1.0, 1.0],
        [0.5, 0.5],
        [0, 0]
    ])

    const ys = tf.tensor2d([
        [0, 0],
        [0.5, 0.5],
        [1.0, 1.0]
    ])

    tf.tidy(function () {
        model.fit(xs, ys, {
            batchSize: 1,
            epochs: 15000
        }).then((response) => console.log(response))
    })

}

function draw() {

}

function mousePressed() {

    tf.tidy(function () {
        const xs = tf.tensor2d([
            [1.0, 1.0],
            [0.5, 0.5],
            [0, 0]
        ])

        const ys = tf.tensor2d([
            [0, 0],
            [0.5, 0.5],
            [1.0, 1.0]
        ])

        const result = model.evaluate(xs, ys, {
            batchSize: 1
        });
        result.print()
    })

    console.log(tf.memory().numTensors)
}