Walker w;


class Walker {
 float x;
 float y;

 Walker(){
   x = width/2;
   y = height/2;
 }

 void display(){
   stroke(34,155,76);
   point(x,y);
 }

 void step(){
   float stepsize = montecarlo();

   float stepx = random(-stepsize, stepsize);
   float stepy = random(-stepsize, stepsize);
   x += stepx;
   y += stepy;

   x = constrain(x, 0, width-1);
   y = constrain(y, 0, height-1);
 }
}

void setup(){
 size(640,360);
 w = new Walker();
 background(0);
}

void draw(){
  w.step();
  w.display();
}


float montecarlo(){
  while (true){
    float r1 = random(10);
    float probability = r1;
    float r2 = random(10);
    if(r2 < probability){
      return r1;
    }
  }
}
