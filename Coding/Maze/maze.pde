
int cols, rows;
int w = 10;

Cell[][] cells;

Cell current;

ArrayList<Cell> stack = new ArrayList<Cell>();

void setup() {
  size(600, 400);
  //fullScreen();
  cols = floor(width/w);
  rows = floor(height/w);
  cells = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      cells[i][j] = new Cell(i, j);
    }
  }
  current = cells[0][0];
}



void draw() {
  background(51);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      cells[i][j].display();
    }
  }
  
  
  current.visited = true;
  current.highlight();
  Cell next = current.check();

  if (next != null) {
    next.visited = true;
    stack.add(current);
    removeWalls(current, next);
    current = next;
  }else if(stack.size() > 0) {
    current = stack.get(stack.size() - 1);
    stack.remove(stack.size() - 1);
  }
  
}



void removeWalls(Cell a, Cell b) {
  int x = a.i - b.i;
  int y = a.j - b.j;

  if (x == 1) {
    a.walls[3] = false;
    b.walls[1] = false;
  } else if ( x == -1) {
    a.walls[1] = false;
    b.walls[3] = false;
  }

  if (y == 1) {
    a.walls[0] = false;
    b.walls[2] = false;
  } else if ( y == -1) {
    a.walls[2] = false;
    b.walls[0] = false;
  }
}
