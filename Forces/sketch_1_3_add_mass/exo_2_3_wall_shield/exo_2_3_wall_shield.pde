class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float size;
  float mass;
  
  Mover(float m, float x, float y){
    location = new PVector(x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0, 0);
    mass = m;
  }

  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void applyForce(PVector force){
    PVector f = force.get();
    f.div(mass);
    acceleration.add(force);
  }
  
  void display(){
    stroke(0);
    fill(175);
    ellipse(location.x, location.y, mass*16,mass*16);
  }
  
  void checkEdges(){
    float spaceWall = 10;
    float marginRight =  ( width - ((width * spaceWall) / 100));
    float marginBottom =  ( height - ((height * spaceWall) / 100));
    if (location.x > marginRight) {
      PVector wallShield = new PVector(map(location.x, marginRight, width, -2, -10), 0);
      acceleration.add(wallShield);
    } else if (location.x < ((width * spaceWall) / 100)) {
      PVector wallShield = new PVector(map(location.x, 0, ((width * spaceWall) / 100), 2, 10), 0);
      acceleration.add(wallShield);
    }
    
    if (location.y > marginBottom) {
      PVector wallShield = new PVector(0, map(location.y, marginBottom, height, -2, -10));
      acceleration.add(wallShield);
    } else if (location.y < ((height * spaceWall) / 100)) {
      PVector wallShield = new PVector(0, map(location.y, 0, ((height * spaceWall) / 100), 2, 10));
      acceleration.add(wallShield);
    }
    
    location.x = constrain(location.x, 0, width);
    location.y = constrain(location.y, 0, height);

  }
  
}