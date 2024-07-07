Particle[] list;
int numbParticles;

public void setup(){
  size(700, 700);
  list = new Particle[10];
  for(int pos = 0; pos < list.length; pos++){
    perhapsAddParticle();
  }
}

public void draw(){
  background(255);
  for(int pos = 0; pos < list.length; pos++){
    list[pos].update();
    list[pos].display();
  }
}

void perhapsAddParticle(){
  if(numbParticles < list.length && frameCount % 10 == 0){
    double rando = Math.random();
    
    if(rando < 0.5){
      list[numbParticles] = new Particle(10);
    }
    else {
      list[numbParticles] = new SquareParticle();
    }
    
    numbParticles++;
  }
  else if (numbParticles == list.length){
    Particle[] temp = new Particle[2 * list.length];
    for(int i = 0; i < list.length; i++){
      temp[i] = list[i];
    }
    list = temp;
  }
}
