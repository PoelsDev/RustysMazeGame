class Player
{
  //Variables
  final int size = 40;
  int xpos = 25;
  int ypos = 25;
  
  //P-objects
  PFont font; 
  PImage player;
  
  //Summon player
  Player() {
    //Load image
    player = loadImage("image3721.png");
  }      
  
  //Draw player
  void draw() {
    image(player,xpos,ypos,size,size); 
  }
  
  //Update player
  void drawWhileDragging()
  {
    if(mouseX >= xpos && mouseX <= xpos+size && 
      mouseY >= ypos && mouseY <= ypos+size)
    {             
        if(xpos + size >= width || xpos <= 2 || ypos + size >= height || ypos <= 2){
          this.resetPosition();
          this.draw();
        } else {
          xpos = mouseX - size/2;
          ypos = mouseY - size/2;
          this.draw();
        }      
    }
  }
  
  //Get current player position
  CollideRectangle getCurrentPosition() {
    CollideRectangle pos = new CollideRectangle();
    pos.X = xpos;
    pos.Y = ypos;
    pos.Width = size;
    pos.Height = size;
    
    return pos;
  }
  
  //Reset position to starting position
  void resetPosition()
  {   
    xpos = 35;
    ypos = 35;
  }
}
