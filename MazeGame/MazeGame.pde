//Objects
GameMode gameMode = GameMode.StartScreen;
Player p1;
Maze m;

//Constants
final int imgX = 300;
final int imgY = 340;
final int imgW = 200;
final int imgH = 100;

//Variables
boolean gameOver;

//Images
PImage start;
PImage reload;
PImage exit;
PImage bckgrnd;
PImage winner;
PImage next;

void setup()
{
  //Settings
  size(800,800);
    
  //Background
  bckgrnd = loadImage("background0.png");
  background(bckgrnd);
  
  //Loading Images
  reload = loadImage("reset.png");
  exit = loadImage("exitbutton.png");
  winner = loadImage("winnerpixel.png");
  start = loadImage("start.png");  
  next = loadImage("nextbutton.png");
  
   //Make Objects   
   MyMazeData mmd = new MyMazeData();      
   /*
   mazeData = new MazeData();
   mazeData.setImage("blabla.png");
   mazeData.setStartPos(10, 10);
   mazeData.setTargetPos(100, 75);
   // TODO 
   */
   
   m = new Maze(mmd);   
   p1 = new Player();
}

void draw()
{
  clear();
  background(200);
  background(bckgrnd);
  
  switch(gameMode) {
    case StartScreen:
      image(start,imgX,imgY,imgW,imgH);
      if (mousePressed == true && mouseX >= imgX && mouseX <= imgX+imgW && 
          mouseY >= imgY && mouseY <= imgY+imgH)
        {         
          gameMode = GameMode.Playing;         
        }  
      break; 
    case Playing:
      m.show();
      p1.draw();
      if(mousePressed == true){
         p1.drawWhileDragging();
         if(m.hasCollided(p1.getCurrentPosition()))
         {
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
      break;
    case GameOver:
      showWinScreen();
      break;
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
  //image(next,14,142,98,50);
  
  //Buttons
  if(mousePressed == true && mouseX <= 100 && mouseY <= 50)       
      {
          background(bckgrnd);
          gameMode = GameMode.Playing;
          p1.resetPosition();
          p1.draw();                 
          m.show();          
      } else if(mousePressed == true && mouseX <= 128 && mouseY >= 70 && mouseY <= 120)
      {
        exit();
      } //else if(mousePressed == true && mouseX <= 98 && mouseY >= 142 && mouseY <= 200)
      //{
        //println("next");
      //}
}
