class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float size;
  float mass;
  float G;
  
  float tx = 1500;
  
  Mover(float x, float y, float s, float m, boolean velocityDir){
    size = s * m;
    G = 0.4;
    location = new PVector(x, y);
    if(velocityDir){
      velocity = new PVector(0,0);  
    } else {
      velocity = new PVector(0,0);
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
    fill(255);
    ellipse(location.x, location.y, size,size);
    tx+= 0.1;
  }
  
   PVector attract(PVector mLocation, float mMass, boolean fromMouse){
    PVector force = PVector.sub(mLocation, location);
    float distance = force.mag();
    distance = constrain(distance, 5, 25);
    force.normalize();
    float strength = (G * mass * mMass) / (distance * distance);
    force.mult(strength);
    if(!fromMouse){
      force.mult(-1);
    }
    return force;
  }
  
}