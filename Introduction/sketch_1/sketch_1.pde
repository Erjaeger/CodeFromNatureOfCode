Walker w;


class Walker {
 float x;
 float y;
 
 Walker(){
   x = width/2;
   y = height/2;
 }
 
 void display(){
   stroke(0);
   point(x,y);
 }
 
 void step(){
   float stepx = random(-1, 1);
   float stepy = random(-1, 1);
   x += stepx;
   y += stepy;
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