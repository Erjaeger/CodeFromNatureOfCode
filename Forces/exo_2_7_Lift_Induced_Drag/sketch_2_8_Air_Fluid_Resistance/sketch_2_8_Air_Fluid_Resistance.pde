class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float size;
  float mass;
  
  Mover(float m, float x, float y, float s){
    size = s * m;
    location = new PVector(x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0, 0);
    mass = m;
  }
     
  boolean isInside(Liquid l){
    if (location.x+size>l.x && location.x<l.x+l.w && location.y>l.y && location.y<l.y+l.h) {
      return true;
    } else {
      return false;
    }
  }

  void drag(Liquid l){
    float speed = velocity.mag();
    float dragMagnitude = l.c * speed * speed;
    println(dragMagnitude);
    
    PVector drag = velocity.copy();
    drag.normalize();
    drag.rotate(-HALF_PI);
    drag.mult(dragMagnitude);
    drag.div(mass);

    applyForce(drag);
  }
  
  void update(){
    
    //if(location.x > 0 && location.x < 100 && location.y > height/2 && location.y < height/2 + 100){
    //  println("apply");
      //float c = 0.1;
      //PVector friction = velocity.copy();
      //friction.mult(-1);
      //friction.normalize();
      //friction.mult(c);
      //this.applyForce(friction);
      
    //  float c = 0.1;
    //  float speed = velocity.mag();
    //  float dragMagnitude = c * speed * speed;
    //  PVector drag = velocity.copy();
    //  drag.mult(-1);
    //  drag.normalize();
    //  drag.mult(dragMagnitude);
    //}
    
    //if(location.x > width-100 && location.x < width && location.y > height/2 && location.y < height/2 + 100){
    //  println("applySpeedUp");
    //  PVector speedUp = acceleration.copy();
    //  speedUp.mult(10);
    //  this.applyForce(speedUp);    
    //}
    
    
    
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void display(){
    stroke(0);
    fill(175);
    rect(location.x, location.y, size,size);
  }
  
  void checkEdges(){
    if (location.x > width) {
      //location.x = width;
      //velocity.x *= -1;
      location.x = 0;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }

    if (location.y > height-size) {
      //velocity.y *= -1;
      //location.y = height-size;
      location.y = height-size;
    }

  }
  
}