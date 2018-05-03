class Maze 
{
  //P-objects
  PGraphics maze;
  PGraphics areas;
  PImage targetImage;
  
  //Variables
  final int mazewidth = 800;
  int targetX;
  int targetY;
  int targetWidth;
  int targetHeight;
  
  public Maze(MazeData mazeData) {
    // load config
    maze = mazeData.maze;
    targetX = mazeData.targetX;
    targetY = mazeData.targetY;
    targetWidth = mazeData.targetWidth;
    targetHeight = mazeData.targetHeight;
    
    // init
    //maze = createGraphics(800, mazewidth);
    areas = createGraphics(800, mazewidth);
    targetImage = loadImage("Door.png");
    targetImage.resize(targetWidth, targetHeight);
    
    
    drawTargetArea();
    loadPixels();
  }
  
  void drawTargetArea() {
     areas.beginDraw();
     //areas.fill(255,0,0);
     //areas.stroke(255,0,0);
     //areas.rect(targetX,targetY,targetWidth,targetHeight); //win area
     areas.image(targetImage,targetX,targetY);
     areas.endDraw();
  }
  
  void show() {
    image(maze, 0, 0);
    image(areas,0,0);
  }
 
   boolean hasWon(int xpos, int ypos)
   {
     if(xpos >= targetX && xpos < targetX + targetWidth && ypos >= targetY && ypos < targetY + targetHeight)
     {
       return true;       
     }
     return false;     
   }
   
   private boolean hasPixelOn(int x, int y) {
     //pixels[x + y * mazewidth]
     if(x > 0 && y > 0)
     {
       color c = maze.pixels[x + y * mazewidth];
       //println(hex(c));
       if(c != 0)
       {
         
         return true;         
       }
     }     
     
     return false;
   }
 
  boolean hasCollided(int x, int y, int w, int h) {
    println(x + " " + y + " " + w + " " + h);
    for(int i = x; i < x + w; i++) {
      for(int j = y; j < y + h; j++) {
        if( hasPixelOn(i, j) ) {
          return true;
        }
      }
    }
    
    return false;  
  }
  
  boolean hasCollided(CollideRectangle pos) {
    return hasCollided(pos.X, pos.Y, pos.Width, pos.Height);
  }
  
}
