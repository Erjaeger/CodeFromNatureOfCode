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
   println("x : " + mouseX);
   println("y : " + mouseY);
   
   float stepx = random(-1, 1);
   float stepy = random(-1, 1);
   
   int followMouse = (int(random(2)));
   println(followMouse);
   if(followMouse == 1){
     if(mouseX > x){
       x += abs(stepx);
     } else {
       x += (abs(stepx)*-1);
     }
     
     if(mouseY > y){
       y += abs(stepy);
     } else {
       y += (abs(stepy)*-1);
     }
   } else {
     x += stepx;
     y += stepy;
   }   
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