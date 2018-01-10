
Mover[] movers = new Mover[2];
Attractor[] attractors = new Attractor[2];
boolean isStarted = false;
boolean startMover = false;


void settings() {
  size(640, 360);
}

void setup() {
  background(87,88,89);
  movers[0] = new Mover(0, 0, 16, 2, true);
  movers[1] = new Mover(width, height, 16, 2, false);
  
  attractors[0] = new Attractor(width/4, height/2, 30);
  attractors[1] = new Attractor(width-width/4, height/2, 30);
  
}

void draw() {
  
  if(!isStarted){
    isStarted = true;
  }
  
  for(int i = 0; i<movers.length; i++){
    for(int j = 0; j<attractors.length; j++){
      PVector f = attractors[j].attract(movers[i]);
      if(startMover){
        movers[i].applyForce(f);
        movers[i].update();
        movers[i].display();
      }
      
      attractors[j].drag();
      attractors[j].hover(mouseX, mouseY);
      attractors[j].display();
    }
  }
}

void mousePressed(){
  for(int j = 0; j<attractors.length; j++){
      attractors[j].clicked(mouseX, mouseY);
    }
}


void mouseReleased(){
  for(int j = 0; j<attractors.length; j++){
      attractors[j].stopDragging();
    }
}

void keyPressed(){
  println(keyCode);
  if(keyCode == 32){
    startMover = !startMover;
  }
}