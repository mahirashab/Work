let data;
let users;

let down1;
let down2;

let p1;
let p2;

let p;


function preload() {
    data = loadJSON('movies.json');
}

function setup() {
    noCanvas();
    p = createP('');
    users = {};

    down1 = createSelect('');
    down2 = createSelect('');

    for (let i = 0; i < data.users.length; i++) {
        let name = data.users[i].name;

        down1.option(data.users[i].name);
        down2.option(data.users[i].name);

        users[name] = data.users[i];
    }

    // console.log(users);

    let button = createButton('submit');
    button.mousePressed(similarity);
}

function similarity() {
    name1 = down1.value();
    name2 = down2.value();

    let p1 = users[name1];
    let p2 = users[name2];

    let titles = Object.keys(p1);

    let i = titles.indexOf('timestamp');
    titles.splice(i, 1);
    let j = titles.indexOf('name');
    titles.splice(j, 1);


    let sum = 0;
    for(let i = 0; i < titles.length; i++) {
        let title = titles[i];

        let rating1 = p1[title];
        let rating2 = p2[title];

        let diff = rating1 - rating2;
        sum += diff * diff;
    }

    let d = sqrt(sum);
    let score = 1 / (1 + d);
    p.html(score);
    
}


function draw() {

}