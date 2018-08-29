let brain



function setup() {
    createCanvas(600, 400)
    background(51)

    brain = new NuralNetwork(2, 2, 2)

    let inputs = [1, 0]
    let targets = [1, 1]

    brain.train(inputs, targets)


}

function draw() {

}