function setup() {
    createCanvas(600, 400)
    background(51)

    const model = tf.sequential()

    const hidden = tf.layers.dense()
    const output = tf.layers.dense()

    model.add(hidden)
    model.add(output)
}

function draw() {

}