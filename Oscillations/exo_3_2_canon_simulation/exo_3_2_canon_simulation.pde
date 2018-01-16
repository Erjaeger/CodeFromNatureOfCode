Mover m;
Attractor a;

void setup(){
  size(640, 360);
  m = new Mover();
  a = new Attractor();
}

void draw(){
  background(255);
  PVector f = a.attract(m);
  m.applyForce(f);
  a.display();
  m.update();
  m.display(); 
}