public class Ball {

  private PVector position;
  private PVector rotation;
  private PVector orientation;
  private PVector speed;
  private int radius;
  private boolean firstPerson=false;
  Ball( int radius ){
  this.radius= radius;
  position = new PVector(0,0,radius);
  rotation= new PVector(0,0,0);
  speed= new PVector(0,0,0);
  orientation= new PVector(1,0,0);
  stroke(255);
  noFill();
  //firstPerson();
    //scene.eyeFrame().setPosition(new Vec (position.x,position.y,position.z+radius));
    //scene.eyeFrame().setOrientation(new Quat(orientation.x,orientation.y,orientation.z));
  }
  void moveRight(){
      speed.y+=0.1;
      position.x+=0.1;
      position.x=position.x%(100-radius);
      
      scene.translate(position.x,position.y,position.z);
      scene.rotateY(speed.y);
      
  }
  void moveLeft(){
      speed.y+=0.1;
      position.x-=0.1;
      position.x=position.x%(100-radius);
      
      scene.translate(position.x,position.y,position.z);
      scene.rotateY(-speed.y);
  }
  void moveFoward(){
      speed.x+=0.1;
      position.y-=0.1;
      //if(position.y%(100-radius)==0){
      //  moveBackward();
      //}
      print(position.y%(100-radius));
      position.y=position.y%(100-radius);
      
      scene.translate(position.x,position.y,position.z);
      scene.rotateX(speed.x);
     
  }
 void moveBackward  (){
      speed.x+=0.1;
      position.y+=0.1;
      position.y=position.y%(100-radius);
      scene.translate(position.x,position.y,position.z);
      scene.rotateX(-speed.x);
     
  }
  void keyPressed(){
    
   if(key=='w'){
    moveFoward();
   }
  else if(key =='a'){
    moveLeft();
  }
  else if(key == 'd'){
    moveRight();
  }
  else if(key == 's'){
    moveBackward();
  }
 
 if ( key == 'p')
    firstPerson();

  }
  void draw(){
  keyPressed();
  scene.drawAxes();
  sphere(radius);

}
  
void firstPerson(){
  firstPerson = !firstPerson;

   scene.eyeFrame().translate(new Vec (position.x,position.y,position.z+radius));
  if(firstPerson) {
    scene.eyeFrame().setMotionBinding(MouseAgent.NO_BUTTON, "lookAround");
    //scene.eyeFrame().setMotionBinding(LEFT, "moveForward");
    //scene.eyeFrame().setMotionBinding(RIGHT, "moveBackward");
  }
  else {
    scene.eyeFrame().removeMotionBinding(MouseAgent.NO_BUTTON);
    //scene.eyeFrame().setMotionBinding(LEFT, "rotate");
    //scene.eyeFrame().setMotionBinding(RIGHT, "translate");
  }
}
}