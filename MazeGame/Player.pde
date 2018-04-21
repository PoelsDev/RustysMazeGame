class Player
{
  int size = 50;
  int xpos = 35;
  int ypos = 35;
  PFont font; 
  int targetX, targetY;
  PImage player;
  PImage bckgrnd;
  
  
  boolean gameOver = false;
  
  void StartGame()
  {
    player = loadImage("idleboi.png");
    targetX = 25;
    targetY = 700;
    image(player,xpos,ypos,size,size);
  }
  
  boolean isGameOver() {
    return gameOver;
  }
  
  void mouseDragged()
  {
    if(mouseX >= xpos && mouseX <= xpos+size && 
      mouseY >= ypos && mouseY <= ypos+size)
    {
      if(xpos >= targetX && xpos < 100 && ypos >= targetY && ypos < 775){
            gameOver = true;
      } else {
        
        if(xpos + size >= width || xpos <= 0 || ypos + size >= height || ypos <= 0){
          xpos = 35;
          ypos = 35;          
          background(bckgrnd);
          image(player,xpos,ypos,size,size);
        } else {
          xpos = mouseX - size/2;
          ypos = mouseY - size/2;
          background(bckgrnd);
          image(player,xpos,ypos,size,size);
        }
      }
    }
  }
  
  void resetPosition()
  {   
    background(bckgrnd);
    xpos = 35;
    ypos = 35;
    image(player, xpos, ypos, size, size);
  }
}
