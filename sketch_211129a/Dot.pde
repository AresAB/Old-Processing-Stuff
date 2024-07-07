class Dot {
  float x, y, size;
  color clr;
  
  Dot(){
    x = 400;
    y = 300;
    size = 40;
    clr = color(0,0,255);
  }
  
  Dot(float a, float b, float s, color c){
    x = a;
    y = b;
    size = s; 
    clr = c;
  }
  
  Dot(float a, float b, float s){
    x = a;
    y = b;
    size = s;
    clr = color(255,255,0);
  }
}
