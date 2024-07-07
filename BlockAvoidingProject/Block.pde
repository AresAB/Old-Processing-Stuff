public class Block {
  
  private float x, y, w, h;
  private float speed;
  private color clr;
  
  public Block() {
    x = width;
    //(float)Math.random() * width;
    y = (float)Math.random() * height;
    w = (float)Math.random() * 80 + 20;
    h = (float)Math.random() * 80 + 20;
    speed = (float)Math.random() * 4 + 2;
    clr = color((float)Math.random() * 256,
                (float)Math.random() * 256,
                (float)Math.random() * 256);
    
  }
  
  public void update() {
    x -= speed;
    
    if(x < -w){
      x = width;
      y = (float)Math.random() * height;
    }
    
  }
  
  
  public void display() {
    fill(clr);
    rect(x, y, w, h);
  
  }
  
  public float getX(){
    return x;
  }
  
  public void speedUp(){
    speed += 0.01;
  }
  
  public boolean checkMouse() {
    if(mouseX > x && mouseX < x + w && 
       mouseY > y && mouseY < y + h){
         
      return true;
    }
    else{
      return false;
    }
    
  }

}
