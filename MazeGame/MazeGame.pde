//Objects
GameMode gameMode = GameMode.StartScreen;
Player p1;
Maze m;
Maze m2;
Maze m3;

//Constants
final int imgX = 300;
final int imgY = 340;
final int imgW = 200;
final int imgH = 100;

//Variables
boolean gameOver;
int currentLevel = 1;

//Images
PImage start;
PImage reload;
PImage exit;
PImage bckgrnd;
PImage bckgrnd2;
PImage startScreenbckgrnd;
PImage winner;
PImage next;

void setup()
{
  //Settings
  size(800,800);
    
  //Background
  bckgrnd = loadImage("background0.png");
  bckgrnd2 = loadImage("background3-720.png");
  startScreenbckgrnd = loadImage("background1-720.png");
  startScreenbckgrnd.resize(800,800);
  bckgrnd2.resize(800,800);
  background(startScreenbckgrnd);
  
  //Loading Images
  reload = loadImage("reset.png");
  exit = loadImage("exitbutton.png");
  winner = loadImage("winnerpixel.png");
  start = loadImage("start.png");  
  next = loadImage("nextbutton.png");
  
   //Make Objects   
   MyMazeData mmd = new MyMazeData();
   MyMazeData2 mmd2 = new MyMazeData2();
   MyMazeData3 mmd3 = new MyMazeData3();
   /*
   mazeData = new MazeData();
   mazeData.setImage("blabla.png");
   mazeData.setStartPos(10, 10);
   mazeData.setTargetPos(100, 75);
   // TODO 
   */
   
   m = new Maze(mmd);   
   m2 = new Maze(mmd2);
   m3 = new Maze(mmd3);
   p1 = new Player();
}

void draw()
{
  clear();
  background(startScreenbckgrnd);
  
  switch(gameMode) {
    case StartScreen:
      image(start,imgX,imgY,imgW,imgH);
      if (mousePressed == true && mouseX >= imgX && mouseX <= imgX+imgW && 
          mouseY >= imgY && mouseY <= imgY+imgH)
        {         
          gameMode = GameMode.PlayingLevel1;         
        }  
      break; 
    case PlayingLevel1:
      background(bckgrnd);
      playLevel(m3);
      break;
    case GameOver:
      showWinScreen();
      break;
    case PlayingLevel2:
      background(bckgrnd2);
      playLevel(m);      
      break;
    case PlayingLevel3:
      background(startScreenbckgrnd);
      playLevel(m2);
  }
}

void playLevel(Maze m) {
    m.show();
    p1.draw();
    if(mousePressed == true){
       p1.drawWhileDragging();
       if(m.hasCollided(p1.getCurrentPosition()))
       {
         println("COLLISION!");
         p1.resetPosition();
         p1.draw();
       }
       
       if(m.hasWon(p1.xpos, p1.ypos))
       {
         gameOver = true;           
       } else {
       gameOver = false;
       }
    }
    if(gameOver == true) {
      gameMode = GameMode.GameOver; 
    } 
}

void showWinScreen() {  
  //Clean up the screen
  clear();
  background(bckgrnd);
  
  //Display images
  image(winner,0,200,800,500);
  image(reload,14,10,95,48);
  image(exit,0,70,128,67);
  image(next,14,142,98,50);
  
  //Buttons
  if(mousePressed == true && mouseX <= 100 && mouseY <= 50)       
      {
          background(bckgrnd);
          gameMode = GameMode.PlayingLevel1;
          p1.resetPosition();
          p1.draw();                 
          m.show();
          currentLevel = 1;
      } else if(mousePressed == true && mouseX <= 128 && mouseY >= 70 && mouseY <= 120)
      {
        exit();
      } else if(mousePressed == true && mouseX <= 98 && mouseY >= 142 && mouseY <= 200)
      {
        /*
        println("next");
        background(bckgrnd2);
        p1.resetPosition();
        p1.draw(); 
        gameMode = GameMode.PlayingLevel2;
        */
        nextLevel();
      }
}

void nextLevel()
{
  if(currentLevel == 1)
  {
        println("next");
        background(bckgrnd2);
        p1.resetPosition();
        p1.draw(); 
        gameMode = GameMode.PlayingLevel2;
        currentLevel = 2;
  } else if(currentLevel == 2)
  {
        println("next");
        background(startScreenbckgrnd);
        p1.resetPosition();
        p1.draw(); 
        gameMode = GameMode.PlayingLevel3;
        currentLevel = 3;
  } else if(currentLevel == 3)
  {
    println("next");
        background(bckgrnd);
        p1.resetPosition();
        p1.draw(); 
        gameMode = GameMode.PlayingLevel1;
        currentLevel = 1;
  }
}
