
function setup() {
    createCanvas (600, 400);
    background (225);
}

function draw() {
    wid = random (8);
    hei = random (8);
    stroke (155);
    fill (70);
    
    if (mouseIsPressed) {
    	rect(mouseX - (wid/2), mouseY - (hei/2), wid, hei);
    }
    
    if (keyIsPressed) {
    	background (225);
    }
}