PShape baton, baloon1, baloon2, line;
float angle = 0;
void setup() {
  size(300, 300);

  // Create the shape group
  baton = createShape(GROUP);
  baloon1 = createShape(ELLIPSE, 0, -height/2+32, 32, 32);
  baloon2 = createShape(ELLIPSE, 0, height/2-32, 32, 32);
  line = createShape(LINE, 0, -height/2+48, 0, height/2-48);
  line.setStroke(color(0));
  line.setStrokeWeight(2);

  baton.addChild(baloon1);
  baton.addChild(baloon2);
  baton.addChild(line);
  
  baton.translate(width/2, height/2);
}

void draw() {
  background(204);
  shape(baton); // Draw the group
}