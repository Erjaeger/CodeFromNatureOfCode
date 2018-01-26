Eye eL, eR;

void setup (){
  size(1000, 1000);
  eL = new Eye(width/2-60, height/2, 60);
  eR = new Eye(width/2+60, height/2, 60);
}

void draw(){
  background(125);
  eL.display();
  eR.display();
}