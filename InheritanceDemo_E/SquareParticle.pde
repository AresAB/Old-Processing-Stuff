public class SquareParticle extends Particle {
  
  public SquareParticle(){
    super(20);
  }
  
  void display(){
    fill(0, 0, 255);
    rect(x, y, 10, 10);
  }
  
}
