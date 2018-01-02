import java.util.*;

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
   float nbr = randomGaussian();
   nbr = nbr*10 + 100;
   println(nbr);
   int stepx = 0;
   int stepy = 0;
   if(nbr > 100 && nbr < 110){
     stepx = 1;
   } else if(nbr < 100 && nbr > 90){
     stepy= 1;
   } else if (nbr <90){
     stepx = -1;
   } else {
     stepy = -1;
   }
   
   x += stepx;
   y += stepy;
   
   x = constrain(x, 0, width-1);
   y = constrain(y, 0, height-1);
 }
}

void setup(){
 size(200,200);
 w = new Walker();
 background(255);
}

void draw(){
  w.step();
  w.display();
}