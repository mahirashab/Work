function setup() {
    createCanvas(600, 400)
    background(51)

    const model = tf.sequential()

    model.add(tf.layers.dense({
        units: 4,
        inputShape: [2],
        activation: 'sigmoid'
    }))

    model.add(tf.layers.dense({
        units: 3,
        inputShape: [4],
        activation: 'sigmoid',
    }))

    model.compile({
        optimizer: tf.train.sgd(0.1),
        loss: 'meanSquaredError'
    })

    model.fit(tf.ones([10, 2]), tf.ones([10, 3]), {
        batchSize: 2,
        epochs: 150
    }).then((response) => console.log(response))


    // const xs = tf.tensor2d([
    //     [1.23, 3.57],
    //     [6.82, 8.32],
    //     [2.67, 5.24],
    //     [2.85, 7.24]
    // ])

    // if (frameCount % 100 == 0) {
    //     model.predict(xs).print()
    // }
}

function draw() {

}