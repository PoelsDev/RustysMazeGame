class Maze 
{
  //P-objects
  PGraphics maze;
  PFont font;
  
  //Variables
  int mazewidth = 800;
  int targetX = 25;
  int targetY = 700;
  
  public Maze() {
    maze = createGraphics(800, mazewidth);
    font = loadFont("HandMeDownS-BRK--48.vlw");
    createCourse1();    
    loadPixels();
  }

  private void createCourse1()
  {
    //Obstacles
    maze.beginDraw();
    maze.fill(0,0,0,0);
    maze.stroke(0);
    maze.strokeWeight(1);
    maze.fill(0,0,0,0);
    maze.stroke(0);
    maze.strokeWeight(10);
    maze.rect(-10,120,500,100);//biggest rect
    maze.rect(150,-10,50,60);
    maze.rect(340,70,50,50);
    maze.triangle(600,-10,810,-10,810,200);
    maze.ellipse(570,170,50,50);
    maze.ellipse(700,250,50,50);
    maze.ellipse(530,225,50,50);
    maze.ellipse(740,200,50,50);
    maze.ellipse(656,300,50,50);
    maze.triangle(500,275,550,350,500,400);
    maze.triangle(650,350,600,400,650,450);
    maze.triangle(525,550,590,420,640,475);
    maze.rect(285,500,200,50);
    maze.rect(285,400,200,-135);
    maze.rect(200,330,20,250);
    maze.rect(200,600,20,110);
    maze.rect(220,650,120,20);
    maze.rect(700,700,-100,-100);
    maze.rect(725,375,20,375);
    maze.rect(725,730,-600,20);
    maze.rect(500,680,-50,50);
    maze.triangle(-10,250,100,250,-10,400);
    maze.rect(-10,425,100,20);
    maze.rect(100,510,100,20);
    maze.rect(-10,600,100,20);
    
    //Special Areas
    maze.fill(255,0,0);
    maze.stroke(255,0,0);
    maze.rect(25,700,75,75); //win area
    /*
    maze.stroke(0,0,255);
    maze.fill(0,0,255);
    maze.rect(25,25,75,75); //start area
    */
    
    //Messages
    maze.fill(255,0,0);
    maze.textFont(font);
    maze.textSize(30);
    maze.text("RED SQUARE =",200,160);
    maze.fill(0);
    maze.textSize(25);
    maze.text("Winner Winner Chicken Dinner",200,180);
    maze.fill(124,252,0);    
    maze.endDraw();
  }
  
  void show() {
    image(maze, 0, 0); 
  }
 
   boolean hasWon(int xpos, int ypos)
   {
     if(xpos >= targetX && xpos < 100 && ypos >= targetY && ypos < 775)
     {
       return true;       
     }
     return false;     
   }
   
   private boolean hasPixelOn(int x, int y) {
     //pixels[x + y * mazewidth]
     color c = maze.pixels[x + y * mazewidth]; //<>//
     if(c != 0)
     {
       return true;
     }
     return false;
   }
 
  boolean hasCollided(int x, int y, int w, int h) {
    println(x + " " + y + " " + w + " " + h);
    for(int i = x; i < x + w; i++) { //<>//
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
