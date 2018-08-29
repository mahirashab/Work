

class Branch {
  PVector begin;
  PVector end;
  boolean last;

  Branch(PVector x, PVector y) {
    begin = x;
    end = y;
    last = true;
  }

  void display() {
    line(begin.x, begin.y, end.x, end.y);
  }

  Branch newBranchA() {
    PVector dir = PVector.sub(end, begin);
    dir.mult(0.67);
    dir.rotate(-PI/4 + PI/8);
    PVector newEnd = PVector.add(end, dir);
    Branch left = new Branch(end, newEnd);
    last = false;
    return left;
  }
  
  Branch newBranchB() {
    PVector dir = PVector.sub(end, begin);
    dir.mult(0.67);
    dir.rotate(PI/4 + PI/8);
    PVector newEnd = PVector.add(end, dir);
    Branch right = new Branch(end, newEnd);
    last = false;
    return right;
  }
  
}
