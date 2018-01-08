
Mover[] movers = new Mover[20];

void settings(){
  size(640, 360);
}

void setup() {
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1, 4), 0, 0);
  }
}


void draw() {
  background(255);
  
  fill(244, 66, 229);
  rect(0, height/2, 100, 100);
  
  fill(244, 157, 65);
  rect(width-100, height/2, 100, 100);

  for (int i = 0; i < movers.length; i++) {

    PVector wind = new PVector(0.01, 0);
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}