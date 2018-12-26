PVector location;
PVector velocity;

int SIZE_BALL = 16;

void setup(){
  size(400, 400);
  location = new PVector(width/2, height/2);
  velocity = new PVector(5, 2);
}

void draw() {
  background(222);
  location.add(velocity);

  if(location.x>width-SIZE_BALL || location.x <SIZE_BALL){
    velocity.x = velocity.x * -1;
    fill(random(0,255),random(0,255),random(0,255));
  } else if(location.y>height-SIZE_BALL || location.y < SIZE_BALL){
    velocity.y = velocity.y * -1;
    fill(random(0,255),random(0,255),random(0,255));
  }
  
  ellipse(location.x, location.y, SIZE_BALL, SIZE_BALL);
  
}
