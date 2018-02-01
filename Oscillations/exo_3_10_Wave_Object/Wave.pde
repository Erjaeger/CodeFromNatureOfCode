class Wave {
  float startAngle;
  float angleVel;
  int spaceBetween;
  int startWave;
  int waveLength;
  
  Wave(int _spaceBetween, float _angleVel, int _startWave, int _waveLength){
    startAngle = 0;
    spaceBetween = _spaceBetween;
    angleVel = _angleVel;
    startWave = _startWave;
    waveLength = _waveLength;
  }
  
  void display(){
    float angle = startAngle;
    for(int x = startWave; x <= waveLength; x += spaceBetween){
      float y = map(sin(angle), -1, 1, 0, height);
      stroke(0);
      fill(0, 50);
      ellipse(x,y,48,48);
      angle+=angleVel;
    }
    startAngle+=0.02;
  }
}