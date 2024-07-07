public class DotWithLabel extends Dot {
  int label;
  
  public DotWithLabel(float x, float y, int label){
    super(x, y);
    this.label = label;
  }
  
  void display(){
    fill(255);
    ellipse(x, y, 10, 10);
    //rough size of a capital letter
    textSize(24);
    text(label, x, y - 5);
  }
}
