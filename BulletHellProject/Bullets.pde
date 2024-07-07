public class Bullets {
  
  float x1, y, x2, h, w;
  float beamW;
  int beamShade;
  float speedX;
  boolean gate;
  
  public Bullets(){
    w = 75;
    h = 30;
    x1 = -w;
    x2 = width;
    y = ((float)Math.random() * (height-100)) + 50;
    beamW = width;
    beamShade = 0;
    speedX = 15;
    gate = true;
  }
  
  public Bullets(boolean b){
    if(b == false){
      x1 = 0;
      x2 = 0;
      y = 0;
      w = 0;
      h = 0;
    }
  }
  
  public boolean correctY(float[] ys){
    if(gate){
      while((y >= ys[0] - h && y <= ys[0] + h) ||
         (y >= ys[1] - h && y <= ys[1] + h) ||
         (y >= ys[2] - h && y <= ys[2] + h) ||
         (y >= ys[3] - h && y <= ys[3] + h) ||
         (y >= ys[4] - h && y <= ys[4] + h)){
        y = ((float)Math.random() * (height-100)) + 50;
      }
      gate = false;
      return true;
    }
    else{
      return true;
    }
  }
  
  public void aim(float[] ys){
    if(beamShade < 255 && correctY(ys)){
      fill(beamShade, 0, 0);
      rect(0, y, beamW, h);
      beamShade += 2;
    }
  }
  
  public boolean telegraphed(){
    if(beamShade >= 255){
      return true;
    }
    return false;
  }
  
  public boolean tagTeam(){
    if(beamShade >= 75){
      return true;
    }
    return false;
  }
  
  public void fire(){
    x1 += speedX;
    x2 -= speedX;
    appear();
  }
  
  public boolean hit(Player p){
    if(((p.getX() > x1 && p.getX() + p.getSize() < x1 + w) ||
       (p.getX() + p.getSize() > x2 && p.getX() < x2 + w)) &&
       p.getY() + p.getSize() > y && p.getY() < y + h){
      return true;
    }
    else{
      return false;
    }
  }
  
  public void appear(){
    fill(255, 0, 255);
    rect(x1, y, w, h);
    rect(x2, y, w, h);
  }
  
  public boolean fired(){
    if(x1 >= width && x2 <= 0){
      return true;
    }
    return false;
  }
  
  public float getY(){
    return y;
  }
}
