Eye eL, eR;

void setup (){
  size(1000, 1000);
  eL = new Eye(width/2, height/2, 60);
}

void draw(){
  eL.display();
}