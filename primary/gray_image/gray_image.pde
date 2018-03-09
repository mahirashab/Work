int cols;
int rows;
int[][] array;
  size(400, 400);
  background(100);
  cols = width;
  rows = height;
  array = new int[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      array[i][j] = int(random(100));
    }
  }
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      println(array[i][j]);
      stroke(array[i][j]);
      point(i, j);
    }
  }