public class Board{
  
  private int size;
  PShape maze , floor;
  PShape [] walls;  
  private final int wallHigh =20;
  public Board(int size){
    this.size=size;
    rectMode(CENTER);
    maze=createShape(GROUP);
    floor = createShape(RECT,0,0,size,size);
    walls = new PShape[4];
    for(int i = 0; i<4;i++){
    walls[i]=createShape();
    walls[i].beginShape();
    walls[i].vertex(-size/2,0,0);
    walls[i].vertex(-size/2,0,wallHigh);
    walls[i].vertex(size/2,0,wallHigh);
    walls[i].vertex(size/2,0,0);
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
    maze.addChild(floor);
    //append walls
    maze.addChild(walls[0]);
    maze.addChild(walls[1]);
    maze.addChild(walls[2]);
    maze.addChild(walls[3]);
  
  }
  void draw(){
    pushMatrix();
    shape(maze);
    popMatrix();  
  }
}