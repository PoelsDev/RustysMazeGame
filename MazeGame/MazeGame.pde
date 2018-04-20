GameMode gameMode = GameMode.StartScreen;
//Player p1 = new Player();
Maze m = new Maze();
 

final int imgX = 300;
final int imgY = 340;
final int imgW = 200;
final int imgH = 100;

PImage start;

void setup()
{
  size(800,800);
  background(255);
  //start = loadImage("start.png");
  //image(start,imgX,imgY,imgW,imgH);
  //p1.font = loadFont("LetterOMatic-30.vlw");
  frameRate(60);  
}
/*
void draw()
{
  switch(gameMode) {
    case StartScreen:
      if (mousePressed == true && mouseX >= imgX && mouseX <= imgX+imgW && 
          mouseY >= imgY && mouseY <= imgY+imgH)
        {
          background(255);
          gameMode = GameMode.Playing;
          p1.StartGame();
        }  
      break;
    
    case Playing:
      /*
      if(mousePressed == true){
         p1.mouseDragged();
         m.createCourse1();
         m.show();
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
  background(255);
  winner = loadImage("winner.jpg");
  image(winner,0,0,800,800); 
}

*/
