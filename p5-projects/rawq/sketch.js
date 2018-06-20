let snow = []

function setup() {
    createCanvas(600, 400)
}

function draw() {
    const s = new SnowFlake()
    snow.push(s)

    for (flake in snow) {
        flake.render()
    }
}