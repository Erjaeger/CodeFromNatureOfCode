class Cat {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float mass;
  float size;

  boolean isJumping;
  
  Cat(){
    size = 32;
    location = new PVector(width/2, height);
    velocity = new PVector(0, 0);    
    acceleration = new PVector(0, 0);
    mass = 1;
    isJumping = false;
  }
  
  void update(){
    if(!isJumping && location.y == height - 16){
      acceleration.x = map(noise(tx), 0, 1, -0.5, 0.5);
      tx+= 0.1;
    }
    
    velocity.add(acceleration);
    velocity.limit(5);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void jump(){
    if(location.y == height - 16){
      
      PVector mouse = new PVector(mouseX, mouseY);
      PVector dist = PVector.sub(mouse, location);
      
      dist.normalize();
      dist.mult(random(1, 100));
    
      acceleration = dist;
      velocity.add(acceleration);
      velocity.limit(5);
      location.add(velocity);
    }
  }
  
  void display(){
    fill(255);
    stroke(1);
    
    location.x = constrain(location.x, 0, width-size/2);
    location.y = constrain(location.y, 0, height-size/2);
    
    ellipse(location.x, location.y, size, size);
  }
}