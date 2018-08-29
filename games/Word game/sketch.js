let wordsList = []
let font

function setup() {
    createCanvas(1000, 400)
    background(51)

    const data = loadJSON('words.json')
    font = loadFont('Lato-Black.ttf')

    wordsList.push(new Word('mahir'))

}

function draw() {

    for (let i = 0; i < wordsList.length; i++) {
        wordsList[i].show()
    }
}


class Word {

    constructor(word_) {
        this.word = word_

        // this.x = random(-150, -100)
        // this.y = random(15, height - 15)

        this.x = random(width)
        this.y = random(height)
    }

    show() {
        strokeWeight(0.5)
        fill(88, 206, 102)
        textFont(font, 30)
        text(this.word, this.x, this.y)
    }
}