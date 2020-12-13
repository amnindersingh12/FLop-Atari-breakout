class Ball{
  //Variables
  private float x,y,Vx,Vy, d;
  private boolean canMove;
  
  //Constructor
  public Ball(){
  x = width/2;
  y = height -70;
  d = 20;
  Vx = random(-5,5);
  Vy = -10;
  canMove = false;
}

  //Method
  public void display(){
    fill(0,255,0);
  ellipse(x,y,d,d);
  if(canMove){
      x += Vx;
      y += Vy;
      //checkWalls
      if(x < 5){
        Vx *= -1;
        x = 5;
      }      
      if(x > width-5){
        Vx *= -1;
        x = width-5;
      }
      if(y < 5){
        Vy *= -1;
      } else if (y > height - d/2){
        canMove = false;
        y = height - 60 - d/2;
        lives--;
      }
    }  else {
  x = mouseX;}
}
    public void checkPaddle(Paddle pad){
      if(x > pad.x && x < pad.x + pad.w && y > pad.y - d/2 && y < pad.y+2){
        //Vy *= -1;
        Vx += (x - mouseX)/10;
       //CAP THE VX
        if (Vx > 8){
          Vx = 8;
        }
        if (Vx < -8){
          Vx = -8;
        }
        if(Vx < 0){
          Vy = -12 - Vx;
        } else {
          Vy = -12 + Vx;
        }
      } 

  }

}
