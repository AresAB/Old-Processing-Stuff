Dot d1, d2, d3;

void setup() {
  size(800,600);
  d1 = new Dot();
  d2 = new Dot(320, 180, 74, color(0, 255, 0));
  d3 = new Dot(200, 500, 100);
}

void draw() {
  background(255,0,255);
  fill(d1.clr);
  ellipse(d1.x, d1.y, d1.size, d1.size);
  fill(d2.clr);
  ellipse(d2.x, d2.y, d2.size, d2.size);
  fill(d3.clr);
  ellipse(d3.x, d3.y, d3.size, d3.size);
  d1.size++;
  if (d1.size >= 800){
    fill(d1.clr);
    ellipse(d1.x, d1.y, d1.size, d1.size);
  }
}
