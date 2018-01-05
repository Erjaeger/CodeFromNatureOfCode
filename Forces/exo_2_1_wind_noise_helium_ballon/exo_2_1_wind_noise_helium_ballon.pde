class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float size;
  
  Mover(){
    location = new PVector(random(width/2), random(height/2));
    velocity = new PVector(0,0);
    acceleration = new PVector(0, 0);
    size = 16;
  }

  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  }
  
  void display(){
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16,16);
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
    } else if(location.y <0){
      velocity.y *= -1;
      location.y = 0;
    }

  }
  
}