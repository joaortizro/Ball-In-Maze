import remixlab.bias.*;
import remixlab.bias.event.*;
import remixlab.dandelion.constraint.*;
import remixlab.dandelion.core.*;
import remixlab.dandelion.geom.*;

import remixlab.fpstiming.*;
import remixlab.proscene.*;
import remixlab.util.*;

Scene scene;
Board board;
Ball ball;
WorldConstraint constraint ;
void setup(){
  size(800,500,P3D);
  scene = new Scene(this);
  //scene.setAxesVisualHint(false);
  //scene.setGridVisualHint(false);
  translate(width/2,height/2);
  board= new Board(100);
  ball = new Ball(5);
  
  constraint = new WorldConstraint();
  constraint.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN,new Vec(0.0f,0.0f,0.0f));
  
  scene.camera().setPosition(new Vec(-20, 100, 230)); 
  scene.camera().lookAt(new Vec(0, 0, 0));
  
}

void draw (){
background(0);
board.draw();
ball.draw();
}