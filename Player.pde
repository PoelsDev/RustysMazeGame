class Player
{
  int size = 50;
  int xpos = 35;
  int ypos = 35;
  PFont font; 
  float targetX, targetY;
  Maze m;
  PImage player;
  PImage winner;
  
  void StartGame()
  {
    //Level 1
    player = loadImage("sloth2.png");
    m = new Maze();
    m.CreateCourse1();
    targetX = 25;
    targetY = 700;
    image(player,xpos,ypos,size,size);
  }
  
  void mouseDragged()
  {
    if(mouseX >= xpos && mouseX <= xpos+size && 
      mouseY >= ypos && mouseY <= ypos+size)
    {
      if(xpos >= targetX && ypos >= targetY){
      clear();
      background(255);
      winner = loadImage("winner.jpg");
      image(winner,0,0,800,800);
      
      } else {
        
      if(xpos + size >= width || xpos <= 0 || ypos + size >= height || ypos <= 0){
      xpos = 35;
      ypos = 35;
      clear();
      background(255);
      m.CreateCourse1();      
      image(player,xpos,ypos,size,size);
      } else {
      xpos = mouseX - size/2;
      ypos = mouseY - size/2;
      clear();
      background(255);
      m.CreateCourse1();      
      image(player,xpos,ypos,size,size);
      }
      }
    }
  }
  
}
