Mover m;
PVector up, down, left, right;

void setup(){
  size(640, 360);
  m = new Mover();
  up = new PVector(0,-1);
  down = new PVector(0,1);
  left = new PVector(-1, 0);
  right = new PVector(1, 0);
}

void draw(){
  background(255);
  m.update();
  m.display(); 
}

void keyPressed(){
  
  println(keyCode);
  switch(keyCode){
    case 38:
      m.applyForce(up);
    break;
    case 40:
      m.applyForce(down);
    break;
    case 37:
      m.applyForce(left);
    break;
    case 39:
      m.applyForce(right);
    break;
    default:
    return ;
  }
}