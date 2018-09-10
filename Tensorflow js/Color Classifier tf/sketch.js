let data

let colors = []
let lables = []

let model

let loadedModel

let rs, gs, bs

let para

let i, j

const lablesList = [
    "red-ish",
    "green-ish",
    "blue-ish",
    "orange-ish",
    "yellow-ish",
    "pink-ish",
    "purple-ish",
    "brown-ish",
    "grey-ish"
]

async function loadSavedModel() {
    tf.loadModel('localstorage://my-model-2').then((result) => {
        loadedModel = result
    })
}


function preload() {
    data = loadJSON('colorData.json')
    try {
        loadSavedModel()
    } catch (e) {
        console.log(e)
    }
}

function setup() {
    createCanvas(600, 400)
    background(51)

    rs = createSlider(0, 255, floor(random(0, 255)))
    gs = createSlider(0, 255, floor(random(0, 255)))
    bs = createSlider(0, 255, floor(random(0, 255)))

    para = createP('')

    for (let obj of data.entries) {
        let rgb = [obj.r / 255, obj.g / 255, obj.b / 255]
        colors.push(rgb)
        lables.push(lablesList.indexOf(obj.label))
    }

    const lablesTensor = tf.tensor1d(lables, 'int32')


    const inputs = tf.tensor2d(colors)
    const ys = tf.oneHot(lablesTensor, 9)
    lablesTensor.dispose()

    i = inputs
    j = ys


    model = tf.sequential();

    model.add(tf.layers.dense({
        units: 20,
        activation: 'tanh',
        inputDim: 3
    }))

    // model.add(tf.layers.dropout({
    //     rate: 0.02
    // }))

    model.add(tf.layers.dense({
        units: 20,
        activation: 'tanh',
    }))

    // model.add(tf.layers.dropout({
    //     rate: 0.01
    // }))

    model.add(tf.layers.dense({
        units: 20,
        activation: 'tanh',
    }))

    model.add(tf.layers.dense({
        units: 9,
        activation: 'softmax',
    }))


    if (loadedModel) {
        for (let i = 0; i < loadedModel.layers.length; i++) {
            model.layers[i].setWeights(loadedModel.layers[i].getWeights())
        }
    }

    model.compile({
        optimizer: tf.train.sgd(0.2),
        loss: 'categoricalCrossentropy'
    })

    model.evaluate(i, j).print()

    model.fit(inputs, ys, {
        batchSize: 32,
        epochs: 5000,
        validationSplit: 0.1,
        shuffle: true,
        callbacks: {
            onBatchBegin: () => {
                tf.tidy(function () {
                    let r = floor(rs.value())
                    let g = floor(gs.value())
                    let b = floor(bs.value())

                    background(r, g, b)

                    const xs = tf.tensor2d([
                        [r / 255, g / 255, b / 255]
                    ])

                    let result = model.predict(xs)
                    let index = result.argMax(1).dataSync()

                    para.html(lablesList[index[0]])
                })
            },
            onEpochEnd: (num, log) => {
                // model.save('localstorage://my-model-2').then((result) => {
                //     // console.log(result)
                // })
                console.log('Epoch: ' + num + ' Loss: ' + log.loss)
                model.evaluate(i, j).print()
            }
        }
    }).then((result) => {
        console.log(result)
    })
}

function draw() {

    tf.tidy(function () {
        let r = floor(rs.value())
        let g = floor(gs.value())
        let b = floor(bs.value())

        background(r, g, b)

        const xs = tf.tensor2d([
            [r / 255, g / 255, b / 255]
        ])

        let result = model.predict(xs)
        let index = result.argMax(1).dataSync()

        para.html(lablesList[index[0]])
    })

    // console.log(tf.memory().numTensors)
}