class Eye {
  PVector location;
  PVector locationIris;
  float size;
  float r;
  float angle;
  
  Eye(float _x, float _y, float _size){
    location = new PVector(_x, _y);
    locationIris = new PVector(_x, _y);
    size = _size;
    angle = 0;
    r = 30;
  }
  
  void display(){
    PVector mouse = new PVector(mouseX, mouseY); 
    PVector newLoc = location.copy();
    newLoc.sub(mouse);//Get the position of the mouse from the center
    background(125);
    line(width/2, height/2, mouse.x, mouse.y);
  
    angle = newLoc.heading(); //Get the angle of the "ball" from the center 

    float x = r * cos(angle);
    float y = r * sin(angle);
    
    
    pushMatrix(); //Draw the big circle
    translate(location.x, location.y);
    fill(80);
    ellipse(0, 0, size, size);
    popMatrix();
    
    
    pushMatrix(); //Draw the little circle
    fill(155);
    translate(location.x, location.y);
    rotate(angle);
    ellipse(x, y, size-40, size-40);
    popMatrix();
  }
}