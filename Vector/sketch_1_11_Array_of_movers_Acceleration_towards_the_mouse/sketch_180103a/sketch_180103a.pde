class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  Mover(){
    location = new PVector(random(width/2), random(height/2));
    velocity = new PVector(0,0);
    acceleration = new PVector(0, 0);
    topspeed = 4;
  }

  
  void update(){
    PVector mouse = new PVector(mouseX, mouseY);
    PVector mouseLoc = PVector.sub(mouse, location);//the point wanted to the location wanted

    mouseLoc.normalize();
    mouseLoc.mult(0.5);
    
    acceleration = mouseLoc;
    velocity.add(acceleration);
    velocity.limit(5);
    location.add(velocity);
    
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