var grid;
var resolution = 12;
var cols, rows;
var zoff = 0;
var particles = [];


function setup() {
    createCanvas(600, 400);
    cols = floor(width / resolution);
    rows = floor(height / resolution);
    grid = new Array(cols * rows);
    for (var i = 0; i < 500; i++) {
        particles.push(new Particle(random(width), random(height)));
    }

}

function draw() {
    background(230, 10);
    var xoff = 0;
    for (var i = 0; i < cols; i++) {
        var yoff = 0;
        for (var j = 0; j < rows; j++) {
            var index = i + j * cols;
            var angle = map(noise(xoff, yoff, zoff), 0, 1, 0, TWO_PI);
            var vector = p5.Vector.fromAngle(angle + PI);
            grid[index] = vector;
            push();
            translate(i * resolution, j * resolution);
            rotate(vector.heading());
            // strokeWeight(1);
            // stroke(10);
            // line(0, 0, resolution, 0);
            pop();
            yoff += 0.2;
        }
        xoff += 0.2;
    }
    zoff +=0.06;


    for (var i = 0; i < particles.length; i++) {
        particles[i].follow(grid);
        particles[i].display();
        particles[i].update();
        particles[i].wrap();
        particles[i].dead();
    }

    // console.log(particles.length);
}


function Particle(x_, y_) {
    this.loc = createVector(x_, y_);
    this.vel = p5.Vector.random2D();
    this.acc = createVector(0, 0);
    this.life = random(75, 125);
    // this.life = 125;

    this.update = function() {
        this.vel.add(this.acc);
        this.vel.limit(2);
        this.loc.add(this.vel);
        this.acc.mult(0);
    }

    this.applyForce = function(force) {
        this.acc.add(force);
    }

    this.follow = function(grid) {
        var x = floor(this.loc.x / resolution);
        var y = floor(this.loc.y / resolution);
        var index = x + y * cols;
        this.applyForce(grid[index]);
    }

    this.display = function() {
        strokeWeight(2);
        stroke(0);
        point(this.loc.x, this.loc.y);
    }

    this.dead = function() {
        if(floor(frameCount%this.life) == 0) {
            this.loc.x = random(width);
            this.loc.y = random(height);
            // console.log(1);
        }
        // console.log(frameCount%this.life);
        // console.log(floor(frameCount%this.life));
    }

    this.wrap = function() {
        if (this.loc.x > width) this.loc.x = 0;
        else if(this.loc.x < 0) this.loc.x = width;
        else if (this.loc.y > height) this.loc.y = 0;
        else if(this.loc.y < 0) this.loc.y = height;

        // if (this.loc.x > width) this.loc.x = random(width);
        // else if(this.loc.x < 0) this.loc.x = random(width);
        // else if (this.loc.y > height) this.loc.y = random(height);
        // else if(this.loc.y < 0) this.loc.y = random(height);
    }


}
