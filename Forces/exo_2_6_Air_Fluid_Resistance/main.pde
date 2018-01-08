
Mover[] movers = new Mover[20];
Liquid liquid;

void settings(){
  size(640, 360);
}

void setup() {
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1, 4), random(0, width), random(0, height/2), random(10, 50));
  }
}


void draw() {
  background(255);
  liquid.display();
  for (int i = 0; i < movers.length; i++) {
    
    if(movers[i].isInside(liquid)){
      movers[i].drag(liquid);
    }

    PVector wind = new PVector(0.01, 0);
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}