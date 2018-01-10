class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float size;
  float mass;
  
  float tx = 1500;
  
  Mover(float x, float y, float s, float m, boolean velocityDir){
    size = s * m;
    location = new PVector(x, y);
    if(velocityDir){
      velocity = new PVector(1,0);  
    } else {
      velocity = new PVector(-1,0);
    }
    
    acceleration = new PVector(0, 0);
    mass = m;
    }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector f){
    PVector divResult = PVector.div(f, mass);
    acceleration.add(divResult);
  }

  void display(){
    stroke(0);
    fill(map(noise(tx), 0, 1, 0, 255), 38, 25);
    ellipse(location.x, location.y, size,size);
    tx+= 0.1;
  }
  
}