int buttonValuePressed = 1;

class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float topspeed;
  
  Mover(){
    location = new PVector(random(width/2), random(height/2));
    velocity = new PVector(0,0);
    acceleration = new PVector(0.001, 0);
    topspeed = 10;
  }
  
  void setAcceleration(int keyPressedValue){
    if(keyPressedValue == 38){
      println("add");
      buttonValuePressed = 1;
    } else if(keyPressedValue == 40) {
      println("sub");
      buttonValuePressed = 0;
    }
  }
  
  void update(){
    println(buttonValuePressed);
    if(buttonValuePressed == 1){
      velocity.add(acceleration);
      // acce to velo
      location.add(velocity);
    } else if(buttonValuePressed == 0){
      velocity.sub(acceleration);
      location.add(velocity);
    }
    velocity.limit(topspeed);
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
  
  void drawMover(){
    update();
    checkEdges();
    display();
  }
  
}