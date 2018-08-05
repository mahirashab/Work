PVector v = new PVector(100, 75, 50);

float [][] projection = {
  {1, 0, 0}, 
  {0, 1, 0}
};


void setup() {
  logMatrix(projection);
  float [][] point = vecToMatrix(v);
  float[][] result = matmul(projection, point);
  
  logMatrix(point);
  logMatrix(result);
  
  println(matrixToVec(point));
}


float[][] matmul(float[][] a, float[][] b) {
  int colsA = a[0].length;
  int rowsA = a.length;
  int colsB = b[0].length;
  int rowsB = b.length;

  float[][] result = new float[rowsA][colsB];

  if (colsA != rowsB) {
    println("!!!Invalid Matrixes!!!");
    println("!!!Try Again!!!");
    return null;
  }

  for (int i = 0; i < rowsA; i++) {
    for (int j = 0; j < colsB; j++) {
      float sum = 0;
      for (int k = 0; k < rowsB; k++) {
        sum += a[i][k] * b[k][j];
      }
      result[i][j] = sum;
    }
  }

  return result;
}

void logMatrix(float [][] m) {
  int cols = m[0].length;
  int rows = m.length;

  println(rows + " x " + cols);
  println("______________");

  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      print(m[i][j] + "  ");
    }
    println();
  }
  println();
}


float[][] vecToMatrix(PVector v) {
  float[][] result = new float[3][1];
  result[0][0] = v.x;
  result[1][0] = v.y;
  result[2][0] = v.z;

  return result;
}

PVector matrixToVec(float[][] m) {
  PVector result = new PVector(m[0][0], m[1][0], m[2][0]);
  result.x = m[0][0];
  result.y = m[1][0];
  if (m.length > 2) {
    result.x = m[0][0];
  }

  return result;
}
