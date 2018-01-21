class Spaceship {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector aAcceleration;
  PShape spaceshipShape;
  
  Spaceship(){
    location = new PVector(width/2, height/2);
    velocity = new PVector(0,0);
    acceleration = new PVector(0, 0);
    aAcceleration = new PVector(0,0);
  }
  
  void update(){
  }
  
  void applyForce(){
  }
  
  void draw(){
    spaceshipShape = createShape(TRIANGLE, 10, 10, 10, 20, 30, 50);
    background(204);
    shape(spaceshipShape);
  }
}