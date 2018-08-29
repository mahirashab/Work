function setup() {
    createCanvas(600, 400)
    background(51)

    // const values = []

    // for (let i = 0; i < 2 * 2; i++) {
    //     values[i] = random(0, 255)
    // }

    // const shape = [2, 2]

    // const tense1 = tf.tensor(values, shape, 'int32')

    // for (let i = 0; i < 2 * 2; i++) {
    //     values[i] = random(0, 255)
    // }

    // const tense2 = tf.tensor(values, shape, 'int32')

    // const tense3 = tense1.sub(tense2)

    // tense1.print()
    // tense2.print()
    // tense3.print()
}


function draw() {
    const values = []

    for (let i = 0; i < 20000 * 20000; i++) {
        values[i] = random(0, 255)
    }

    const shape = [20000, 20000]

    const tense1 = tf.tensor(values, shape, 'int32')

    for (let i = 0; i < 2 * 2; i++) {
        values[i] = random(0, 255)
    }

    const tense2 = tf.tensor(values, shape, 'int32')

    const tense3 = tense1.sub(tense2)
}