var w;

function setup() {
  createCanvas(400, 400);
  w = new Walker();
}

function draw() {
  background(220);
  w.walk();
  w.display();
}

function Walker(){
  this.v = createVector(width/2, height/2);

  this.walk = function(){
    this.v.x += random(-1, 1);
    this.v.y += random(-1, 1);
  }

  this.display = function(){
    fill(255);
    ellipse(this.v.x, this.v.y, 16, 16);
  }
}
