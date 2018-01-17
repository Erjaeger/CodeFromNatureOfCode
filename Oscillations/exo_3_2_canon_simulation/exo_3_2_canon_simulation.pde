Mover[] movers;
PShape rect;
int idx = 0;

PVector gravity;
PVector shot;

void setup(){
  size(640, 360);
  movers = new Mover[100];
  
  rect = new PShape();
  rect = createShape(RECT, 0, 0, 100, 50);
  rect.setFill(color(162, 180, 186));
  rect.setStroke(false);
  rect.rotate(-45);
  
  gravity = new PVector(0, 0.1);
  shot = new PVector(65, 280);
}

void draw(){
  background(255);
  shape(rect, -10, 350);
  
  for(int i = 0; i < movers.length; i++){
    if(movers[i] instanceof Mover){
      movers[i].applyForce(gravity);
      movers[i].update();
      movers[i].display();
    }
  }
  
}

void mouseClicked(){
  println("clicked");
  if(idx == 100) idx = 0;
  movers[idx] = new Mover();
  
  PVector ori = new PVector(0, height);
  PVector fShot = PVector.sub(shot, ori);
  fShot.normalize();
  fShot.mult(random(2, 10));
  
  movers[idx].applyForce(fShot);
  idx++;
}