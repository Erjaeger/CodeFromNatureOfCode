Mover mover;

void settings(){
  size(600, 400);
  
}

void setup(){
  mover = new Mover();
}

void draw(){
  background(255);
  mover.drawMover();
}