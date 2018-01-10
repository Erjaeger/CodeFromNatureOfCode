
Mover[] m = new Mover[10];
Attractor a;

void settings() {
  size(640, 360);
}

void setup() {
  for(int i = 0; i<m.length; i++){
    m[i] = new Mover(10, random(0, width), random(0, height), random(1, 5));
  }
  
  a = new Attractor();
}

void draw() {
  
  for(int i = 0; i<m.length; i++){
    PVector f = a.attract(m[i]);
    m[i].applyForce(f);
    m[i].update();
    
    m[i].display();
  }
  
  

  a.display();
}