void setup(){
  size(640, 360);
}

void draw(){
  background(255);
  
  float period = 120;
  float amplitude = 100;
  float yT = sin(TWO_PI * (frameCount / period));
  float y = map(yT, -1, 1, 10, 100);
  
  stroke(0);
  fill(175);
  line(width/2, y, width/2, 0);
  ellipse(width/2, y, 20, 20);
}