GameMode gameMode = GameMode.StartScreen;
Player p1 = new Player();
Maze m;
 

final int imgX = 300;
final int imgY = 340;
final int imgW = 200;
final int imgH = 100;

boolean collision;

PImage start;
PImage reload;
PImage exit;
PImage bckgrnd;

void setup()
{
  //Venster
  size(800,800);
  
  //Maze
 
  
  //background
  bckgrnd = loadImage("background0.png");
  background(bckgrnd);
  p1.bckgrnd = loadImage("background0.png");
  reload = loadImage("reset.png");
  exit = loadImage("exitbutton.png");
  
  //Start
  start = loadImage("start.png");
  image(start,imgX,imgY,imgW,imgH);
  
  //Extra's
  //p1.font = loadFont("LetterOMatic-30.vlw");
  frameRate(60);
  m.font = loadFont("HandMeDownS-BRK--48.vlw");
  collision = false;
  
   m = new Maze();
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
         p1.mouseDragged(); //<>//
         m.show();
         if(m.hasCollided(p1.xpos, p1.ypos, p1.size, p1.size))
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
  winner = loadImage("winnerpixel.png");
  image(winner,0,200,800,500);
  image(reload,14,10,95,48);
  image(exit,0,70,128,67);
  if(mousePressed == true && mouseX <= 100 && mouseY <= 50)       
      {
          background(bckgrnd);
          gameMode = GameMode.Playing;
          p1.xpos = 35;
          p1.ypos = 35;
          p1.gameOver = false;
          m.createCourse1();
          m.show();
          p1.StartGame();
      } else if(mousePressed == true && mouseX <= 128 && mouseY >= 70 && mouseY <= 140)
      {
        exit();
      }
}

void checkForCollisions(PImage img, int x, int y)
{
  color c1 = color(0);
  loadPixels();
  m.maze.loadPixels();
  img.loadPixels();
  for(int i = 0; i < img.pixels.length; i++)
  {
    for(int j = 0; j < m.maze.pixels.length; j++) {
      if(m.maze.pixels[j] == img.pixels[i])
      {
        collision = true;
      }  
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
    collision = false;
}
