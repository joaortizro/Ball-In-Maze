public class Ball {
  InteractiveFrame iFrame ;
  private int radius;
  private PVector pos;
  private PVector speed;
  private PVector acc;
  private int transDir;
  
  Ball(int radius){
   this .radius = radius;
   iFrame = new InteractiveFrame(scene);
   iFrame.setConstraint(constraint);
  
  }
  void draw(){
  pushMatrix();
  iFrame.applyTransformation();
  
  fill(255,0,0);
  noStroke();
  translate(0,0,radius);
  sphere(radius);
  
  popMatrix();
  }
}