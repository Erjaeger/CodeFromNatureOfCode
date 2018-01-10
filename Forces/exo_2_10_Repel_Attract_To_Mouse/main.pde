
Mover[] movers = new Mover[10];
Attractor[] attractors = new Attractor[2];

void settings() {
  size(640, 360);
}

void setup() {
  background(87,88,89);
  for(int i = 0; i < movers.length; i++){
    movers[i] = new Mover(random(0, width), random(0, height), 16, 2, true);
  }
  
  
}

void draw(){
  for(int i = 0; i<movers.length; i++){
    for(int j = 0; j<movers.length; j++){
      if(i != j){
        PVector f = movers[j].attract(movers[i].location, movers[i].mass, false);
        PVector fMouse = movers[j].attract(new PVector(mouseX, mouseY), 1, true);
        movers[i].applyForce(fMouse);
        movers[i].update();
        movers[i].display();
      }
    }
  }
}