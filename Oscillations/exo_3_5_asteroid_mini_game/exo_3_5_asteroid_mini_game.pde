float r = 75;
float theta = 0;

Spaceship s;

void setup(){
  size(640, 360);
  background(255);
  s = new Spaceship();
}

void draw(){
  s.draw();
  //float x = r * cos(theta);
  //float y = r * sin(theta);
  
  //noStroke();
  //fill(0);
  //ellipse(x+width/2, y+height/2, 16, 16);
  
  //theta += 0.01;
}

//void keyPressed(){
  
//  println(keyCode);
//  switch(keyCode){
//    case 38:
//      m.applyForce(up);
//    break;
//    case 40:
//      m.applyForce(down);
//    break;
//    case 37:
//      m.applyForce(left);
//    break;
//    case 39:
//      m.applyForce(right);
//    break;
//    default:
//    return ;
//  }
//}