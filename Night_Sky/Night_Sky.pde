float[] x, y, size;
boolean[] growing;

void setup() {
  size(800,600);
  
  int numbStars = 1000;
  x = new float[numbStars];
  y = new float[numbStars];
  size = new float[numbStars];
  growing = new boolean[numbStars];
  
  for(int pos = 0; pos < x.length; pos++) {
    x[pos] = (float)Math.random()*width;
    y[pos] = (float)Math.random()*height;
    size[pos] = (float)Math.random()*10 + 5;
    if (Math.random() < 0.5) {
      growing[pos] = true;
    }
  }
}

void draw() {
  background(0);
  for (int i = 0; i < x.length; i++) {
    ellipse(x[i], y[i], size[i], size[i]);
    if (growing[i]) {
      size[i] += 0.5;
    }
    else {
      size[i] -= 0.5;
    }
    if (size[i] <= 5) {
      growing[i] = true;
    }
    else if (size[i] >= 15) {
      growing[i] = false;
    }
  }
}
