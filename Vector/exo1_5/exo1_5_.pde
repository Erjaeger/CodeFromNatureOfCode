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
   float stepx = randomGaussian();
   float stepy = randomGaussian();
   
   int sd = 20;
   int mean = 10;
   
   
   x += (stepx * sd) + mean;
   y += (stepy * sd) + mean;
   
   x = constrain(x,0,width-1);
   y = constrain(y,0,height-1);
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