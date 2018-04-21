GameMode gameMode = GameMode.StartScreen;
Player p1 = new Player();
Maze m;
 

final int imgX = 300;
final int imgY = 340;
final int imgW = 200;
final int imgH = 100;

boolean black = false;

PImage start;
PImage bckgrnd;

void setup()
{
  //Venster
  size(800,800);
  
  //Maze
  m = new Maze();
  
  //background
  bckgrnd = loadImage("background0.png");
  background(bckgrnd);
  p1.bckgrnd = loadImage("background0.png");
  
  //Start
  start = loadImage("start.png");
  image(start,imgX,imgY,imgW,imgH);
  
  //Extra's
  //p1.font = loadFont("LetterOMatic-30.vlw");
  frameRate(60);
  m.font = loadFont("HandMeDownS-BRK--48.vlw");
}

void draw()
{
  switch(gameMode) {
    case StartScreen:
      if (mousePressed == true && mouseX >= imgX && mouseX <= imgX+imgW && 
          mouseY >= imgY && mouseY <= imgY+imgH)
        {
          background(bckgrnd);
          gameMode = GameMode.Playing;
          p1.StartGame();
        }  
      break;
    
    case Playing:

      if(mousePressed == true){
         p1.mouseDragged();
         m.createCourse1(); //<>//
         m.show();
         checkForCollisions(p1.player, p1.size, p1.size);
         if(black == true)
         {
            p1.resetPosition();
         }
      }
      if(p1.isGameOver()) {
        gameMode = GameMode.GameOver; 
      }
      break;
    
    case GameOver:
      showWinScreen();  
      break;
  }
}

void showWinScreen() {
  PImage winner;
  
  clear();
  background(bckgrnd);
  winner = loadImage("winner.jpg");
  image(winner,0,0,800,800); 
}

void checkForCollisions(PImage img, int x, int y)
{
  color c1 = color(0);
  loadPixels();
  m.maze.loadPixels();
  img.loadPixels();
  for(int i = 0; i < img.pixels.length; i++)
  {        
    if(img.pixels[i] == c1)
    {
      black = true;
    } 
  }  
  
  /*
  loadPixels();
  m.maze.loadPixels();
  img.loadPixels();
  for (x = 0; x < img.width; x++) {  
  for (y = 0; y < img.height; y++) { 
    int loc = x + y * img.width;
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
    if (color(r,g,b) == c1) {
     return true;
    }
   }
  }
  */
    black = false;
}
