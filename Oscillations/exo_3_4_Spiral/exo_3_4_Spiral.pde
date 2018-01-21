float r = 0;
float theta = 0;
float tx = 100;

void setup(){
  size(640, 360);
  background(255);
}

void draw(){
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  noStroke();
  fill(0, 5);
  ellipse(x+width/2, y+height/2, 16, 16);
  
  
  r += map(noise(tx), 0, 1, -1, 1);
  theta += map(noise(tx), 0, 1, -1, 1);
  tx += 0.1;
}