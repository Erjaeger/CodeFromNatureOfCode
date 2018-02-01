float yPos = -100;
int angle = 10;
Oscillator[] oscillators = new Oscillator[8];
void setup(){
  size(640, 360);
  for(int i = 0; i<oscillators.length; i++){
    if(i%2 == 0){
     oscillators[i] = new Oscillator(new PVector(-100, yPos), new PVector(0.05,0), angle);  
    } else {
      oscillators[i] = new Oscillator(new PVector(100, yPos), new PVector(0.05,0), angle);
      yPos += 80;
      angle += 10;
    }
  }
}

void draw(){
  background(255);
  for(int i = 0; i<oscillators.length; i++){
    oscillators[i].oscillate();
    oscillators[i].display();
  }
}