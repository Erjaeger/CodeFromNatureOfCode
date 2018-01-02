import java.util.*;

class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float topspeed;
  float tx, ty;
  
  Mover(){
    location = new PVector(random(width/2), random(height/2));
    velocity = new PVector(0,0);
    acceleration = new PVector(0.001, 0);
    topspeed = 10;
    tx = 0;
    ty = 10000;
  }

  void update(){
    acceleration.x = map(noise(tx), 0, 1, 0, 10);
    acceleration.y = map(noise(ty), 0, 1, 0, 10);
    println(acceleration.x, acceleration.y);

    tx += 0.01;
    ty += 0.01;

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
  
  void display(){
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, 16,16);
  }
  
  void checkEdges(){
    if(location.x > width){
      location.x = 0;
    } else if( location.x < 0){
      location.x = width;
    }
    
    if(location.y > height){
      location.y = 0;
    } else if(location.y < 0){
      location.y = height; 
    }
  }
  
  void drawMover(){
    update();
    checkEdges();
    display();
  }
  
}