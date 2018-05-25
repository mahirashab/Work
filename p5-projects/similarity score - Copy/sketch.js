let data;
let score = {};

let titles;

let w;

function preload() {
    data = loadJSON('movies.json');
}

function setup() {
    createCanvas(600, 400);
    background(155);

    titles = Object.keys(data.users[1]);

    let i = titles.indexOf('name');
    titles.splice(i, 1);
    let j = titles.indexOf('timestamp');
    titles.splice(j, 1);

    w = (width - 10) / titles.length;

    for (let i = 0; i < titles.length; i++) {
        let sum = 0;
        for (let j = 0; j < data.users.length; j++) {
            let person = data.users[j]
            sum += person[titles[i]];
        }
        score[titles[i]] = sum;
    }
    console.log(score);

    let max = data.users.length * 10;

    for(let i = 0; i < titles.length; i++) {
        let value = map(score[titles[i]], 0, max, 0, height);
        console.log(value);
        noStroke();
        fill(51);
        rect((w*i) + 10, (height - value), (w - 10), value);
        fill(255);
        textSize(25);
        text(titles[i], (w * i) + 10, 35);
    }

}


function draw() {

}