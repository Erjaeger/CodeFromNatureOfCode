Mover mover;
void settings(){
    size(640,360);
}

void setup() {

  mover = new Mover();
}

void draw(){
  background(255);
  mover.update();
  mover.checkEdges();
  mover.display();
}