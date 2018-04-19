class Maze 
{
  void CreateCourse1()
  {
  //Obstacles
  fill(255,255,255);
  stroke(0);
  strokeWeight(1);
  fill(255,255,255);
  stroke(0,0,0);
  strokeWeight(10);
  rect(-10,120,500,100);//biggest rect
  rect(150,-10,50,60);
  rect(340,70,50,50);
  triangle(600,-10,810,-10,810,200);
  ellipse(570,170,50,50);
  ellipse(700,250,50,50);
  ellipse(530,225,50,50);
  ellipse(740,200,50,50);
  ellipse(656,300,50,50);
  triangle(500,275,550,350,500,400);
  triangle(650,350,600,400,650,450);
  triangle(525,550,590,420,640,475);
  rect(285,500,200,50);
  rect(285,400,200,-135);
  rect(200,330,20,250);
  rect(200,600,20,110);
  rect(220,650,120,20);
  rect(700,700,-100,-100);
  rect(725,375,20,375);
  rect(725,730,-600,20);
  rect(500,680,-50,50);
  triangle(-10,250,100,250,-10,400);
  rect(-10,425,100,20);
  rect(100,510,100,20);
  rect(-10,600,100,20);
  
  //Special Areas
  fill(255,0,0);
  rect(25,700,75,75); //win area
  fill(0,0,255);
  rect(25,25,75,75); //start area
  
  //Messages
  fill(255,0,0);
  text("RED SQUARE =",250,160);
  fill(0,0,0);
  text("Winner Winner Chicken Dinner",250,180);
  fill(124,252,0);
  }
}
