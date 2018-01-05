Mover[] movers = new Mover[10];


void settings(){
  size(1000, 800);
}

void setup(){
  for(int i = 0; i < movers.length; i++){
    movers[i] = new Mover(random(0.5, 5), random(0, width), random(0, height));
  }
}

void draw(){
  background(255);
  PVector wind = new PVector(0.1, 0);
  PVector gravity = new PVector(0, 0.1);
   
   
  for(Mover m : movers){
    m.applyForce(wind);
    m.applyForce(gravity);
    m.update();
    m.checkEdges();
    m.display();
  }
}