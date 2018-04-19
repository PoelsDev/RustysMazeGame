Player p1 = new Player();

final int imgX = 300;
final int imgY = 340;
final int imgW = 200;
final int imgH = 100;
PImage start;

void setup()
{
  size(800,800);
  background(255);
  start = loadImage("start.png");
  image(start,imgX,imgY,imgW,imgH);
  p1.font = loadFont("LetterOMatic-30.vlw");
  
}

void draw()
{
  if (mousePressed == true && mouseX >= imgX && mouseX <= imgX+imgW && 
      mouseY >= imgY && mouseY <= imgY+imgH)
    {
      clear();
      background(255);
      p1.StartGame();
    }
    
    p1.mouseDragged();
}
