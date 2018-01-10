class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float size;
  float mass;
  
  Mover(float s, float x, float y, float m){
    size = s * m;
    location = new PVector(x, y);
    velocity = new PVector(1,0);
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
    fill(175);
    ellipse(location.x, location.y, size,size);
  }
  
}