
void setup(){
  size(600, 600);
}

void draw(){
  //drawTarget(width/2, height/2, height/2);
  //drawEyes(width/2, height/2, height/2);
  triforce(0, height, width/2, 0, width, height);
}


void triforce(float x1, float y1, float x2, float y2, float x3, float y3){
  if(abs(x2 - x1) > 1){
    fill(200, 70, 180);
    triangle(x1, y1, x2, y2, x3, y3);
    
    float m12X = (x1 + x2)/2;
    float m12Y = (y1 + y2)/2;
    float m23X = (x2 + x3)/2;
    float m23Y = (y2 + y3)/2;
    float m13X = (x1 + x3)/2;
    float m13Y = (y1 + y3)/2;
    
    fill(70, 200, 180);
    triangle(m12X, m12Y, m23X, m23Y, m13X, m13Y);
    
    //remember, designs can look cool with only some of it being recursed
    //check what they look like with one of these removed
    triforce(x1, y1, m12X, m12Y, m13X, m13Y);
    triforce(m12X, m12Y, x2, y2, m23X, m23Y);
    triforce(m13X, m13Y, m23X, m23Y, x3, y3);
  }
}

void drawEyes(float x, float y, float r){
  if (r > 1){
    ellipse(x, y, r * 2, r * 2);
    drawEyes(x - r/2, y, r/2);
    drawEyes(x + r/2, y, r/2);
    drawEyes(x, y - r/2, r/2);
    drawEyes(x, y + r/2, r/2);
  }
}

void drawTarget(float x, float y, float r) {
  if (r > 1){
    ellipse(x, y, r * 2, r * 2);
    drawTarget(x, y, r - 20);
  }
}
