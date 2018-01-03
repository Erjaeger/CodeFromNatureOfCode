Cat c;

void settings(){
  size(640, 400);
  smooth();
}

void setup(){
 background(255);
 
 c = new Cat();
}

void draw(){
  background(255);
  if(mousePressed){
    fill(0, 153, 51);
    ellipse(mouseX, mouseY, 20, 20);
    c.doJump();
  }
  c.drawCat();
}

void mouseReleased(){
  println("released?");
  c.goToFloor();
}