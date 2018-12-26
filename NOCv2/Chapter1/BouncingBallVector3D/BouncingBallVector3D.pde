PVector location;
PVector velocity;

int SIZE_BALL = 16;

void setup(){
  size(400, 400, P3D);
  location = new PVector(0, 0, 0);
  velocity = new PVector(3, 2, 1);
}

void draw() {
  background(222);
  
  pushMatrix();
  
  translate(200, 200, -200);
  
  noFill();
  stroke(0);
  box(300);
  
  translate(location.x, location.y, location.z);
  location.add(velocity);

  if(location.x>150-SIZE_BALL || location.x < -150+SIZE_BALL){
    velocity.x = velocity.x * -1;
    fill(random(0,255),random(0,255),random(0,255));
  } else if(location.y>150-SIZE_BALL || location.y < -150+SIZE_BALL){
    velocity.y = velocity.y * -1;
    fill(random(0,255),random(0,255),random(0,255));
  } else if(location.z>150-SIZE_BALL || location.z < -150+SIZE_BALL){
    velocity.z = velocity.z * -1;
  }
  
  lights();
  sphere(SIZE_BALL);
  popMatrix();
}
