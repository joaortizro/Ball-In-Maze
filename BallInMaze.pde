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
int i=0;
int j=0;
void setup(){
  size(1000,500,P3D);
  scene = new Scene(this);
  //scene.setAxesVisualHint(false);
  //scene.setGridVisualHint(false);
  translate(width/2,height/2);
  board= new Board(200,4);
  ball = new Ball(5);
  scene.camera().setPosition(new Vec(-20, 100, 100)); 
  scene.camera().lookAt(new Vec(0, 0, 0));
  //scene.eye().orientation().print();
  
  
}

void draw (){
  
background(0);
board.draw();
ball.draw();
}