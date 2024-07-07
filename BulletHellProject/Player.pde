public class Player {
  
  float x, y, size;
  float speedX1, speedX2, speedY1, speedY2, divingRate;
  
  public Player(){
    x = 600;
    y = 600;
    size = 25;
    speedX1 = 0;
    speedX2 = 0;
    speedY1 = 0;
    speedY2 = 0;
    divingRate = 0;
  }
  
  public void appear(){
    fill(100, 216, 230);
    rect(x, y, size, size);
    if(y >= height-(size/2) || y <= 0 + (size/2) ||
       x >= width - (size/2) || x <= 0 + (size/2)){
      gameOn = false;
    }
  }
  
  public void reset(){
    x = 300;
    y = 300;
    speedX1 = 0;
    speedY1 = 0;
    speedX2 = 0;
    speedY2 = 0;
    divingRate = 0;
  }
  
  public void fallingReset(){
    speedY2 = speedY1 * -0.3;
  }
  
  public float getX(){
    return x;
  }
  public float getY(){
    return y;
  }
  public float getSize(){
    return size;
  }
  
  public void respond(boolean[] k){
    if(k[0] == true){
      //move left
      if(speedX1 < 10){
        speedX1 += 1.2;
      }
      x -= speedX1;
    }
    if(keys[1] == true){
      //move right
      if(speedX2 < 10){
        speedX2 += 1.2;
      }
      x += speedX2;
    }
    if(keys[2] == true){
      //momentum change
      if(speedY2 > 0){
        speedY2 -= 0.1;
        y += speedY2;
      }
      else {
        speedY2 = 0;
      }
      //move up
      speedY1 += 1.2;
      y -= speedY1;
    }  
    if(keys[3] == true){
      //diving
      if(speedY2 < 10){
        speedY2 += 0.1;
      }
      if(divingRate < 10){
        divingRate += 1.2;
      }
      y += divingRate;
    }
    if(speedX1 > 0){
      //left x friction
      speedX1--;
      if(speedX1 < 0){
        speedX1 = 0;
      }
    }
    if(speedX2 > 0){
      //right x friction
      speedX2--;
      if(speedX2 < 0){
        speedX2 = 0;
      }
    }
    if(speedY1 > 0){
      //y speed friction
      speedY1 -= 1;
      if(speedY1 < 0){
        speedY1 = 0;
      }
    }
    if(keys[2] == false && keys[3] == false){
      //falling
      divingRate = 0;
      if(speedY2 < 10){
        speedY2 += 0.1;
      }
      y += speedY2;
    }
  }
  
}
