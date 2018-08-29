
ArrayList<Box> boxes = new ArrayList<Box>();

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

void setup() {
  size(600, 400);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
}

void draw() {
  background(250);
  
  box2d.step();
  
  if(mousePressed) {
   boxes.add(new Box(mouseX, mouseY)); 
  }
  
  for(Box b:boxes) {
   b.display(); 
  }
}
