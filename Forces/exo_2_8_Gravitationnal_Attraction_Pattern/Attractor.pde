class Attractor {
  float mass;
  PVector location;
  float G;
  
  boolean dragging = false;
  boolean rollover = false;
  PVector dragOffset;
  
  Attractor(float x, float y, float m){
    location = new PVector(x, y, m);
    mass = m;
    G = 0.4;
    dragOffset = new PVector(0.0, 0.0);
  }
  
  PVector attract(Mover m){
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 5, 25);
    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    
    return force;
  }
  
  void display(){
    noStroke();
    if(dragging) fill(0, 0);
    else if(rollover) fill(100);
    else fill(255);
    ellipse(location.x, location.y, 16, 16);
  }
  
  void clicked(int mx, int my){
    float d = dist(mx, my, location.x, location.y);
    if(d < mass){
      dragging = true;
      dragOffset.x = location.x-mx;
      dragOffset.y = location.y-my;
    }
  }
  
  void hover(int mx, int my){
    float d = dist(mx, my, location.x, location.y);
    if(d < mass){
      rollover = true;
    } else {
      rollover = false;
    }
  }
  
  void stopDragging(){
    dragging = false;
  }
  
  void drag(){
    if(dragging){
      location.x = mouseX + dragOffset.x;
      location.y = mouseY + dragOffset.y;
    }
  }
}