Mover m;

void settings(){
  size(640, 320);
}

void setup(){
  m = new Mover();
}

void draw(){
  background(255);
  m.update();
  m.checkEdges();
  m.display();
}