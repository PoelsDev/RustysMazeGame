class MazeData {
  protected PGraphics maze;
  PFont font;
  final int width = 800;
  final int height = 800;
  
  protected int mazewidth;
  
  protected int startX;
  protected int startY;
  protected int targetX;
  protected int targetY;
  protected int targetWidth;
  protected int targetHeight;
  protected PImage collisionMaze;
  
  public MazeData() {
    maze = createGraphics(width, height);
    font = loadFont("HandMeDownS-BRK--48.vlw"); //<>//
  }  
  /*
  public MazeData(String filename) {
    // TODO: check
    //maze.image(filename);
  }
  
  public void setStartPos(int x, int y) {
    startX = x;
    startY = y;
  }
  
  //TODO : target setters
  // TODO : maze width setter
  */
}


class MyMazeData extends MazeData {
  
  public MyMazeData() {    
    super();
    startX = 35;
    startY = 35;
    targetX = 25;
    targetY = 700;
    targetWidth = 75;
    targetHeight = 75;
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
    maze.triangle(500,250,550,325,500,375);
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
    
    /*
    maze.stroke(0,0,255);
    maze.fill(0,0,255);
    maze.rect(25,25,75,75); //start area
    */
    
    //Messages
    maze.fill(255,0,0);
    maze.textFont(font);
    maze.textSize(30);
    maze.text("DOORWAY =",200,160);
    maze.fill(0);
    maze.textSize(25);
    maze.text("NEXT LEVEL",200,180);
    maze.fill(124,252,0);    
    maze.endDraw();
  }
   
}

class MyMazeData2 extends MazeData
{
  public MyMazeData2()
  {    
    super();
    collisionMaze = loadImage("Level2.png");
    startX = 15;
    startY = 35;
    targetX = 700;
    targetY = 700;
    targetWidth = 75;
    targetHeight = 75;
    maze.beginDraw();    
    maze.image(collisionMaze,0,0);
    maze.endDraw();    
  }
}
