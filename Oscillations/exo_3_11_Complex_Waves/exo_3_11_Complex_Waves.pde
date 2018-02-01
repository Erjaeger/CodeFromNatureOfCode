float startAngle = 0;
float angleVel = 0.25;
Wave leftWave;
Wave rightWave;
 
void setup(){
 size(400,200);
 background(255); 
 leftWave = new Wave(5, 0.2, 0, width/2 - 50);
 rightWave = new Wave(5, 0.5, width/2+50, width);
}
 
void draw(){
 background(255);
 leftWave.display();
 rightWave.display();
}