class Player
{
  int size = 50;
  int xpos = 35;
  int ypos = 35;
  PFont font; 
  float targetX, targetY;
  PImage player;
  
  
  boolean gameOver = false;
  
  void StartGame()
  {
    player = loadImage("sloth2.png");
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
      if(xpos >= targetX && ypos >= targetY){
            gameOver = true;
      } else {
        
        if(xpos + size >= width || xpos <= 0 || ypos + size >= height || ypos <= 0){
          xpos = 35;
          ypos = 35;
          background(255);
          image(player,xpos,ypos,size,size);
        } else {
          xpos = mouseX - size/2;
          ypos = mouseY - size/2;
          background(255);
          image(player,xpos,ypos,size,size);
        }
      }
    }
  }
}
