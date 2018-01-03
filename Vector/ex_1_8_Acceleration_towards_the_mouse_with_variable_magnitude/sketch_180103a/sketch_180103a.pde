class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Mover(){
    location = new PVector(random(width/2), random(height/2));
    velocity = new PVector(0,0);
    acceleration = new PVector(0, 0);
  }

  
  void update(){
    PVector mouse = new PVector(mouseX, mouseY);
    PVector mouseLoc = PVector.sub(mouse, location);//the point wanted to the location wanted

    float multValue = map(mouseLoc.mag(),0, sqrt(width*width+height*height), 0.01, 10);
    mouseLoc.normalize();
    mouseLoc.mult(multValue);
    acceleration = mouseLoc;
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(5);
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