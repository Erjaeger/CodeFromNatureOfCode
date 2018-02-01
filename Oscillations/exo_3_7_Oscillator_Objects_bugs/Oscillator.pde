class Oscillator {
  PVector angle;
  PVector velocity;
  PVector amplitude;
  
  Oscillator(PVector _amp, PVector _vel, int _ang){
    angle = new PVector(_ang, 0);
    velocity = new PVector(_vel.x, _vel.y);
    amplitude = new PVector(_amp.x, _amp.y);
  }
  
  void oscillate(){
    angle.add(velocity);
  }
  
  void display(){
    float x = sin(angle.x)*amplitude.x;
    float y = amplitude.y;
    
    pushMatrix();
    translate(width/2, height/2);
    stroke(0);
    fill(175);
    line(0,0,x,y);
    ellipse(x,y, 16, 16);
    popMatrix();
  }
  
}