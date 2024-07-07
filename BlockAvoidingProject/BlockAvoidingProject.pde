Block[] allBlocks;
boolean gameOver;
int score;
int blocks;
int amountOfBlocks;

void setup() {
  size(600, 600);
  amountOfBlocks = 10;
  allBlocks = new Block[amountOfBlocks];
  for(int i = 0; i < allBlocks.length; i++){
    allBlocks[i] = new Block();
  }
  blocks = 0;
  gameOver = false;
  score = 0;
}

void draw(){
  background(0);
  showScore();
  if(gameOver == false){
    game();
    score++;
  }
  else {
    endScreen();
  }
}

void game(){
  for(Block j : allBlocks){
    j.speedUp();
  }
  allBlocks[0].update();
  allBlocks[0].display();
  if(allBlocks[blocks].getX() < 300){
    if (blocks < amountOfBlocks-1){
      blocks++;
    }
  }
  for(int i = 0; i <= blocks; i++){
    allBlocks[i].update();
    allBlocks[i].display();
    if(allBlocks[i].checkMouse()){
      gameOver = true;
    } 
  }
}

void endScreen(){
  textSize(50);
  fill(255);
  text("Game Over", 185, 250);
  text("Click to Restart", 135, 300);
}

void showScore(){
  textSize(50);
  fill(255);
  text("Score: " + score, 0, 50);
}
