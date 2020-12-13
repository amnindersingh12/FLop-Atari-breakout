public class Block{
    private float x, y, w, h;
    private int numBlocks;  //CHANGED FROM EPISODE 3
    private boolean status;
    private int r, g, b;
    
    public Block(){
      x = 0;
      numBlocks = 8;
      y = 0;
      w = width / numBlocks;
      h = 30;
    }
    public Block(int col, int row, int theNumBlocks){
      numBlocks = theNumBlocks;
      w = width / numBlocks;
      h = 30;
      x = w * col;
      y = h * row;
      r = (int)random(0, 256);
      g = (int)random(0, 256);
      b = (int)random(0, 256);
      status = true;
   }
    
   public void display(){
     fill(r,g,b);
     if(status){
       fill(b,r,g);
       rect(x+2,y,w-17,h-17,2);
       fill(g,b,r);
       arc(x, y, 28, 28, PI, TWO_PI);
       
       }
   }
   
   public void checkBall(Ball ball){
       if(status){
         //Bottom
         if(ball.x > x && ball.x < x+w && ball.y < (y+h+ball.d/2)&& ball.y>y+h){
           ball.Vy*=-1;
           status=false;
           score++;
         }
         //Top
         if(ball.x > x && ball.x < x+w && ball.y > y-ball.d/2 && ball.y < y){
           ball.Vy*=-1;
           status=false;
           score++;
         }
         //Left
         if(ball.x > x - ball.d/2 && ball.y > y && ball.y < y+h && ball.x < x){
           ball.Vx*=-1;
           status=false;
           score++;
         }
          //Right
         if(ball.x > x+w  && ball.y > y && ball.y < y+h && ball.x<x+w+ball.d/2){
           ball.Vx*=-1;
           status=false;
           score++;
         }                
       }
      
    }
}
