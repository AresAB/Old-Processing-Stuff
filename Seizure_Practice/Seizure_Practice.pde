PImage cheese;
float cheeseX, cheeseY, xSpeed, ySpeed;

void setup() {
  size(800,600);
  cheese = loadImage("Cheese2.png");
  cheeseX = width/2;
  cheeseY = height/2;
  xSpeed = 2.4;
  ySpeed = 1.8;
  stroke(255,0,0);
  frameRate(60);
}

void draw() {
  background(0);
  imageMode(CENTER);
  
  for(int i = 0; i < 1000; i++){
    float red = (float)Math.random()*256;
    float green = (float)Math.random()*256;
    float blue = (float)Math.random()*256;
    fill(red,green,blue);
    float x = (float)Math.random()*width;
    float y = (float)Math.random()*height;
    float size = (float)Math.random()*25+15;
    ellipse(x,y,size,size);
    if(cheeseX<0||cheeseX>width){
      xSpeed = -xSpeed;
    }
    if(cheeseY<0||cheeseY>height){
      ySpeed = -ySpeed;
    }
    image(cheese,cheeseX,cheeseY);
    cheeseX+=xSpeed;
    cheeseY+=ySpeed;
  }
}
