public class Particle {
  
  //not private on purpose...we'll get back into that soon
  float x, y, rise, run, size;
  
  public Particle(float s) {
    size = s;
    x = (float)( Math.random() * width );
    y = (float)( Math.random() * height );
    
    //There is a range of 10 from -5 to +5, so multiply by 10
    //We are subtracting 5 to have the lowest value be -5
    rise = (float)( Math.random() * 10 - 5 );  
    run = (float)( Math.random() * 10 - 5 );
  }
  

  //This method simply moves the object linearly and wraps
  //around to the other side when it hits a wall
  void update() {
    x += run;
    y += rise;
    
    if( x < 0 ) {
      x = width; 
    }
    else if( x > width ) {
      x = 0; 
    }
    
    if( y < 0 ) {
      y = height; 
    }
    else if( y > height ) {
      y = 0; 
    }
  }
  
  //draws a small, red ellipse at the particle's location
  void display() {
    fill(255, 0, 0);
    ellipse( x, y, size, size );
  }
  
   
}
