public class Dot {
  float x, y;
  
  public Dot(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void display(){
    fill(255);
    ellipse(x, y, 10, 10);
  }
}
