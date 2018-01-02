import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class exo1_6 extends PApplet {

Walker w;


class Walker {
 float x;
 float y;

 Walker(){
   x = width/2;
   y = height/2;
 }

 public void display(){
   stroke(34,155,76);
   point(x,y);
 }

 public void step(){
   float stepsize = montecarlo();

   float stepx = random(-stepsize, stepsize);
   float stepy = random(-stepsize, stepsize);
   x += stepx;
   y += stepy;

   x = constrain(x, 0, width-1);
   y = constrain(y, 0, height-1);
 }
}

public void setup(){
 
 w = new Walker();
 background(0);
}

public void draw(){
  w.step();
  w.display();
}


public float montecarlo(){
  while (true){
    float r1 = random(10);
    float probability = r1;
    float r2 = random(10);
    if(r2 < probability){
      return r1;
    }
  }
}
  public void settings() {  size(640,360); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "exo1_6" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
