Player p;
Bullets[] pairs;
//credit to an unnamed processing forum user for the logic behind detecting multiple keys
//https://forum.processing.org/two/discussion/22644/two-keys-pressed-three-keys-pressed-simultaneously.html
boolean[] keys;
boolean[] chambers;
boolean gameOn;
float[] storedY;
int pair;
Bullets finalShot;
int bullets;

void setup(){
  size(600,600);
  
  bullets = 5;
  pairs = new Bullets[bullets];
  pairs[0] = new Bullets();
  finalShot = new Bullets(false);
  chambers = new boolean[bullets];
  chambers[0] = true;
  for(int i = 1; i < chambers.length; i++){
    chambers[i] = false;
  }
  pair = 0;
  p = new Player();
  storedY = new float[bullets];
  gameOn = false;
  
  keys = new boolean[5];
  for(int i = 0; i < keys.length; i++){
    keys[i] = false;
  }
}

void draw(){
  background(0);
  if(gameOn){
    gamePlay();
  }
  else {
    reset();
  }
}
public void gamePlay(){
  for(int i = 0; i < chambers.length; i++){
    bulletStorm(i);
    if(pairs[i].hit(p)){
      for(int j = 0; j < chambers.length; j++){
        chambers[j] = false;
      }
      finalShot = pairs[i];
      gameOn = false;
    }
  }
  p.appear();
  p.respond(keys);
}

public void reset(){
  finalShot.appear();
  p.appear();
  textSize(50);
  fill(255);
  text("Press 'e' to start", 140,300, 0);
  if(keys[4] == true){
    p.reset();
    pairs[0] = new Bullets();
    for(int i = 1; i < pairs.length; i++){
      pairs[i] = new Bullets(false);
    }
    chambers[0] = true;
    for(int i = 1; i < chambers.length; i++){
      chambers[i] = false;
    }
    gameOn = true;
  }
}

public void bulletStorm(int b){
  if(chambers[b]){
    pairs[b].aim(storedY);
    if(pairs[b].telegraphed()){
      pairs[b].fire();
      if(pairs[b].fired()){
        storedY[b] = 0;
        chambers[b] = false;
      }
    }
  }
  else{
    pairs[b] = new Bullets();
    storedY[b] = pairs[b].getY();
    if(b != 0){
      if(pairs[b-1].tagTeam()){
        chambers[b] = true;
      }
    }
    else{
      if(pairs[pairs.length-1].tagTeam()){
        chambers[b] = true;
      }
    }
  }
}

void keyPressed(){
  if(key == 'a'){
    keys[0] = true;
  }
  if(key == 'd'){
    keys[1] = true;
  }
  if(key == 'w'){
    keys[2] = true;
  }
  if(key == 's'){
    keys[3] = true;
  }
  if(key == 'e'){
    keys[4] = true;
  }
}

void keyReleased(){
  if(key == 'a'){
    keys[0] = false;
  }
  if(key == 'd'){
    keys[1] = false;
  }
  if(key == 'w'){
    keys[2] = false;
    p.fallingReset();
  }
  if(key == 's'){
    keys[3] = false;
  }
  if(key == 'e'){
    keys[4] = false;
  }
}
