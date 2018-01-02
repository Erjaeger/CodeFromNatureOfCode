Walker w;
float tx = 0;
float ty = 10000;

class Walker {
 float x;
 float y;
 
 Walker(){
   x = width/2;
   y = height/2;
 }
 
 void display(){
   stroke(0);
   ellipse(x,y, 16, 16);
 }
 
 void step(){
   float nx = noise(tx);
   float ny = noise(ty);
   float stepx = map(nx, 0, 1, -10, 10);
   float stepy = map(ny, 0, 1, -10, 10);
   
   println(stepx, stepy);
   x += stepx;
   y += stepy;
   
   x = constrain(x, 0, width-1);
   y = constrain(y, 0, height-1);
   
   tx+=0.01;
   ty+= 0.1;
 }
}

void setup(){
 size(640,360);
 w = new Walker();
 background(255);
}

void draw(){
  w.step();
  w.display();
}