int size, x, y, xSpeed, ySpeed;

void setup() {
  size(800,600);
  x = width/2;
  y = height/2;
  size = 40;
  noStroke();
  xSpeed = -4;
  ySpeed = -2;
  
}

void draw() {
  background(137,255,131);
  fill(255,0,250);
  ellipse(x,y,size,size);
  x += xSpeed;
  y += ySpeed;
  
  if (x/2 >= width) {
    xSpeed *= -1;
  }
  if (x <= size/2) {
    xSpeed *= -1;
  }
  if (y/2 >= height) {
    ySpeed *= -1;
  }
  if (y <= size/2) {
    ySpeed *= -1;
  }
  
}
