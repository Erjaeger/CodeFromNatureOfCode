Cat c;
float tx = 10000;

void settings(){
  size(640, 400);
  smooth();
}

void setup(){
 background(255);
 
 c = new Cat();
}

void draw(){
  background(255);
  if(mousePressed){
    c.jump();
  }
  
  PVector gravity = new PVector(0, 0.1);
  float cF = 0.01;
  PVector friction = c.velocity.copy();
  friction.mult(-1);
  friction.normalize();
  friction.mult(cF);
  
  c.applyForce(gravity);
  c.applyForce(friction);
  c.update();
  c.display();
}