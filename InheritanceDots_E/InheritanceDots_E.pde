Dot[] list;
int numbDots;

public void setup(){
  size(600, 600);
  list = new Dot[10000];
  numbDots = 0;
}

public void draw(){
  background(0);
  connectTheDots();
  for(int i = 0; i < numbDots; i++){
    list[i].display();
  }
}

void mousePressed(){
  if(mouseButton == LEFT){
    Dot d = new Dot(mouseX, mouseY);
    list[numbDots] = d;
    numbDots++;
  }
  else{
    DotWithLabel dwl = new DotWithLabel(mouseX, mouseY, numbDots);
    list[numbDots] = dwl;
    numbDots++;
  }
}

void connectTheDots(){
  for(int i = 0; i < numbDots - 1; i++){
    Dot current = list[i];
    Dot next = list[i + 1];
    stroke(255, 0, 0);
    strokeWeight(3);
    line(current.x, current.y, next.x, next.y);
  }
}
