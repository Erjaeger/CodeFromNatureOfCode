
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

  for (int i = 0; i < movers.length; i++) {

    PVector wind = new PVector(0.01, 0);
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    
    float c = 0.01;
    PVector friction = movers[i].velocity.copy();
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);

    movers[i].applyForce(friction);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}