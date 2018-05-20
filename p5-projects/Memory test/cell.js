function Cell(x_, y_, w_) {
    this.x = x_;
    this.y = y_;
    this.w = w_;
    this.hovering = false;

    this.display = function() {
        noStroke();
        fill(190);
        rect(this.x, this.y, this.w, this.w);
        if (this.hovering) {
            strokeWeight(2);
            stroke(133, 188, 107);
            noFill();
            rect(this.x, this.y, this.w - 1, this.w - 1);
        }
    }

    this.checkHover = function() {
        if (mouseX > this.x && mouseX < this.x + this.w && mouseY > this.y && mouseY < this.y + this.w) {
            this.hovering = true;
        } else {
            this.hovering = false;
        }
    }
}
