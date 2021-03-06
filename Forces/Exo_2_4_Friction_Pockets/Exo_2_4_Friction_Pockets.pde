class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float size;
  float mass;
  
  Mover(float m, float x, float y){
    location = new PVector(x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0, 0);
    mass = m;
  }

  
  void update(){
    
    if(location.x > 0 && location.x < 100 && location.y > height/2 && location.y < height/2 + 100){
      println("apply");
      float c = 0.1;
      PVector friction = velocity.copy();
      friction.mult(-1);
      friction.normalize();
      friction.mult(c);
      this.applyForce(friction);    
    }
    
    if(location.x > width-100 && location.x < width && location.y > height/2 && location.y < height/2 + 100){
      println("applySpeedUp");
      PVector speedUp = acceleration.copy();
      speedUp.mult(10);
      this.applyForce(speedUp);    
    }
    
    
    
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void display(){
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, mass*16,mass*16);
  }
  
  void checkEdges(){
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }

  }
  
}