let numbers = []
let count = 1
let sequence = []
let index = 0
let biggest = 0

let arcs = []

class Arc {
    constructor(start, end, dir) {
        this.start = start
        this.end = end
        this.dir = dir
    }

    show() {
        let diameter = this.end - this.start
        let x = (this.end + this.start) / 2
        stroke(255)
        noFill()
        if (this.dir == 0) {
            arc(x, 0, diameter, diameter, 0, PI)

        } else {
            arc(x, 0, diameter, diameter, PI, 0)
        }
    }
}

function step() {
    let next = index - count
    if (next < 0 || numbers[next]) {
        next = index + count
    }
    numbers[next] = true

    let a = new Arc(index, next, count % 2)
    arcs.push(a)

    index = next

    if (index > biggest) {
        biggest = index
    }

    count++
    sequence.push(index)
}


function setup() {
    createCanvas(1000, 600)
    background(51)
    strokeWeight(0.5)
    numbers[index] = true
    sequence.push(index)

}

function draw() {
    background(51)
    step()
    translate(0, height / 2)
    scale(width / biggest)
    for (let a of arcs) {
        a.show()
    }
}