class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  float angle=0;
  float aVelocity=0;
  float aAcceleration=0.01;
  
  Mover(){
    location = new PVector(random(0,width), random(0, height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass=1;
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    aAcceleration = acceleration.x / 10;
    aVelocity += aAcceleration;
    aVelocity = constrain(aVelocity, -0.1, 0.1);
    angle += aVelocity;
    
    acceleration.mult(0);
  }
  
  void applyForce(PVector f){
    PVector acc = PVector.div(f, mass);
    acceleration.add(acc);
  }
  
  void display(){
    stroke(0);
    fill(175, 200);
    rectMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    rect(0,0,mass*16, mass*16);
    popMatrix();
  }
}