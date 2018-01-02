class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Mover(){
    location = new PVector(random(width/2), random(height/2));
    velocity = new PVector(0,0);
    acceleration = new PVector(-0.001, 0.01);
  }

  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(10);
  }
  
  void display(){
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16,16);
  }
  
  void checkEdges(){
    if(location.x > width){
      location.x = 0;
    } else if( location.x < 0){
      location.x = width;
    }
    
    if(location.y > height){
      location.y = 0;
    } else if(location.y < 0){
      location.y = height; 
    }
  }
  
}