float x;
float y;
float xspeed;
float yspeed;
int SIZE_BALL = 16;

void setup(){
  size(400, 400);
  x= width/2;
  y= height/2;
  
  xspeed = 5;
  yspeed = 2;
}

void draw() {
  background(222);
  x += xspeed;
  y += yspeed;
  
  if(x>width-SIZE_BALL || x<SIZE_BALL){
    xspeed*=-1;
  } else if(y>height-SIZE_BALL || y < SIZE_BALL){
    yspeed *= -1;
  }
  
  ellipse(x, y, SIZE_BALL, SIZE_BALL);
  
}
