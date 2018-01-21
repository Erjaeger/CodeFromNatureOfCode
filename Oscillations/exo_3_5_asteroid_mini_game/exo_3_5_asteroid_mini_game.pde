float r = 75;
PVector left, right;

Spaceship s;

void setup(){
  size(640, 360);
  background(255);
  s = new Spaceship();
  left = new PVector(-1, 0);
  right = new PVector(1, 0);
}

void draw(){
  s.update();
  s.checkEdges();
  s.display();
  //float x = r * cos(theta);
  //float y = r * sin(theta);
  
  //noStroke();
  //fill(0);
  //ellipse(x+width/2, y+height/2, 16, 16);
  
  //theta += 0.01;
}

void keyPressed(){
  println(keyCode);
  switch(keyCode){
    case 90:
      s.applyBoost();
    break;
    case 37:
      s.applyRotate("left");
    break;
    case 39:
      s.applyRotate("right");
    break;
    default:
    return ;
  }
}