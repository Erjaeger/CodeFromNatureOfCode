Mover m;

void settings(){
  size(640, 320);
}

void setup(){
  m = new Mover();
}

void draw(){
  background(255);
  PVector wind = new PVector(1, 0);
  PVector gravity = new PVector(0, 1);
  
  if(mousePressed){
    m.applyForce(wind);
  }
  
  m.applyForce(gravity);
  
  m.update();
  m.checkEdges();
  m.display();
}