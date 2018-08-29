let w1Slider, w2Slider, bias;

function setup() {
    createCanvas(1000, 500)
    background(51)
    w1Slider = createSlider(0, 1, 0.5, 0.001)
    w1Slider.position(20, 20)

    w2Slider = createSlider(0, 1, 0.5, 0.001)
    w2Slider.position(20, 50)

    bias = createSlider(-30, 30, 0, 1)
    bias.position(20, 80)
}

function draw() {
    background(51)
    translate(width / 2, height / 2 + 30)

    stroke(255)
    strokeWeight(3)

    line(-width / 2, 0, width / 2, 0)
    line(0, -height / 2 - 30, 0, height / 2)

    noFill()
    beginShape()
    for (let i = -width / 2; i < width / 2; i += 1) {
        let w1 = w1Slider.value()
        let w2 = w2Slider.value()
        let b = bias.value()

        let sum = i * w1 + b * w2
        let y = map(sigmoid(sum), 0, 1, 0, -height / 2)
        vertex(i, y)
    }
    endShape()

    noStroke()
    fill(255)
    strokeWeight(0.2)
    text(`w0 - ${w1Slider.value()}`, -width / 2 + 20, -height / 2 - 10)
    text(`w1 - ${w2Slider.value()}`, -width / 2 + 20, -height / 2 + 22)
    text(`bias - ${bias.value()}`, -width / 2 + 20, -height / 2 + 52)
}

function sigmoid(x) {
    return 1 / (1 + Math.pow(Math.E, -x))
}