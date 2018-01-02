import java.util.*;

Date d= new Date();
float t= d.getTime();

void setup(){
  size(400, 200);
}

void draw(){
  float n= noise(t);
  float x = map(n, 0,1,0,width);
  fill(34,155,76);
  ellipse(x, 180, 16,16);
  t += 0.01;
}