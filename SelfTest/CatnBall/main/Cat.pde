float tx = 10000;

class Cat {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  PVector coordBeforeJump;
  
  float size;
  
  float accelerationSpeedX;
  float accelerationSpeedY;
  float topSpeed;
  
  boolean isJumping;
  
  Cat(){
    size = 30;
    accelerationSpeedX = 0.01;
    accelerationSpeedY = 0.05;
    topSpeed = 10;
    location = new PVector(0+size/2, height-size/2);
    velocity = new PVector(0, 0);    
    //acceleration = new PVector(accelerationSpeedX, accelerationSpeedY);
    acceleration = new PVector(0, 0);
    isJumping = false;
  }
  
  void drawCat(){
    //update();
    //checkEdges();
    //display();
    fill(255);
    if(isJumping == false){
      float accelValue = noise(tx);
      acceleration.x = map(accelValue, 0, 1, -1, 1);
      acceleration.y = 1;
      tx += 0.1;
    }
    velocity.add(acceleration);
    velocity.limit(5);
    location.add(velocity);
    
    //if((location.x + size/2 > width) || (location.x - size/2 < 0)){ //Bouncing ball
    //  acceleration.x = -velocity.x *2;
    //  velocity.add(acceleration);
    //  if(acceleration.x > 0 ){
    //    acceleration.x = accelerationSpeedX;
    //  } else {
    //    acceleration.x = accelerationSpeedX * -1;
    //  }
    //}
    
    //if((location.y + size/2 > height) || (location.y - size/2 < 0)){
    //  acceleration.y = -velocity.y *2;
    //  velocity.add(acceleration);
    //  if(acceleration.y > 0 ){
    //    acceleration.y = accelerationSpeedY;
    //  } else {
    //    acceleration.y = accelerationSpeedY * -1;
    //  }
    //}
    
    location.x = constrain(location.x, 0, width-size/2);
    location.y = constrain(location.y, 0, height-size/2);
    
    ellipse(location.x, location.y, size, size);
  }
  
  void doJump(){
    coordBeforeJump = location;
    PVector mouse = new PVector(mouseX, mouseY);
    PVector mouseLoc = PVector.sub(mouse, location);
    
    acceleration = mouseLoc;
    velocity.add(acceleration);
    velocity.limit(5);
    location.add(velocity);
    location.x = constrain(location.x, 0, width-size/2);
    location.y = constrain(location.y, 0, height-size/2);
    
    isJumping = true;
    
    ellipse(location.x, location.y, size, size);
  }
  
  void goToFloor(){
    println(coordBeforeJump);
    isJumping = false;
    PVector mouse = new PVector(mouseX, mouseY);
    PVector mouseLoc = PVector.sub(mouse, location);
    
    println(mouseLoc);
    acceleration.y= 1;
  }
}