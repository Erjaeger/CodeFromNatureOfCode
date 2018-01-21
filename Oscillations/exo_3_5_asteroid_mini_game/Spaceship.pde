class Spaceship {
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector aAcceleration;
  PShape spaceshipShape;
  PShape commandShape;
  PShape leftMotor;
  PShape rightMotor;

  float mass;
  float angle;
  float r;

  Spaceship() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    angle = PI;
    mass = 1;
    r = 0;
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    
    velocity.x = constrain(velocity.x, -1, 1);
    velocity.y = constrain(velocity.y, -1, 1);
  }

  void applyForce(PVector forceIn) {
    PVector newForce = PVector.div(forceIn, mass);
    acceleration.add(newForce);
    acceleration.x = constrain(acceleration.x, -1, 1);
    acceleration.y = constrain(acceleration.y, -1, 1);
  }

  void applyBoost() {
    float x = cos(angle-PI/2);
    float y = sin(angle-PI/2);
    PVector normDir = new PVector(x, y);
    normDir.normalize();
    normDir.mult(2);
    applyForce(normDir);
  }
  
  void applyRotate(String s){
    if(s == "left"){
      angle -= 0.1;
    } else if(s == "right"){
      angle += 0.1;
    }
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    spaceshipShape = createShape(GROUP);
    commandShape = createShape(TRIANGLE, 0, 0, -20, 30, 20, 30);
    leftMotor = createShape(RECT, -15, 30, 10, 5);
    rightMotor = createShape(RECT, 5, 30, 10, 5);
    spaceshipShape.addChild(commandShape);
    spaceshipShape.addChild(leftMotor);
    spaceshipShape.addChild(rightMotor);
    spaceshipShape.rotate(angle);
    background(204);
    shape(spaceshipShape);
    popMatrix();
  }

  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    } else if (location.y < 0) {
      location.y = height;
    } else if (location.y > height) {
      location.y = 0;
    }
  }
}