class Mover {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  float angle=0;
  Mover(){
    location = new PVector(random(0,width), random(0, height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass=1;
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    
    location.x = constrain(location.x, 32, width-32);
    location.y = constrain(location.y, 32, height-32);
    acceleration.mult(0);
  }
  
  void applyForce(PVector f){
    PVector acc = PVector.div(f, mass);
    acceleration.add(acc);
    acceleration.x = constrain(acceleration.x, -0.1, 0.1);
    acceleration.y = constrain(acceleration.y, -0.1, 0.1);
  }
  
  void display(){
    
    angle = velocity.heading();
    stroke(0);
    fill(175, 200);
    rectMode(CENTER);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle);
    rect(0,0,mass*32, mass*16);
    popMatrix();
  }
}