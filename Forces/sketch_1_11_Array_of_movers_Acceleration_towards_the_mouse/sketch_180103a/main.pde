Mover[] movers = new Mover[20];

void settings(){
  size(640, 320);
}

void setup(){
  for(int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
}

void draw(){
  background(255);
  for(Mover m : movers){
    m.update();
    m.checkEdges();
    m.display();  
  }
}