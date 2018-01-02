void setup(){
  size(400,400);
}

void draw(){
  loadPixels();
  //for(int x = 0; x < width; x++){ //Fonctionnement en random basique
  //  for(int y=0; y < height; y++){
  //    float bright = random(255);
  //    pixels[x+y*width] = color(bright);
  //  }
  //}

  float xoff = 0.0;
  float t = 0.0;
  for(int x = 0; x < width; x++){ //Fonctionnement en noise 2d basique
    float yoff=0.0;
    for(int y=0; y < height; y++){  
      float bright = map(noise(xoff,yoff, t),0,1,0,255);
      pixels[x+y*width] = color(bright);
      yoff+=0.01;
    }
    xoff += 0.01;
  }
  t+=0.01;
  updatePixels();
}