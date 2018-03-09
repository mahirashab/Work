var x;
var wave = 0;
var offset;
var sliders = [];

function setup() {
  	// createCanvas(400, 200);
  	noCanvas();
  	for (var i = 0; i < 50; i++) {
  		sliders[i] = createSlider(0, 255, 50);
  	}
  	
}

function draw() {
	offset = 0;
	for (var i = 0; i < sliders.length; i++) {
		x = map(sin(wave + offset), -1, 1, 0, 255);
		sliders[i].value(x);
		offset += 0.15;
	}
	wave += 0.08;
  	// background(166);
}