public class Board{
  
  private int size;
  PShape maze , floor;
  PShape [] walls;  
  private int num_walls;
  private final int wallHigh =20;
  public Board(int size,int num_walls){
    this.size=size;
    strokeWeight(2);
    rectMode(CENTER);fill(155,155,155);
    maze=createShape(GROUP);
    floor = createShape(RECT,0,0,size,size);
    walls = new PShape[num_walls];
    for(int i = 0; i<4;i++){
    walls[i]=createShape();
    walls[i].beginShape();
    walls[i].vertex(-size/2,0,0);
    walls[i].vertex(-size/2,0,wallHigh);
    walls[i].vertex(size/2,0,wallHigh);
    walls[i].vertex(size/2,0,0);
    walls[i].endShape();
    }
    
    for(int i = 5; i<num_walls;i++){
      float r = size*0.25;
    walls[i]=createShape();
    walls[i].beginShape();
    walls[i].vertex(-r,0,0);
    walls[i].vertex(-r,0,wallHigh);
    walls[i].vertex(r,0,wallHigh);
    walls[i].vertex(r,0,0);
    walls[i].endShape();
    }
    //North wall
    walls[0].translate(0,- size*0.5);
    //East Wall
    walls[1].rotate(PI/2);
    walls[1].translate(size*0.5,0);
    //South wall
    walls[2].translate(0,size*0.5);
    //West Wall
    walls[3].rotate(PI/2);
    walls[3].translate(-size*0.5,0);
    
    //random ones
    for(int i=5;i<num_walls;i++){
      if (i%4==0){
        
        walls[i].translate(0,-size*random(0.1,0.5));
      }
      if (i%4==1){
        walls[i].rotate(PI/2);
        walls[i].translate(size*random(0.1,0.5),0);
      }
      if(i%4==2){
        walls[i].translate(0,size*random(0.1,0.5));
      }
      
      if(i%4==3){
         walls[i].rotate(PI/2);
        walls[i].translate(-size*random(0.1,0.5),0);
      }
      
    }
    
    maze.addChild(floor);
    //append walls
    maze.addChild(walls[0]);
    maze.addChild(walls[1]);
    maze.addChild(walls[2]);
    maze.addChild(walls[3]);
    for(int i=5;i<num_walls;i++){
      maze.addChild(walls[i]);
    }
  
  }
  void draw(){
    pushMatrix();
    
    shape(maze);
    popMatrix();  
  }
}