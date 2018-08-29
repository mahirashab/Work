var cols = 18;
var rows = 10;

var w = 25;
var space = 5;

var grid;

var xMargine, yMargine;


function setup() {
  createCanvas(600, 400);

  xMargine = (width - (w + space) * cols);
  yMargine = (height - (w + space) * rows);

  grid = make2DArray(cols, rows);


  for (var i = 0; i < cols; i++) {
      for (var j = 0; j < rows; j++) {
          var x = xMargine/2 + (i * w) + (space * i);
          var y = yMargine/2 + (j * w) + (space * j);
          grid[i][j] = new Cell(x, y, w);

      }
  }
}

function draw() {
  background(51);

  for (var i = 0; i < cols; i++) {
      for (var j = 0; j < rows; j++) {
          grid[i][j].display();
          grid[i][j].checkHover();
      }
  }
}


function make2DArray(cols, rows) {
    var grid = new Array(cols);
    for(var i = 0; i < cols; i++) {
        grid[i] = new Array(rows);
    }
    return grid;
}
